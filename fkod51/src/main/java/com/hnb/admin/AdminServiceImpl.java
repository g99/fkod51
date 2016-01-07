package com.hnb.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hnb.mapper.AdminMapper;
import com.hnb.mapper.MemberMapper;
import com.hnb.member.MemberService;
import com.hnb.member.MemberServiceImpl;
import com.hnb.member.MemberVO;
import com.hnb.movie.MovieController;

@Service
public class AdminServiceImpl implements AdminService{
	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);
	private static AdminService instance = new AdminServiceImpl();
	@Autowired private SqlSession sqlSession;
	
	private AdminServiceImpl() {}
	
	public static AdminService getInstance(){
		return instance;
	}
	
	@Override
	public List<MemberVO> getMemberList() {
		AdminMapper adminDAO = sqlSession.getMapper(AdminMapper.class);
		return adminDAO.memberList();
	}
}
