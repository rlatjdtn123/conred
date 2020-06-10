package com.hk.conred.service;

import java.util.List;

import com.hk.conred.dtos.ReplyDto;

public interface IReplyService {
	
	//1.리뷰목록 - 사용자: 자기가 쓴 모든 리뷰
	public List<ReplyDto> replyList(String user_id,String pnum);

	//2.리뷰목록 - 점주: 자기 매장에 달린 모든 리뷰
	public List<ReplyDto> replyListStore(int store_seq);
	
}
