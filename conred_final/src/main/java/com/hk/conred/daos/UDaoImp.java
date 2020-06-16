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
	public UDto getLogin(String user_id, String user_password) {
		
		UDto dto=null;
		Map<String, String> map=new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_password", user_password);
		dto=sqlSession.selectOne(nameSpace+"getLogin", map);
		System.out.println(dto);
		return dto;
	}

	@Override
	public UDto getStats(String user_id) {
		UDto dto=null;
		dto=sqlSession.selectOne(nameSpace+"getStats", user_id);
		return dto;
	}

	@Override
	public UDto userMyInfo(String user_id) {
		UDto dto=sqlSession.selectOne(nameSpace+"userMyInfo", user_id);
		return dto;
	}
	
	
	 
}
