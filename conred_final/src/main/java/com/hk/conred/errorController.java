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
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class errorController {
	 
	private static final Logger logger = LoggerFactory.getLogger(errorController.class);
	

	@RequestMapping(value = "error.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String home(Locale locale, Model model,@RequestParam("msg") String msg) {
		logger.info("error컨트롤러 {}.", locale);

		model.addAttribute("msg", msg);
		return "error/error"; 
	}
	
}
