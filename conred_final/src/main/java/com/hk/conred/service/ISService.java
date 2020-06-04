package com.hk.conred.service;

import com.hk.conred.dtos.SDto;

public interface ISService {
	//매장등록(사업자등록정보)
	public boolean insertStoreCertify(SDto sdto);
	//매장등록2(매장정보)
	public boolean updateStoreInfo(SDto sdto);
	//매장등록3(메뉴/서비스정보)
	public boolean updateStoreMenu(SDto sdto);
}
