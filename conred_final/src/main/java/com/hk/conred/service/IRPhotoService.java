package com.hk.conred.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.hk.conred.dtos.RPhotoDto;

public interface IRPhotoService {

	//사용자 매장 리뷰 사진등록
	public boolean reviewPhotoInsert(List<RPhotoDto> list);
	
}
