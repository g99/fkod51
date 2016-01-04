package com.hnb.ticket;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnb.mapper.ScheduleMapper;
import com.hnb.mapper.TicketMapper;


@Service

public class TicketServiceImpl implements TicketService {
	@Autowired private SqlSession sqlSession;
	
	@Override
	public List<String> getRateList() {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		return mapper.selectDateAll();
	}
	@Override
	public List<String> getAscList() {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		return mapper.selectMovieAscAll();
	}
	@Override
	public List<String> getTheaterList() {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		return mapper.selectTheaterAll();
	}
	@Override
	public List<String> getShowDateList() {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		return mapper.selectDateAll();
	}
	@Override
	public List<String> getTheaterListByM(String movie) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		return mapper.selectTheaterByM(movie);
	}
	@Override
	public List<String> getShowDateListByM(String movie) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		return mapper.selectDateByM(movie);
	}
	@Override
	public List<?> getTheaterListByMD(String movie, String date) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		return mapper.selectTheaterByMD(movie, date);
	}
	@Override
	public List<?> getShowDateListByMT(String movie, String theater) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		return mapper.selectDateByMT(movie, theater);
	}
	@Override
	public List<?> getMovieRateByTD(String theater, String date) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		return mapper.selectMovieRateByTD(theater, date);
	}
	@Override
	public List<?> getMovieAscByTD(String theater, String date) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		return mapper.selectMovieAscByTD(theater, date);
	}
	@Override
	public List<?> getMovieRateByT(String theater) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		return mapper.selectMovieRateByT(theater);
	}
	@Override
	public List<?> getMovieAscByT(String theater) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		return mapper.selectMovieAscByT(theater);
	}
	@Override
	public List<?> getShowDateListByT(String theater) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		return mapper.selectDateByT(theater);
	}
	@Override
	public List<?> getMovieRateByD(String date) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		return mapper.selectMovieRateByD(date);
	}
	@Override
	public List<?> getMovieAscByD(String date) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		return mapper.selectMovieAscByD(date);
	}
	@Override
	public List<?> getTheaterListByD(String date) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		return mapper.selectTheaterByD(date);
	}
	@Override
	public List<?> getTimeList(String movie, String theater, String date) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		return mapper.selectTime(movie, theater, date);
	}
	@Override
	public String getFilmNumberBy(String movie) {
		ScheduleMapper mapper = sqlSession.getMapper(ScheduleMapper.class);
		return mapper.selectFilmNumber(movie);
	}
	@Override
	public List<?> getSeatList(String theater, String room) {
		TicketMapper mapper = sqlSession.getMapper(TicketMapper.class);
		return mapper.selectRoom(theater, room);
	}
}
