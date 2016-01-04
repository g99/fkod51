package com.hnb.main;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("메인컨트롤러 home 메소드 진입 {}.", locale);
		return "global/default.tiles";
	}
	
	@RequestMapping("/home")
	public String newHome() {
		logger.info("새로운 홈 진입");
		return "global2/default_seong.jsp";
	}
}
