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
	 
	@RequestMapping(value = "owner_myinfo.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_myinfo(Locale locale, Model model,HttpServletRequest request) {
		logger.info("점주 나의정보조회{}.", locale);  
		HttpSession session=request.getSession();   
		ODto oldto=(ODto)session.getAttribute("oldto");
		ODto dto=(ODto)oService.ownerMyInfo(oldto.getOwner_id());	
		model.addAttribute("dto",dto); 
		return "owner/owner_myinfo"; 
	}
	
	
	@RequestMapping(value = "owner_myinfo_update.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_myinfo_update(Locale locale, Model model,ODto dto,String owner_email1,String owner_email3) {
		logger.info("점주 나의정보수정{}.", locale);  
		dto.setOwner_email(owner_email1+"@"+owner_email3);
		boolean isS=oService.ownerUpdate(dto);
		if(isS) {			
			return "redirect:owner_myinfo.do"; 
		}else {
			return "";
		}
		
	}
	 
	
	
	@RequestMapping(value = "owner_myinfo_delete.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_myinfo_delete(Locale locale, Model model,HttpServletRequest request) {
		logger.info("점주 탈퇴{}.", locale);  
		HttpSession session=request.getSession(); 
		ODto oldto=(ODto)session.getAttribute("oldto");
		boolean isS=oService.ownerDelete(oldto.getOwner_id());
		if(isS) {
			session.invalidate();
			return "redirect:index.jsp"; 
		}else {
			return "";  
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "owner_idcheck_ajax.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String, String> owner_idcheck_ajax(Locale locale, Model model,String owner_id) {
		logger.info("점주 아이디체크ajax {}.", locale);
		System.out.println("@@@점주아이디::"+owner_id); 
		String owner_result=(String)oService.ownerIdCheck(owner_id);
		Map<String, String> map=new HashMap<>();
		map.put("owner_result", owner_result); 
		return map; 
	}
	
	
	@RequestMapping(value = "owner_mystore_info.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_mystore_info(Locale locale, Model model,HttpServletRequest request) {
		logger.info("점주 매장정보{}.", locale);
		return "owner/owner_mystore_info";
	}
	
}
