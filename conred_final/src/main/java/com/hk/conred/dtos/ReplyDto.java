package com.hk.conred.dtos;

import java.util.Date;

public class ReplyDto {
	
	private int reply_seq;
	private String user_id;
	private int store_seq;
	private String reply_content;
	private Double reply_clean;
	private Double reply_price;
	private Double reply_service;
	private String reply_answer;
	private String reply_read;
	private Date reply_regdate;
	private String reply_delflag;
	
	public ReplyDto() {
	}
	
	public ReplyDto(int reply_seq, String user_id, int store_seq, String reply_content, Double reply_clean,
			Double reply_price, Double reply_service, String reply_answer, String reply_read, Date reply_regdate,
			String reply_delflag) {
		super();
		this.reply_seq = reply_seq;
		this.user_id = user_id;
		this.store_seq = store_seq;
		this.reply_content = reply_content;
		this.reply_clean = reply_clean;
		this.reply_price = reply_price;
		this.reply_service = reply_service;
		this.reply_answer = reply_answer;
		this.reply_read = reply_read;
		this.reply_regdate = reply_regdate;
		this.reply_delflag = reply_delflag;
	}

	public int getReply_seq() {
		return reply_seq;
	}

	public void setReply_seq(int reply_seq) {
		this.reply_seq = reply_seq;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getStore_seq() {
		return store_seq;
	}

	public void setStore_seq(int store_seq) {
		this.store_seq = store_seq;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public Double getReply_clean() {
		return reply_clean;
	}

	public void setReply_clean(Double reply_clean) {
		this.reply_clean = reply_clean;
	}

	public Double getReply_price() {
		return reply_price;
	}

	public void setReply_price(Double reply_price) {
		this.reply_price = reply_price;
	}

	public Double getReply_service() {
		return reply_service;
	}

	public void setReply_service(Double reply_service) {
		this.reply_service = reply_service;
	}

	public String getReply_answer() {
		return reply_answer;
	}

	public void setReply_answer(String reply_answer) {
		this.reply_answer = reply_answer;
	}

	public String getReply_read() {
		return reply_read;
	}

	public void setReply_read(String reply_read) {
		this.reply_read = reply_read;
	}

	public Date getReply_regdate() {
		return reply_regdate;
	}

	public void setReply_regdate(Date reply_regdate) {
		this.reply_regdate = reply_regdate;
	}

	public String getReply_delflag() {
		return reply_delflag;
	}

	public void setReply_delflag(String reply_delflag) {
		this.reply_delflag = reply_delflag;
	}

	@Override
	public String toString() {
		return "ReplyDto [reply_seq=" + reply_seq + ", user_id=" + user_id + ", store_seq=" + store_seq
				+ ", reply_content=" + reply_content + ", reply_clean=" + reply_clean + ", reply_price=" + reply_price
				+ ", reply_service=" + reply_service + ", reply_answer=" + reply_answer + ", reply_read=" + reply_read
				+ ", reply_regdate=" + reply_regdate + ", reply_delflag=" + reply_delflag + "]";
	}

	
	
	
	
	
}
