package com.hk.conred.daos;



import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.conred.dtos.ODto;
import com.hk.conred.dtos.UDto;




@Repository
public class ADaoImp implements IADao {
	
	private String nameSpace="com.hk.conred.A.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<UDto> admin_site_userlist(){
		sqlSession.selectList(nameSpace+"admin_site_userlist");
		
//		List<UDto> list=new ArrayList<>(); 사용할 필요 없다.
		
		return admin_site_userlist();
  }
	public List<ODto> admin_site_ownerlist(){
		sqlSession.selectList(nameSpace+"admin_site_ownerlist");
		
		return admin_site_ownerlist();
	}
	
}