package com.hnb.ticket;

import java.util.List;

public interface TicketService {
	public List<?> getSeatList(String theater, String room);
	public int getCountByKey(int key);
	public int book(TicketVO ticket);
	public int insertSeatNumber(String seatNumber);
	public int updateSeatStatus(int quantity, String filmNumber, int theaterSeq, String roomName, String date, String startTime);
}
