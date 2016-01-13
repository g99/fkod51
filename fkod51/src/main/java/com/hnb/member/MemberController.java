package com.hnb.member;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hnb.global.Constants;
import com.hnb.global.FileUpload;
import com.hnb.ticket.TicketServiceImpl;
import com.hnb.ticket.TicketVO;

@Controller
@SessionAttributes({"user","ticket"})
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	MemberServiceImpl service;
	@Autowired
	MemberVO member;
	
	@Autowired
	TicketServiceImpl ticketService;
	@Autowired
	TicketVO ticket;
	@Autowired
	private EmailSender emailSender;
	
	int auth_Num = 0;
	
	@RequestMapping("/admin_home")
	public String adminHome(){
		logger.info("멤버컨트롤러 adminHome() - 진입");
		return "member/admin_home";
	}
	@RequestMapping("/provision")
	public String provision(){
		logger.info("멤버컨트롤러 provision() - 진입");
		return "member/provision";
	}
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public Model joinMember(
			@RequestBody MemberVO param,
			Model model
			){
		logger.info("멤버컨트롤러 joinMember() - 진입");
		logger.info("가입 아이디 : {}",param.getId());
		logger.info("가입 이메일 : {}",param.getEmail());
		logger.info("가입 패스워드 : {}",param.getPassword());
		logger.info("가입 이름 : {}",param.getName());
		logger.info("가입 전화번호 : {}",param.getPhone());
		logger.info("가입 인증번호 : {}",param.getConfirm_num());
		
		int confirm_Num = Integer.parseInt(param.getConfirm_num());
		if (auth_Num == confirm_Num) {
			member.setId(param.getId());
			member.setPassword(param.getPassword());
			member.setName(param.getName());
			member.setEmail(param.getEmail());
			member.setPhone(param.getPhone());
			int result = service.join(member);
			if (result == 1) {
				logger.info("회원가입 성공");
				model.addAttribute("result","success");
				model.addAttribute("name",member.getName());
			} else {
				logger.info("회원가입 실패");
				model.addAttribute("result", "fail");
			}
		} 
		else {
			model.addAttribute("result", "not_Agreement");
		}
		
		return model;
	}
	
	@RequestMapping("/join_auth")
	public Model joinAuth (
			@RequestParam("id")String id,
			@RequestParam("e_mail")String e_mail,
 		    @RequestParam("name")String name, 
 		    Model model) throws Exception {
			Email email = new Email();
		logger.info("멤버컨트롤러 joinAuth() - 진입");
		logger.info("넘어온 id는?"+id);
		logger.info("넘어온 email은?"+e_mail);
		logger.info("넘어온 name은?"+name);
        MemberVO member_Id_check = service.selectById(id);
        MemberVO member_Email_check = service.selectByEmail(e_mail);
		if (member_Id_check != null) {
			model.addAttribute("id_fail", "id_fail");
		}
		else if (member_Email_check != null) {
			model.addAttribute("email_fail", "email_fail");
		}
		else {
			auth_Num = (int) (Math.random()*9999) + 1000;
        	String reciver = e_mail;
        	String subject = "환영합니다.  "+name+"님, 인증번호 메일입니다.";
        	String content = name+" 님의 가입 인증번호는 "+auth_Num+"입니다.";
        	email.setReciver(reciver);
            email.setSubject(subject);
            email.setContent(content);
            emailSender.sendMail(email);
            model.addAttribute("success", "success");
		}
        return model;
    }
	
	/*아이디 유효성 체크*/
	@RequestMapping("/checking_Id")
	public Model checking_Id(
			@RequestParam("id")String id,
 		    Model model) throws Exception {
		logger.info("멤버컨트롤러 checking_Id() - 진입");
		logger.info("넘어온 id는?"+id);
        MemberVO member_Id_check = service.selectById(id);
		if (member_Id_check != null) {
			model.addAttribute("id_fail", "id_fail");
		}
		else {
            model.addAttribute("id_Confirm", "id_Confirm");
		}
        return model;
    }
	
	
	
	
	
	
	
	/*
	 * if(service.selectById(id).getId()==null) {} => 이 구문 에러발생.
	 *  
	 * @RequestMapping("/join_auth")
	public ModelAndView sendEmailAction (@RequestParam Map<String, Object> paramMap, ModelMap model) 
			throws Exception {
			
        ModelAndView mav;
        String id=(String) paramMap.get("id");
        String e_mail=(String) paramMap.get("email");
        String pw=mainService.getPw(paramMap);
        System.out.println(pw);
        if(pw!=null) {
            email.setContent("비밀번호는 "+pw+" 입니다.");
            email.setReceiver(e_mail);
            email.setSubject(id+"님 비밀번호 찾기 메일입니다.");
            emailSender.SendEmail(email);
            mav= new ModelAndView("redirect:/login.do");
            return mav;
        }else {
            mav=new ModelAndView("redirect:/logout.do");
            return mav;
        }
    }*/

	
	
	
	
	@RequestMapping("/join_Result")
	public String joinResult(){
		logger.info("멤버컨트롤러 joinResult() - 진입");
		
		return "member/join_Result";
	}
	
	
	
	@RequestMapping("/logout")
	public String logout(Model model, SessionStatus status){
		logger.info("멤버컨트롤러 logout() - 진입");
		status.setComplete();
		logger.info("멤버컨트롤러 logout() - 로그아웃 완료");
		return "redirect:/"; /* 메인컨트롤러로 간다는 뜻 */ 
	}
	
	
	
	/*로그인*/
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public @ResponseBody MemberVO login(
			@RequestParam("id")String id,
 		    @RequestParam("password")String pw,
 		    HttpSession session,
		    Model model){
		logger.info("멤버컨트롤러 login() - 진입");
		logger.info("유저아이디 : {}", id);
		logger.info("유저 비밀번호: {}", pw);
		member = service.login(id, pw);
		/*ticket = ticketService.가져올 메서드(id)*/
		if (member != null) {
		logger.info("로그인 성공!!!!!!!");
		session.setAttribute("user", member);
		session.setAttribute("ticket", ticket);
		} else {
			logger.info("로그인 실패!!!!!!!!");
		}
		return member;
	}
	
	
	
	@RequestMapping("/login_mobile")
	public String login_mobile(
			@RequestParam("id")String id,
 		    @RequestParam("pw")String pw,
 		    Model model
 		    ){
		logger.info("아이디 {}",id);
		logger.info("비이번 {}",pw);
		return "member/mypage.tiles";
	}	
	
	
	
	@RequestMapping("/check_Overlap")
	public Model checkOverlap(
			String id,
			Model model
			){
		logger.info("멤버컨트롤러 checkOverlap() - 진입");
		if (service.selectById(id).getId() == null) {
			model.addAttribute("result", "usable");
			model.addAttribute("id", id);
		} else {
			model.addAttribute("result", "unusable");
			model.addAttribute("id", id);
		}
		return model;
	}
	
	@RequestMapping("/mypage")
	public String mypage(){
		logger.info("멤버컨트롤러 mypage() - 진입");
		return "member/mypage.tiles";
	}
	
	@RequestMapping("/detail/{id}")
	public @ResponseBody MemberVO detail(
		@PathVariable("id")String id){
		logger.info("디테일 id {}", id);
		logger.info("멤버컨트롤러 detail() - 진입");
		member = service.selectById(id);
		return member;
	}
	
	@RequestMapping(value="/file_Update", method=RequestMethod.POST)
	public @ResponseBody MemberVO file_Update(
			@RequestParam(value="file", required=false)MultipartFile multipartFile,
			@RequestParam("password")String password,
			@RequestParam("addr")String addr,
			@RequestParam("email")String email,
			@RequestParam("phone")String phone,
			@RequestParam("id")String id
			) {
		logger.info("file_Update() 진입");
		String path = Constants.IMAGE_DOMAIN + "resources\\images\\";
		FileUpload fileUpload = new FileUpload();
		String fileName = multipartFile.getOriginalFilename();
		String fullPath = fileUpload.uploadFile(multipartFile, path, fileName);
		logger.info("풀패스 : {}", fullPath);
		member.setPassword(password);
		member.setAddr(addr);
		member.setEmail(email);
		member.setPhone(phone);
		member.setProfile(fileName);
		int result = service.change(member);
		if (result != 0) {
			logger.info("업데이트 성공");
		} else {
			logger.info("업데이트 실패");
		}
		return member;
	}
	
	
	/*내정보 수정*/
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public @ResponseBody Model update(
			@RequestBody MemberVO param,
			Model model
			) {
		logger.info("내정보 수정, Controller-update() 진입");
		member.setPassword(param.getPassword());
		member.setPhone(param.getPhone());
		member.setId(param.getId());
		int result = service.change(member);
		if (result != 0) {
			logger.info("회원정보 수정완료");
			model.addAttribute("result","success");
		} else {
			logger.info("회원정보 수정실패");
			model.addAttribute("result","fail");
		}
		return model;
	}
	
	/*회원탈퇴*/
	@RequestMapping("/delete")
	public Model delete(
			@RequestParam("delete_Id")String delete_Id,
			SessionStatus status,
			Model model
			){
		logger.info("멤버컨트롤러 delete() - 진입");
		logger.info("삭제할 id는?  "+delete_Id);
		int result = service.remove(delete_Id);
		if (result != 0) {
			logger.info("회원탈퇴 완료");
			status.setComplete();
			model.addAttribute("result","success");
		} else {
			logger.info("회원탈퇴 실패");
			model.addAttribute("result","fail");
		}
		return model;
	}
	
	
	
	
	
	@RequestMapping("/headerReload")
	public String headerReload() {
		return "global2/header.jsp";
	}
}
