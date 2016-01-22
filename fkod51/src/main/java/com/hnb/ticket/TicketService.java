package com.hnb.ticket;

import java.util.List;

public interface TicketService {
	public List<?> getSeatList(String theater, String room);
	public int book(TicketVO ticket);
	public int insertSeatNumber(String seatNumber);
	public int updateSeatStatus(int quantity, String filmNumber, int theaterSeq, String roomName, String date, String startTime);
	public int getCountByKey(int key);
	public List<TicketVO> getTicketVO(String id);
	public List<TicketVO> getAllTicketVO();
	public TicketVO getTicketByTicketNumber(String ticketNumber);
	public int deleteSeatNumber(String seatNumber);
	public int cancel(String ticketNumber);
}
