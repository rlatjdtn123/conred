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
public class MapController {
	
	private static final Logger logger = LoggerFactory.getLogger(MapController.class);
	

	@RequestMapping(value = "map.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("맵으로 이동 {}.", locale);
		
		return "all/map"; 
	}
	
}
