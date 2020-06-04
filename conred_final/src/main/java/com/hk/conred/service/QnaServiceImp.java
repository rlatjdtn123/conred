package com.hk.conred.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.conred.daos.IQnaDao;
import com.hk.conred.daos.QnaDaoImp;
import com.hk.conred.dtos.QnaDto;

@Service
public class QnaServiceImp implements IQnaService{

	@Autowired
	private IQnaDao QnaDaoImp;
	
	@Override
	public List<QnaDto> qnaList(String user_id) {
		return QnaDaoImp.qnaList(user_id);
	}

}
