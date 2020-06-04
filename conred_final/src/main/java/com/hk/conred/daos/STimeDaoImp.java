package com.hk.conred.daos;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.conred.dtos.STimeDto;

@Repository
public class STimeDaoImp implements ISTimeDao{
	private String namespace="com.hk.conred.STime.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public boolean insertStime(STimeDto stimedto) {
		int count =0;
		count = sqlSession.insert(namespace+"insertSTime",stimedto);
		return count>0?true:false;
	}

	@Override
	public boolean updateStime(STimeDto stimedto) {
		return false;
	}
	
}
