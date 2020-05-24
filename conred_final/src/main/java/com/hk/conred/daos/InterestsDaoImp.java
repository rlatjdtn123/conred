package com.hk.conred.daos;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.conred.dtos.InterestsDto;

@Repository
public class InterestsDaoImp implements IInterestsDao{

	
	private String nameSpace="com.hk.conred.Interests.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public boolean insertInterests(String category_code) {
		int count=0;
		count=sqlSession.insert(nameSpace+"insertInterests", category_code);
		return count>0?true:false;
	}

}
