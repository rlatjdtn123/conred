package com.hk.conred;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.Arrays;
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

import com.hk.conred.dtos.SDto;
import com.hk.conred.dtos.UDto;
import com.hk.conred.service.AServiceImp;
import com.hk.conred.service.IAService;

//admin_store_search.do
@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping(value = "admin_site.do", method = RequestMethod.GET)
	public String admin_site(Locale locale, Model model) {
		logger.info("관리자 사이트관리 페이지로 이동 {}.", locale);
		
	
		return "admin/admin_site";
	}
	
    @Autowired
    private IAService aService ;
    
	@RequestMapping(value = "admin_site_userlist.do", method = RequestMethod.GET)
	public String admin_site_userlist(Locale locale, Model model, UDto udto) {
		logger.info("관리자 - 유저 조회 로이동 {}.", locale); 
		
	
		return "admin/admin_site_userlist";
	}

	
	@RequestMapping(value = "admin_user_search.do", method = RequestMethod.POST)
	public String admin_user_search(Locale locale, Model model, UDto udto, String searchWord,String userSearch) {
		logger.info("관리자 - 유저 목록 전체 조회 및 키워드 조회 기능 {}.", locale); 
		
		if(userSearch.equals("keyWord")) {
			List<UDto> list = aService.admin_site_userlist(searchWord);
			model.addAttribute("list",list);
			
		}else if(userSearch.equals("blackUser")) {
			List<UDto> list = aService.admin_blackuser_search(searchWord);
			model.addAttribute("list",list);
		}
		
		model.addAttribute("userSearch",userSearch);
	
		return "admin/admin_site_userlist";
	}
	@RequestMapping(value = "admin_site_storelist.do", method = RequestMethod.GET)
	public String admin_site_storelist(Locale locale, Model model, UDto udto) {
		logger.info("관리자 - 매장 조회로 페이지로 이동 {}.", locale); 
		
	
		return "admin/admin_site_storelist";
	}
	
	@RequestMapping(value = "admin_store_search.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String admin_store_search(Locale locale, Model model, SDto sdto, String searchWordStore, String storeSearch) {
		logger.info("관리자 - 매장 목록 전체 및 키워드 조회 기능 {}.", locale); 
		
		if(storeSearch.equals("keywordStore")) {
			List<SDto> list = aService.admin_site_storelist(searchWordStore);
			model.addAttribute("list",list);
			
		}else if(storeSearch.equals("adminState")) {
			List<SDto> list = aService.admin_store_state_search(searchWordStore);
			model.addAttribute("list",list);
		}
	
		model.addAttribute("searchWordStore",searchWordStore);
		model.addAttribute("storeSearch",storeSearch);
		
		return "admin/admin_site_storelist";
	}
	
	@RequestMapping(value = "adminMulchk.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String adminMulchk(String[] store_seqs, Locale locale, Model model,String searchWordStore, String storeSearch) throws UnsupportedEncodingException {
		 
		logger.info("관리자 - 매장 선택/다중선택 후 매장 승인 및 취소 기능 {"+(Arrays.toString(store_seqs))+"}.", locale);
		
		boolean isS=aService.adminMulchk(store_seqs);
		
		if(isS) {
			return "redirect:admin_store_search.do?searchWordStore="+(URLEncoder.encode(searchWordStore, "utf-8")) +"&storeSearch="+storeSearch;			
		}else {
			model.addAttribute("msg", "변경에 실패 했습니다. 다시 시도해 주세요!");
			return "error";
		}
		
	}
	@RequestMapping(value = "adminMuldel.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String adminMuldel(String[] store_seqs, Locale locale, Model model,String searchWordStore, String storeSearch) throws UnsupportedEncodingException {
		 
		logger.info("관리자 - 매장 선택/다중선택 후 매장 삭제기능 {"+(Arrays.toString(store_seqs))+"}.", locale);
		
		boolean isS=aService.adminMuldel(store_seqs);
		
		if(isS) {
			return "redirect:admin_store_search.do?searchWordStore="+(URLEncoder.encode(searchWordStore, "utf-8")) +"&storeSearch="+storeSearch;			
		}else {
			model.addAttribute("msg", "삭제에 실패 했습니다. 다시 시도해 주세요!");
			return "error";
		}
		
	}
	
	
}
