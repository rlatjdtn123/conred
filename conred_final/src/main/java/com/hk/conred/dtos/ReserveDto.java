package com.hk.conred.dtos;

import java.util.Date;

public class ReserveDto {

	private int reserve_seq;
	private String user_id;
	private int menu_seq;
	private int store_seq;
	private String reserve_time;
	private String reserve_state;
	private String reserve_price; 
	private Date reserve_regdate; 
	
	public ReserveDto() {
	}

	public ReserveDto(int reserve_seq, String user_id, int menu_seq, int store_seq, String reserve_time,
			String reserve_state, String reserve_price, Date reserve_regdate) {
		super();
		this.reserve_seq = reserve_seq;
		this.user_id = user_id;
		this.menu_seq = menu_seq;
		this.store_seq = store_seq;
		this.reserve_time = reserve_time;
		this.reserve_state = reserve_state;
		this.reserve_price = reserve_price;
		this.reserve_regdate = reserve_regdate;
	}

	public int getReserve_seq() {
		return reserve_seq;
	}

	public void setReserveve_seq(int reserveve_seq) {
		this.reserve_seq = reserveve_seq;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getMenu_seq() {
		return menu_seq;
	}

	public void setMenu_seq(int menu_seq) {
		this.menu_seq = menu_seq;
	}

	public int getStore_seq() {
		return store_seq;
	}

	public void setStore_seq(int store_seq) {
		this.store_seq = store_seq;
	}

	public String getReserve_time() {
		return reserve_time;
	}

	public void setReserve_time(String reserve_time) {
		this.reserve_time = reserve_time;
	}

	public String getReserve_state() {
		return reserve_state;
	}

	public void setReserve_state(String reserve_state) {
		this.reserve_state = reserve_state;
	}

	public String getReserve_price() {
		return reserve_price;
	}

	public void setReserve_price(String reserve_price) {
		this.reserve_price = reserve_price;
	}

	public Date getReserve_regdate() {
		return reserve_regdate;
	}

	public void setReserve_regdate(Date reserve_regdate) {
		this.reserve_regdate = reserve_regdate;
	}
  
	@Override
	public String toString() {
		return "ReserveDto [reserveve_seq=" + reserve_seq + ", user_id=" + user_id + ", menu_seq=" + menu_seq
				+ ", store_seq=" + store_seq + ", reserve_time=" + reserve_time + ", reserve_state=" + reserve_state
				+ ", reserve_price=" + reserve_price + ", reserve_regdate=" + reserve_regdate + "]";
	}

	
	
	
}
