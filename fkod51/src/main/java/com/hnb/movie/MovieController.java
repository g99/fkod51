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
	@RequestMapping("/movie_Cut")
	public Model movieCut(String filmNumber, Model model){
		logger.info("MovieController-movieCut() 진입");
		logger.info("영화 스틸컷 : {}", filmNumber);
		movie = service.searchByName(filmNumber);
		String cut = movie.getCut();
		String[]arr = cut.split("/");
		logger.info("배열결과 : {}", arr);
		model.addAttribute("arr", arr);
		return model;
	}
	@RequestMapping("/movie_Tra")
	public String movieTra(String filmNumber, Model model){
		logger.info("MovieController-movieTra() 진입");
		logger.info("영화 트레일러 : {}", filmNumber);
		movie = service.searchByName(filmNumber);
		String tra = movie.getTrailer();
		logger.info("get 트레일러 : {}", tra);
		String[]arrt = tra.split("/");
		logger.info("트레일러 : ", arrt);
		model.addAttribute("arrt", arrt);
		return "movie/movie_Tra";
	}
	@RequestMapping("/movie_Basic")
	public @ResponseBody MovieVO movieBasic (String filmNumber, Model model){
		logger.info("MovieController-movieBasic() 진입");
		logger.info("movieBasic의 film넘버 : {}", filmNumber);
		movie = service.searchByName(filmNumber);
		logger.info("movieBasic컷의영화제목 : {} ", movie.getFilmName());
		model.addAttribute("movie", movie);
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
