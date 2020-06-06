package com.hk.conred.dtos;

public class LikeDto {
	
	private int like_list_seq; 
	private String user_id;
	private int store_seq;
	private String store_name;
	private String store_intro_simple;
	private String store_address;
	
	
	public LikeDto() {
	}


	public LikeDto(int like_list_seq, String user_id, int store_seq, String store_name, String store_intro_simple,
			String store_address) {
		super();
		this.like_list_seq = like_list_seq;
		this.user_id = user_id;
		this.store_seq = store_seq;
		this.store_name = store_name;
		this.store_intro_simple = store_intro_simple;
		this.store_address = store_address;
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


	public String getStore_name() {
		return store_name;
	}


	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}


	public String getStore_intro_simple() {
		return store_intro_simple;
	}


	public void setStore_intro_simple(String store_intro_simple) {
		this.store_intro_simple = store_intro_simple;
	}


	public String getStore_address() {
		return store_address;
	}


	public void setStore_address(String store_address) {
		this.store_address = store_address;
	}


	@Override
	public String toString() {
		return "LikeDto [like_list_seq=" + like_list_seq + ", user_id=" + user_id + ", store_seq=" + store_seq
				+ ", store_name=" + store_name + ", store_intro_simple=" + store_intro_simple + ", store_address="
				+ store_address + "]";
	}


	


	


	
	
	
}
