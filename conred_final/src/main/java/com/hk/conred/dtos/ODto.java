package com.hk.conred.dtos;

import java.util.Date;

public class ODto {
	private String owner_id;
	private String owner_password;
	private String owner_name;
	private String owner_email;
	private String owner_birth;
	private String owner_sex;
	private Date owner_regdate;
	private String owner_agreement;
	private String owner_out;
	public ODto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ODto(String owner_id, String owner_password, String owner_name, String owner_email, String owner_birth,
			String owner_sex, Date owner_regdate, String owner_agreement, String owner_out) {
		super();
		this.owner_id = owner_id;
		this.owner_password = owner_password;
		this.owner_name = owner_name;
		this.owner_email = owner_email;
		this.owner_birth = owner_birth;
		this.owner_sex = owner_sex;
		this.owner_regdate = owner_regdate;
		this.owner_agreement = owner_agreement;
		this.owner_out = owner_out;
	}
	public String getOwner_id() {
		return owner_id;
	}
	public void setOwner_id(String owner_id) {
		this.owner_id = owner_id;
	}
	public String getOwner_password() {
		return owner_password;
	}
	public void setOwner_password(String owner_password) {
		this.owner_password = owner_password;
	}
	public String getOwner_name() {
		return owner_name;
	}
	public void setOwner_name(String owner_name) {
		this.owner_name = owner_name;
	}
	public String getOwner_email() {
		return owner_email;
	}
	public void setOwner_email(String owner_email) {
		this.owner_email = owner_email;
	}
	public String getOwner_birth() {
		return owner_birth;
	}
	public void setOwner_birth(String owner_birth) {
		this.owner_birth = owner_birth;
	}
	public String getOwner_sex() {
		return owner_sex;
	}
	public void setOwner_sex(String owner_sex) {
		this.owner_sex = owner_sex;
	}
	public Date getOwner_regdate() {
		return owner_regdate;
	}
	public void setOwner_regdate(Date owner_regdate) {
		this.owner_regdate = owner_regdate;
	}
	public String getOwner_agreement() {
		return owner_agreement;
	}
	public void setOwner_agreement(String owner_agreement) {
		this.owner_agreement = owner_agreement;
	}
	public String getOwner_out() {
		return owner_out;
	}
	public void setOwner_out(String owner_out) {
		this.owner_out = owner_out;
	}
	@Override
	public String toString() {
		return "ODto [owner_id=" + owner_id + ", owner_password=" + owner_password + ", owner_name=" + owner_name
				+ ", owner_email=" + owner_email + ", owner_birth=" + owner_birth + ", owner_sex=" + owner_sex
				+ ", owner_regdate=" + owner_regdate + ", owner_agreement=" + owner_agreement + ", owner_out="
				+ owner_out + "]";
	}
	
	
}