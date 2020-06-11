package com.hk.conred.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hk.conred.daos.ICListDao;
import com.hk.conred.daos.ICMainDao;
import com.hk.conred.daos.IMenuDao;
import com.hk.conred.daos.ISDao;
import com.hk.conred.daos.ISTimeDao;
import com.hk.conred.dtos.CMainDto;
import com.hk.conred.dtos.ODto;
import com.hk.conred.dtos.SDto;

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
	public boolean insertStoreCertify(SDto sdto, HttpServletRequest request) {
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest)request;

//		MultipartFile multiFile_biz=multi.getFile("biz");
//		MultipartFile multiFile_sales=multi.getFile("sales");
//		
//		//originName
//		String originName_biz=multiFile_biz.getOriginalFilename();
//		System.out.println("biz의 원본파일명:"+originName_biz);
//		String originName_sales=multiFile_sales.getOriginalFilename();
//		System.out.println("sales의 원본파일명:"+originName_sales);
//			
//		//storedName
//		String createUUid_biz=UUID.randomUUID().toString().replaceAll("-", "");
//		String storedName_biz = createUUid_biz+originName_biz.substring(originName_biz.indexOf("."));
//		System.out.println("biz의 저장파일명:"+storedName_biz);
//		String createUUid_sales=UUID.randomUUID().toString().replaceAll("-", "");
//		String storedName_sales = createUUid_sales+originName_sales.substring(originName_sales.indexOf("."));
//		System.out.println("sales의 저장파일명:"+storedName_sales);
//			
//		//fileSize
//		String fileSize_biz=Long.toString(multiFile_biz.getSize());
//		System.out.println("biz의 사이즈:"+fileSize_biz);
//		String fileSize_sales=Long.toString(multiFile_sales.getSize());
//		System.out.println("sales의 사이즈:"+fileSize_sales);
//			
//		String path_biz="C:/Users/hkedu/git/conred/conred_final/src/main/webapp/upload_biz/";
//		String path_sales="C:/Users/hkedu/git/conred/conred_final/src/main/webapp/upload_sales/";
//		File file_biz = new File(path_biz+storedName_biz);
//		File file_sales = new File(path_sales+storedName_sales);
		
//		sdto.setStore_license_biz_origin(originName_biz);
//		sdto.setStore_license_biz_stored(storedName_biz);
//		sdto.setStore_license_biz_size(fileSize_biz);
//		sdto.setStore_license_sales_origin(originName_sales);
//		sdto.setStore_license_sales_stored(storedName_sales);
//		sdto.setStore_license_sales_size(fileSize_sales);
			
		sdto.setStore_license_biz_origin("1");
		sdto.setStore_license_biz_stored("1");
		sdto.setStore_license_biz_size("1");
		sdto.setStore_license_sales_origin("1");
		sdto.setStore_license_sales_stored("1");
		sdto.setStore_license_sales_size("1");
			
		boolean isS=false; 
		try {
//			isS=SDaoImp.insertStoreCertify(new SDto (odto.getOwner_id(), store_owner_name, store_license_number,
//					originName_biz, storedName_biz, fileSize_biz, store_license_sales_origin, 
//					store_license_sales_stored, store_license_sales_size, store_owner_phone, store_agreement));
			isS=SDaoImp.insertStoreCertify(sdto);
			if(isS) {
//				multiFile_biz.transferTo(file_biz);
//				multiFile_sales.transferTo(file_sales);
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
		}
		return isS;
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
