package com.hk.conred.dtos;

public class InterestsDto {

	private int interests_seq;
	private String user_id;
	private int category_code;
	
	public InterestsDto() {
	}

	public InterestsDto(int interests_code, String user_id, int category_code) {
		super();
		this.interests_seq = interests_seq;
		this.user_id = user_id;
		this.category_code = category_code;
	}

	public int getInterests_seq() {
		return interests_seq;
	}

	public void setInterests_seq(int interests_seq) {
		this.interests_seq = interests_seq;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getCategory_code() {
		return category_code;
	}

	public void setCategory_code(int category_code) {
		this.category_code = category_code;
	}

	@Override
	public String toString() {
		return "interestsDto [interests_seq=" + interests_seq + ", user_id=" + user_id + ", category_code="
				+ category_code + "]";
	}
	
	
}
