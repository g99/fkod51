package com.hnb.ticket;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ticket")
public class TicketController {
	private static final Logger logger = LoggerFactory.getLogger(TicketController.class);
	@Autowired TicketServiceImpl ticketService;
	@Autowired TicketVO ticket;
	
	@RequestMapping("/Ticket")
	public String ticketMain(){
		logger.info("TicketController-ticketMain() 진입");
		return "ticket/Ticket.jsp";
	}
	
	@RequestMapping("/initSeats")
	public Model initSeats(Model model){
		logger.info("TicketController-initSeats() 진입");
		model.addAttribute("seatList", ticketService.getSeatList(ticket.getTheaterName(),ticket.getRoomName()));
		return model;
	}
}
