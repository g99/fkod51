package com.hnb.movie;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnb.mapper.MovieMapper;


@Service
public class MovieServiceImpl implements MovieService{
	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);
	
	@Autowired private SqlSession sqlSession;
	
	@Override	//영화등록
	public int register(MovieVO o) {
		MovieMapper mapper = sqlSession.getMapper(MovieMapper.class);
		return mapper.insert(o);
	}
	@Override	//영화수정
	public int change(MovieVO o) {
		MovieMapper mapper = sqlSession.getMapper(MovieMapper.class);
		return mapper.update(o);
	}
	@Override	//영화삭제
	public int remove(String filmNumber) {
		MovieMapper mapper = sqlSession.getMapper(MovieMapper.class);
		return mapper.delete(filmNumber);
	}
	@Override	//영화제목으로 검색
	public MovieVO searchByName(String filmName) {
		MovieMapper mapper = sqlSession.getMapper(MovieMapper.class);
		return mapper.selectNameBy(filmName);
	}
	@Override	//영화전체목록
	public List<MovieVO> getList() {
		logger.info("MovieServiceImpl : getList() ");
		MovieMapper mapper = sqlSession.getMapper(MovieMapper.class); // 인터페이스를 구현하는 클래스
		List<MovieVO> list = mapper.selectAll();
		logger.info("마이바티스 : {}", list);
		return list;
	}
	@Override
	public List<MovieVO> getFilmNum() {
		MovieMapper mapper = sqlSession.getMapper(MovieMapper.class);
		return mapper.selectChart();
	}
	
}
