package com.hk.conred.dtos;

public class likeDto {
	
	private int like_seq;
	private String user_id;
	private int store_seq;
	
	
	public likeDto() {
	}


	public likeDto(int like_seq, String user_id, int store_seq) {
		super();
		this.like_seq = like_seq;
		this.user_id = user_id;
		this.store_seq = store_seq;
	}


	public int getLike_seq() {
		return like_seq;
	}


	public void setLike_seq(int like_seq) {
		this.like_seq = like_seq;
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


	@Override
	public String toString() {
		return "likeDto [like_seq=" + like_seq + ", user_id=" + user_id + ", store_seq=" + store_seq + "]";
	}
	
	
}
