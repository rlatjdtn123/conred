package com.hk.conred.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.hk.conred.daos.IInterestsDao;
import com.hk.conred.daos.InterestsDaoImp;
import com.hk.conred.dtos.InterestsDto;

public class InterestsServiceImp implements IInterestsService{

	@Autowired
	private IInterestsDao InterestsDaoImp;
	
	@Override
	public boolean insertInterests(InterestsDto dto) {
		return InterestsDaoImp.insertInterests(dto);
	}

}
