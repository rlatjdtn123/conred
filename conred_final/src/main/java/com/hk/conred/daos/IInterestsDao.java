package com.hk.conred.daos;

import java.util.List;

import com.hk.conred.dtos.InterestsDto;
import com.hk.conred.dtos.SDto;

public interface IInterestsDao {
	
	//사용자 관심사 등록
	public boolean insertInterests(String[] category_code,String  user_id);
	//사용자 관심사 메인페이지 추천 기능
    public List<SDto> user_interests_recommended(String user_id);
}
