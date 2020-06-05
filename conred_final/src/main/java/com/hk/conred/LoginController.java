package com.hk.conred;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.conred.dtos.UDto;


@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		logger.info("공통 로그인폼 접근 {}.", locale);
	 
		return "all/login"; 
	}
	
	@RequestMapping(value = "user_insert.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_insert(Locale locale, Model model,UDto dto,String user_email1,String user_email3,HttpServletRequest request) {
		logger.info("테스트용 유저 회원가입 폼 {}.", locale);
		dto.setUser_email(user_email1+"@"+user_email3);
		//성별 null일경우 String타입으로 값 받을수 있게 수정(*왜 null값이 입력이 안되는지 모르겠음)
		if(dto.getUser_sex()==null) {
			dto.setUser_sex("");
		}
		HttpSession session=request.getSession();
		session.setAttribute("udto", dto);
		return "user/user_regist_category";
	}	 
	
}
