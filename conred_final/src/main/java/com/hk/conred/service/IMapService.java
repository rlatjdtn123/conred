package com.hk.conred.service;

import java.util.List;

import com.hk.conred.dtos.SDto;
import com.hk.conred.dtos.SPhotoDto;

public interface IMapService {
	public List<SDto> searchCateAll();
	public List<SDto> searchCate(String category_code);

	//아작스로 맵에뿌려주기1 : 카테고리 all
	public List<SDto> searchCateAll_ajax(String nelat, String nelng, String swlat, String swlng);
	public List<SPhotoDto> getPhotos_ajax(List<SDto> list);
}
