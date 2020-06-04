package com.hk.conred.daos;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.conred.dtos.QnaDto;

@Repository
public class QnaDaoImp implements IQnaDao{

	private String nameSpace="com.hk.conred.Qna.";
	
	@Autowired
	private SqlSessionTemplate sqlSession; 
	
	public List<QnaDto> qnaList(String user_id) {
		List<QnaDto> list=sqlSession.selectList(nameSpace+"qnaList", user_id);
		return list;
	}
}
