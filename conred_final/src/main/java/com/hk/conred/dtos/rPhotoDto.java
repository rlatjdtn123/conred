package com.hk.conred.dtos;

public class rPhotoDto {

	private int reply_photo_seq;
	private int reply_seq;
	private String reply_photo_origin;
	private String reply_photo_stored;
	
	public rPhotoDto() {
	}

	public rPhotoDto(int reply_photo_seq, int reply_seq, String reply_photo_origin, String reply_photo_stored) {
		super();
		this.reply_photo_seq = reply_photo_seq;
		this.reply_seq = reply_seq;
		this.reply_photo_origin = reply_photo_origin;
		this.reply_photo_stored = reply_photo_stored;
	}

	public int getReply_photo_seq() {
		return reply_photo_seq;
	}

	public void setReply_photo_seq(int reply_photo_seq) {
		this.reply_photo_seq = reply_photo_seq;
	}

	public int getReply_seq() {
		return reply_seq;
	}

	public void setReply_seq(int reply_seq) {
		this.reply_seq = reply_seq;
	}

	public String getReply_photo_origin() {
		return reply_photo_origin;
	}

	public void setReply_photo_origin(String reply_photo_origin) {
		this.reply_photo_origin = reply_photo_origin;
	}

	public String getReply_photo_stored() {
		return reply_photo_stored;
	}

	public void setReply_photo_stored(String reply_photo_stored) {
		this.reply_photo_stored = reply_photo_stored;
	}

	@Override
	public String toString() {
		return "rPhotoDto [reply_photo_seq=" + reply_photo_seq + ", reply_seq=" + reply_seq + ", reply_photo_origin="
				+ reply_photo_origin + ", reply_photo_stored=" + reply_photo_stored + "]";
	}
	
	
}
