package com.hnb.member;

import java.util.List;

import com.hnb.global.Command;

public interface MemberService {
	// C : 추가(회원가입)
	public int join(MemberVO member);
	
	// R : 조회
	public List<MemberVO> getList(Command command); //전체회원목록
	public List<MemberVO> searchByKeyword(Command command); //임의의 값으로 검색
	public MemberVO selectById(String id); //아이디로 조회
	public int count(); //전체회원수 조회
	public MemberVO login(String id, String pass); //로그인
	public int countByKeyword(Command command); // 검색결과의 갯수만 ㅏ조회
	
	// U : 개인정보 변경
	public int change(MemberVO member);
	
	// D : 삭제 (회원탈퇴)
	public int remove(String id);
}
