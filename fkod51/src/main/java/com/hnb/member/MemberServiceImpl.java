package com.hnb.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnb.global.Command;
import com.hnb.mapper.MemberMapper;
import com.hnb.movie.MovieController;

@Service

public class MemberServiceImpl  implements MemberService{
	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);
	@Autowired private SqlSession sqlSession;
	/**
	 * DML
	 */
	// 회원가입
	@Override
	public int join(MemberVO member) {
		logger.info("MemberServiceImpl : join");
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.insert(member);
	}
	
	// 전체 회원목록 조회
	@Override
	public List<MemberVO> getList(Command command) {
		logger.info("MemberServiceImpl : getList");
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.selectAll(command);
	}
	
	// 임의의 검색어로 조회
	@Override
	public List<MemberVO> searchByKeyword(Command command) {
		logger.info("MemberServiceImpl : searchByKeyword");
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.selectSomeBy(command);
	}
	
	// ID로 회원검색 - 아이디 유효성 체크 1
	@Override
	public MemberVO selectById(String id) { // 이부분은 서비스 인터페이스에서 정해준 이름이자, 틀이 됨.
		logger.info("MemberServiceImpl : selectById");
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		MemberVO member = mapper.selectOneBy(id); //실제로 mapper에 담겨있는 sql문을 실행시켜 주는 부분
		if (member != null) {
			return member;
		} else {
			return null;
		}
	}
	
	
	//이메일로 회원검색 - 유효성 체크 2
	@Override
	public MemberVO selectByEmail(String email) {
		logger.info("MemberServiceImpl : selectByEmail");
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		MemberVO member = mapper.selectByEmail(email);
		logger.info("selectByEmail은?"+member);
		return member;
	}
	
	
	// 총 회원 수 검색
	@Override
	public int count() {
		logger.info("MemberServiceImpl : count");
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.count();
	}
	
	// 로그인
	@Override
	public MemberVO login(String id, String pass) {
		logger.info("MemberServiceImpl : login");
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		MemberVO loginMember = null;
		loginMember = mapper.selectOneBy(id);
		if (loginMember != null) {
			System.out.println("로그인해서 나온 값은?? "
					+ "* 현재 id가 틀릴경우 아예 mysql자체에서 에러가 나는 것 같음."+loginMember.getId());
			if (loginMember.getId() ==  null) {
				return null;
			} 
			if (loginMember.getPassword().equals(pass)) {
				return loginMember;
			}else{
				return null;
			}
		} else {
			return null;
		}
	}
	
	// 회원정보 변경
	@Override
	public int change(MemberVO member) {
		logger.info("MemberServiceImpl : change");
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.update(member);
	}
	
	// 회원탈퇴
	@Override
	public int remove(String id) {
		logger.info("MemberServiceImpl : remove() 진입");
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.delete(id);
	}

	public int countByKeyword(Command command) {
		logger.info("MemberServiceImpl : countByKeyword");
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.countByKeyword(command);
	}
}
