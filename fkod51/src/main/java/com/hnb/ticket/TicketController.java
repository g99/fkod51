package com.hnb.ticket;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.hnb.member.MemberController;



@Controller
@RequestMapping("/ticket")
public class TicketController {
	private static final Logger logger = LoggerFactory.getLogger(TicketController.class);
	
	@Autowired
	TicketServiceImpl ticketService;
	
	int result;
	
	TicketVO ticketVO = new TicketVO();
	List movieListRate = new ArrayList();
	List movieListAsc = new ArrayList();
	List theaterList = new ArrayList();
	List dateList = new ArrayList();
	List timeList = new ArrayList();
	List seatList = new ArrayList();
	
	@RequestMapping("/Ticket")
	public String Ticket(Model model){
		return "ticket/Ticket";
	}	
	@RequestMapping("/movieSelect")
	public String movieSelect(Model model, String movie,String theater,String date
			){
		if (theater == null && date != null) {
			logger.info("극장널");
			theaterList = ticketService.getTheaterListByMD(movie, date);
		} else if (theater==null && date != null) {
			logger.info("날짜널");
			dateList = ticketService.getShowDateListByMT(movie,theater);
		} else if (theater==null && date==null) {
			logger.info("다널");
			theaterList = ticketService.getTheaterListByM(movie);
			dateList = ticketService.getShowDateListByM(movie);
		} else if (movie!=null&&theater!=null&&date!=null) {
			timeList = ticketService.getTimeList(movie, theater, date);
		}
		List movieSelectList = new ArrayList();
		logger.info("극장" +theaterList);
		logger.info("날짜" +dateList);
		movieSelectList.add(theaterList);
		movieSelectList.add(dateList);
		movieSelectList.add(timeList);
		return "ticket/movieSelect";
	}
	@RequestMapping("/theaterSelect")
	public String theaterSelect(String movie,String theater,String date){
		if (movie==null && date!=null) {
			movieListRate = ticketService.getMovieRateByTD(theater,date);
			movieListAsc = ticketService.getMovieAscByTD(theater,date);
		} else if (movie!=null && date==null) {
			dateList = ticketService.getShowDateListByMT(movie, theater);
		} else if (movie==null && date==null) {
			movieListRate = ticketService.getMovieRateByT(theater);
			movieListAsc = ticketService.getMovieAscByT(theater);
			dateList = ticketService.getShowDateListByT(theater);
		} else if (movie!=null&&theater!=null&&date!=null) {
			timeList = ticketService.getTimeList(movie, theater, date);
		}
		List theaterSelectList = new ArrayList();
		theaterSelectList.add(movieListRate);
		theaterSelectList.add(movieListAsc);
		theaterSelectList.add(dateList);
		theaterSelectList.add(timeList);
		return "ticket/theaterSelect";
	}
	@RequestMapping("/dateSelect")
	public String dateSelect(String movie,String theater, String date){
		if (movie==null && theater!=null) {
			movieListRate = ticketService.getMovieRateByTD(theater,date);
			movieListAsc = ticketService.getMovieAscByTD(theater,date);
		} else if (movie!=null && theater==null) {
			theaterList = ticketService.getTheaterListByMD(movie,date);
		} else if (movie==null && theater==null) {
			movieListRate = ticketService.getMovieRateByD(date);
			movieListAsc = ticketService.getMovieAscByD(date);
			theaterList = ticketService.getTheaterListByD(date);
		} else if (movie!=null&&theater!=null&&date!=null) {
			timeList = ticketService.getTimeList(movie, theater, date);
		}
		List dateSelectList = new ArrayList();
		dateSelectList.add(movieListRate);
		dateSelectList.add(movieListAsc);
		dateSelectList.add(theaterList);
		dateSelectList.add(timeList);
		logger.info("결과 {}", timeList);
		return "ticket/dateSelect";
	}
	@RequestMapping("/choiceseat")
	public Model choiceseat(String movie,String theater,String date, Model model){
		String filmNumber = ticketService.getFilmNumberBy(movie);
		System.out.println(filmNumber);
		ticketVO.setFilmNumber(filmNumber);
		ticketVO.setTheaterName(theater);
		ticketVO.setDate(date);
		ticketVO.setRoomName("time".split(" ")[0]);
		ticketVO.setStartTime("time".split(" ")[1]);
		System.out.println(ticketVO.getFilmNumber());
		System.out.println(ticketVO.getTheaterName());
		System.out.println(ticketVO.getDate());
		System.out.println(ticketVO.getRoomName());
		System.out.println(ticketVO.getStartTime());
		if(result == 1) {
			model.addAttribute("result", "success");
		} else {
			model.addAttribute("result", "fail");
			model.addAttribute("result", "fail");
		}
		return model;
	}
	@RequestMapping("/initList")
	public String initList(Model model){
		movieListRate = ticketService.getRateList();
		movieListAsc = ticketService.getAscList();
		theaterList = ticketService.getTheaterList();
		dateList = ticketService.getShowDateList();
		List initList = new ArrayList();
		initList.add(movieListAsc);
		initList.add(movieListAsc);
		initList.add(theaterList);
		initList.add(dateList);
		System.out.println("리스트"+initList);
		return "ticket/initList";
	}
	@RequestMapping("/Seats")
	public String Seats(Model model, String movie,String date){
		model.addAttribute("movie", movie);
		model.addAttribute("date", date);
		model.addAttribute("time", ticketVO.getStartTime());
		return "ticket/Seats";
	}
	@RequestMapping("/initSeats")
	public String initSeats(Model model){
		logger.info("좌석초기화진입");
		seatList = ticketService.getSeatList(ticketVO.getTheaterName(),ticketVO.getRoomName());
		return "ticket/initSeats";
	}
	@RequestMapping("/infoSave")
	public Model infoSave(Model model, String adult,String old_man, String teenager, String price,String seat_number
			){
		ticketVO.setAdult(Integer.parseInt(adult));
		ticketVO.setOldMan(Integer.parseInt(old_man));
		ticketVO.setTeenager(Integer.parseInt(teenager));
		ticketVO.setPrice(Integer.parseInt(price));
		ticketVO.setSeatNumber(seat_number);
		logger.info(adult);
		logger.info(old_man);
		logger.info(teenager);
		logger.info(price);
		logger.info(seat_number);
		if(result == 1) {
			model.addAttribute("result", "success");
		} else {
			model.addAttribute("result", "fail");
		}
		return model;
	}
	@RequestMapping("/Confirm")
	public String Confirm(Model model){
		return "ticket/Confirm";
	}
}
