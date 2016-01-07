package com.hnb.movie;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/movie")
public class MovieController {
	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);
	
	@Autowired
	MovieServiceImpl service;
	@Autowired
	MovieVO movie;

	@RequestMapping("/Movie")
	public String movie(){
		logger.info("MovieController-Movie() 진입");
		return "movie/Movie.jsp";
	}
	@RequestMapping("/t1000")
	public String t1000(){
		logger.info("MovieController-Movie() 진입");
		return "movie/t1000.jsp";
	}
	@RequestMapping("/movie_info")
	public Model movieInfo(Model model){
		logger.info("MovieController-movieInfo() 진입");
		List<MovieVO> list = service.getList();
		model.addAttribute("movieList", list);
		logger.info("영화 리스트 조회결과 : {}", list);
		return model;
	}
	@RequestMapping("/movie_name/{movieName}")
	public @ResponseBody MovieVO movieName(
			@PathVariable ("movieName")String name){
		logger.info("MovieController-movieName() 진입");
		logger.info("영화 아이디 : {}", name);
		movie = service.searchByName(name);
		logger.info("영화제목 : {}", movie.getFilmName());
		return movie;
	} 
	@RequestMapping("/film_name/{keyword}")
	public @ResponseBody List<MovieVO> find(
			@PathVariable ("keyword")String name){
		logger.info("MovieController-find() 진입");
		logger.info("영화 아이디 : {}", name);
		List<MovieVO> movie = service.find(name);
		logger.info("검색 list 값 : {}", movie);
		return movie;
	} 
	@RequestMapping("/movie_Basic/{filmNumber}")
	public @ResponseBody MovieVO movieBasic (@PathVariable ("filmNumber")String filmNumber){
		logger.info("MovieController-movieBasic() 진입");
		logger.info("movieBasic의 film넘버 : {}", filmNumber);
		movie = service.searchByName(filmNumber);
		logger.info("movieBasic컷의영화제목 : {} ", movie.getFilmName());
		/*model.addAttribute("movie", movie);*/
		return movie;
	}
	@RequestMapping("/movie_Chart")
	public @ResponseBody List<MovieVO> movieChart(){
		logger.info("MovieController-movieChart() 진입");
		List<MovieVO> list = service.getList();
		System.out.println("서비스 리턴값 :" + list); 
		logger.info("서비스 리턴값 : {}", list);
		/*model.addAttribute("movieList2", list);*/
		return list;
	}
}
