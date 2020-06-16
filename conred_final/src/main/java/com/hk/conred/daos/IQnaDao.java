package com.hk.conred.daos;

import java.util.List;

import com.hk.conred.dtos.QnaDto;

public interface IQnaDao {
	
	//1.특정 사용자의 문의 목록
	public List<QnaDto> qnaList(String user_id,String pnum);
	
	//2.특정매장의 문의목록
	public List<QnaDto> qnaListStore(int store_seq,int pnum);
	
	
}
