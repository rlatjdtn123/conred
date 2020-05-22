package com.hk.conred.daos;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.conred.dtos.UDto;

@Repository
public class UDaoImp implements IUDao{

	private String nameSpace="com.hk.conred.U.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public boolean insertUser(UDto dto) {
		int count =0;
		count=sqlSession.insert(nameSpace+"insertUser", dto);
		return count>0?true:false;
	}

	@Override
	public UDto getLogin(String id, String password) {
		UDto dto=null;
		Map<String, String> map=new HashMap<>();
		map.put("id", id);
		map.put("password", password);
		dto=sqlSession.selectOne(nameSpace+"getLogin", map);
		return dto;
	}
	
	
	 
}
