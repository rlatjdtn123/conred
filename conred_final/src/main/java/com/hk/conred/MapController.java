package com.hk.conred;

import java.text.DateFormat;
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
import com.hk.conred.service.ISService;
import com.hk.conred.service.SServiceImp;


@Controller
public class MapController {
	
	private static final Logger logger = LoggerFactory.getLogger(MapController.class);
	
	@Autowired
	private ISService sService;

	@RequestMapping(value = "map.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model/*,String store_seq*/) {
		logger.info("맵으로 이동 {}.", locale);
		
//		String[] store_seq_list =store_seq.split(",");
//		List<SDto> list = sService.StoreSeqList(store_seq_list);
		
//		model.addAttribute("list",list);
		
//		이 주석들은 지도가 구현되어서 지도안의 매장들의 seq값을가져올 때 사용되는데 아마 map.do에서 가 아니라
//		all/map.jsp에서 ajax로 화면안에 매장들을 뿌려주고
//		그 뿌려준 값들을 오른쪽 매장리스트에 넣을것이다
//		그렇기때문에 아마 쓸일 없을듯하지만 일단은 주석처리해놓음
		
		return "all/map"; 
	}
	
}
