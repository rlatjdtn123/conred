package com.hk.conred.daos;

import com.hk.conred.dtos.UDto;


public interface IUDao {

	//1.회원가입
	public boolean insertUser(UDto dto);
	//2.로그인
	public UDto getLogin(String id,String password);
	//3.나의정보조회
	
	//4.나의정보수정
	
	//5.좋아요
	
	//6.내 예약
	
}
