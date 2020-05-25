package com.hk.conred.daos;

import com.hk.conred.dtos.InterestsDto;

public interface IInterestsDao {
	
	//사용자 관심사 등록
	public boolean insertInterests(String[] category_code,String  user_id);
}
