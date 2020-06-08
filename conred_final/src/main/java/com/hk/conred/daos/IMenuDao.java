package com.hk.conred.daos;

import java.util.List;

import com.hk.conred.dtos.MenuDto;
import com.hk.conred.dtos.SDto;

public interface IMenuDao {
	public boolean insertMenu(SDto sdto, String[] category_code_2,String[] name,
			String[] content,String[] price,String[] state);
	
	public List<MenuDto> selectMenu(int store_seq);
}
