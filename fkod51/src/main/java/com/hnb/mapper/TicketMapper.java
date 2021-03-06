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
	public int getCountByKey(int key);
	public List<TicketVO> getTicketVO(String id);
	public List<TicketVO> getAllTicketVO();
	public TicketVO getTicketByTicketNumber(String ticketNumber);
	public int deleteSeatNumber(String seatNumber);
	public int cancel(String ticketNumber);
}
