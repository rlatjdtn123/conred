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
public class Sungsu {
	
	private static final Logger logger = LoggerFactory.getLogger(Sungsu.class);
	
	
//	@RequestMapping(value = "home.do", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		return "test/home"; 
//	}
	
	

	
	
	@RequestMapping(value = "sungsu.do", method = RequestMethod.GET)
	public String sungsu(Locale locale, Model model) {
		logger.info("테스트용 푸터 접근 {}.", locale);
		
		
		
		return "test/sungsu"; 
	}
	
	
	
	@RequestMapping(value = "user_regist.do", method = RequestMethod.GET)
	public String user_regist(Locale locale, Model model) {
		logger.info("테스트용 유저 회원가입 접근 {}.", locale);
	
		return "user/user_regist"; 
	}
		
		
		
			
	@RequestMapping(value = "user_regist_category.do", method = RequestMethod.GET)
	public String user_regist_category(Locale locale, Model model) {
		logger.info("테스트용 유저 회원가입 접근 {}.", locale);
		
		return "user/user_regist_category"; 
	}
		
		
			
		@RequestMapping(value = "login.do", method = RequestMethod.GET)
		public String login(Locale locale, Model model) {
			logger.info("공통 로그인폼 접근 {}.", locale);
		
			return "all/login"; 
		}
		
		
		@RequestMapping(value = "user_login.do", method = RequestMethod.GET)
		public String user_login(Locale locale, Model model) {
			logger.info("유저 로그인접근 {}.", locale);
				
			return ""; 
		}
		
}
