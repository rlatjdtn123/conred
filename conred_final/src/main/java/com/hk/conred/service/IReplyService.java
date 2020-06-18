package com.hk.conred.service;

import java.util.List;

import com.hk.conred.dtos.ReplyDto;

public interface IReplyService {
	
	//1.리뷰목록 - 사용자: 자기가 쓴 모든 리뷰
	public List<ReplyDto> replyList(String user_id,String pnum);

	//2.리뷰목록 - 점주: 자기 매장에 달린 모든 리뷰
	public List<ReplyDto> replyListStore(int store_seq);
	
	//3.리뷰평균목록 - 점주: 특정 매장에 달린 모든 리뷰에 대한 평균들, 달린리뷰, 달은 답변 갯수
	public ReplyDto replyAvgStore(int store_seq);
	
	//2.리뷰목록 - 점주: 특정 매장에 달린 모든 리뷰 -- 상세 
	public List<ReplyDto> replyListStoreDetail(int store_seq,int pnum);
	
	//5.리뷰삭제 - 사용자:자기가쓴 모든리뷰 개별삭제
	public boolean userReplyDelete(String user_id,int reply_seq); 
	
	//6.리뷰 등록 - 사용자:매장에대한 평점과 리뷰글 등록
	public boolean userInsertReview(String user_id,int store_seq,String reply_content,double reply_service,double reply_clean,double reply_price);
}
