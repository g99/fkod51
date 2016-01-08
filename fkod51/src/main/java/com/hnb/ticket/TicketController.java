package com.hnb.ticket;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.hnb.member.MemberVO;

@Controller
@SessionAttributes("user")
@RequestMapping("/ticket")
public class TicketController {
	private static final Logger logger = LoggerFactory.getLogger(TicketController.class);
	@Autowired TicketServiceImpl ticketService;
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
			Model model){
		logger.info("TicketController-book() 진입");
		Date nowdate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		String ticketSeq = String.format("%02X", Long.parseLong(sdf.format(nowdate))); // 16진수 문자열로 변환
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
		ticket.setTheaterName(theater);
		ticket.setRoomName(roomName);
		ticket.setSeatNumber(seat_number);
		ticket.setStartTime(time);
		ticket.setDate(date);
		ticket.setAdult(ad);
		ticket.setOldMan(ol);
		ticket.setTeenager(te);
		ticket.setPrice(Integer.parseInt(price));
		
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
