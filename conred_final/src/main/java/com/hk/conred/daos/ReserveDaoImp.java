package com.hk.conred.daos;

import java.util.List;

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
	public boolean insertReserve(String user_id) {
		int count=0;
		count=sqlSession.insert(nameSpace+"insertReserve", user_id);
		return count>0?true:false;
	}

	@Override
	public List<ReserveDto> reserveList(String user_id,String pnum) {
		List<ReserveDto> list=null;
		list=sqlSession.selectList(nameSpace+"reserveList", user_id);
		return list;
	}

	@Override
	public ReserveDto getReserve(int reserve_seq) {
	
		return sqlSession.selectOne(nameSpace+"getReserve", reserve_seq);
		 
	}

}
