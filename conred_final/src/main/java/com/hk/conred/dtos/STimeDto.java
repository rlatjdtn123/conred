package com.hk.conred.dtos;

public class STimeDto {
	private int store_time_seq;
	private int store_seq;
	private String store_time_day;
	private String store_time_time;
	
	public STimeDto() {
	}

	public STimeDto(int store_time_seq, int store_seq, String store_time_day, String store_time_time) {
		super();
		this.store_time_seq = store_time_seq;
		this.store_seq = store_seq;
		this.store_time_day = store_time_day;
		this.store_time_time = store_time_time;
	}

	public int getStore_time_seq() {
		return store_time_seq;
	}

	public void setStore_time_seq(int store_time_seq) {
		this.store_time_seq = store_time_seq;
	}

	public int getStore_seq() {
		return store_seq;
	}

	public void setStore_seq(int store_seq) {
		this.store_seq = store_seq;
	}

	public String getStore_time_day() {
		return store_time_day;
	}

	public void setStore_time_day(String store_time_day) {
		this.store_time_day = store_time_day;
	}

	public String getStore_time_time() {
		return store_time_time;
	}

	public void setStore_time_time(String store_time_time) {
		this.store_time_time = store_time_time;
	}

	@Override
	public String toString() {
		return "sTimeDto [store_time_seq=" + store_time_seq + ", store_seq=" + store_seq + ", store_time_day="
				+ store_time_day + ", store_time_time=" + store_time_time + "]";
	}
	
	
}
