package com.hk.conred.service;

import java.util.List;

import com.hk.conred.dtos.ODto;
import com.hk.conred.dtos.SDto;
import com.hk.conred.dtos.UDto;

public interface IAService  {
	//1.전체 사용자 조회 기능
	public List<UDto> admin_site_userlist(String keyword);
	//2.전체 블랙유저 조회 기능
	public List<UDto> admin_blackuser_search(String blackuser);
	//3.전체 점주 조회 기능
//	public List<ODto> admin_site_ownerlist();
	//4.전체 매장 조회 기능
	public List<SDto> admin_site_storelist(String keywordstore);
	//5.전체 승인매장 조회 기능
	public List<SDto> admin_store_state_search(String adminstate);
	//6.매장 선택/다중선택 후 매장 승인 및 취소 기능                 
	public boolean adminMulchk(String[] store_seqs);
	//7.매장 선택/다중선택 후 매장 삭제 기능
	public boolean adminMuldel(String[] store_seqs);
	
}

