package com.hk.conred;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.conred.dtos.ODto;
import com.hk.conred.dtos.QnaDto;
import com.hk.conred.service.IOService;
import com.hk.conred.service.IQnaService;


@Controller
public class OwnerController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private IOService oService;
	 
	@RequestMapping(value = "owner_myinfo.do", method = RequestMethod.GET)
	public String owner_myinfo(Locale locale, Model model,HttpServletRequest request) {
		logger.info("점주 나의정보조회{}.", locale);  
		HttpSession session=request.getSession();
		ODto oldto=(ODto)session.getAttribute("oldto");
		ODto dto=(ODto)oService.ownerMyInfo(oldto.getOwner_id());	
		System.out.println("@@@owner_dto::"+dto);
		model.addAttribute("dto"); 
		return "owner/owner_myinfo"; 
	}

	 
}
