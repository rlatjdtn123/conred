package com.hk.conred.daos;

import java.util.List;

import com.hk.conred.dtos.ReserveDto;

public interface IReserveDao {
	
	//예약
	public boolean insertReserve(String user_id,int menu_seq,int store_seq,String reserve_time,String reserve_price,String reserve_sdate,String reserve_edate);
	
	//예약목록조회
	public List<ReserveDto> reserveList(String user_id,String pnum);
	
	//상세조회 -->로 들어가야 결제버튼 있음
	public ReserveDto getReserve(int reserve_seq);
	
	//메뉴->날짜 선택시 매진된 시간 클릭못하게
	public List<ReserveDto> reserveMax(int store_seq,int menu_seq,String reserve_sdate);
	
}
