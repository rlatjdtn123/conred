package com.hk.conred.dtos;

public class InterestsDto {

	private int interests_seq;
	private String user_id;
	private int category_seq;
	
	public InterestsDto() {
	}

	public InterestsDto(int interests_seq, String user_id, int category_seq) {
		super();
		this.interests_seq = interests_seq;
		this.user_id = user_id;
		this.category_seq = category_seq;
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

	public int getCategory_seq() {
		return category_seq;
	}

	public void setCategory_seq(int category_seq) {
		this.category_seq = category_seq;
	}

	@Override
	public String toString() {
		return "interestsDto [interests_seq=" + interests_seq + ", user_id=" + user_id + ", category_seq="
				+ category_seq + "]";
	}
	
	
}
