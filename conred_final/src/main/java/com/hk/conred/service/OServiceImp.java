package com.hk.conred.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.conred.daos.IODao;
import com.hk.conred.dtos.ODto;

@Service
public class OServiceImp implements IOService{

	@Autowired
	private IODao ODaoImp;
	
	@Override
	public boolean insertOwner(ODto dto) {
		return ODaoImp.insertOwner(dto);
	}

	@Override
	public ODto getLogin(String Owner_id, String Owner_password) {
		return ODaoImp.getLogin(Owner_id, Owner_password);
	}

	@Override
	public ODto ownerMyInfo(String owner_id) {
		return ODaoImp.ownerMyInfo(owner_id); 
	}

}
