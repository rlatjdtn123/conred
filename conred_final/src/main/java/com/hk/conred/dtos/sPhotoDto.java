package com.hk.conred.dtos;

public class sPhotoDto {
	private int store_photo_seq;
	private int store_seq;
	private String store_photo_origin;
	private String store_photo_stored;
	
	public sPhotoDto() {
	}

	public sPhotoDto(int store_photo_seq, int store_seq, String store_photo_origin, String store_photo_stored) {
		super();
		this.store_photo_seq = store_photo_seq;
		this.store_seq = store_seq;
		this.store_photo_origin = store_photo_origin;
		this.store_photo_stored = store_photo_stored;
	}

	public int getStore_photo_seq() {
		return store_photo_seq;
	}

	public void setStore_photo_seq(int store_photo_seq) {
		this.store_photo_seq = store_photo_seq;
	}

	public int getStore_seq() {
		return store_seq;
	}

	public void setStore_seq(int store_seq) {
		this.store_seq = store_seq;
	}

	public String getStore_photo_origin() {
		return store_photo_origin;
	}

	public void setStore_photo_origin(String store_photo_origin) {
		this.store_photo_origin = store_photo_origin;
	}

	public String getStore_photo_stored() {
		return store_photo_stored;
	}

	public void setStore_photo_stored(String store_photo_stored) {
		this.store_photo_stored = store_photo_stored;
	}

	@Override
	public String toString() {
		return "sPhotoDto [store_photo_seq=" + store_photo_seq + ", store_seq=" + store_seq + ", store_photo_origin="
				+ store_photo_origin + ", store_photo_stored=" + store_photo_stored + "]";
	}
	
	
}
