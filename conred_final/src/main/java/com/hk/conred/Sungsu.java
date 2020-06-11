package com.hk.conred;

import java.rmi.server.RemoteServer;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
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

import com.hk.conred.dtos.InterestsDto;
import com.hk.conred.dtos.LikeDto;
import com.hk.conred.dtos.MenuDto;
import com.hk.conred.dtos.QnaDto;
import com.hk.conred.dtos.ReplyDto;
import com.hk.conred.dtos.ReserveDto;
import com.hk.conred.dtos.UDto;
import com.hk.conred.service.ILikeService;
import com.hk.conred.service.IMenuService;
import com.hk.conred.service.IOService;
import com.hk.conred.service.IQnaService;
import com.hk.conred.service.IReplyService;
import com.hk.conred.service.IReserveService;
import com.hk.conred.service.IUService;
import com.hk.conred.service.QnaServiceImp;
import com.sun.glass.ui.Menu;

 
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
	
	@Autowired
	private IReserveService reserveService;
	
	@Autowired
	private IQnaService qnaService;
	
	@Autowired
	private ILikeService likeService;
	
	@Autowired
	private IReplyService replyService;
	
	@Autowired
	private IMenuService menuService;
	
	
	
	

	
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
		
//	@RequestMapping(value = "user_insert.do", method = {RequestMethod.GET,RequestMethod.POST})
//	public String user_insert(Locale locale, Model model,UDto dto,String user_email1,String user_email3,HttpServletRequest request) {
//		logger.info("테스트용 유저 회원가입 폼 {}.", locale);
//		dto.setUser_email(user_email1+"@"+user_email3);
//		//성별 null일경우 String타입으로 값 받을수 있게 수정(*왜 null값이 입력이 안되는지 모르겠음)
//		if(dto.getUser_sex()==null) {
//			dto.setUser_sex("");
//		}
//		HttpSession session=request.getSession();
//		session.setAttribute("udto", dto);
//		return "user/user_regist_category";
//	}	 
		 
		
	
	
	
	@RequestMapping(value = "user_regist_category.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_regist_category(Locale locale, Model model,String []category_code,String user_id,HttpServletRequest request) {
		logger.info("관심사 선택완료후 가입완료 메시지 출력페이지로 이동{}.", locale);
			
			HttpSession session=request.getSession();
			UDto dto=(UDto)session.getAttribute("udto");
//			for (int i = 0; i < category_code.length; i++) {
//				System.out.println("@@@@@@@@@@@@@@@@@::"+category_code[i]);
//				System.out.println("!!!!!!!!!!!!!!!!!::"+user_id[i]);
//			}
		
			boolean isS=uService.insertUser(dto, category_code,dto.getUser_id());
			if(isS){ 
				return "user/user_regist_finish";						
			}else {
				return "";
			}
	}
	 
		
		 
	@RequestMapping(value = "user_login.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_login(Locale locale, Model model,HttpServletRequest request,UDto dto) {
		logger.info("유저 로그인접근 {}.", locale);
		HttpSession session=request.getSession();
		UDto uldto=uService.getLogin(dto.getUser_id(),dto.getUser_password());
		
		if(uldto.getUser_out().equals("Y")){
			System.out.println("탈퇴한 회원 입니다");
			return "";
		}else if(uldto.getUser_black().equals("Y")) {
			System.out.println("블랙된 회원입니다");
			return "";
		}else if(uldto.getUser_id()==null||uldto.getUser_id().equals("")) {
			System.out.println("아이디 다시한번 확인해주세요");
			return "";
		}else{
			session.setAttribute("uldto", uldto);
			return "redirect:index.jsp"; 
		}	
	}
	
	
	@RequestMapping(value = "user_logout.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_logout(Locale locale, Model model,HttpServletRequest request) {
		logger.info("사용자 로그아웃 {}.", locale);
		request.getSession().invalidate();
		return "redirect:index.jsp"; 
	} 
		
	
	@RequestMapping(value = "user_mypage.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_mypage(Locale locale, Model model,HttpServletRequest request) {
		logger.info("사용자 마이페이지{}.", locale);
		HttpSession session=request.getSession();
		UDto uldto=(UDto)session.getAttribute("uldto");
		UDto dto=uService.getStats(uldto.getUser_id());
//		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@ ::: "+uldto);
//		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@ ::: "+dto); 
		model.addAttribute("dto", dto);
		
		return "user/user_mypage";  
	}
	
	@RequestMapping(value = "user_mypage_review.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_mypage_review(Locale locale, Model model,HttpServletRequest request) {
		logger.info("사용자 마이페이지_리뷰{}.", locale);
		HttpSession session=request.getSession();
		UDto uldto=(UDto)session.getAttribute("uldto");
		List<ReplyDto> list=replyService.replyList(uldto.getUser_id(),"1");
		model.addAttribute("list",list);
		return "user/user_mypage_review";  
	}
	
	@ResponseBody
	@RequestMapping(value = "review_ajax.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String, List<ReplyDto>> review_ajax(Locale locale, Model model,HttpServletRequest request,String pnum){
		logger.info("사용자 리뷰 스크롤{}.", locale);
		HttpSession session=request.getSession();
		UDto uldto=(UDto)session.getAttribute("uldto");
		List<ReplyDto> list=replyService.replyList(uldto.getUser_id(),pnum);
		Map<String, List<ReplyDto>> map=new HashMap<>();
		map.put("list", list); 
		return map;
	}
	

	
	
	@RequestMapping(value = "user_mypage_qna.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_mypage_qna(Locale locale, Model model,HttpServletRequest request) {
		logger.info("사용자 마이페이지_문의{}.", locale);
		HttpSession session=request.getSession();
		UDto uldto=(UDto)session.getAttribute("uldto");
		List<QnaDto> list=(List<QnaDto>)qnaService.qnaList(uldto.getUser_id(),"1");
		model.addAttribute("list",list);
		return "user/user_mypage_qna";  
	}
	 
	@ResponseBody
	@RequestMapping(value = "qna_ajax.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String, List<QnaDto>> qna_ajax(Locale locale, Model model,HttpServletRequest request,String pnum) {
		logger.info("사용자 문의 스크롤{}.", locale);
		HttpSession session=request.getSession();
		UDto uldto=(UDto)session.getAttribute("uldto");
		List<QnaDto> list=(List<QnaDto>)qnaService.qnaList(uldto.getUser_id(),pnum);
		Map<String, List<QnaDto>> map=new HashMap<>();
		map.put("list", list);
		return map;  
	} 
	
	
		
	@RequestMapping(value = "user_mypage_reservation.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_mypage_reservation(Locale locale, Model model,HttpServletRequest request) {
		logger.info("사용자 마이페이지_예약{}.", locale);
		HttpSession session=request.getSession();
		UDto uldto=(UDto)session.getAttribute("uldto");
		List<ReserveDto> list=reserveService.reserveList(uldto.getUser_id(), "1");
		model.addAttribute("list", list);
		return "user/user_mypage_reserve";  
	}
	
	@ResponseBody 
	@RequestMapping(value = "user_reserve_ajax.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String, List<ReserveDto>> user_reserve_ajax(Locale locale, Model model,HttpServletRequest request,String pnum           ) {
		logger.info("사용자예약 스크롤{}.", locale);
		HttpSession session=request.getSession();
		UDto uldto=(UDto)session.getAttribute("uldto");
		List<ReserveDto> list=reserveService.reserveList(uldto.getUser_id(), pnum);
		Map<String, List<ReserveDto>> map=new HashMap<>();
		map.put("list", list);
		return map;  
	}
	
	
	@RequestMapping(value = "user_mypage_like.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_mypage_like(Locale locale, Model model,HttpServletRequest request) {
		logger.info("사용자 마이페이지_좋아요{}.", locale);
		HttpSession session=request.getSession();
		UDto uldto=(UDto)session.getAttribute("uldto");
		List<LikeDto> list=likeService.likeList(uldto.getUser_id(),"1"); 
		model.addAttribute("list",list);
		return "user/user_mypage_like";  
	}
	
	@ResponseBody
	@RequestMapping(value = "user_like_ajax.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String, List<LikeDto>> user_like_ajax(Locale locale, Model model,HttpServletRequest request,String pnum) {
		logger.info("사용자 좋아요 스크롤{}.", locale);
		HttpSession session=request.getSession();
		UDto uldto=(UDto)session.getAttribute("uldto"); 
		List<LikeDto> list=likeService.likeList(uldto.getUser_id(),pnum);
		Map<String, List<LikeDto>> map=new HashMap<>();
		map.put("list", list);
		return map;   
	}
	
	
	@RequestMapping(value = "select_regist.do", method = RequestMethod.GET)
	public String select_regist(Locale locale, Model model) {
		logger.info("사용자 회원가입폼 접근 {}.", locale);
		
		return "all/select_regist"; 
	}
	
	
	
	
	
	
	
	/*
	
	
	
	
	       
	owner_login.do
	
	
	 */ 
	
	@RequestMapping(value = "asd.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String asd(Locale locale, Model model) {
		logger.info("사용자 마이페이지_문의{}.", locale);
		
		return "user/user_mypage_like";  
	}
	
	
	
	
	@RequestMapping(value = "user_regist_category_test.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_regist_category_test(Locale locale, Model model) {
		logger.info("사용자 카테고리 틀 만들기{}.", locale);
		
		return "user/user_regist_category_test";  
	}
	
		
	@RequestMapping(value = "test_reserve.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String test_reserve(Locale locale, Model model,HttpServletRequest request) {
		logger.info("테스트 결제{}.", locale);
		
		
		return "test/test_reserve";  
	}
	
	@ResponseBody
	@RequestMapping(value = "test_reserve2.do", method = {RequestMethod.GET,RequestMethod.POST})
	public void test_reserve2(Locale locale, Model model,String imp_uid,String merchant_uid) {
		logger.info("가맹점쪽 상황 << 여기서 해당주문건에 대한 정보 받기{}.", locale);
		logger.info("imp_uid:"+imp_uid);
		logger.info("주문번호:"+merchant_uid);
		
//		return "test/test_reserve2";  
	}
	
	
	
	
		
	@RequestMapping(value = "test_menu.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String test_menu(Locale locale, Model model) {
		logger.info("테스트 결제{}.", locale);
		
		return "test/test_menu";  
	}
	
	@RequestMapping(value = "test_reserve_success.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String test_reserve_success(String msg, Locale locale, Model model,HttpServletRequest request,String imp_uid,String merchant_uid) {
		logger.info("테스트 결제2{}.", locale);
//		System.out.println(imp_uid);
//		System.out.println(merchant_uid); 
		model.addAttribute("msg", msg);
		return "test/test_reserve_success";  
	}
	 
	
	@RequestMapping(value = "test_menu2.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String test_menu2(Locale locale, Model model,HttpServletRequest request) {
		logger.info("사용자_메뉴 선택폼{}.", locale);
		HttpSession session=request.getSession();
		UDto uldto=(UDto)session.getAttribute("uldto");
		boolean isS=reserveService.insertReserve(uldto.getUser_id());
		
		if(isS) {
			
			return "redirect:sungsu.do";	
		}else {
			return ""; 
		}
 
	} 
	
	
	
	@RequestMapping(value = "test_menu_success.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String test_menu_success(Locale locale, Model model,int reserve_seq) {
		logger.info("사용자_예약{}.", locale);
//		ReserveDto dto=reserveService.getReserve(reserve_seq);
	
		
	
		return "";
	} 
	
	
