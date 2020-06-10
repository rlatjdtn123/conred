package com.hk.conred;



import java.util.List;
import java.util.Locale;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.hk.conred.dtos.SDto;
import com.hk.conred.dtos.UDto;
import com.hk.conred.service.IInterestsService;




 
@Controller
public class Haekang {

	
	private static final Logger logger = LoggerFactory.getLogger(Haekang.class);
	
	@RequestMapping(value = "haekang.do", method = RequestMethod.GET)
	public String Haekang(Locale locale, Model model) {
		logger.info("테스트용 푸터 접근 {}.", locale);
	
		
		
		return "test/haekang"; 
	}
	
	@Autowired IInterestsService interService ;
	HttpSession session;
	
	@RequestMapping(value = "test_index.do", method = RequestMethod.GET)
	public String test_index(Locale locale, Model model) {
		logger.info("테스트 인덱스 접근 {}.", locale);
	
		
		
		return "test/test_index"; 
	}
	
//	UDto uldto=(UDto)session.getAttribute("uldto");
	@RequestMapping(value = "user_interests_recommended.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String user_interests_recommended(HttpServletRequest request, Locale locale, Model model, UDto udto, SDto sdto, String user_id) {
		logger.info("관리자 - 오너 목록 전체 조회 및 키워드 조회 기능 {}.", locale); 
			
		HttpSession session=request.getSession();
		UDto uldto = (UDto)session.getAttribute("uldto");//Object(uldto객체)
		
		List<SDto> list = interService.user_interests_recommended(uldto.getUser_id());
							   
		model.addAttribute("list",list);//list[sDto,sDto[c,c,c,cDto,iDto[c,c]]...]
//			                                  new SDto().getcDto().getCategory_name()
			
		
		
		return "test/test_index";
	}	
	
	
}