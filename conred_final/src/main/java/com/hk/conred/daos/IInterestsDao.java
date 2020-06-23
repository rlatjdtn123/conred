package com.hk.conred.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hk.conred.dtos.InterestsDto;
import com.hk.conred.dtos.SDto;

public interface IInterestsDao {
	
	//1. 사용자 관심사 등록
	public boolean insertInterests(String[] category_code, String user_id);
	//2. 사용자 관심사 메인페이지 추천 기능
	public List<SDto> user_interests_recommended(String user_id, String paging);
	
	//3.사용자마이페이지 관심사
	public InterestsDto userInterests(String user_id);
    
}

