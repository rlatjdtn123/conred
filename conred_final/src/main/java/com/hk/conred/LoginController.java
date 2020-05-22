package com.hk.conred;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		logger.info("공통 로그인폼 접근 {}.", locale);
	 
		return "all/login"; 
	}
	@RequestMapping(value = "select_regist.do", method = RequestMethod.GET)
	public String select_regist(Locale locale, Model model) {
		logger.info("사용자 회원가입폼 접근 {}.", locale);
		
		return "all/select_regist"; 
	}

	@RequestMapping(value = "owner_regist.do", method = RequestMethod.GET)
	public String owner_regist(Locale locale, Model model) {
		logger.info("점주 회원가입폼 접근 {}.", locale);
		
		return "owner/owner_regist"; 
	}
	
}
