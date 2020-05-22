package com.hk.conred.service;

import com.hk.conred.dtos.ODto;

public interface IOService {

		//1. 점주 회원가입
		public boolean insertOwner(ODto dto);
		//2. 점주 로그인
		public ODto getLogin(String Owner_id,String Owner_password);
	
}
