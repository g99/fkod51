package com.hnb.article;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hnb.global.Command;
import com.hnb.global.CommandFactory;
import com.hnb.member.MemberServiceImpl;
import com.hnb.member.MemberVO;

@Controller
@RequestMapping("/article")
public class ArticleController {
	private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);

	@Autowired MemberServiceImpl service;
	@Autowired MemberVO member;
	@Autowired ArticleVO article;
	@Autowired ArticleServiceImpl articleService;
	
	/*RESTful 방식 (url 에 {}이 있어서 @PathVariable 사용한 경우)*/
	@RequestMapping("/home")
	public String boardList(){
		logger.info("boardhome() 진입");
		return "article/boardList.tiles";
	}
	
	@RequestMapping("/list/{pageNo}")
	public @ResponseBody Map boardList(
			@PathVariable("pageNo")String pageNo,
			Model model){
		logger.info("boardList() 진입");
		logger.info("넘어온 페이지 번호 : {}", pageNo);
		int count = articleService.count();
		List<ArticleVO> list = articleService.getList(CommandFactory.list(pageNo));
		Map result = new HashMap();
		result.put("count", count);
		result.put("list", list);
		return result;
	}
	
	@RequestMapping("/member_search/{pageNo}")
	public String memberSearch(
			@PathVariable("pageNo")String pageNo,
			@RequestParam("keyword")String keyword,
			@RequestParam("column")String column,
			Model model){
		logger.info("memberSearch() 진입");
		logger.info("넘어온 페이지 번호 : {}", pageNo);
		logger.info("넘어온 컬럼 : {}", column);
		logger.info("넘어온  검색어 : {}", keyword);
		Command command = CommandFactory.seach(column, keyword, pageNo);
		List<MemberVO> list = service.searchByKeyword(command);
		int count = service.countByKeyword(command);
		logger.info("리스트 결과 : {}", list.size());
		model.addAttribute("member", list);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("count", count);
		return "article/boardSearch.tiles";
	}
	
	@RequestMapping("/write")
	public String write() {
		logger.info("write() 진입");
		return "article/write.jsp";
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	public void save(
			@RequestBody ArticleVO article
			) {
		logger.info("save() 진입");
		articleService.write(article);
	}
}
