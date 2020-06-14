package com.hk.conred.service;

import java.util.List;

import com.hk.conred.dtos.SDto;

public interface IMapService {
	public List<SDto> searchCateAll();
	public List<SDto> searchCate(String category_code);

	public List<SDto> searchCateAll_ajax(String nelat, String nelng, String swlat, String swlng);
}
