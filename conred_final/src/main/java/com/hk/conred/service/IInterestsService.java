package com.hk.conred.service;

import java.util.List;

import com.hk.conred.dtos.InterestsDto;

public interface IInterestsService {

	//사용자 관심사 등록
	public boolean insertInterests(String []category_code,String user_id);
}
