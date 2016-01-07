package com.hnb.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.hnb.schedule.RoomVO;
import com.hnb.schedule.ScheduleVO;

@Repository
public interface ScheduleMapper {
	// C
		public int insert(ScheduleVO o);
		
		// R
		public List<String> selectMovieRateAll();
		public List<String> selectMovieAscAll();
		public List<String> selectTheaterAll();
		public List<String> selectDateAll();
		public ScheduleVO selectOneBy(String filmNumber);
		public int countBy(String filmNumber);
		public int count();
		public List<?> getRateList();
		public List<?> getAscList();
		public List<?> getTheaterList();
		public List<?> getTheaterListByM(String movie);
		public List<?> getShowDateList();
		public List<?> getShowDateListByM(String movie);
		public List<?> getTheaterListByMD(Map<String, String> parameters);
		public List<?> getShowDateListByMT(Map<String, String> parameters);
		public List<?> getMovieRateByTD(Map<String, String> parameters);
		public List<?> getMovieAscByTD(Map<String, String> parameters);
		public List<?> getMovieRateByT(String theater);
		public List<?> getMovieAscByT(String theater);
		public List<?> getShowDateListByT(String theater);
		public List<?> getMovieRateByD(String date);
		public List<?> getMovieAscByD(String date);
		public List<?> getTheaterListByD(String date);
		public List<?> getTimeList(Map<String, String> parameters);
		public String getFilmNumberBy(String movie);
		
		public RoomVO getSeatList(Map<String, String> parameters);
		
		// U
		public int update(ScheduleVO o);
		
		// D
		public int delete(String filmNumber);

		public List<String> selectTheaterByM(String movie);

		public List<String> selectDateByM(String movie);

		public List selectTheaterByMD(String movie, String date);

		public List selectDateByMT(String movie, String theater);

		public List selectMovieRateByTD(String theater, String date);
		
		public List selectMovieAscByTD(String theater, String date);

		public List selectMovieRateByT(String theater);

		public List selectMovieAscByT(String theater);

		public List selectDateByT(String theater);

		public List selectMovieRateByD(String date);

		public List selectMovieAscByD(String date);

		public List selectTheaterByD(String date);

		public List selectTime(String movie, String theater, String date);

		public String selectFilmNumber(String movie);

		
}
