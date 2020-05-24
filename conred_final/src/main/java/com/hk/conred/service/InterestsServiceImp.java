package com.hk.conred.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.conred.daos.IInterestsDao;
import com.hk.conred.daos.InterestsDaoImp;
import com.hk.conred.dtos.InterestsDto;

@Service
public class InterestsServiceImp implements IInterestsService{

	@Autowired
	private IInterestsDao InterestsDaoImp;
	
	@Override
	public boolean insertInterests(String category_code) {
		return InterestsDaoImp.insertInterests(category_code);
	}

}
 