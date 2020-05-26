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
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	@RequestMapping(value = "admin_site_userlist.do", method = RequestMethod.GET)
	public String axxx(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
	
		return "admin/admin_site_userlist";
	}
	
}
