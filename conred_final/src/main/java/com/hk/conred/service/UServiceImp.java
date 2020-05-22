package com.hk.conred.service;

import org.springframework.stereotype.Service;

import com.hk.conred.daos.IUDao;
import com.hk.conred.daos.UDaoImp;
import com.hk.conred.dtos.UDto;

@Service
public class UServiceImp implements IUService{

	private IUDao UDaoImp;
	
	@Override
	public boolean insertUser(UDto dto) {
		return UDaoImp.insertUser(dto);
	} 

	@Override
	public UDto getLogin(String id, String password) {
		return UDaoImp.getLogin(id, password);
	}

}
