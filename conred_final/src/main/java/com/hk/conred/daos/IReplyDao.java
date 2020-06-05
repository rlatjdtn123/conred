package com.hk.conred.daos;

import java.util.List;

import com.hk.conred.dtos.ReplyDto;

public interface IReplyDao {

	//1.리뷰 목록
	public List<ReplyDto> replyList(String user_id,String pnum);
	
	
}
