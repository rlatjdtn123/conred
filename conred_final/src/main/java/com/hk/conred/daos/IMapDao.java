package com.hk.conred.daos;

import java.util.List;

import com.hk.conred.dtos.SDto;

public interface IMapDao {
	public List<SDto> searchCateAll();
	public List<SDto> searchCate(String category_code);
}
