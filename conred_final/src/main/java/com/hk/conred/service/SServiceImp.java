package com.hk.conred.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hk.conred.daos.ISDao;
import com.hk.conred.daos.ISTimeDao;
import com.hk.conred.dtos.ODto;
import com.hk.conred.dtos.SDto;
import com.hk.conred.dtos.STimeDto;

@Service
public class SServiceImp implements ISService {
	
	@Autowired
	private ISDao SDaoImp;
	@Autowired
	private ISTimeDao STimeDaoImp;
	//매장등록(사업자등록정보)
	@Override
	public boolean insertStoreCertify(SDto sdto) {
		return SDaoImp.insertStoreCertify(sdto) ;
	}
	//매장등록2(매장정보)
	@Transactional
	@Override
//	public boolean updateStoreInfo(SDto sdto, STimeDto stimedto) {
//	public boolean updateStoreInfo(SDto sdto, Map<String, Object> map) {
	public boolean updateStoreInfo(SDto sdto,String[] time_day,String[] time_open,String[] time_close,String[] time_break) {
		SDaoImp.updateStoreInfo(sdto);
		//위의 updateStoreInfo을 true false 리턴 안해주는 이유
		//	>>어차피 여기서 오류나면 밑에 return은 실행되지않으니, 실행되면 true라는걸 알 수 있다.s
		return STimeDaoImp.insertStime(sdto,time_day,time_open,time_close,time_break);
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
