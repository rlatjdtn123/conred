package com.hk.conred.dtos;

public class CListDto {
	private int category_list_seq;
	private int store_seq;
	private String category_code_small;
	
	public CListDto() {
		super();
	}
	
	public CListDto(int category_list_seq, int store_seq, String category_code_small) {
		super();
		this.category_list_seq = category_list_seq;
		this.store_seq = store_seq;
		this.category_code_small = category_code_small;
	}

	public int getCategory_list_seq() {
		return category_list_seq;
	}

	public void setCategory_list_seq(int category_list_seq) {
		this.category_list_seq = category_list_seq;
	}

	public int getStore_seq() {
		return store_seq;
	}

	public void setStore_seq(int store_seq) {
		this.store_seq = store_seq;
	}

	public String getCategory_code_small() {
		return category_code_small;
	}

	public void setCategory_code_small(String category_code_small) {
		this.category_code_small = category_code_small;
	}

	@Override
	public String toString() {
		return "CListDto [category_list_seq=" + category_list_seq + ", store_seq=" + store_seq
				+ ", category_code_small=" + category_code_small + "]";
	}
	
}
