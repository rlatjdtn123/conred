package com.hk.conred.service;

import java.util.List;

import com.hk.conred.dtos.MenuDto;

public interface IMenuService {
	public List<MenuDto> selectMenu(int store_seq);
}
