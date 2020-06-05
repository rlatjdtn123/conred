package com.hk.conred.daos;

import java.util.List;

import com.hk.conred.dtos.LikeDto;

public interface ILikeDao {
	
	//1.찜 목록
	public List<LikeDto> likeList(String user_id,String pnum);
}
