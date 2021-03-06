package com.hnb.admin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.converters.DateConverter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hnb.article.ArticleServiceImpl;
import com.hnb.article.ArticleVO;
import com.hnb.global.FileUpload;
import com.hnb.member.MemberServiceImpl;
import com.hnb.member.MemberVO;
import com.hnb.movie.MovieServiceImpl;
import com.hnb.movie.MovieVO;
import com.hnb.ticket.TicketServiceImpl;
import com.hnb.ticket.TicketVO;


@Controller
@SessionAttributes("admin")
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired MemberVO member;
	@Autowired MovieVO movie;
	@Autowired ArticleVO article;
	@Autowired MemberServiceImpl memberService;
	@Autowired MovieServiceImpl movieService;
	@Autowired AdminServiceImpl adminService;
	@Autowired ArticleServiceImpl articleService;
	@Autowired TicketServiceImpl ticketService;
	@RequestMapping("")
	public String home(){
		logger.info("AdminController-login() 진입");
		return "admin/login.jsp";
	}
	
	@RequestMapping("/main")
	public String main(){
		logger.info("AdminController-home() 진입");
		return "admin/main.jsp";
	}
	
	@RequestMapping("/member")
	public String member(Model model){
		logger.info("AdminController-home() 진입");
		List<MemberVO> members = adminService.getMemberList();
		model.addAttribute("list", members);
		return "admin/member.jsp";
	}
	
	@RequestMapping("/movie")
	public String movie(Model model){
		logger.info("영화목록 진입");
		List<MovieVO> movies = movieService.getList();
		model.addAttribute("list", movies);
		return "admin/movie.jsp";
	}	
	
	@RequestMapping("/chart")
	public String chart(){
		logger.info("AdminController-home() 진입");
		return "admin/chart.jsp";
	}
	
	@RequestMapping("/board")
	public String board(Model model){
		logger.info("AdminController-home() 진입");
		List<ArticleVO> articles = articleService.getAllList();
		model.addAttribute("list", articles);
		return "admin/board.jsp";
	}
	
	@RequestMapping("/movie_list")
	public Model movieList(Model model){
		logger.info("AdminController-movieList() 진입");
		List<MovieVO> movieList;
		movieList = movieService.getList();
		model.addAttribute("movieList",movieList);
		
		return model;
	}
	
	@RequestMapping("/member_list")
	public void memberList(
			Model model
			){
		List<MemberVO> members = adminService.getMemberList();
		model.addAttribute("list", members);
	}
	
	@RequestMapping("/member_profile")
	public Model memberProfile(
			String id,Model model
			){
		logger.info("개인 프로필 진입");
		logger.info("가져온 아이디{}",id);
		member = memberService.selectById(id);
		model.addAttribute("member", member);
		return model;
		
	}
	@RequestMapping("/movie_profile")
	public Model movieProfile(String filmNumber,Model model){
		logger.info(" 영화 목록 진입");
		logger.info(" 가져온 영화 번호{}",filmNumber);
		movie = movieService.searchByName(filmNumber);
		model.addAttribute("movie", movie);
		
		return model;
	}
	@RequestMapping("/insert")
	public void insert(
		@RequestParam("id") String id,
		@RequestParam("password") String password,
		String email, String phone, Model model){
		logger.info("insert 진입");
		logger.info("id{}",id);
		logger.info("password{}",password);
		logger.info("email{}",email);
		logger.info("phone{}",phone);
		member = memberService.selectById(id);
		member.setPassword(password);
		member.setEmail(email);
		member.setPhone(phone);
		int result = memberService.change(member);
		model.addAttribute("result", id + " 님의 정보수정을 완료했습니다.");
	}
	@RequestMapping("/insert2")
	public Model insert2(String filmName,String story,Model model){
		logger.info("인서트 진입");
		logger.info("영화이름{}",filmName);
		logger.info("줄거리{}",story);
		movie = movieService.searchByName(filmName);
		movie.setStory(story);
		model.addAttribute("movie",movie);
		
		return model;
	}
	@RequestMapping("/delete")
	public Model delete(String id,Model model){
		memberService.remove(id);
		model.addAttribute("result",id+"님의 탈퇴를 완료했습니다.");
		return model;
	}
	
	@RequestMapping("/logout")
	public void logout(SessionStatus status){
		status.setComplete();
	}
	
	@RequestMapping("/login")
	public void login(
			String id,
			String password,
			Model model
			) {
		System.out.println("아이디 : " + id );
		System.out.println("비번 : " + password );
		member = memberService.login(id, password);
		if (member == null) {
			System.out.println("로그인 실패");
			model.addAttribute("result", "fail");
		} else {
			if (member.getId().equals("choa")) {
				System.out.println("로그인 성공");
				model.addAttribute("admin", member);
				model.addAttribute("result", "success");
			} else {
				System.out.println("로그인 실패");
				model.addAttribute("result", "fail");
			}
		}
	}
	
	@RequestMapping("/notice")
	public String notice() {
		return "admin/notice.jsp";
	}
	
	@RequestMapping("/write_notice")
	public void writeNotice(
			String title,
			String content
			) {
		article.setUsrSubject(title);
		article.setUsrContent(content);
		article.setUsrName("관리자");
		articleService.write(article);
	}
	
	@RequestMapping("/delete_writing")
	public void deleteWriting(String code) {
		articleService.delete(Integer.parseInt(code));
	}
	
	@RequestMapping("/line_chart")
	public void lineChart(
			String key,
			Model model
			) {
		logger.info("라인차트 진입!!!");
		model.addAttribute("count", ticketService.getCountByKey(Integer.parseInt(key)));
	}
	
	@RequestMapping("/donut_chart")
	public void donutChart(
			String key,
			Model model
			) {
		logger.info("도넛차트 진입!!!");
		List<TicketVO> list = ticketService.getAllTicketVO();
		Map<String, Integer> result = new HashMap<String, Integer>();
		int adult = 0;
		int teenager = 0;
		int oldman = 0;
		for (int i = 0; i < list.size(); i++) {
			adult += list.get(i).getAdult();
			teenager += list.get(i).getTeenager();
			oldman += list.get(i).getOldMan();
		}
		System.out.println("성인" + adult);
		System.out.println("노인" + oldman);
		System.out.println("청소년" + teenager);
		model.addAttribute("adult", adult);
		model.addAttribute("teenager", teenager);
		model.addAttribute("oldman", oldman);
	}
	
	@RequestMapping("/pie_chart")
	public void pieChart(
			Model model
			) {
		logger.info("파이차트 진입!!!");
		List<TicketVO> list = ticketService.getAllTicketVO();
		Map<String, Double> result = new HashMap<String, Double>();
		List<String> movieNames = new ArrayList<String>();
		int movies = list.size();
		for (int i = 0; i < list.size(); i++) {
			String temp = list.get(i).getFilmName();
			//해당 영화이름을 포함하고 있지 않으면
			if (!result.containsKey(temp)) {
				result.put(temp, 1.0/movies);
				movieNames.add(temp);
			} else {
			//해당 영화를 이미 넣은상태이면
				result.put(temp, result.get(temp) + (1.0/movies));
			}
		}
		model.addAttribute("names", movieNames);
		model.addAttribute("list", result);
	}
	
	@RequestMapping("/add_movie")
	public String addMovie() {
		return "admin/add_movie.jsp";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public void add(
			MultipartHttpServletRequest multipartHSR,
			String subject,	String number, String director,
			String actor, String country, String rate,
			String genre, String runtime, String price,
			String release, String end, String story,
			String trailer
			) {
		// 파일업로드를 할 절대경로
		logger.info("add() 진입");
		String path = "C:\\Users\\HB\\git\\fkod51\\fkod51\\src\\main\\webapp\\resources\\images\\";
		FileUpload fileUpload = new FileUpload();
		List<MultipartFile> fileList = multipartHSR.getFiles("poster");
		StringBuffer fileName = new StringBuffer();
		String file = null;
		// 파일이 없는경우를 제외하고
		if (!(fileList.size() == 1 && fileList.get(0).getOriginalFilename().equals(""))) {
			logger.info("반목문 수행중");
			for (int i = 0; i < fileList.size(); i++) {
				file = fileList.get(i).getOriginalFilename();
				fileUpload.uploadFile(fileList.get(i), path, file);
				fileName.append(file);
				if (i != fileList.size()-1) {
					fileName.append("/");
				}
			}
			file = fileName.toString();
			file = file.replace(".jpg", "");
		}
		
		movie.setFilmName(subject);
		movie.setFilmNumber(number);
		movie.setDirector(director);
		movie.setActor(actor);
		movie.setCountry(country);
		movie.setRate(rate);
		movie.setGenre(genre);
		movie.setRuntime(Integer.parseInt(runtime));
		movie.setPrice(Integer.parseInt(price));
		movie.setReleaseDate(release);
		movie.setEndDate(end);
		movie.setStory(story);
		movie.setTrailer(trailer);
		movie.setCut(file);
		movie.settRate(0);
		
		movieService.register(movie);
	}
	
	
	@RequestMapping("/delete_movie")
	public void deleteMovie(String filmNumber) {
		logger.info("deleteMovie() 진입");
		logger.info("필름번호 "+filmNumber);
		movieService.remove(filmNumber);
	}
}