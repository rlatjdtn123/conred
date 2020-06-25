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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.conred.dtos.RPhotoDto;
import com.hk.conred.dtos.ReplyDto;
import com.hk.conred.dtos.ReserveDto;
import com.hk.conred.dtos.SDto;
import com.hk.conred.dtos.UDto;
import com.hk.conred.service.IRPhotoService;
import com.hk.conred.service.IReplyService;
import com.hk.conred.service.IReserveService;
import com.hk.conred.service.ISService;


@Controller
public class ReviewController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	private IReplyService replyService;
	@Autowired
	private IRPhotoService rPhotoService;

	@Autowired
	private IReserveService reserveService;
	
	
	@RequestMapping(value = "owner_mystore_review.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String owner_mystore_review(Locale locale, Model model) {
		logger.info("매장관리> 리뷰로 이동  {}.", locale);
		
		return "owner/owner_mystore_review"; 
	}
	
	
	@RequestMapping(value = "review.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String review(Locale locale, Model model,@RequestParam("store_seq") int store_seq,HttpServletRequest request) {
		logger.info("리뷰폼으로 이동  {}.", locale);
		HttpSession session=request.getSession();
		UDto uldto=(UDto)session.getAttribute("uldto");
		List<ReplyDto> list=replyService.replyListStoreDetail(store_seq, 1);
		ReplyDto list_avg=replyService.replyAvgStore(store_seq); 
		List<RPhotoDto> list_photo=rPhotoService.reviewPhotoList(store_seq);
		ReplyDto store_name=replyService.modalStoreName(store_seq);
		if(uldto!=null) {
			List<ReserveDto> list_reserve=reserveService.userOnceReview(store_seq,uldto.getUser_id());
			model.addAttribute("list_reserve", list_reserve);
			System.out.println("@@@@@@@@@list_reserve:::"+list_reserve);
		}
		model.addAttribute("list", list); 
		model.addAttribute("list_avg", list_avg); 	
		model.addAttribute("list_photo", list_photo); 
		model.addAttribute("store_name", store_name);
//		model.addAttribute("list_reserve", list_reserve);
		return "all/review";    
	}
	
	@ResponseBody
	@RequestMapping(value = "review_ajax.do", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String, Object> review_ajax(Locale locale, Model model,@RequestParam("store_seq") int store_seq,@RequestParam("pnum") int pnum) {
		logger.info("리뷰 ajax  {}.", locale);
		List<ReplyDto> list=replyService.replyListStoreDetail(store_seq, pnum); 
		List<RPhotoDto> list_photo=rPhotoService.reviewPhotoList(store_seq); 
		System.out.println("@@@@list_photo::"+list_photo); 
		Map<String, Object> map=new HashMap<>();
		map.put("list", list);		
		map.put("list_photo", list_photo); 
		return map; 
	} 

}
