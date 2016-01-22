package com.hnb.ticket;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public int book(TicketVO ticket) {
		logger.info("TicketServiceImpl : book()");
		TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
		return mapper.book(ticket);
	}

	@Override
	public int insertSeatNumber(String seatNumber) {
		logger.info("TicketServiceImpl : insertSeatNumber()");
		TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
		return mapper.insertSeatNumber(seatNumber);
	}

	@Override
	public int updateSeatStatus(int quantity, String filmNumber, int theaterSeq, String roomName, String date, String startTime) {
		logger.info("TicketServiceImpl : updateSeatStatus()");
		TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("quantity", quantity);
		parameters.put("filmNumber", filmNumber);
		parameters.put("theaterSeq", theaterSeq);
		parameters.put("roomName", roomName);
		parameters.put("showDate", date);
		parameters.put("showTime", startTime);
		return mapper.updateSeatStatus(parameters);
	}
	@Override
	public int getCountByKey(int key){
		TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
		return mapper.getCountByKey(key);
	}

	@Override
	public List<TicketVO> getTicketVO(String id) {
		logger.info("TicketServiceImpl : getTicketVO()");
		TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
		return mapper.getTicketVO(id);
	}
	
	@Override
	public List<TicketVO> getAllTicketVO() {
		TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
		return mapper.getAllTicketVO();
	}

	@Override
	public TicketVO getTicketByTicketNumber(String ticketNumber) {
		TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
		return mapper.getTicketByTicketNumber(ticketNumber);
	}

	@Override
	public int deleteSeatNumber(String seatNumber) {
		logger.info("TicketServiceImpl : deleteSeatNumber()");
		TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
		return mapper.deleteSeatNumber(seatNumber);
	}

	@Override
	public int cancel(String ticketNumber) {
		logger.info("TicketServiceImpl : cancel()");
		TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
		return mapper.cancel(ticketNumber);
	}
}
