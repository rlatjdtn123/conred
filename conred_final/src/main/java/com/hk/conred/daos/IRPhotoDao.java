package com.hk.conred.daos;

import java.util.List;

import com.hk.conred.dtos.RPhotoDto;

public interface IRPhotoDao {
	
	//사용자 매장 리뷰 사진등록
	public boolean reviewPhotoInsert(List<RPhotoDto> list);
	
}
