package com.hk.conred.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hk.conred.daos.ICListDao;
import com.hk.conred.daos.ICMainDao;
import com.hk.conred.daos.IMenuDao;
import com.hk.conred.daos.ISDao;
import com.hk.conred.daos.ISTimeDao;
import com.hk.conred.dtos.CMainDto;
import com.hk.conred.dtos.ODto;
import com.hk.conred.dtos.SDto;
import com.hk.conred.dtos.STimeDto;

@Service
public class SServiceImp implements ISService {
	
	@Autowired
	private ISDao SDaoImp;
	@Autowired
	private ISTimeDao STimeDaoImp;
	@Autowired
	private ICMainDao CMainDaoImp;
	@Autowired
	private ICListDao CListDaoImp;
	@Autowired
	private IMenuDao MenuDaoImp;
	
	//매장등록(사업자등록정보)
	@Override
	public boolean insertStoreCertify(SDto sdto) {
		return SDaoImp.insertStoreCertify(sdto) ;
	}
	//매장등록2(매장정보)
	@Transactional
	@Override
	public boolean updateStoreInfo(SDto sdto,String[] time_day,String[] time_open,String[] time_close,String[] time_break) {
		SDaoImp.updateStoreInfo(sdto);
		//위의 updateStoreInfo을 true false 리턴 안해주는 이유
		//	>>어차피 여기서 오류나면 밑에 return은 실행되지않으니, 실행되면 true라는걸 알 수 있다.s
		return STimeDaoImp.insertStime(sdto,time_day,time_open,time_close,time_break);
	}
	//매장등록3(메뉴/서비스정보)
	@Transactional
	@Override
	public boolean updateStoreMenu(SDto sdto,CMainDto cmaindto,
			String[] clist,String[] category_code_2,String[] name,
			String[] content,String[] price,String[] state) {//아직미구현
		SDaoImp.updateStoreMenu(sdto);
		CMainDaoImp.insertCMain(cmaindto);
		CListDaoImp.insertCList(sdto, clist);
//		MenuDaoImp.insertMenu(sdto, category_code_2, name, content, price, state);
		return MenuDaoImp.insertMenu(sdto, category_code_2, name, content, price, state);
	}
	//Store Seq 가져오기
	@Override
	public SDto selectStoreSeq(ODto odto) {
		return SDaoImp.selectStoreSeq(odto);
	}
	//일반 매장 상세정보들 가져오기
	@Override
	public SDto selectStoreDetail(int store_seq) {
		return SDaoImp.selectStoreDetail(store_seq);
	}
	//매장 리스트+각 리스트의 상세정보 가져오기
	@Override
	public List<SDto> StoreSeqList(String[] store_seq_list) {
		return SDaoImp.StoreSeqList(store_seq_list);
	}

}