//	@RequestMapping(value = "test_reserve_list.do", method = {RequestMethod.GET,RequestMethod.POST})
//	public String test_reserve_list(Locale locale, Model model,HttpServletRequest request) {
//		logger.info("사용자_예약목록{}.", locale);
//		HttpSession session=request.getSession();
//		UDto uldto=(UDto)session.getAttribute("uldto");
//		List<ReserveDto> list=reserveService.reserveList(uldto.getUser_id(),"1");
//		model.addAttribute("list", list);
//		
//	 
//		return "test/test_reserve_list"; 
//	} 
//	
//	
//	@RequestMapping(value = "test_reserve_detail.do", method = {RequestMethod.GET,RequestMethod.POST})
//		public String test_reserve_detail(Locale locale, Model model,int reserve_seq) {
//		logger.info("사용자_예약목록2{}.", locale);
//		ReserveDto dto=reserveService.getReserve(reserve_seq);
//		model.addAttribute("dto", dto);
//		
//		return "test/test_reserve_detail";
//	} 
	
	
	
	@RequestMapping(value = "test_calendar.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String test_calendar(Locale locale, Model model) {
		logger.info("캘린더 테스트{}.", locale);
		

		return "test/test_calendar";
	} 

	
	@RequestMapping(value = "test_calendar02.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String test_calendar02(Locale locale, Model model) {
		logger.info("캘린더 테스트2{}.", locale);
		return "test/test_calendar02";
	} 

	
	
	@RequestMapping(value = "user_store_reserve.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_store_reserve(Locale locale, Model model,int store_seq,String store_name) {
		logger.info("매장 예약가능목록 출력{}.", locale);
		List<MenuDto> list_menu=menuService.selectMenu(store_seq);
		model.addAttribute("list_menu", list_menu);
		model.addAttribute("store_name", store_name);
		System.out.println(store_name);
		return "user/user_store_reserve";
	} 
	
	@RequestMapping(value = "user_reserve_time_select.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_reserve_time_select(Locale locale, Model model,int menu_seq,String menu_state,int store_seq) {
		logger.info("사용자 해당메뉴선택후 숙박/당일여부 별로 예약하러가기{}.", locale);
		List<MenuDto> list=menuService.detailMenu(menu_seq,store_seq);
		if(menu_state.equals("T")) {
			model.addAttribute("list", list);
			return "user/user_reserve_time_selectT";			
		}else if(menu_state.equals("S")){
			model.addAttribute("list", list);
			return "user/user_reserve_time_selectS";
		}else {
			System.out.println("식품/용품 메뉴 선택부분");
			return "";			
		}
	} 
	
	@ResponseBody
	@RequestMapping(value = "user_reserve_time_ajax.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String, List<MenuDto>> user_reserve_time_ajax(Locale locale, Model model,int menu_seq,int store_seq) {
		logger.info("사용자 예약 ajax {}.", locale);
//		System.out.println(menu_seq+"::@@@@@::"+store_seq);
		List<MenuDto> list=menuService.detailMenu(menu_seq,store_seq);
		Map<String, List<MenuDto>> map=new HashMap<>();
		map.put("list", list);	
		return map;
	}  
	
	
	@ResponseBody
	@RequestMapping(value = "user_selectWeek_ajax.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String, List<MenuDto>> user_selectWeek_ajax(Locale locale, Model model,int menu_seq,int store_seq,String store_time_day) {
		logger.info("선택요일에따라 시간출력 {}.", locale);
//		System.out.println(menu_seq+"::@@@@@::"+store_seq);
		System.out.println(store_time_day); 
		List<MenuDto> listWeek=menuService.selectWeek(menu_seq, store_seq, store_time_day);
		Map<String, List<MenuDto>> map=new HashMap<>();
		map.put("listWeek", listWeek); 	
		return map;
	}
	
	
	
}
