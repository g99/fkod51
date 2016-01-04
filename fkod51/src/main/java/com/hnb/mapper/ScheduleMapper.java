package com.hnb.mapper;

import java.util.List;

import com.hnb.schedule.ScheduleVO;

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
		public List<?> getTheaterListByMD(String movie, String date);
		public List<?> getShowDateListByMT(String movie, String theater);
		public List<?> getMovieRateByTD(String theater, String date);
		public List<?> getMovieAscByTD(String theater, String date);
		public List<?> getMovieRateByT(String theater);
		public List<?> getMovieAscByT(String theater);
		public List<?> getShowDateListByT(String theater);
		public List<?> getMovieRateByD(String date);
		public List<?> getMovieAscByD(String date);
		public List<?> getTheaterListByD(String date);
		public List<?> getTimeList(String movie, String theater, String date);
		public String getFilmNumberBy(String movie);
		
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
