package com.hk.conred;

import java.io.Console;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import javax.inject.Inject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;

import com.hk.conred.dtos.UDto;
import com.hk.conred.NaverLoginBO;


@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
    
	/* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
	
	
	@RequestMapping(value = "login.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Locale locale, Model model, HttpSession session) {
		logger.info("공통 로그인폼 접근 및 네이버 로그인 준비 {}.", locale);
	 
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
        //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
        System.out.println("네이버:" + naverAuthUrl);
        
        //네이버 
        model.addAttribute("url", naverAuthUrl);

        /* 생성한 인증 URL을 View로 전달 */
  
		return "all/login"; 
	}
	
//  //네이버 로그인 성공시 callback호출 메소드
//  @RequestMapping(value = "naverSuccess", method = { RequestMethod.GET, RequestMethod.POST })
//  public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
//          throws IOException {
//      System.out.println("여기는 callback");
//      OAuth2AccessToken oauthToken;
//      oauthToken = naverLoginBO.getAccessToken(session, code, state);
//      //로그인 사용자 정보를 읽어온다.
//      apiResult = naverLoginBO.getUserProfile(oauthToken);
//      System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
//      model.addAttribute("result", apiResult);
//      System.out.println("result"+apiResult);
     
      /* 네이버 로그인 성공 페이지 View 호출 */
//    JSONObject jsonobj = jsonparse.stringToJson(apiResult, "response");
//    String snsId = jsonparse.JsonToString(jsonobj, "id");
//    String name = jsonparse.JsonToString(jsonobj, "name");
//
//    UserVO vo = new UserVO();
//    vo.setUser_snsId(snsId);
//    vo.setUser_name(name);
//
//    System.out.println(name);
//    try {
//        vo = service.naverLogin(vo);
//    } catch (Exception e) {
//        // TODO Auto-generated catch block
//        e.printStackTrace();
//    }


//    session.setAttribute("login",vo);
//    return new ModelAndView("views/loginPost", "result", vo);
      
//      return "naverSuccess";
//  }
  

  //로그인성공시 콜백페이지
  @RequestMapping(value = "callback.do", method = { RequestMethod.GET, RequestMethod.POST })
  public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
          throws IOException {
      System.out.println("여기는 callback");
      OAuth2AccessToken oauthToken;
      oauthToken = naverLoginBO.getAccessToken(session, code, state);
      //로그인 사용자 정보를 읽어온다.
      apiResult = naverLoginBO.getUserProfile(oauthToken);
      System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
      model.addAttribute("result", apiResult);
      System.out.println("result"+apiResult);
      
      
      /* 네이버 로그인 성공하면서 JSON 데이터 파싱*/
      
      JSONParser parser = new JSONParser();
      Object obj;
		try {
			obj = parser.parse(apiResult);
			JSONObject jsonObj = (JSONObject) obj;
			System.out.println(jsonObj);
			JSONObject jsonObj2=(JSONObject)jsonObj.get("response");
			System.out.println(jsonObj2.get("name"));
			System.out.println(jsonObj2.get("email"));
			String name=(String)jsonObj2.get("name");
//			JSONObject jsonObjreal = new JSONObject();
		    String email=(String)jsonObj2.get("email");
		    model.addAttribute("name", name);
		    model.addAttribute("email", email);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
      
      
//    JSONObject jsonobj = jsonparse.stringToJson(apiResult, "response");
//    String snsId = jsonparse.JsonToString(jsonobj, "id");
//    String name = jsonparse.JsonToString(jsonobj, "name");
//
//    UserVO vo = new UserVO();
//    vo.setUser_snsId(snsId);
//    vo.setUser_name(name);
//
//    System.out.println(name);
//    try {
//        vo = service.naverLogin(vo);
//    } catch (Exception e) {
//        // TODO Auto-generated catch block
//        e.printStackTrace();
//    }


//    session.setAttribute("login",vo);
//    return new ModelAndView("views/loginPost", "result", vo);
   
      return "user_regist.do";
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
