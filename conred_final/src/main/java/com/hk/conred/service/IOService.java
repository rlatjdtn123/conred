package com.hk.conred.service;

import com.hk.conred.dtos.ODto;

public interface IOService {

	//1. 점주 회원가입
	public boolean insertOwner(ODto dto);
	//2. 점주 로그인
	public ODto getLogin(String Owner_id,String Owner_password);
	//3. 나의정보조회 -- 점주
	public ODto ownerMyInfo(String owner_id);
	//4. 내정보수정 --점주
	public boolean ownerUpdate(ODto dto);
	//5. 점주 탈퇴
	public boolean ownerDelete(String owner_id);
	//6. 점주 아이디중복체크
	public String ownerIdCheck(String owner_id);
	
}
