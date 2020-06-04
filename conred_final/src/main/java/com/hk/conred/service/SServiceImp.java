package com.hk.conred.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.conred.daos.ISDao;
import com.hk.conred.dtos.SDto;

@Service
public class SServiceImp implements ISService {
	
	@Autowired
	private ISDao SDaoImp;
	
	@Override
	public boolean insertStoreCertify(SDto sdto) {
		return SDaoImp.insertStoreCertify(sdto) ;
	}

	@Override
	public boolean updateStoreInfo(SDto sdto) {
		return false;
	}

	@Override
	public boolean updateStoreMenu(SDto sdto) {
		return false;
	}

}
