package com.hk.conred.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.conred.daos.ICMainDao;
import com.hk.conred.dtos.CMainDto;

@Service
public class CMainServiceImp implements ICMainService{
	
	@Autowired
	private ICMainDao ICMainDaoImp;
	
	@Override
	public CMainDto selectCMain(int store_seq) {
		return ICMainDaoImp.selectCMain(store_seq);
	}
	
}
