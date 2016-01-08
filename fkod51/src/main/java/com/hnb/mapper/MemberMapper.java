package com.hnb.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hnb.global.Command;
import com.hnb.member.MemberVO;

@Repository

public interface MemberMapper {
	//CRUD
	
	// C : 추가(회원가입)
	public int insert(MemberVO member);
	
	// R : 조회
	public List<MemberVO> selectAll(Command command); // 전체조회
	public List<MemberVO> selectSomeBy(Command command); //임의의 값으로 검색
	public MemberVO selectOneBy(String id); //아이디로 조회
	public MemberVO selectByEmail(String email); //이메일로 조회
	public int count(); //전체회원수 조회
	public MemberVO login(String id, String pass); //로그인
	public int countByKeyword(Command command); // 검색결과 갯수만 조회
	
	// U : 업데이트
	public int update(MemberVO member);
	
	// D : 삭제 (회원탈퇴)
	public int delete(String id);

	

	
	
	
	
}