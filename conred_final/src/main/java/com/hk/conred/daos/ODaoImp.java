package com.hk.conred.daos;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.conred.dtos.ODto;

@Repository
public class ODaoImp implements IODao {
	
	private String nameSpace="com.hk.conred.O.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public boolean insertOwner(ODto dto) {
		int count=0;
		count=sqlSession.insert(nameSpace+"insertOwner", dto);
		return count>0?true:false;
	}

	@Override
	public ODto getLogin(String Owner_id, String Owner_password) {
		ODto dto=null;
		Map<String, String> map=new HashMap<>();
		map.put("Owner_id", Owner_id);
		map.put("Owner_password", Owner_password);
		dto=sqlSession.selectOne(nameSpace+"getLogin", map);
		return dto;
	}

	
	
}
