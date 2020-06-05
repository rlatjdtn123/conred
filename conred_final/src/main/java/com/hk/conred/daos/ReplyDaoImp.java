package com.hk.conred.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.conred.dtos.ReplyDto;

@Repository
public class ReplyDaoImp implements IReplyDao{

	private String nameSpace="com.hk.conred.Reply.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<ReplyDto> replyList(String user_id,String pnum) {
		Map<String, String> map=new HashMap<>();
		map.put("user_id", user_id);
		map.put("pnum", pnum);
		List<ReplyDto> list=sqlSession.selectList(nameSpace+"replyList", map);
		return list;
	}

}
