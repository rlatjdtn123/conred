package com.hk.conred.service;

import java.util.List;

import com.hk.conred.dtos.QnaDto;

public interface IQnaService {
	
	public List<QnaDto> qnaList(String user_id);
}
