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
	//Store Seq 가져오기
	public SDto selectStoreSeq(ODto odto);
}
