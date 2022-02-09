package com.myspring.allCar.member.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("memberVO")
public class MemberVO {
	private String name;
	private String id;
	private String pwd;
	private String emailId;
	private String emailAddress;
	private String phoneNum;
	private String birth_y;
	private String birth_m;
	private String birth_d;
	private String gender;
	private String postcode;
	private String address;
	private String detailAddress;
	private String marketingOk;
	private String noticeKinds;
	private Date regdate;
	
	public MemberVO() {

	}
	
	public MemberVO(String name, String id, String pwd, String emailId, String emailAddress, String phoneNum,
			String birth_y, String birth_m, String birth_d, String gender, String postcode, String address,
			String detailAddress, String marketingOk, String noticeKinds) {
		super();
		this.name = name;
		this.id = id;
		this.pwd = pwd;
		this.emailId = emailId;
		this.emailAddress = emailAddress;
		this.phoneNum = phoneNum;
		this.birth_y = birth_y;
		this.birth_m = birth_m;
		this.birth_d = birth_d;
		this.gender = gender;
		this.postcode = postcode;
		this.address = address;
		this.detailAddress = detailAddress;
		this.marketingOk = marketingOk;
		this.noticeKinds = noticeKinds;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getBirth_y() {
		return birth_y;
	}

	public void setBirth_y(String birth_y) {
		this.birth_y = birth_y;
	}

	public String getBirth_m() {
		return birth_m;
	}

	public void setBirth_m(String birth_m) {
		this.birth_m = birth_m;
	}

	public String getBirth_d() {
		return birth_d;
	}

	public void setBirth_d(String birth_d) {
		this.birth_d = birth_d;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getMarketingOk() {
		return marketingOk;
	}

	public void setMarketingOk(String marketingOk) {
		this.marketingOk = marketingOk;
	}

	public String getNoticeKinds() {
		return noticeKinds;
	}

	public void setNoticeKinds(String noticeKinds) {
		this.noticeKinds = noticeKinds;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
	
}
