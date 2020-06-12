package com.hk.conred.daos;

import java.util.List;

import com.hk.conred.dtos.SPhotoDto;

public interface ISPhotoDao {
	//매장사진넣기
	public boolean insertSPhoto(List<SPhotoDto> list);
	
	//매장사진수정
	
	//매장사진 가져오기
	public List<SPhotoDto> selectSPhoto(int store_seq);
}
