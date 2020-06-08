package com.hk.conred.daos;

import com.hk.conred.dtos.ODto;
import com.hk.conred.dtos.SDto;

public interface ISDao {
	//매장등록(사업자등록정보)
	public boolean insertStoreCertify(SDto sdto);
	//매장등록2(매장정보)
	public boolean updateStoreInfo(SDto sdto);
	//매장등록3(메뉴/서비스정보)
	public boolean updateStoreMenu(SDto sdto);
	//로그인중인 점주의 store_Seq 가져오기
	public SDto selectStoreSeq(ODto odto);
	//일반 매장 상세정보들 가져오기
	public SDto selectStoreDetail(int store_seq);
}
