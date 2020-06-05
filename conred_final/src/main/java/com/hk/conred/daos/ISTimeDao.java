package com.hk.conred.daos;

import java.util.Map;

import com.hk.conred.dtos.SDto;
import com.hk.conred.dtos.STimeDto;

public interface ISTimeDao {
	//영업시간 등록
//	public boolean insertStime(STimeDto stimedto);
	public boolean insertStime(SDto sdto,String[] time_day,String[] time_open,String[] time_close,String[] time_break);
	//영업시간 수정s
	public boolean updateStime(STimeDto stimedto);
}
