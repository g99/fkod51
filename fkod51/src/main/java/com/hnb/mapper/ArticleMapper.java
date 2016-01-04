package com.hnb.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hnb.article.ArticleVO;
import com.hnb.global.Command;
@Repository
public interface ArticleMapper {
	//CRUD
	
	// C : 추가(회원가입)
	public int write(ArticleVO article);
	
	// R : 조회
	public List<ArticleVO> selectAll(Command command); // 전체조회
	public List<ArticleVO> selectSomeBy(Command command); //임의의 값으로 검색
	public ArticleVO selectByRcdNo(int rcdNo); // 글 번호로 조회
	public List<ArticleVO> descSelect(ArticleVO article);
	public String getPassword(int rcdNo);
	public int count(); //게시글 조회
	public int countByKeyword(Command command); // 검색결과 갯수만 조회
	public ArticleVO descSelectByKeyword(Command command);
	// U : 업데이트
	public int update(ArticleVO article);
	public int updateRefer(int rcdNo);
	// D : 삭제 (회원탈퇴)
	public int delete(int rcdNo);
}
