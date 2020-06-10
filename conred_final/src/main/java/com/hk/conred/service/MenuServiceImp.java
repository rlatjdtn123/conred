package com.hk.conred.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.conred.daos.IMenuDao;
import com.hk.conred.dtos.MenuDto;

@Service
public class MenuServiceImp implements IMenuService {
	
	@Autowired
	private IMenuDao iMenuDaoImp;
	
	@Override
	public List<MenuDto> selectMenu(int store_seq) {
		return iMenuDaoImp.selectMenu(store_seq);
	}

	@Override
	public List<MenuDto> detailMenu(int menu_seq,int store_seq) {
		return iMenuDaoImp.detailMenu(menu_seq,store_seq);
	}

}
