package com.hk.conred;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.conred.dtos.QnaDto;
import com.hk.conred.service.IQnaService;


@Controller
public class QnaController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private IQnaService qnaService;
	 
	@RequestMapping(value = "qna.do", method = RequestMethod.GET)
	public String qna_store(Locale locale, Model model,int store_seq,int pnum) {
		logger.info("매장 문의 ajax {}.", locale);
		System.out.println("@@매장번호:"+store_seq); 
		List<QnaDto> list=qnaService.qnaListStore(store_seq, 1);
		model.addAttribute("list", list);
		return "all/qna"; 
	}
	
	@ResponseBody
	@RequestMapping(value = "qna_ajax.do", method = RequestMethod.GET)
	public Map<String, List<QnaDto>> qna_ajax(Locale locale, Model model,int store_seq,int pnum) {
		logger.info("매장 문의 ajax {}.", locale);
		List<QnaDto> list=qnaService.qnaListStore(store_seq, pnum);
		Map<String, List<QnaDto>> map=new HashMap<>();
		map.put("list", list);
		return map; 
	}
	
}
