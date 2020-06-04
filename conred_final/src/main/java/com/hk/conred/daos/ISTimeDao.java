package com.hk.conred.daos;

import com.hk.conred.dtos.STimeDto;

public interface ISTimeDao {
	//영업시간 등록
	public boolean insertStime(STimeDto stimedto);
	//영업시간 수정s
	public boolean updateStime(STimeDto stimedto);
}
