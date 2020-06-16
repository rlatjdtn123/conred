package com.hk.conred.service;

import java.util.List;


import com.hk.conred.dtos.QnaDto;
import com.hk.conred.dtos.UDto;

public interface IUService {
	

	//1.회원가입
	public boolean insertUser(UDto dto,String [] category_code,String user_id);
	//2.로그인
	public UDto getLogin(String user_id,String user_password);
	//3.나의정보조회
	public UDto userMyInfo(String user_id);
	//4.나의정보수정
	
	//5.내 좋아요(찜)
	
	//6.내 예약
	
	//7.내 문의
//	public QnaDto qnaList(String user_id);
	//8.내 리뷰
	
	//8.내 통계 (좋아요,예약,문의,포인트,리뷰)
	public UDto getStats(String user_id);
	
	//9.사용자 블랙처리 (신고3번받으면)
	
}
