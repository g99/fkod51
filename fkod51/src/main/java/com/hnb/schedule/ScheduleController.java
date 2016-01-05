package com.hnb.schedule;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hnb.ticket.TicketVO;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);
	@Autowired ScheduleServiceImpl scheduleService;
	@Autowired TicketVO ticket;
	
	@RequestMapping("/Ticket")
	public String ticketMain(){
		logger.info("ScheduleController-ticketMain() 진입");
		return "ticket/Ticket.jsp";
	}
	
	@RequestMapping("/movieSelect")
	public Model movieSelect(
			String movie,
			String theater,
			String date,
			Model model
			){
		logger.info("ScheduleController-movieSelect() 진입");
		List<?> theaterList = new ArrayList<>();
		List<?> dateList = new ArrayList<>();
		List<?> timeList = new ArrayList<>();
		if (theater==null && date!=null) {
			theaterList = scheduleService.getTheaterListByMD(movie,date);
		} else if (theater!=null && date==null) {
			dateList = scheduleService.getShowDateListByMT(movie,theater);
		} else if (theater==null && date==null) {
			theaterList = scheduleService.getTheaterListByM(movie);
			dateList = scheduleService.getShowDateListByM(movie);
		} else if (movie!=null&&theater!=null&&date!=null) {
			timeList = scheduleService.getTimeList(movie, theater, date);
		}
		logger.info("theaterList : {}", theaterList);
		logger.info("dateList : {}", dateList);
		logger.info("timeList : {}", timeList);
		model.addAttribute("theaterList",theaterList);
		model.addAttribute("dateList",dateList);
		model.addAttribute("timeList",timeList);
		return model;
	}
	@RequestMapping("/theaterSelect")
	public Model theaterSelect(
			String movie,
			String theater,
			String date,
			Model model
			){
		logger.info("ScheduleController-theaterSelect() 진입");
		List<?> movieListRate = new ArrayList<>();
		List<?> movieListAsc = new ArrayList<>();
		List<?> dateList = new ArrayList<>();
		List<?> timeList = new ArrayList<>();
		if (movie==null && date!=null) {
			movieListRate = scheduleService.getMovieRateByTD(theater,date);
			movieListAsc = scheduleService.getMovieAscByTD(theater,date);
		} else if (movie!=null && date==null) {
			dateList = scheduleService.getShowDateListByMT(movie, theater);
		} else if (movie==null && date==null) {
			movieListRate = scheduleService.getMovieRateByT(theater);
			movieListAsc = scheduleService.getMovieAscByT(theater);
			dateList = scheduleService.getShowDateListByT(theater);
		} else if (movie!=null&&theater!=null&&date!=null) {
			timeList = scheduleService.getTimeList(movie, theater, date);
		}
		model.addAttribute("movieListRate", movieListRate);
		model.addAttribute("movieListAsc", movieListAsc);
		model.addAttribute("dateList", dateList);
		model.addAttribute("timeList", timeList);
		return model;
	}
	@RequestMapping("/dateSelect")
	public Model dateSelect(
			String movie,
			String theater,
			String date,
			Model model
			){
		logger.info("ScheduleController-dateSelect() 진입");
		List<?> movieListRate = new ArrayList<>();
		List<?> movieListAsc = new ArrayList<>();
		List<?> theaterList = new ArrayList<>();
		List<?> timeList = new ArrayList<>();
		if (movie==null && theater!=null) {
			movieListRate = scheduleService.getMovieRateByTD(theater,date);
			movieListAsc = scheduleService.getMovieAscByTD(theater,date);
		} else if (movie!=null && theater==null) {
			theaterList = scheduleService.getTheaterListByMD(movie,date);
		} else if (movie==null && theater==null) {
			movieListRate = scheduleService.getMovieRateByD(date);
			movieListAsc = scheduleService.getMovieAscByD(date);
			theaterList = scheduleService.getTheaterListByD(date);
		} else if (movie!=null&&theater!=null&&date!=null) {
			timeList = scheduleService.getTimeList(movie, theater, date);
		}
		model.addAttribute("movieListRate", movieListRate);
		model.addAttribute("movieListAsc", movieListAsc);
		model.addAttribute("theaterList", theaterList);
		model.addAttribute("timeList", timeList);
		return model;
	}
	@RequestMapping("/choiceseat")
	public Model choiceseat(
			String movie,
			String theater,
			String date,
			String time,
			Model model
			){
		logger.info("ScheduleController-choiceseat() 진입");
		String filmNumber = scheduleService.getFilmNumberBy(movie);
		logger.info("영화번호 : {}", filmNumber);
		ticket.setFilmNumber(filmNumber);
		ticket.setTheaterName(theater);
		ticket.setTheaterName(date);
		ticket.setTheaterName(time.split(" ")[0]);
		ticket.setTheaterName(time.split(" ")[1]);
		logger.info("영화번호 : {}", ticket.getFilmNumber());
		logger.info("영화관 : {}", ticket.getTheaterName());
		logger.info("날짜 : {}", ticket.getDate());
		logger.info("관번호 : {}", ticket.getRoomName());
		logger.info("시작시간 : {}", ticket.getStartTime());
		model.addAttribute("result", "success");
		return model;
	}
	
	@RequestMapping("/initList")
	public Model initList(Model model){
		logger.info("ScheduleController-initList() 진입");
		List<?> movieListRate = scheduleService.getRateList();
		logger.info("movieListRate : {}",movieListRate);
		List<?> movieListAsc = scheduleService.getAscList();
		List<?> theaterList = scheduleService.getTheaterList();
		List<?> dateList = scheduleService.getShowDateList();
		model.addAttribute("movieListRate", movieListRate);
		model.addAttribute("movieListAsc", movieListAsc);
		model.addAttribute("theaterList", theaterList);
		model.addAttribute("dateList", dateList);
		logger.info("initList : {}",model);
		return model;
	}
	@RequestMapping("/Seats")
	public Model seatsMain(Model model){
		logger.info("ScheduleController-seatsMain() 진입");
		model.addAttribute("movie", ticket.getFilmNumber());
		model.addAttribute("date", ticket.getDate());
		model.addAttribute("time", ticket.getStartTime());
		return model;
	}
	@RequestMapping("/infoSave")
	public Model infoSave(
			String adult,
			String old_man,
			String teenager,
			String price,
			String seat_number,
			Model model
			){
		logger.info("ScheduleController-infoSave() 진입");
		ticket.setAdult(Integer.parseInt(adult));
		ticket.setOldMan(Integer.parseInt(old_man));
		ticket.setTeenager(Integer.parseInt(teenager));
		ticket.setPrice(Integer.parseInt(price));
		ticket.setSeatNumber(seat_number);
		model.addAttribute("result", "success");
		return model;
	}
	@RequestMapping("/Confirm")
	public Model confirmMain(Model model){
		logger.info("ScheduleController-confirmMain() 진입");
		model.addAttribute("movie", ticket.getFilmNumber());
		model.addAttribute("ticket", ticket);
		return model;
	}
}
