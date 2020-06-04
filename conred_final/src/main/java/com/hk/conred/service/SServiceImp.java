package com.hk.conred.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.conred.daos.ISDao;
import com.hk.conred.dtos.ODto;
import com.hk.conred.dtos.SDto;

@Service
public class SServiceImp implements ISService {
	
	@Autowired
	private ISDao SDaoImp;
	
	//매장등록(사업자등록정보)
	@Override
	public boolean insertStoreCertify(SDto sdto) {
		return SDaoImp.insertStoreCertify(sdto) ;
	}
	//매장등록2(매장정보)
	@Override
	public boolean updateStoreInfo(SDto sdto) {
		return SDaoImp.updateStoreInfo(sdto);
	}
	//매장등록3(메뉴/서비스정보)
	@Override
	public boolean updateStoreMenu(SDto sdto) {//아직미구현
		return SDaoImp.updateStoreMenu(sdto);
	}
	//Store Seq 가져오기
	@Override
	public SDto selectStoreSeq(ODto odto) {
		return SDaoImp.selectStoreSeq(odto);
	}

}
