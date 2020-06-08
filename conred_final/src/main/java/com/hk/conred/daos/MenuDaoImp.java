package com.hk.conred.daos;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.conred.dtos.MenuDto;
import com.hk.conred.dtos.SDto;

@Repository
public class MenuDaoImp implements IMenuDao{

	private String namespace="com.hk.conred.Menu.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public boolean insertMenu(SDto sdto, String[] category_code_2, String[] name,
			String[] content, String[] price, String[] state) {
		int count = 0;
		List<MenuDto> list = new ArrayList<>();
		MenuDto dto;
		for (int i = 0; i < name.length; i++) {
			dto = new MenuDto();
			dto.setStore_seq(sdto.getStore_seq());
			dto.setCategory_code(category_code_2[i]);
			dto.setMenu_name(name[i]);
			dto.setMenu_content(content[i]);
			dto.setMenu_price(price[i]);
			dto.setMenu_state(state[i]);
			list.add(dto);
			dto=null;
		}
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		count=sqlSession.insert(namespace+"insertMenu",list);
		return count>0?true:false;
	}

	@Override
	public List<MenuDto> selectMenu(int store_seq) {
		List<MenuDto> list= sqlSession.selectList(namespace+"selectMenu",store_seq);
		return list;
	}

}
