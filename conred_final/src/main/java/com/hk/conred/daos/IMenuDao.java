package com.hk.conred.daos;

import java.util.List;

import com.hk.conred.dtos.MenuDto;
import com.hk.conred.dtos.SDto;

public interface IMenuDao {
	public boolean insertMenu(SDto sdto, String[] category_code_2,String[] name,
			String[] content,String[] price,String[] state);
	
	public List<MenuDto> selectMenu(int store_seq);
	
	//메뉴 상세 예약가능시간,매장최대인원수 같이출력
	public List<MenuDto> detailMenu(int menu_seq,int store_seq);
}
