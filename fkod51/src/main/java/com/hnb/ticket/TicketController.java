package com.hnb.ticket;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.hnb.member.MemberVO;
import com.hnb.schedule.ScheduleServiceImpl;

@Controller
@SessionAttributes("user")
@RequestMapping("/ticket")
public class TicketController {
	private static final Logger logger = LoggerFactory.getLogger(TicketController.class);
	@Autowired TicketServiceImpl ticketService;
	@Autowired ScheduleServiceImpl scheduleService;
	@Autowired TicketVO ticket;
	
	@RequestMapping("/book")
	public Model book(
			String id,
			String movie,
			String date,
			String time,
			String filmNumber,
			String theater,
			String roomName,
			String startTime,
			String adult,
			String old_man,
			String teenager,
			String price,
			String seat_number,
			HttpSession session,
			Model model){
		logger.info("TicketController-book() 진입");
		logger.info("TicketController-book() roomName : {}",roomName);
		logger.info("TicketController-book() startTime: {}", startTime);
		logger.info("TicketController-book() date: {}", date);
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		String ticketSeq = String.format("%02X", Long.parseLong(sdf.format(new Date()))); // 16진수 문자열로 변환
		logger.info("데이트 {}",ticketSeq);
		logger.info("좌석번호 {}",seat_number);
		int ad = Integer.parseInt(adult);
		int ol = Integer.parseInt(old_man);
		int te = Integer.parseInt(teenager);
		String ticketNumber = ticketSeq+id+filmNumber+String.valueOf(ad+ol+te);
		logger.info("ticketNumber {}",ticketNumber);
		
		ticket.setTicketNumber(ticketNumber);
		ticket.setId(id);
		ticket.setFilmNumber(filmNumber);
		int theaterSeq = scheduleService.getTheaterSeq(theater);
		ticket.setTheaterSeq(theaterSeq);
		ticket.setRoomName(roomName);
		ticket.setSeatNumber(seat_number);
		ticket.setStartTime(time);
		ticket.setDate(date);
		ticket.setAdult(ad);
		ticket.setOldMan(ol);
		ticket.setTeenager(te);
		ticket.setPrice(Integer.parseInt(price));
		ticket.setFilmName(movie);
		
		ticketService.book(ticket);
		String scheduleSeq = scheduleService.getScheduleSeq(filmNumber,theater,roomName,date,startTime)+"-";
		int quantity =seat_number.split(",").length;
		for (int i = 0; i < quantity; i++) {
			String seatNumber = scheduleSeq+seat_number.split(",")[i];
			ticketService.insertSeatNumber(seatNumber);
		}
		ticketService.updateSeatStatus(quantity,filmNumber,theaterSeq,roomName,date,startTime);
		List<TicketVO> ticketAdd = ticketService.getTicketVO(((MemberVO)session.getAttribute("user")).getId());
		ticketAdd.add(ticket);
		session.setAttribute("tickets", ticketAdd);
		
		model.addAttribute("ticketNumber", ticketNumber);
		
		// 세션에 티켓 정보 추가.
		
		
		//model.addAttribute("seatList", ticketService.getSeatList(ticket.getTheaterName(),ticket.getRoomName()));
		return model;
	}
	@RequestMapping("/getId")
	public Model getId(HttpSession session,Model model){
		logger.info("TicketController getId() - 진입");
		logger.info("session : {}",session.getAttribute("user"));
		MemberVO member = (MemberVO) session.getAttribute("user");
		if (member!=null) {
			model.addAttribute("id",member.getId());
		}
		return model;
		}
}
