package com.hnb.schedule;

import java.util.List;

public interface ScheduleService {
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
}
