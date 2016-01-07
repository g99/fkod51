package com.hnb.ticket;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("user")
@RequestMapping("/ticket")
public class TicketController {
	private static final Logger logger = LoggerFactory.getLogger(TicketController.class);
	@Autowired TicketServiceImpl ticketService;
	@Autowired TicketVO ticket;
	
	@RequestMapping("/book")
	public Model book(
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
		//model.addAttribute("seatList", ticketService.getSeatList(ticket.getTheaterName(),ticket.getRoomName()));
		return model;
	}
}
