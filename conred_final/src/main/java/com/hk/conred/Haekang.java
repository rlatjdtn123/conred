package com.hk.conred;



import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;




 
@Controller
public class Haekang {
	
	private static final Logger logger = LoggerFactory.getLogger(Haekang.class);
	
	@RequestMapping(value = "Haekang.do", method = RequestMethod.GET)
	public String Haekang(Locale locale, Model model) {
		logger.info("테스트용 푸터 접근 {}.", locale);
		
		
		
		return "test/Haekang"; 
	}
}