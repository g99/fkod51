package com.hnb.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface TicketMapper {
	public List<?> getSeatList(String theater, String room);
}
