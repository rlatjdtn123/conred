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
public class Yoonho {
	
	private static final Logger logger = LoggerFactory.getLogger(Yoonho.class);
	
	@RequestMapping(value = "yoonho.do", method = RequestMethod.GET)
	public String yoonho(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "test/yoonho"; 
	}
	
	@RequestMapping(value = "header.do", method = RequestMethod.GET)
	public String header(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		return "test/header"; 
	}
	
	@RequestMapping(value = "template.do", method = RequestMethod.GET)
	public String template(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "test/template"; 
	}
	@RequestMapping(value = "template2.do", method = RequestMethod.GET)
	public String template2(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "test/template2"; 
	}
	
}
