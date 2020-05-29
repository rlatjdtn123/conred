package com.hk.conred.daos;

import java.util.List;

import com.hk.conred.dtos.ODto;
import com.hk.conred.dtos.SDto;
import com.hk.conred.dtos.UDto;

public interface IADao {
	
	//1.전체 사용자 조회 기능
	public List<UDto> admin_site_userlist(String keyword);
	//2.전체 블랙유저 조회 기능
	public List<UDto> admin_blackuser_search(String blackuser);
	//3.전체 점주 조회 기능
//	public List<ODto> admin_site_ownerlist();
	//4.전체 점포 조회 기능
	public List<SDto> admin_site_storelist(String keywordstore);
	//5.전체 승인매장 조회 기능
	public List<SDto> admin_store_state_search(String adminstate);
}
