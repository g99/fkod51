package com.hnb.ticket;

import java.util.List;

public interface TicketService {
	public List<?> getSeatList(String theater, String room);

	public int getCountByKey(int key);
}
