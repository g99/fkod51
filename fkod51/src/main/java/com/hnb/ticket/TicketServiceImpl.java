package com.hnb.ticket;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnb.mapper.TicketMapper;

@Service
public class TicketServiceImpl implements TicketService {
	private static final Logger logger = LoggerFactory.getLogger(TicketServiceImpl.class);
	@Autowired private SqlSession sqlSession;
	
	@Override
	public List<?> getSeatList(String theater, String room) {
		logger.info("TicketServiceImpl : getSeatList()");
		TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
		return mapper.getSeatList(theater,room);
	}
}
