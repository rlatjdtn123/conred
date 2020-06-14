package com.hk.conred.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.conred.daos.IMapDao;
import com.hk.conred.dtos.SDto;

@Service
public class MapServiceImp implements IMapService{
	
	@Autowired
	private IMapDao mapDao;
	
	@Override
	public List<SDto> searchCateAll() {
		return mapDao.searchCateAll();
	}
	
	@Override
	public List<SDto> searchCate(String category_code) {
		return mapDao.searchCate(category_code);
	}


}
