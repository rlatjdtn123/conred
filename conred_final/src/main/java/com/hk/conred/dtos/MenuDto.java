package com.hk.conred.dtos;

public class MenuDto {
	private int menu_seq;
	private int store_seq;
	private String menu_name;
	private String menu_content;
	private String menu_price;
	private String menu_state;
	
	public MenuDto() {
	}

	public MenuDto(int menu_seq, int store_seq, String menu_name, String menu_content, String menu_price,
			String menu_state) {
		super();
		this.menu_seq = menu_seq;
		this.store_seq = store_seq;
		this.menu_name = menu_name;
		this.menu_content = menu_content;
		this.menu_price = menu_price;
		this.menu_state = menu_state;
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

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public String getMenu_content() {
		return menu_content;
	}

	public void setMenu_content(String menu_content) {
		this.menu_content = menu_content;
	}

	public String getMenu_price() {
		return menu_price;
	}

	public void setMenu_price(String menu_price) {
		this.menu_price = menu_price;
	}

	public String getMenu_state() {
		return menu_state;
	}

	public void setMenu_state(String menu_state) {
		this.menu_state = menu_state;
	}

	@Override
	public String toString() {
		return "menuDto [menu_seq=" + menu_seq + ", store_seq=" + store_seq + ", menu_name=" + menu_name
				+ ", menu_content=" + menu_content + ", menu_price=" + menu_price + ", menu_state=" + menu_state + "]";
	}
	
	
}
