package com.hk.conred;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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

import com.hk.conred.dtos.QnaDto;
import com.hk.conred.dtos.UDto;
import com.hk.conred.service.IQnaService;


@Controller
public class QnaController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private IQnaService qnaService;
	 
	@RequestMapping(value = "qna.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String qna_store(Locale locale, Model model,int store_seq) {
		logger.info("매장 문의{}.", locale);  
		
		System.out.println("@@매장번호:"+store_seq); 
		List<QnaDto> list=qnaService.qnaListStore(store_seq, 1);
		QnaDto qnaAvg=qnaService.qnaAvg(store_seq);
		QnaDto owner_chk=qnaService.ownerQnaIdChk(store_seq);
		model.addAttribute("list", list);
		model.addAttribute("qnaAvg", qnaAvg);
		model.addAttribute("owner_chk", owner_chk);
		System.out.println(qnaAvg+"@@@@@@@@@@@@@@@@@@@@");
		return "all/qna"; 
	}
	
	@ResponseBody 
	@RequestMapping(value = "qna_ajax.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String, Object> qna_ajax(Locale locale, Model model,int store_seq,int pnum) {
		logger.info("매장 문의 ajax {}.", locale);
		List<QnaDto> list=qnaService.qnaListStore(store_seq, pnum); 
		QnaDto owner_chk=qnaService.ownerQnaIdChk(store_seq);
		Map<String, Object> map=new HashMap<>();
		map.put("list", list);
		map.put("owner_chk", owner_chk);
		return map;  
	} 
	
	@RequestMapping(value = "insert_qna.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String insert_qna(Locale locale, Model model,HttpServletRequest request,int store_seq,String qna_content,String qna_title, String qna_hide) {
		logger.info("매장 문의{}.", locale); 
		HttpSession session=request.getSession();
		UDto uldto=(UDto)session.getAttribute("uldto");
		boolean isS=qnaService.insertQna(store_seq, uldto.getUser_id(), qna_title, qna_content, qna_hide);
		if(isS) {
			List<QnaDto> list=qnaService.qnaListStore(store_seq, 1);
			QnaDto qnaAvg=qnaService.qnaAvg(store_seq);
			model.addAttribute("list", list);
			model.addAttribute("qnaAvg", qnaAvg);  
			return "all/qna";   
		}else {
			return ""; 
		}
	}
	
}
