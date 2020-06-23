package com.hk.conred.service;

import java.util.List;

import com.hk.conred.dtos.LikeDto;

public interface ILikeService {

	//1.예약목록
	public List<LikeDto> likeList(String user_id,int pnum);
	
	//2.찜 삭제
	public boolean userLikeDelete(int like_list_seq);
	
	//찜 목록 가게 사진 출력
	public List<LikeDto> likeStoreImg(String user_id);
}
