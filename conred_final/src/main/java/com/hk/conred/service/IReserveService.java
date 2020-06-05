package com.hk.conred.service;

import java.util.List;

import com.hk.conred.dtos.ReserveDto;

public interface IReserveService {

	
	//예약
	public boolean insertReserve(String user_id);	
	
	
	//예약조회
	public List<ReserveDto> reserveList(String user_id,String pnum);
	
	//상세조회 -->로 들어가야 결제버튼 있음
	public ReserveDto getReserve(int reserve_seq);
}
 