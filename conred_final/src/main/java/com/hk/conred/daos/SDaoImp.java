package com.hk.conred.daos;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.conred.dtos.ODto;
import com.hk.conred.dtos.SDto;

@Repository
public class SDaoImp implements ISDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.hk.conred.S.";
	
	//매장등록(사업자등록정보)
	@Override
	public boolean insertStoreCertify(SDto sdto) {    
		int count= 0;
		count=sqlSession.insert(namespace+"insertStoreCertify",sdto);
		return count>0?true:false;
	}
	//매장등록2(매장정보)
	@Override
	public boolean updateStoreInfo(SDto sdto) {
		int count= 0;
		count=sqlSession.update(namespace+"updateStoreInfo",sdto);
		return count>0?true:false;
	}
	//매장등록3(메뉴/서비스정보)
	@Override
	public boolean updateStoreMenu(SDto sdto) {
		int count= 0;
		count=sqlSession.update(namespace+"updateStoreMenu",sdto);
		return count>0?true:false;
	}
	//Store Seq 가져오기
	@Override
	public SDto selectStoreSeq(ODto odto) {
		return sqlSession.selectOne(namespace+"selectStoreSeq",odto);
	}
	@Override
	public SDto selectStoreDetail(int store_seq) {
		return sqlSession.selectOne(namespace+"selectStoreDetail",store_seq);
	}
	
}
