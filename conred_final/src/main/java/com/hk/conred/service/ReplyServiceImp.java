package com.hk.conred.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.conred.daos.IReplyDao;
import com.hk.conred.dtos.ReplyDto;

@Service
public class ReplyServiceImp implements IReplyService{
	
	@Autowired
	private IReplyDao replyDao;
	
	@Override
	public List<ReplyDto> replyList(String user_id,String pnum) {
		return replyDao.replyList(user_id,pnum);
	}

}
