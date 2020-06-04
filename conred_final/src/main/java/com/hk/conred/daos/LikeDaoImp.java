package com.hk.conred.daos;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.conred.dtos.LikeDto;

@Repository
public class LikeDaoImp implements ILikeDao{

	private String nameSpace="com.hk.conred.Like.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<LikeDto> likeList(String user_id) {
		List<LikeDto> list=sqlSession.selectList(nameSpace+"likeList", user_id);
		return list;
	}

}
