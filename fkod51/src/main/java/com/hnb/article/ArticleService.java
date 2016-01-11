package com.hnb.article;

import java.util.List;

import com.hnb.global.Command;

public interface ArticleService {
	//CRUD
	
	// C : 추가(회원가입)
	public int write(ArticleVO article);
	
	// R : 조회
	public List<ArticleVO> getList(Command command); // 전체조회
	public List<ArticleVO> searchByKeyword(Command command); //임의의 값으로 검색
	public ArticleVO selectById(int rcdNo); // 글 번호로 조회
	public int count(); //게시글 조회
	public int countByKeyword(Command command); // 검색결과 갯수만 조회
	
	// U : 업데이트
	public int update(ArticleVO article);
	
	// D : 삭제 (회원탈퇴)
	public int delete(int rcdNo);

	public int reply(ArticleVO article);

	public List<ArticleVO> selectByGrp(int grpNo);

	public List<ArticleVO> getAllList();

}
