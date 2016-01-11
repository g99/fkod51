package com.hnb.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.hnb.ticket.TicketVO;

@Repository
public interface TicketMapper {
	public List<?> getSeatList(String theater, String room);
	public int book(TicketVO ticket);
	public int insertSeatNumber(String seatNumber);
	public int updateSeatStatus(Map<String, Object> parameters);
}
