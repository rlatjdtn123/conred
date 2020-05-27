package com.hk.conred.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.conred.daos.IADao;
import com.hk.conred.dtos.ODto;
import com.hk.conred.dtos.SDto;
import com.hk.conred.dtos.UDto;

@Service
public class AServiceImp implements IAService{

	@Autowired
	private IADao ADaoImp;

	@Override
	public List<UDto> admin_site_userlist() {
		// TODO Auto-generated method stub
		return ADaoImp.admin_site_userlist();
	}

	@Override
	public List<ODto> admin_site_ownerlist() {
		// TODO Auto-generated method stub
		return ADaoImp.admin_site_ownerlist();
	}
	@Override
	public List<SDto> admin_site_storelist() {
		// TODO Auto-generated method stub
		return ADaoImp.admin_site_storelist();
	}
	
}