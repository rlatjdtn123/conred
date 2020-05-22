package com.hk.conred.dtos;

public class CListDto {
	private int category_list_seq;
	private String category_code;
	private int store_seq;
	
	public CListDto() {
	}

	public CListDto(int category_list_seq, String category_code, int store_seq) {
		super();
		this.category_list_seq = category_list_seq;
		this.category_code = category_code;
		this.store_seq = store_seq;
	}

	public int getCategory_list_seq() {
		return category_list_seq;
	}

	public void setCategory_list_seq(int category_list_seq) {
		this.category_list_seq = category_list_seq;
	}

	public String getCategory_code() {
		return category_code;
	}

	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}

	public int getStore_seq() {
		return store_seq;
	}

	public void setStore_seq(int store_seq) {
		this.store_seq = store_seq;
	}

	@Override
	public String toString() {
		return "cListDto [category_list_seq=" + category_list_seq + ", category_code=" + category_code + ", store_seq="
				+ store_seq + "]";
	}
	
	
}
