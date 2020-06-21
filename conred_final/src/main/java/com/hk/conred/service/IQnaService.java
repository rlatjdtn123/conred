package com.hk.conred.service;

import java.util.List;

import com.hk.conred.dtos.QnaDto;

public interface IQnaService {
	
	//1.특정 사용자의 문의 목록
	public List<QnaDto> qnaList(String user_id,String pnum);
	
	//2.특정매장의 문의목록
	public List<QnaDto> qnaListStore(int store_seq,int pnum);
	
	//3.특정매장의 문의갯수
	public QnaDto qnaAvg(int store_seq);
	
	//4.사용자 문의 삭제
	public boolean userQnaDelete(int qna_seq);
	
	//5.사용자 문의 수정
	public boolean userQnaUpdate(int qna_seq,String qna_title,String qna_content,String qna_hide);
	
	//6.사용자 특정문의 한개
	public QnaDto getUserQna(int qna_seq);
	
	//7.사용자 문의등록
	public boolean insertQna(int store_seq,String user_id,String qna_title,String qna_content,String qna_hide);
}
