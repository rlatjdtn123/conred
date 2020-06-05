package com.hk.conred.service;

import java.util.List;

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
	public boolean insertReserve(String user_id) {
		System.out.println("ㅋㅋㅋㅋㅋ:  "+user_id);
		return reserveDaoImp.insertReserve(user_id);
	}

	@Override
	public List<ReserveDto> reserveList(String user_id,String pnum) {	
		return reserveDaoImp.reserveList(user_id,pnum);
	}

	@Override
	public ReserveDto getReserve(int reserve_seq) {
		return reserveDaoImp.getReserve(reserve_seq);
	}

}
