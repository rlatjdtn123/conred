package com.hk.conred.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public boolean insertReserve(String user_id,int menu_seq,int store_seq,String reserve_time,String reserve_price) {
		int count=0;
		Map<String, Object> map =new HashMap<>();
		map.put("user_id", user_id);
		map.put("menu_seq", menu_seq);
		map.put("store_seq", store_seq);
		map.put("reserve_time", reserve_time);
		map.put("reserve_price", reserve_price);
		count=sqlSession.insert(nameSpace+"insertReserve", map);
		return count>0?true:false;
	}

	@Override
	public List<ReserveDto> reserveList(String user_id,String pnum) {
		List<ReserveDto> list=null;
		Map<String, String> map=new HashMap<>();
		map.put("user_id", user_id);
		map.put("pnum", pnum);
		list=sqlSession.selectList(nameSpace+"reserveList", map);
		return list;
	}

	@Override
	public ReserveDto getReserve(int reserve_seq) {
	
		return sqlSession.selectOne(nameSpace+"getReserve", reserve_seq);
		 
	}
 
	@Override
	public List<ReserveDto> reserveMax(int store_seq, int menu_seq, String reserve_sdate) {
		Map<String, Object> map=new HashMap<>();
		map.put("store_seq", store_seq);
		map.put("menu_seq", menu_seq);
		map.put("reserve_sdate", reserve_sdate);
		List<ReserveDto> list=sqlSession.selectList(nameSpace+"reserveMax", map);
		return list;
	}

}
