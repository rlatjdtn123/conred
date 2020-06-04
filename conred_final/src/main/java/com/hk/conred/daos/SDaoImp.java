package com.hk.conred.daos;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.conred.dtos.SDto;

@Repository
public class SDaoImp implements ISDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.hk.conred.S.";
	
	@Override
	public boolean insertStoreCertify(SDto sdto) {
		int count= 0;
		count=sqlSession.insert(namespace+"insertStoreCertify",sdto);
		return count>0?true:false;
	}

	@Override
	public boolean updateStoreInfo(SDto sdto) {
		return false;
	}

	@Override
	public boolean updateStoreMenu(SDto sdto) {
		return false;
	}
	
}
