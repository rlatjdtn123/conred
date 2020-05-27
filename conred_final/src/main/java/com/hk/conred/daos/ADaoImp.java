package com.hk.conred.daos;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.conred.dtos.ODto;
import com.hk.conred.dtos.SDto;
import com.hk.conred.dtos.UDto;




@Repository
public class ADaoImp implements IADao {
	
	private String nameSpace="com.hk.conred.A.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<UDto> admin_site_userlist(String keyword){
		
//		List<UDto> list=new ArrayList<>(); 사용할 필요 없다.
		//seqSession : insert(), selectList(), selectOne, update(), delete()
		return sqlSession.selectList(nameSpace+"admin_site_userlist",keyword);
	}
	
	public List<ODto> admin_site_ownerlist(){
		
		
		return sqlSession.selectList(nameSpace+"admin_site_ownerlist");
	}
	
	public List<SDto> admin_site_storelist(){
		
		
		return sqlSession.selectList(nameSpace+"admin_site_storelist");
	}

	
}