package com.hk.conred.daos;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.conred.dtos.SDto;

@Repository
public class MapDaoImp implements IMapDao{
	
	private String namespace="con.hk.conred.Map.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<SDto> searchCateAll() {
		return sqlSession.selectList(namespace+"searchCateAll");
	}
	
	@Override
	public List<SDto> searchCate(String category_code) {
		return sqlSession.selectList(namespace+"searchCate",category_code);
	}


}
