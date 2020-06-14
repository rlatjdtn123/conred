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

import com.hk.conred.dtos.ReplyDto;
import com.hk.conred.dtos.SDto;
import com.hk.conred.service.IReplyService;
import com.hk.conred.service.ISService;


@Controller
public class ReviewController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	private IReplyService replyService;
	
	private ISService storeService;
	
	
	@RequestMapping(value = "owner_mystore_review.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_mystore_review(Locale locale, Model model) {
		logger.info("매장관리> 리뷰로 이동  {}.", locale);
		
		return "owner/owner_mystore_review"; 
	}
	
	
	@RequestMapping(value = "review.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String review(Locale locale, Model model,int store_seq,int pnum) {
		logger.info("리뷰로 이동  {}.", locale);
		List<ReplyDto> list=replyService.replyListStoreDetail(store_seq, 1);
		List<SDto> listAvg=storeService.listAvg(store_seq);
		model.addAttribute("list", list);
		model.addAttribute("listAvg", listAvg); 	
		return "all/review"; 
	}

}
