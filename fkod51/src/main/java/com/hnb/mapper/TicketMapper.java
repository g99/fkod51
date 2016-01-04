package com.hnb.mapper;

import java.util.List;

import com.hnb.ticket.TicketVO;



public interface TicketMapper {
	// C
	public int insert(TicketVO o);
	
	// R
	public List<TicketVO> selectAll();
	public TicketVO selectOneBy(String filmNumber);
	public int countBy(String filmNumber);
	public int count();
	
	// U
	public int update(TicketVO o);
	
	// D
	public int delete(String filmNumber);

	public List selectRoom(String theater, String room);
}
