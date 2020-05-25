package com.hk.conred.service;

import com.hk.conred.dtos.UDto;

public interface IUService {
	

		//1.회원가입
		public boolean insertUser(UDto dto,String [] category_code,String user_id);
		//2.로그인
		public UDto getLogin(String user_id,String user_password);
		//3.나의정보조회
		
		//4.나의정보수정
		
		//5.좋아요
		
		//6.내 예약
	
}
