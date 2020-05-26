package com.hk.conred.daos;

import com.hk.conred.dtos.ReserveDto;

public interface IReserveDao {
	
	//예약
	public boolean insertReserve(ReserveDto dto);
	
}
