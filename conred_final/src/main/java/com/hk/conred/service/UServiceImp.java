package com.hk.conred.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hk.conred.daos.IInterestsDao;
import com.hk.conred.daos.IUDao;
import com.hk.conred.daos.InterestsDaoImp;
import com.hk.conred.daos.UDaoImp;
import com.hk.conred.dtos.UDto;

@Service
public class UServiceImp implements IUService{

	@Autowired
	private IUDao UDaoImp;
	@Autowired
	private IInterestsDao interestsDaoImp;
	
	@Transactional
	@Override
	public boolean insertUser(UDto dto,String [] category_code,String user_id) {
		
		UDaoImp.insertUser(dto);
		
		return interestsDaoImp.insertInterests(category_code,user_id);
	} 

	@Override
	public UDto getLogin(String user_id, String user_password) {
		
		return UDaoImp.getLogin(user_id,user_password);
	}


	@Override
	public UDto getStats(String user_id) {
		return UDaoImp.getStats(user_id);
	}
	
	

}
