package com.hk.conred.dtos;

import java.util.Date;

public class qnaDto {

	private int qna_seq;
	private int store_seq;
	private String user_id;
	private String qna_content;
	private String answer;
	private String qna_hide;
	private String qna_read;
	private Date qna_regdate;
	private String qna_delflag;
	
	public qnaDto() {
	}

	public qnaDto(int qna_seq, int store_seq, String user_id, String qna_content, String answer, String qna_hide,
			String qna_read, Date qna_regdate, String qna_delflag) {
		super();
		this.qna_seq = qna_seq;
		this.store_seq = store_seq;
		this.user_id = user_id;
		this.qna_content = qna_content;
		this.answer = answer;
		this.qna_hide = qna_hide;
		this.qna_read = qna_read;
		this.qna_regdate = qna_regdate;
		this.qna_delflag = qna_delflag;
	}

	public int getQna_seq() {
		return qna_seq;
	}

	public void setQna_seq(int qna_seq) {
		this.qna_seq = qna_seq;
	}

	public int getStore_seq() {
		return store_seq;
	}

	public void setStore_seq(int store_seq) {
		this.store_seq = store_seq;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getQna_hide() {
		return qna_hide;
	}

	public void setQna_hide(String qna_hide) {
		this.qna_hide = qna_hide;
	}

	public String getQna_read() {
		return qna_read;
	}

	public void setQna_read(String qna_read) {
		this.qna_read = qna_read;
	}

	public Date getQna_regdate() {
		return qna_regdate;
	}

	public void setQna_regdate(Date qna_regdate) {
		this.qna_regdate = qna_regdate;
	}

	public String getQna_delflag() {
		return qna_delflag;
	}

	public void setQna_delflag(String qna_delflag) {
		this.qna_delflag = qna_delflag;
	}

	@Override
	public String toString() {
		return "qnaDto [qna_seq=" + qna_seq + ", store_seq=" + store_seq + ", user_id=" + user_id + ", qna_content="
				+ qna_content + ", answer=" + answer + ", qna_hide=" + qna_hide + ", qna_read=" + qna_read
				+ ", qna_regdate=" + qna_regdate + ", qna_delflag=" + qna_delflag + "]";
	}

	
}
