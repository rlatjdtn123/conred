package com.hk.conred;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.conred.dtos.UDto;
import com.hk.conred.service.AServiceImp;
import com.hk.conred.service.IAService;


@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "admin_site.do", method = RequestMethod.GET)
	public String admin_site(Locale locale, Model model) {
		logger.info("관리자 사이트관리 페이지로 이동 {}.", locale);
		
	
		return "admin/admin_site";
	}
	
    @Autowired
    private IAService aService ;
    
	@RequestMapping(value = "admin_site_userlist.do", method = RequestMethod.GET)
	public String admin_site_userlist(Locale locale, Model model, UDto udto) {
		logger.info("관리자 - 유저목록 전체조회 및 검색 조회 로이동 {}.", locale); 
		
//		List<UDto> list = aService.admin_site_userlist();
//		model.addAttribute("list",list);
//		
//		System.out.println(list);
	
		return "admin/admin_site_userlist";
	}

	
	@RequestMapping(value = "admin_user_search.do", method = RequestMethod.POST)
	public String admin_user_search(Locale locale, Model model, UDto udto, String searchWord,String userSearch) {
		logger.info("관리자 - 유저목록 전체조회 및 검색조회로 이동 {}.", locale); 
		
		
		List<UDto> list = aService.admin_site_userlist(searchWord);
		model.addAttribute("list",list);
		
		System.out.println(list);
	
		return "admin/admin_site_userlist";
	}
	
	
	
	
}
