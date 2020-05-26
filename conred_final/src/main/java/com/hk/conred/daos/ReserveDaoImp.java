package com.hk.conred.daos;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.conred.dtos.ReserveDto;

@Repository
public class ReserveDaoImp implements IReserveDao{

	private String nameSpace="com.hk.conred.Reserve.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public boolean insertReserve(ReserveDto dto) {
		int count=0;
		count=sqlSession.insert(nameSpace+"insertReserve", dto);
		return count>0?true:false;
	}

}
