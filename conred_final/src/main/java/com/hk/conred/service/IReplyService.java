package com.hk.conred.service;

import java.util.List;

import com.hk.conred.dtos.ReplyDto;

public interface IReplyService {
	
	//1.리뷰목록
	public List<ReplyDto> replyList(String user_id);
}
