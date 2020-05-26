package com.hk.conred.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.conred.daos.IReserveDao;
import com.hk.conred.daos.ReserveDaoImp;
import com.hk.conred.dtos.ReserveDto;


@Service
public class ReserveServiceImp implements IReserveService{
	
	@Autowired
	private IReserveDao reserveDaoImp;
	
	@Override
	public boolean insertReserve(ReserveDto dto) {
		return reserveDaoImp.insertReserve(dto);
	}

}
