package com.hk.conred.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.conred.daos.ILikeDao;
import com.hk.conred.dtos.LikeDto;

@Service
public class LikeServiceImp implements ILikeService{

	@Autowired
	private ILikeDao likeDaoImp;
	
	@Override
	public List<LikeDto> likeList(String user_id,String pnum) {
		return likeDaoImp.likeList(user_id,pnum);
	}
	
}
