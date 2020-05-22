package com.hk.conred.dtos;

import java.util.Date;

public class ReserveDto {

	private int reservation_seq;
	private String user_id;
	private int menu_seq;
	private int store_seq;
	private String reservation_time;
	private String reservation_state;
	private String reservation_price;
	private Date reservation_regdate; 
	
	public ReserveDto() {
	}

	public ReserveDto(int reservation_seq, String user_id, int menu_seq, int store_seq, String reservation_time,
			String reservation_state, String reservation_price, Date reservation_regdate) {
		super();
		this.reservation_seq = reservation_seq;
		this.user_id = user_id;
		this.menu_seq = menu_seq;
		this.store_seq = store_seq;
		this.reservation_time = reservation_time;
		this.reservation_state = reservation_state;
		this.reservation_price = reservation_price;
		this.reservation_regdate = reservation_regdate;
	}

	public int getReservation_seq() {
		return reservation_seq;
	}

	public void setReservation_seq(int reservation_seq) {
		this.reservation_seq = reservation_seq;
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

	public String getReservation_time() {
		return reservation_time;
	}

	public void setReservation_time(String reservation_time) {
		this.reservation_time = reservation_time;
	}

	public String getReservation_state() {
		return reservation_state;
	}

	public void setReservation_state(String reservation_state) {
		this.reservation_state = reservation_state;
	}

	public String getReservation_price() {
		return reservation_price;
	}

	public void setReservation_price(String reservation_price) {
		this.reservation_price = reservation_price;
	}

	public Date getReservation_regdate() {
		return reservation_regdate;
	}

	public void setReservation_regdate(Date reservation_regdate) {
		this.reservation_regdate = reservation_regdate;
	}

	@Override
	public String toString() {
		return "reserveDto [reservation_seq=" + reservation_seq + ", user_id=" + user_id + ", menu_seq=" + menu_seq
				+ ", store_seq=" + store_seq + ", reservation_time=" + reservation_time + ", reservation_state="
				+ reservation_state + ", reservation_price=" + reservation_price + ", reservation_regdate="
				+ reservation_regdate + "]";
	}
	
	
}
