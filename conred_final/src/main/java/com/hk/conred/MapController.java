package com.hk.conred;

import java.text.DateFormat;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.conred.dtos.SDto;
import com.hk.conred.service.IMapService;
import com.hk.conred.service.ISService;
import com.hk.conred.service.SServiceImp;


@Controller
public class MapController {
	
	private static final Logger logger = LoggerFactory.getLogger(MapController.class);
	
	@Autowired
	private ISService sService; 
	@Autowired 
	private IMapService mapService;
	
	//얘는 임시 테스트용 - 다른거 하나 만들면 바로 폐기각
	@RequestMapping(value = "map.do", method = RequestMethod.GET)
	public String map(Locale locale, Model model/*,String store_seq*/) {
		logger.info("맵으로 이동 {}.", locale);
		
		//map.do를 검색방법에 따라 나눠야하나 ㅇㅇ
		//1.검색창
		//파라미터:seq=검색어
		//2.카테고리검색(+all,내주변=select*(만약 내 위치 허용이 안되어있다면 내 주변 말고 기본지정위치에서 all))
		//파라미터:cate=카테고리
		//3.지도안에서의 검색+카테고리 검색
		//파라미터:seq=검색어&cate=카테고리
		
//		String[] store_seq_list =store_seq.split(",");
//		List<SDto> list = sService.StoreSeqList(store_seq_list);
		
//		model.addAttribute("list",list);
		
//		이 주석들은 지도가 구현되어서 지도안의 매장들의 seq값을가져올 때 사용되는데 아마 map.do에서 가 아니라
//		all/map.jsp에서 ajax로 화면안에 매장들을 뿌려주고
//		그 뿌려준 값들을 오른쪽 매장리스트에 넣을것이다
//		그렇기때문에 아마 쓸일 없을듯하지만 일단은 주석처리해놓음
		
//		가 아니라 모든 store들을 조회해서 가져가기에 seq값은 필요없고
//		대신에
		
		//
		return "all/map"; 
	}
	
	
	@RequestMapping(value = "map_category.do", method = RequestMethod.GET)
	public String map_category(Locale locale, Model model,String category_code) {
		logger.info("맵으로 이동 : 카테고리검색 {}.", locale);
		//2.카테고리검색(대분류 카테고리)(+all,내주변=select*(만약 내 위치 허용이 안되어있다면 내 주변 말고 기본지정위치에서 all))
		//파라미터:category=카테고리&mylocation=내현재위치(없으면 지정위치)
		//기본적으로 내 위치권한이 허용되어있다면 위치대로 / 아니라면 지정위치 
		
		List<SDto> list =new ArrayList<SDto>();
		if(category_code.equals("all")) {
			list=mapService.searchCateAll();
		}else {
			list=mapService.searchCate(category_code);
		}
		System.out.println(list);
		
		model.addAttribute("list",list);
		
		return "all/map"; 
	}
	
	@ResponseBody
	@RequestMapping(value = "map_test.do", method = RequestMethod.GET)
	public String map_test(Locale locale, Model model,String category_code) {
		logger.info("맵으로 이동 : 카테고리검색 {}.", locale);
		//2.카테고리검색(대분류 카테고리)(+all,내주변=select*(만약 내 위치 허용이 안되어있다면 내 주변 말고 기본지정위치에서 all))
		//파라미터:category=카테고리&mylocation=내현재위치(없으면 지정위치)
		//기본적으로 내 위치권한이 허용되어있다면 위치대로 / 아니라면 지정위치 
		
		List<SDto> list =new ArrayList<SDto>();
		if(category_code.equals("all")) {
			list=mapService.searchCateAll();
		}else {
			list=mapService.searchCate(category_code);
		}
		System.out.println(list);
		
		model.addAttribute("list",list);
		
		return "all/map"; 
	}
	
	
	
	@RequestMapping(value = "map_keyword_store.do", method = RequestMethod.GET)
	public String map_keyword_store(Locale locale, Model model/*,String store_seq*/) {
		logger.info("맵으로 이동 : 키워드검색 {}.", locale);
		//1.검색창(지역명, 지하철역명, 매장명 검색 = 얘네도 각각 따로 나눠줄지? 왜냐하면 연관검색어로 나오는 키워드로만 검색이되기때문에 나눠줄 수 있음)
		//안나눠줄경우 검색의 정확도가 떨어질 가능성이 높다.
		//하지만 나눠줄경우 검색어+카테고리로 검색시 번거로워질 수 있다.(걔도 3개씩짜야할 수 있다는 뜻: 하나하면 나머지는 쉽겠지만.)
		//파라미터:keyword=검색어&myloca=내현재위치(없으면 지정위치)
		return "all/map"; 
	}
	
	@RequestMapping(value = "map_keyword_subway.do", method = RequestMethod.GET)
	public String map_keyword_subway(Locale locale, Model model/*,String store_seq*/) {
		logger.info("맵으로 이동 : 키워드검색 {}.", locale);
		//1.검색창(지역명, 지하철역명, 매장명 검색 = 얘네도 각각 따로 나눠줄지? 왜냐하면 연관검색어로 나오는 키워드로만 검색이되기때문에 나눠줄 수 있음)
		//안나눠줄경우 검색의 정확도가 떨어질 가능성이 높다.
		//파라미터:keyword=검색어&myloca=내현재위치(없으면 지정위치)
		return "all/map"; 
	}
	
	@RequestMapping(value = "map_keyword_loca.do", method = RequestMethod.GET)
	public String map_keyword_loca(Locale locale, Model model/*,String store_seq*/) {
		logger.info("맵으로 이동 : 키워드검색 {}.", locale);
		//1.검색창(지역명, 지하철역명, 매장명 검색 = 얘네도 각각 따로 나눠줄지? 왜냐하면 연관검색어로 나오는 키워드로만 검색이되기때문에 나눠줄 수 있음)
		//안나눠줄경우 검색의 정확도가 떨어질 가능성이 높다.
		//파라미터:keyword=검색어&myloca=내현재위치(없으면 지정위치)
		return "all/map"; 
	}

	@RequestMapping(value = "map_key_n_cate.do", method = RequestMethod.GET)
	public String map_keycate(Locale locale, Model model/*,String store_seq*/) {
		logger.info("맵으로 이동 : 카테고리 + 키워드 검색 {}.", locale);
		//3.지도안에서의 검색+카테고리 검색
		//파라미터:keyword=검색어&category=카테고리
		return "all/map"; 
	}
	
}
