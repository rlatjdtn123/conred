package com.hk.conred.dtos;

public class SDto {
	private int store_seq;
	private String owner_id;
	private String store_name;
	private String store_owner_name;
	private String store_path;
	private String store_simple_intro;
	private String store_intro;
	private String store_state;
	private String store_phone;
	private String store_owner_phone;
	private String store_address;
	private String store_detail_address;
	private String store_time_other;
	private String store_bank;
	private String store_account;
	private String store_license_owner;
	private String store_license_sales;
	private String store_admin_state;
	
	public SDto() {
	}

	public SDto(int store_seq, String owner_id, String store_name, String store_owner_name, String store_path,
			String store_simple_intro, String store_intro, String store_state, String store_phone,
			String store_owner_phone, String store_address, String store_detail_address, String store_time_other,
			String store_bank, String store_account, String store_license_owner, String store_license_sales,
			String store_admin_state) {
		super();
		this.store_seq = store_seq;
		this.owner_id = owner_id;
		this.store_name = store_name;
		this.store_owner_name = store_owner_name;
		this.store_path = store_path;
		this.store_simple_intro = store_simple_intro;
		this.store_intro = store_intro;
		this.store_state = store_state;
		this.store_phone = store_phone;
		this.store_owner_phone = store_owner_phone;
		this.store_address = store_address;
		this.store_detail_address = store_detail_address;
		this.store_time_other = store_time_other;
		this.store_bank = store_bank;
		this.store_account = store_account;
		this.store_license_owner = store_license_owner;
		this.store_license_sales = store_license_sales;
		this.store_admin_state = store_admin_state;
	}

	public int getStore_seq() {
		return store_seq;
	}

	public void setStore_seq(int store_seq) {
		this.store_seq = store_seq;
	}

	public String getOwner_id() {
		return owner_id;
	}

	public void setOwner_id(String owner_id) {
		this.owner_id = owner_id;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public String getStore_owner_name() {
		return store_owner_name;
	}

	public void setStore_owner_name(String store_owner_name) {
		this.store_owner_name = store_owner_name;
	}

	public String getStore_path() {
		return store_path;
	}

	public void setStore_path(String store_path) {
		this.store_path = store_path;
	}

	public String getStore_simple_intro() {
		return store_simple_intro;
	}

	public void setStore_simple_intro(String store_simple_intro) {
		this.store_simple_intro = store_simple_intro;
	}

	public String getStore_intro() {
		return store_intro;
	}

	public void setStore_intro(String store_intro) {
		this.store_intro = store_intro;
	}

	public String getStore_state() {
		return store_state;
	}

	public void setStore_state(String store_state) {
		this.store_state = store_state;
	}

	public String getStore_phone() {
		return store_phone;
	}

	public void setStore_phone(String store_phone) {
		this.store_phone = store_phone;
	}

	public String getStore_owner_phone() {
		return store_owner_phone;
	}

	public void setStore_owner_phone(String store_owner_phone) {
		this.store_owner_phone = store_owner_phone;
	}

	public String getStore_address() {
		return store_address;
	}

	public void setStore_address(String store_address) {
		this.store_address = store_address;
	}

	public String getStore_detail_address() {
		return store_detail_address;
	}

	public void setStore_detail_address(String store_detail_address) {
		this.store_detail_address = store_detail_address;
	}

	public String getStore_time_other() {
		return store_time_other;
	}

	public void setStore_time_other(String store_time_other) {
		this.store_time_other = store_time_other;
	}

	public String getStore_bank() {
		return store_bank;
	}

	public void setStore_bank(String store_bank) {
		this.store_bank = store_bank;
	}

	public String getStore_account() {
		return store_account;
	}

	public void setStore_account(String store_account) {
		this.store_account = store_account;
	}

	public String getStore_license_owner() {
		return store_license_owner;
	}

	public void setStore_license_owner(String store_license_owner) {
		this.store_license_owner = store_license_owner;
	}

	public String getStore_license_sales() {
		return store_license_sales;
	}

	public void setStore_license_sales(String store_license_sales) {
		this.store_license_sales = store_license_sales;
	}

	public String getStore_admin_state() {
		return store_admin_state;
	}

	public void setStore_admin_state(String store_admin_state) {
		this.store_admin_state = store_admin_state;
	}

	@Override
	public String toString() {
		return "sDto [store_seq=" + store_seq + ", owner_id=" + owner_id + ", store_name=" + store_name
				+ ", store_owner_name=" + store_owner_name + ", store_path=" + store_path + ", store_simple_intro="
				+ store_simple_intro + ", store_intro=" + store_intro + ", store_state=" + store_state
				+ ", store_phone=" + store_phone + ", store_owner_phone=" + store_owner_phone + ", store_address="
				+ store_address + ", store_detail_address=" + store_detail_address + ", store_time_other="
				+ store_time_other + ", store_bank=" + store_bank + ", store_account=" + store_account
				+ ", store_license_owner=" + store_license_owner + ", store_license_sales=" + store_license_sales
				+ ", store_admin_state=" + store_admin_state + "]";
	}
	
	
	
}
