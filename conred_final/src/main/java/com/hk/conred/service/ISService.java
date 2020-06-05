package com.hk.conred.service;


import com.hk.conred.dtos.ODto;
import com.hk.conred.dtos.SDto;

public interface ISService {
	//매장등록(사업자등록정보)
	public boolean insertStoreCertify(SDto sdto);
	//매장등록2(매장정보)
	public boolean updateStoreInfo(SDto sdto,String[] time_day,String[] time_open,String[] time_close,String[] time_break);
//	public boolean updateStoreInfo(SDto sdto, Map<String, Object> map);
//	public boolean updateStoreInfo(SDto sdto, STimeDto stimedto);
	//매장등록3(메뉴/서비스정보)
	public boolean updateStoreMenu(SDto sdto);
	//Store Seq 가져오기
	public SDto selectStoreSeq(ODto odto);
}
