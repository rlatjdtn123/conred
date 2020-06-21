package com.hk.conred.service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.hk.conred.dtos.CMainDto;
import com.hk.conred.dtos.ODto;
import com.hk.conred.dtos.SDto;
import com.hk.conred.dtos.SLocaDto;

public interface ISService {
//매장등록
	//매장등록1(사업자등록정보)
	public boolean insertStoreCertify(SDto sdto,HttpServletRequest request);
	//매장등록2(매장정보)
	public boolean insertStoreInfo(SDto sdto,String[] time_day,	String[] time_open,
			String[] time_close,String[] time_break, String[] store_photo_title,
			SLocaDto slocadto,HttpServletRequest request);
	//매장등록3(메뉴/서비스정보)
	public boolean updateStoreMenu(SDto sdto,CMainDto cmaindto,
			String[] clist,String[] category_code_2,String[] name,
			String[] content,String[] price,String[] state);
	
//매장수정
	//매장수정1(사업자등록정보)
//	public boolean updateStoreCertify(SDto sdto, HttpServletRequest request, String sales_change, String biz_change);
	public boolean updateStoreCertify(SDto sdto, HttpServletRequest request, SDto seq);
	//매장수정2(매장정보)
	public boolean updateStoreInfo(SDto sdto,String[] time_day,	String[] time_open,
			String[] time_close,String[] time_break, String[] store_photo_title,
			SLocaDto slocadto,HttpServletRequest request);
	//매장수정3(메뉴/서비스정보)
//	public boolean updateStoreCertify(SDto sdto, HttpServletRequest request, SDto seq);
	
//매장정보가져오기
	//Store Seq 가져오기
	public SDto selectStoreSeq(ODto odto);
	//일반 매장 상세정보들 가져오기
	public SDto selectStoreDetail(int store_seq);
	//매장 리스트+각 리스트의 상세정보 가져오기
	public List<SDto> StoreSeqList(String[] store_seq_list);
	
	

}

