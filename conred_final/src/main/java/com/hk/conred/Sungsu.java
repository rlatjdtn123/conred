package com.hk.conred;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.conred.dtos.UDto;
import com.hk.conred.service.IOService;
import com.hk.conred.service.IUService;


@Controller
public class Sungsu {
	
	private static final Logger logger = LoggerFactory.getLogger(Sungsu.class);
	
	
//	@RequestMapping(value = "home.do", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		return "test/home"; 
//	}
	
	
	@Autowired
	private IUService uService;
	
	@Autowired
	private IOService oService;
	
	@RequestMapping(value = "sungsu.do", method = RequestMethod.GET)
	public String sungsu(Locale locale, Model model) {
		logger.info("테스트용 푸터 접근 {}.", locale);
		
		
		
		return "test/sungsu"; 
	}
	
	
	
	@RequestMapping(value = "user_regist.do", method = RequestMethod.GET)
	public String user_regist(Locale locale, Model model) {
		logger.info("테스트용 유저 회원가입 접근 {}.", locale);
	
		return "user/user_regist"; 
	}
		
		
		
			
	@RequestMapping(value = "user_regist_category.do", method = RequestMethod.GET)
	public String user_regist_category(Locale locale, Model model) {
		logger.info("테스트용 유저 회원가입 접근 {}.", locale);
		
		return "user/user_regist_category"; 
	}
		
		
		
		
	@RequestMapping(value = "user_login.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_login(Locale locale, Model model,HttpServletRequest request,UDto dto) {
		logger.info("유저 로그인접근 {}.", locale);
		System.out.println("ddddddddddddddddddd:   "+dto.getUser_id());
		HttpSession session=request.getSession();
		UDto ldto=uService.getLogin(dto.getUser_id(),dto.getUser_password());
		
		System.out.println(ldto.getUser_id());
		
		if(ldto.getUser_out().equals("Y")){
			System.out.println("탈퇴한 회원 입니다");
			return "";
		}else if(ldto.getUser_black().equals("Y")) {
			System.out.println("블랙된 회원입니다");
			return "";
		}else if(!ldto.getUser_role().equals("user")||ldto.getUser_id()==null||ldto.getUser_id().equals("")) {
			System.out.println("아이디 다시한번 확인해주세요");
			return "";
		}else{
			session.setAttribute("ldto", ldto);
			return "all/users_main"; 
		}	
	}
	
	
	@RequestMapping(value = "user_logout.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_logout(Locale locale, Model model,HttpServletRequest request) {
		logger.info("사용자 로그아웃 {}.", locale);
		request.getSession().invalidate();
		return "redirect:index.jsp"; 
	}
		
	
	@RequestMapping(value = "user_mypage.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_mypage(Locale locale, Model model) {
		logger.info("사용자 마이페이지{}.", locale);
		
		return "user/user_mypage";  
	}
	
	@RequestMapping(value = "user_mypage_review.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_mypage_review(Locale locale, Model model) {
		logger.info("사용자 마이페이지_리뷰{}.", locale);
		
		return "user/user_mypage_review";  
	}
	
	@RequestMapping(value = "user_mypage_qna.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_mypage_qna(Locale locale, Model model) {
		logger.info("사용자 마이페이지_문의{}.", locale);
		
		return "user/user_mypage_qna";  
	}
	
	
		
	@RequestMapping(value = "user_mypage_reservation.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_mypage_reservation(Locale locale, Model model) {
		logger.info("사용자 마이페이지_문의{}.", locale);
		
		return "user/user_mypage_reservation";  
	}
	
	
	@RequestMapping(value = "user_mypage_like.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_mypage_like(Locale locale, Model model) {
		logger.info("사용자 마이페이지_문의{}.", locale);
		
		return "user/user_mypage_like";  
	}
	
	
	
	
	
	
	
	
	
	
	/*
	
	
	
	
	       
	owner_login.do
	
	
	 */
	
	@RequestMapping(value = "asd.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String asd(Locale locale, Model model) {
		logger.info("사용자 마이페이지_문의{}.", locale);
		
		return "user/user_mypage_like";  
	}
	
	
	
	
	
	
	
	
}
