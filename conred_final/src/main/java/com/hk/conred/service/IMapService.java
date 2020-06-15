package com.hk.conred.service;

import java.util.List;

import com.hk.conred.dtos.CListDto;
import com.hk.conred.dtos.SDto;
import com.hk.conred.dtos.SLocaDto;
import com.hk.conred.dtos.SPhotoDto;
import com.hk.conred.dtos.STimeDto;

public interface IMapService {
	public List<SDto> searchCateAll();
	public List<SDto> searchCate(String category_code);

	//아작스로 맵에뿌려주기1 : 카테고리 all
	public List<SDto> searchCateAll_ajax(String nelat, String nelng, String swlat, String swlng);
	public List<SPhotoDto> getPhotos_ajax(List<SDto> list);
	public List<CListDto> getCates_ajax(List<SDto> list);
	public List<STimeDto> getStime_ajax(List<SDto> list);
	public List<SLocaDto> getSloca_ajax(List<SDto> list);
}
