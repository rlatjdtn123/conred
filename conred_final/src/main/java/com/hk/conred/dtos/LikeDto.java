package com.hk.conred.dtos;

public class LikeDto {
	
	private int like_list_seq; 
	private String user_id;
	private int store_seq;
	
	
	public LikeDto() {
	}


	public LikeDto(int like_list_seq, String user_id, int store_seq) {
		super();
		this.like_list_seq = like_list_seq;
		this.user_id = user_id;
		this.store_seq = store_seq;
	}


	public int getLike_list_seq() {
		return like_list_seq;
	}


	public void setLike_list_seq(int like_list_seq) {
		this.like_list_seq = like_list_seq;
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
		return "LikeDto [like_list_seq=" + like_list_seq + ", user_id=" + user_id + ", store_seq=" + store_seq + "]";
	}


	
	
	
}
