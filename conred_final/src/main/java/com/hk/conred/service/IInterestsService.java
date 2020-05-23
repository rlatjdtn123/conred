package com.hk.conred.service;

import com.hk.conred.dtos.InterestsDto;

public interface IInterestsService {

	//사용자 관심사 등록
	public boolean insertInterests(InterestsDto dto);
}
