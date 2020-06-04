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

import com.hk.conred.dtos.ODto;
import com.hk.conred.dtos.SDto;
import com.hk.conred.dtos.UDto;
import com.hk.conred.service.IOService;
import com.hk.conred.service.ISService;
import com.hk.conred.service.OServiceImp;

@Controller
public class Yoonho {
	
	private static final Logger logger = LoggerFactory.getLogger(Yoonho.class);
	
	@RequestMapping(value = "yoonho.do", method = RequestMethod.GET)
	public String yoonho(Locale locale, Model model) {
		logger.info("윤호입장 {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "test/yoonho"; 
	}
	
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
	
	@Autowired
	private IOService oService;
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
		
		/*탈퇴컬럼 만들기 owner_out*/
		if(oldto.getOwner_id()==null||oldto.getOwner_id().equals("")) {
			System.out.println("아이디 다시한번 확인해주세요");
			return "";
		}else{
			session.setAttribute("oldto", oldto);
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
	
	@Autowired
	private ISService sService;
	@RequestMapping(value = "owner_regist_store.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_regist_store(Locale locale, Model model, SDto sdto, HttpServletRequest request, String store_owner_phone1, String store_owner_phone2, String store_owner_phone3) {
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
		
		boolean isS=sService.insertStoreCertify(sdto);
		if(isS&&sdto.getStore_agreement()=="Y") {
			System.out.println("매장생성 + 사업자정보등록 :성공");
			return "owner/owner_regist_store";
		}else{
			System.out.println("매장생성 + 사업자정보등록 :실패");
			return ""; 
		}	
	}
	
	@RequestMapping(value = "owner_regist_menu.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_regist_menu(Locale locale, Model model,SDto sdto) {
		logger.info("점주: 매장등록 (메뉴정보 입력)으로 이동  {}.", locale);
		System.out.println(sdto.getOwner_id());
		System.out.println(sdto.getStore_name());
		System.out.println(sdto.getStore_owner_name());
		System.out.println(sdto.getStore_path());
		System.out.println(sdto.getStore_intro_simple());
		System.out.println(sdto.getStore_intro());
		System.out.println(sdto.getStore_state());
		System.out.println(sdto.getStore_phone());
		System.out.println(sdto.getStore_phone_manager());
		System.out.println(sdto.getStore_address());
		System.out.println(sdto.getStore_address_detail());
		System.out.println(sdto.getStore_time_other());
		System.out.println(sdto.getStore_bank());
		System.out.println(sdto.getStore_account());
		System.out.println(sdto.getStore_license_number());
		System.out.println(sdto.getStore_license_biz_origin());
		System.out.println(sdto.getStore_license_biz_stored());
		System.out.println(sdto.getStore_license_biz_size());
		System.out.println(sdto.getStore_license_sales_origin());
		System.out.println(sdto.getStore_license_sales_stored());
		System.out.println(sdto.getStore_license_sales_size());
		System.out.println(sdto.getStore_owner_phone());
		System.out.println(sdto.getStore_agreement());
		System.out.println(sdto.getStore_admin_state());
		System.out.println(sdto.getStore_maxdate());
		System.out.println(sdto.getStore_maxman());
		
		return "owner/owner_regist_menu"; 
	}
	
	@RequestMapping(value = "owner_regist_finish.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_regist_finish(Locale locale, Model model) {
		logger.info("점주: 매장등록(매장정보 입력)으로 이동  {}.", locale);
		
		return "owner/owner_regist_finish"; 
	}
	
	@RequestMapping(value = "store.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String store(Locale locale, Model model) {
		logger.info("공통메인(사용자별메인)테스트로 이동  {}.", locale);
		
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
