package com.hnb.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hnb.movie.MovieVO;

@Repository
public interface MovieMapper {
	public List<MovieVO> selectAll();
	public List<MovieVO> selectChart();
	public int insert(MovieVO o);
	public int update(MovieVO o);
	public int delete(String filmNumber);
	public MovieVO selectNameBy(String movieName);

}
