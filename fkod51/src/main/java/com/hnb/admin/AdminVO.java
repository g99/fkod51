package com.hnb.admin;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component

public class AdminVO implements Serializable {
	private static final long serialVersionUID = 1L;
	private String id;
	private String password;
	private String name;
	private String birth;
	private String gender;
	private String phone;
	private String addr;
	private String email;
	private String regdate;
	
	private static AdminVO instance = new AdminVO();
	public static AdminVO getInstnace(){
		return instance;
	}

	public AdminVO() {
	}
	public AdminVO(String id,String password,String name,String birth,String addr,String gender,
			String email,String phone,String regdate) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.birth = birth;
		this.addr = addr;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.regdate = regdate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getId() {
		return id;
	}
	public String getPassword() {
		return password;
	}
	public String getName() {
		return name;
	}
	public String getBirth() {
		return birth;
	}
	public String getGender() {
		return gender;
	}
	public String getPhone() {
		return phone;
	}
	public String getAddr() {
		return addr;
	}
	public String getEmail() {
		return email;
	}
	public String getRegdate() {
		return regdate;
	}
	public static AdminVO getInstance() {
		return instance;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public static void setInstance(AdminVO instance) {
		AdminVO.instance = instance;
	}
	@Override
	public String toString() {
		return "AdminVO [아이디=" + id 
				    + ", 비밀번호=" + password 
				    + ", 이름=" + name 
				    + ", 생년=" + birth 
				    + ", 성별=" + gender 
				    + ", 전화번호=" + phone 
				    + ", 주소=" + addr 
				    + ", 이메일=" + email 
				    + ", 등록일=" + regdate + "]";
	}
	

}

