package com.hk.conred.service;

import java.util.List;

import com.hk.conred.dtos.ODto;
import com.hk.conred.dtos.SDto;
import com.hk.conred.dtos.UDto;

public interface IAService  {
	//1.전체 사용자 조회 기능
	public List<UDto> admin_site_userlist();
	//2.전체 점주 조회 기능
	public List<ODto> admin_site_ownerlist();
	//3.전체 점포 조회 기능
	public List<SDto> admin_site_storelist();
}

