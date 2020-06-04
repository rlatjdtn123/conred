package com.hk.conred.daos;

import java.util.List;

import com.hk.conred.dtos.QnaDto;

public interface IQnaDao {
	
	//1.문의 목록
	public List<QnaDto> qnaList(String user_id);
	
}
