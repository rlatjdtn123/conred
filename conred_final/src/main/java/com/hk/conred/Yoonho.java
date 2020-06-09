package com.hk.conred;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.conred.dtos.CListDto;
import com.hk.conred.dtos.CMainDto;
import com.hk.conred.dtos.MenuDto;
import com.hk.conred.dtos.ODto;
import com.hk.conred.dtos.SDto;
import com.hk.conred.dtos.STimeDto;
import com.hk.conred.dtos.UDto;
import com.hk.conred.service.ICListService;
import com.hk.conred.service.ICMainService;
import com.hk.conred.service.IMenuService;
import com.hk.conred.service.IOService;
import com.hk.conred.service.ISService;
import com.hk.conred.service.ISTimeService;
import com.hk.conred.service.OServiceImp;

@Controller
public class Yoonho {
	
	private static final Logger logger = LoggerFactory.getLogger(Yoonho.class);
	
	@Autowired
	private IOService oService;
	@Autowired
	private ISService sService;
	@Autowired
	private ISTimeService sTimeService;
	@Autowired
	private ICMainService cMainService;
	@Autowired
	private ICListService cListService;
	@Autowired
	private IMenuService menuService;
	
	@RequestMapping(value = "yoonho.do", method = RequestMethod.GET)
	public String yoonho(Locale locale, Model model) {
		logger.info("윤호입장 {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "test/yoonho"; 
	}
	
//	@ResponseBody
//	@RequestMapping(value = "ajax_owner_id.do", method = RequestMethod.GET)
//	public Map<String, Object> ajax_owner_id(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
//		logger.info("아약스: 점주아이디 얻으러 이동 {}.", locale);
//		HttpSession session =request.getSession();
//		ODto oldto = (ODto)session.getAttribute("oldto");
//		SDto seq =sService.selectStoreSeq(oldto);
//		System.out.println(seq);
//		System.out.println(seq.getStore_seq());
//		
//		Map<String, Object> map =new HashMap<>();
//		map.put("seq", seq.getStore_seq());
//		return map; 
//	}
	
	@RequestMapping(value = "header.do", method = RequestMethod.GET)
	public String header(Locale locale, Model model) {
		logger.info("헤더1로 이동 {}.", locale);

		return "all/header"; 
	}
	@RequestMapping(value = "header2.do", method = RequestMethod.GET)
	public String header2(Locale locale, Model model) {
		logger.info("헤더2로 이동 {}.", locale);
		
		return "all/header2"; 
	}
	@RequestMapping(value = "header_map.do", method = RequestMethod.GET)
	public String header_map(Locale locale, Model model) {
		logger.info("헤더_맵으로 {}.", locale);
		
		
		return "all/header_map"; 
	}
	
	@RequestMapping(value = "container.do", method = RequestMethod.GET)
	public String container(Locale locale, Model model) {
		logger.info("컨테이너로 이동 {}.", locale);
		
		return "test/container"; 
	}
	@RequestMapping(value = "template.do", method = RequestMethod.GET)
	public String template(Locale locale, Model model) {
		logger.info("템플릿으로이동 {}.", locale);
		
		return "test/template"; 
	}

	
	@RequestMapping(value = "owner_regist.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_regist(Locale locale, Model model) {
		logger.info("점주 회원가입폼으로 이동 {}.", locale);
		
		return "owner/owner_regist"; 
	}
	

	@RequestMapping(value = "owner_insert.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_insert(Locale locale, Model model, ODto dto, String owner_email1, String owner_email2) {
		logger.info("점주 회원정보 db에 입력 {}.", locale);
		dto.setOwner_email(owner_email1+"@"+owner_email2);
		
		//성별 null일경우 String타입으로 값 받을수 있게 수정(*왜 null값이 입력이 안되는지 모르겠음)
		if(dto.getOwner_sex()==null) {
			dto.setOwner_sex("");
		}
		
		System.out.println(dto.getOwner_id());
		System.out.println(dto.getOwner_password());
		System.out.println(dto.getOwner_name());
		System.out.println(dto.getOwner_email());
		System.out.println(dto.getOwner_birth());
		System.out.println(dto.getOwner_sex());
		System.out.println(dto.getOwner_regdate());
		System.out.println(dto.getOwner_agreement());
		
		
		boolean isS = oService.insertOwner(dto);
		if(isS&&dto.getOwner_agreement().equals("Y")) {
			System.out.println("회원가입성공");
			return "owner/owner_regist_finish"; 
		}else {
			System.out.println("회원가입실패");
			return ""; 
		}
	}

	@RequestMapping(value = "owner_login.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_login(Locale locale, Model model, HttpServletRequest request, ODto dto) {
		logger.info("점주 로그인후 test 공통메인으로 {}.", locale);
		
		HttpSession session=request.getSession();
		ODto oldto=oService.getLogin(dto.getOwner_id(),dto.getOwner_password());
		System.out.println(oldto.getOwner_id());
		SDto seq =sService.selectStoreSeq(oldto);
		System.out.println(seq);
		
		/*탈퇴컬럼 만들기 owner_out*/
		if(oldto.getOwner_id()==null||oldto.getOwner_id().equals("")) {
			System.out.println("아이디 다시한번 확인해주세요");
			return "";
		}else{
			session.setAttribute("oldto", oldto);
			session.setAttribute("sdto", seq);
			session.setMaxInactiveInterval(60*10*6);
			return "all/users_main"; 
		}	
	}

	@RequestMapping(value = "users_main_test.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String users_main_test(Locale locale, Model model) {
		logger.info("공통메인(사용자별메인)테스트로 이동  {}.", locale);
		
		return "test/users_main_test"; 
	}
	
	@RequestMapping(value = "owner_regist_certify.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_regist_certify(Locale locale, Model model) {
		logger.info("점주: 매장등록(사업자정보 입력)으로 이동  {}.", locale);
		
		return "owner/owner_regist_certify"; 
	}
	

	@RequestMapping(value = "owner_regist_store.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_regist_store(Locale locale, Model model, SDto sdto, STimeDto stimedto, HttpServletRequest request) {
		logger.info("점주: 매장등록(매장정보 입력)으로 이동  {}.", locale);
		
		HttpSession session=request.getSession();
		ODto odto= (ODto)session.getAttribute("oldto");
		
		System.out.println("odto 아이디:"+odto.getOwner_id());
		sdto.setOwner_id(odto.getOwner_id()); 
		
		sdto.setStore_license_number(sdto.getStore_license_number().replace(",",""));
		sdto.setStore_owner_phone(sdto.getStore_owner_phone().replace(",",""));
		

		
		System.out.println("sdto 아이디:"+sdto.getOwner_id());
//		System.out.println("sdto 매장명:"+sdto.getStore_name());
		System.out.println("sdto 사업자이름:"+sdto.getStore_owner_name());
//		System.out.println("sdto 매장홈피링크:"+sdto.getStore_path());
//		System.out.println("sdto 간단소개:"+sdto.getStore_intro_simple());
//		System.out.println("sdto 상세소개:"+sdto.getStore_intro());
//		System.out.println("sdto 영업상태:"+sdto.getStore_state());
//		System.out.println("sdto 매장번호:"+sdto.getStore_phone());
//		System.out.println("sdto 담당자번호:"+sdto.getStore_phone_manager());
//		System.out.println("sdto 주소:"+sdto.getStore_address());
//		System.out.println("sdto 상세주소:"+sdto.getStore_address_detail());
//		System.out.println("sdto 영업시간 기타사항:"+sdto.getStore_time_other());
//		System.out.println("sdto 은행명:"+sdto.getStore_bank());
//		System.out.println("sdto 계좌번호:"+sdto.getStore_account());
		System.out.println("sdto 사업자등록번호:"+sdto.getStore_license_number());
		System.out.println("sdto 사업자증원본명:"+sdto.getStore_license_biz_origin());
		System.out.println("sdto 사업자증저장명:"+sdto.getStore_license_biz_stored());
		System.out.println("sdto 사업자증사이즈:"+sdto.getStore_license_biz_size());
		System.out.println("sdto 영업증원본명:"+sdto.getStore_license_sales_origin());
		System.out.println("sdto 영업증저장명:"+sdto.getStore_license_sales_stored());
		System.out.println("sdto 영업증사이즈:"+sdto.getStore_license_sales_size());
		System.out.println("sdto 사업자전화번호:"+sdto.getStore_owner_phone());
		System.out.println("sdto 약관동의:"+sdto.getStore_agreement());
		System.out.println("sdto 관리자승인:"+sdto.getStore_admin_state());
//		System.out.println("sdto 아이디:"+sdto.getStore_maxdate());
//		System.out.println("sdto 아이디:"+sdto.getStore_maxman());
		
		System.out.println();
		boolean isS=sService.insertStoreCertify(sdto);
		
//		boolean isS=sService.insertStoreCertify(sdto); //원래했던거
//		if(isS&&sdto.getStore_agreement()=="Y") {
		if(isS) {
			System.out.println("매장생성 + 사업자정보등록 :성공");
			return "owner/owner_regist_store";
		}else{
			System.out.println("매장생성 + 사업자정보등록 :실패");
			return ""; 
		}	
	}
	
	@RequestMapping(value = "owner_regist_menu.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_regist_menu(Locale locale, Model model,SDto sdto, STimeDto stimedto, HttpServletRequest request) {
		logger.info("점주: 매장등록 (메뉴정보 입력)으로 이동  {}.", locale);
		
		//세션에서 id정보 가져오기(store_seq구하기용)
		HttpSession session=request.getSession();
		ODto odto= (ODto)session.getAttribute("oldto");
		SDto seq =sService.selectStoreSeq(odto);
		
//		System.out.println("sdto 아이디:"+sdto.getOwner_id());//ㄴㄴㄴㄴㄴㄴㄴ
//		System.out.println("sdto 사업자이름:"+sdto.getStore_owner_name());//ㄴㄴㄴㄴㄴㄴㄴ

		System.out.println("세션에서가져온sdto2의 store_seq값: "+seq.getStore_seq());
		sdto.setStore_seq(seq.getStore_seq());
		System.out.println("sdto에 넣은 store_seq값: "+sdto.getStore_seq());
		//ㅇㅇㅇㅇㅇㅇㅇㅇ
		System.out.println("sdto 매장명:"+sdto.getStore_name());
		System.out.println("sdto 매장홈피링크:"+sdto.getStore_path());
		System.out.println("sdto 간단소개:"+sdto.getStore_intro_simple());
		System.out.println("sdto 상세소개:"+sdto.getStore_intro());
		System.out.println("sdto 영업상태:"+sdto.getStore_state());
		System.out.println("sdto 매장번호:"+sdto.getStore_phone());
		System.out.println("sdto 담당자번호:"+sdto.getStore_phone_manager());
		System.out.println("sdto 주소:"+sdto.getStore_address());
		System.out.println("sdto 상세주소:"+sdto.getStore_address_detail());
		System.out.println("sdto 영업시간 기타사항:"+sdto.getStore_time_other());
		System.out.println("sdto 은행명:"+sdto.getStore_bank());
		System.out.println("sdto 계좌번호:"+sdto.getStore_account());
		
		//ㄴㄴㄴㄴㄴㄴㄴㄴ
//		System.out.println("sdto 사업자등록번호:"+sdto.getStore_license_number());
//		System.out.println("sdto 사업자증원본명:"+sdto.getStore_license_biz_origin());
//		System.out.println("sdto 사업자증저장명:"+sdto.getStore_license_biz_stored());
//		System.out.println("sdto 사업자증사이즈:"+sdto.getStore_license_biz_size());
//		System.out.println("sdto 영업증원본명:"+sdto.getStore_license_sales_origin());
//		System.out.println("sdto 영업증저장명:"+sdto.getStore_license_sales_stored());
//		System.out.println("sdto 영업증사이즈:"+sdto.getStore_license_sales_size());
//		System.out.println("sdto 사업자전화번호:"+sdto.getStore_owner_phone());
//		System.out.println("sdto 약관동의:"+sdto.getStore_agreement());
//		System.out.println("sdto 관리자승인:"+sdto.getStore_admin_state());
		
//		System.out.println("sdto 아이디:"+sdto.getStore_maxdate());
//		System.out.println("sdto 아이디:"+sdto.getStore_maxman());
		
//		System.out.println("배열로받아온 요일:"+store_time_day.toString());
		
		stimedto.setStore_seq(seq.getStore_seq());
		System.out.println("매장번호:"+stimedto.getStore_seq());
		System.out.println("요일:"+stimedto.getStore_time_day());
		System.out.println("개점시간:"+stimedto.getStore_time_open());
		System.out.println("폐점시간:"+stimedto.getStore_time_close());
		System.out.println("휴무여부:"+stimedto.getStore_time_break());
		String [] time_day=stimedto.getStore_time_day().split(",");
		String [] time_open=stimedto.getStore_time_open().split(",");
		String [] time_close=stimedto.getStore_time_close().split(",");
		String [] time_break=stimedto.getStore_time_break().split(",");
//		stimedto.setTime_day(time_day);
//		stimedto.setTime_open(time_open);
//		stimedto.setTime_close(time_close);
//		stimedto.setTime_break(time_break);
		
		
		
//		STimeDto dto1 = new STimeDto();
//		dto1.setStore_time_day(time_day[0]);
//		dto1.setStore_time_open(time_open[0]);
//		dto1.setStore_time_close(time_close[0]);
//		dto1.setStore_time_break(time_break[0]);
//		STimeDto dto2 = new STimeDto();
//		dto2.setStore_time_day(time_day[1]);
//		dto2.setStore_time_open(time_open[1]);
//		dto2.setStore_time_close(time_close[1]);
//		dto2.setStore_time_break(time_break[1]);
//		List<STimeDto> list = new ArrayList<STimeDto>();
//		list.add(dto1);
//		list.add(dto2);
//		Map<String, Object> map =new HashMap<String, Object>();
//		map.put("list", list);
		
		for (int i = 0; i < time_day.length; i++) {
			System.out.println(time_day[i]+" : "+time_open[i]+"~"+time_close[i]+"/폐점여부:"+time_break[i]); 
		}
		
//		return "";
//		boolean isS=sService.updateStoreInfo(sdto,stimedto);
//		boolean isS=sService.updateStoreInfo(sdto,map);
		boolean isS=sService.updateStoreInfo(sdto,time_day,time_open,time_close,time_break);
		if(isS) {
			System.out.println("매장정보 업데이트성공~");
			return "owner/owner_regist_menu";
		}else{
			System.out.println("매장정보 업데이트실패~");
			return ""; 
		}	
	}
	
	@RequestMapping(value = "owner_regist_finish.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_regist_finish(Locale locale, Model model,String[] category_code_2, SDto sdto, CMainDto cmaindto, CListDto clistdto, MenuDto menudto, HttpServletRequest request/*,String store_maxdate*/) {
		logger.info("점주: 매장등록 신청완료 로 이동  {}.", locale);
		
		//세션에서 id정보 가져오기(store_seq구하기용)
		HttpSession session = request.getSession();
		ODto odto =(ODto)session.getAttribute("oldto");
		SDto seq = sService.selectStoreSeq(odto);
		
		System.out.println("세션에서가져온sdto2의 store_seq값: "+seq.getStore_seq());
		sdto.setStore_seq(seq.getStore_seq());
		cmaindto.setStore_seq(seq.getStore_seq());//각 dto안에 store_seq값 넣어주기
		clistdto.setStore_seq(seq.getStore_seq());//각 dto안에 store_seq값 넣어주기
		menudto.setStore_seq(seq.getStore_seq());//각 dto안에 store_seq값 넣어주기
		
		sdto.setStore_seq(seq.getStore_seq());
//		if(sdto.getStore_maxdate()==0) {
//			sdto.setStore_maxdate(0);
//		}
//		if(sdto.getStore_maxman()==0) {
//			sdto.setStore_maxdate(0);
//		}
		System.out.println("sdto에 넣은 store_seq값: "+sdto.getStore_seq());
		System.out.println("sdto 최대일수:"+sdto.getStore_maxdate());
		System.out.println("sdto 허용인원:"+sdto.getStore_maxman());
		
		//체크한 대표카테고리
		System.out.println("CMain 카테고리:"+cmaindto.getCategory_code());
		//체크한 세부카테고리
		System.out.println("CList 카테고리:"+clistdto.getCategory_code_small());
		String [] clist=clistdto.getCategory_code_small().split(",");
		//만든 메뉴
		String [] name=menudto.getMenu_name().split(",");
		String [] content=menudto.getMenu_content().split(",");
		String [] price=menudto.getMenu_price().split(",");
		String [] state=menudto.getMenu_state().split(",");
		for (int i = 0; i < category_code_2.length; i++) {
			System.out.println
			("메뉴 카테고리코드: "+category_code_2[i]+"/ 메뉴명:"+name[i]+"/ 내용:"+
					content[i]+"/ 가격:"+price[i]+"/ 예약코드:"+state[i]);
		}
		System.out.println("메뉴명: "+menudto.getMenu_name());
		System.out.println("내용: "+menudto.getMenu_content());
		System.out.println("가격: "+menudto.getMenu_price());
		System.out.println("예약: "+menudto.getMenu_state());
		
//		return "";
		boolean isS=sService.updateStoreMenu(sdto,cmaindto,clist,category_code_2,name,content,price,state);
		if(isS) {
			System.out.println("메뉴정보 업데이트성공~");
			return "owner/owner_regist_finish"; 
		}else{
			System.out.println("메뉴정보 업데이트실패~");
			return ""; 
		}	
	}
	
	@RequestMapping(value = "store.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String store(Locale locale, Model model,int store_seq, HttpServletRequest request) {
		logger.info("(일렬번호 : "+store_seq+")번 매장(사용자별 매장)으로 이동  {}.", locale);
		HttpSession session = request.getSession();
		ODto odto =(ODto)session.getAttribute("oldto");
		SDto sldto =null;//초기값널
		if (odto!=null) {
			System.out.println("점주 로그인정보가 있습니다. 점주의 store_seq를 빼오겠습니다.");
			sldto = sService.selectStoreSeq(odto);
			System.out.println("점주 로그인정보가 있습니다. 점주의 store_seq를 빼오겠습니다.");
		}
//		int store_seq = Integer.parseInt(store_seq);
		
		SDto store_detail = sService.selectStoreDetail(store_seq);
		List<STimeDto> list_stime =sTimeService.selectStime(store_seq);
		CMainDto cmain =cMainService.selectCMain(store_seq);
		List<CListDto> list_clist =cListService.selectCList(store_seq);
		List<MenuDto> list_menu =menuService.selectMenu(store_seq);

		System.out.println("store_detail : "+store_detail);
		System.out.println("list_stime : "+list_stime);
		System.out.println("cmain : "+cmain);
		System.out.println("list_clist : "+list_clist);
		System.out.println("list_menu : "+list_menu);
		
		System.out.println("sdto의 store_seq:"+store_seq);
		System.out.println("sldto의 store_seq:"+sldto);//초기값(null 이거나,seq가 들어간 sdto가 나옴)
		
		String d =list_menu.get(0).getMenu_name();
		for (int i = 0; i < list_menu.size(); i++) {
			if(list_menu.get(i).getMenu_state()=="A") {
				List<MenuDto> list_menu_A =new ArrayList<>();
				list_menu_A.add(list_menu.get(i));
			}else if(list_menu.get(i).getMenu_state()=="B") {
				List<MenuDto> list_menu_B =new ArrayList<>();
				list_menu_B.add(list_menu.get(i));
			}else if(list_menu.get(i).getMenu_state()=="C") {
				List<MenuDto> list_menu_C =new ArrayList<>();
				list_menu_C.add(list_menu.get(i));
			}else if(list_menu.get(i).getMenu_state()=="D") {
				List<MenuDto> list_menu_D =new ArrayList<>();
				list_menu_D.add(list_menu.get(i));
			}else if(list_menu.get(i).getMenu_state()=="E") {
				List<MenuDto> list_menu_E =new ArrayList<>();
				list_menu_E.add(list_menu.get(i));
			}else if(list_menu.get(i).getMenu_state()=="F") {
				List<MenuDto> list_menu_F =new ArrayList<>();
				list_menu_F.add(list_menu.get(i));
			}else if(list_menu.get(i).getMenu_state()=="G") {
				List<MenuDto> list_menu_G =new ArrayList<>();
				list_menu_G.add(list_menu.get(i));
			}else if(list_menu.get(i).getMenu_state()=="H") {
				List<MenuDto> list_menu_H =new ArrayList<>();
				list_menu_H.add(list_menu.get(i));
			}else if(list_menu.get(i).getMenu_state()=="I") {
				List<MenuDto> list_menu_I =new ArrayList<>();
				list_menu_I.add(list_menu.get(i));
			}
		}
//		if()
//		List<CListDto> list_menu_bycate =list_
		//메뉴 뿌려줄값 나눠주기
//		if(list_menu[0].getMe) {
//			
//		}
		
		//뿌려줄값들
		model.addAttribute("store_detail",store_detail);// 영업시간
		model.addAttribute("list_stime",list_stime);// 영업시간
		model.addAttribute("cmain",cmain);// 대분류카테고리
		model.addAttribute("list_clist",list_clist);// 소분류카테고리
		model.addAttribute("list_menu",list_menu);// 메뉴
		
		//내 매장인지/타인 매장인지 여부 확인용
		model.addAttribute("s_seq",store_seq);//내 매장인지/타인 매장인지 여부 확인용
		model.addAttribute("sldto",sldto);//스토어정보 세션
		
		return "all/store"; 
	}
	
	@RequestMapping(value = "owner_mystore_update.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_mystore_update(Locale locale, Model model) {
		logger.info("매장 업데이트 폼으로 이동  {}.", locale);
		
		return "owner/owner_mystore_update"; 
	}
	
	@RequestMapping(value = "owner_mystore_reservation.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_mystore_reservation(Locale locale, Model model) {
		logger.info("매장관리> 예약으로 이동  {}.", locale);
		
		return "owner/owner_mystore_reservation"; 
	}
	
	@RequestMapping(value = "owner_mystore_review.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_mystore_review(Locale locale, Model model) {
		logger.info("매장관리> 리뷰로 이동  {}.", locale);
		
		return "owner/owner_mystore_review"; 
	}
	
	@RequestMapping(value = "owner_mystore_qna.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_mystore_qna(Locale locale, Model model) {
		logger.info("매장관리> 문의로 이동  {}.", locale);
		
		return "owner/owner_mystore_qna"; 
	}
	
	@RequestMapping(value = "qna.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String qna(Locale locale, Model model) {
		logger.info("문의로 이동  {}.", locale);
		
		return "all/qna"; 
	}
	
	@RequestMapping(value = "review.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String review(Locale locale, Model model) {
		logger.info("리뷰로 이동  {}.", locale);
		
		return "all/review"; 
	}

	
	
}
