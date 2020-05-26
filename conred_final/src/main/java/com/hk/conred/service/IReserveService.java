package com.hk.conred.service;

import com.hk.conred.dtos.ReserveDto;

public interface IReserveService {

	
	//예약
	public boolean insertReserve(ReserveDto dto);	
}
