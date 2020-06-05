package com.hk.conred.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.conred.dtos.QnaDto;

@Repository
public class QnaDaoImp implements IQnaDao{

	private String nameSpace="com.hk.conred.Qna.";
	
	@Autowired
	private SqlSessionTemplate sqlSession; 
	
	public List<QnaDto> qnaList(String user_id,String pnum) { 
		Map<String, String> map=new HashMap<>();
		map.put("user_id", user_id);
		map.put("pnum", pnum);
		List<QnaDto> list=sqlSession.selectList(nameSpace+"qnaList", map);
		return list;
	}
}
