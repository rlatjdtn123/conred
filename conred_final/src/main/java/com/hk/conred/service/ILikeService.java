package com.hk.conred.service;

import java.util.List;

import com.hk.conred.dtos.LikeDto;

public interface ILikeService {

	//1.예약목록
	List<LikeDto> likeList(String user_id,String pnum);
}
