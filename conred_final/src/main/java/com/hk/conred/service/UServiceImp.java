package com.hk.conred.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.conred.daos.IUDao;
import com.hk.conred.daos.UDaoImp;
import com.hk.conred.dtos.UDto;

@Service
public class UServiceImp implements IUService{

	@Autowired
	private IUDao UDaoImp;
	
	@Override
	public boolean insertUser(UDto dto) {
		return UDaoImp.insertUser(dto);
	} 

	@Override
	public UDto getLogin(String user_id, String user_password) {
		return UDaoImp.getLogin(user_id,user_password);
	}

}
