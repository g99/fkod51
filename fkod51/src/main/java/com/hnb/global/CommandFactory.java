package com.hnb.global;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.hnb.member.MemberController;

public class CommandFactory {
	private static final Logger logger = LoggerFactory.getLogger(MemberController. class);
	public static Command list(String pageNo){
		logger .info("CommandFactory : 페이지넘버 = {}", pageNo);
		return new Command(pageNo);
	}
	
	public static Command seach(String column, String keyword, String pageNo){
		logger .info("CommandFactory : 컬럼 = {}", column);
		logger .info("CommandFactory : 검색어 = {}", column);
		logger .info("CommandFactory : 페이지넘버 = {}", column);
		return new Command(column, keyword, pageNo);
	}
}
