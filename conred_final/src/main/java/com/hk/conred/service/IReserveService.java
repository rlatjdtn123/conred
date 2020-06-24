package com.hk.conred.service;

import java.util.List;

import com.hk.conred.dtos.ReserveDto;

public interface IReserveService {

	
	//예약
	public boolean insertReserve(String user_id,int menu_seq,int store_seq,String reserve_time,String reserve_price,String reserve_sdate,String reserve_edate);	
	
	
	//예약조회
	public List<ReserveDto> reserveList(String user_id,String pnum);
	
	//상세조회 -->로 들어가야 결제버튼 있음
	public ReserveDto getReserve(int reserve_seq);
	
	//메뉴->날짜 선택시 매진된 시간 클릭못하게
	public List<ReserveDto> reserveMax(int store_seq,int menu_seq,String reserve_sdate);
	
	//숙박 예약 출력
	public List<ReserveDto> stayReserve(int store_seq,int menu_seq);
	
	//사용자 예약취소
	public boolean userReserveCancel(int reserve_seq);
	
	//사용자 예약메뉴 매장사진
	public List<ReserveDto> userReservePhoto(String user_id);
	
	//사용자 결제후 상태 S로 업데이트
	public boolean reserveSuccess(int reserve_seq);
	
	//유저가 결제한 매장에대한 리뷰 1회기능
	public List<ReserveDto> userOnceReview(int store_seq,String user_id);
	
	//해당매장 리뷰남기면 상태N
	public boolean userReviewSuccess(String user_id,int store_seq);
}
 