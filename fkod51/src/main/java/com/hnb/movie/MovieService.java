package com.hnb.movie;

import java.util.List;


public interface MovieService {
	public int register(MovieVO o);	//영화등록
	public int change(MovieVO o); //영화수정
	public int remove(String filmNumber); //영화 삭제
	public MovieVO searchByName(String filmName); //제목으로 검색
	public List<MovieVO> getList(); //전체 영화목록
	public List<MovieVO> getFilmNum();

}
