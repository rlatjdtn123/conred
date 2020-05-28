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
	public List<UDto> admin_site_userlist(String keyword) {
		// TODO Auto-generated method stub
		return ADaoImp.admin_site_userlist(keyword);
	}
	@Override
	public List<UDto> admin_blackuser_search(String blackuser) {
		// TODO Auto-generated method stub
		return ADaoImp.admin_blackuser_search(blackuser);
	}
	
	
	@Override
	public List<ODto> admin_site_ownerlist() {
		// TODO Auto-generated method stub
		return ADaoImp.admin_site_ownerlist();
	}
	@Override
	public List<SDto> admin_site_storelist(String keywordstore) {
		// TODO Auto-generated method stub
		return ADaoImp.admin_site_storelist(keywordstore);
	}
	
	@Override
	public List<SDto> admin_store_state_search(String adminstate) {
		// TODO Auto-generated method stub
		return ADaoImp.admin_store_state_search(adminstate);
	}
	
	
}