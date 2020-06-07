package com.hk.conred.daos;

import com.hk.conred.dtos.SDto;

public interface IMenuDao {
	public boolean insertMenu(SDto sdto, String[] category_code_2,String[] name,
			String[] content,String[] price,String[] state);
}
