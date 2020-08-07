
package com.WeBlogPortal.model;
import java.sql.*;
public class Blogger {
	int id;
	String username;
	String fullname;
	int mobile;
	public Blogger(int id, String username, String fullname, int mobile, String emailid, String password,
			String description, Blob profilepic, String profilestatus, String gender, Date regdate, Timestamp lastlogin,
			String address, String city, String state, String country) {
		super();
		this.id = id;
		this.username = username;
		this.fullname = fullname;
		this.mobile = mobile;
		this.emailid = emailid;
		this.password = password;
		this.description = description;
		this.profilepic = profilepic;
		this.profilestatus = profilestatus;
		this.gender = gender;
		this.regdate = regdate;
		this.lastlogin = lastlogin;
		Address = address;
		this.city = city;
		this.state = state;
		this.country = country;
	}

	String emailid;
	String password;
	String description;
	Blob profilepic;
	String profilestatus;
	public Blogger() {
		super();
	}

	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}

	String gender;
	Date regdate;
	Timestamp lastlogin;
    String Address;
    String city;
    String state;
    String country;
	public Blogger(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	


	public Blogger(String username, String fullname, String emailid, String password, String gender) {
		super();
		this.username = username;
		this.fullname = fullname;
		this.emailid = emailid;
		this.password = password;
		this.gender = gender;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname){
		this.fullname = fullname;
	}

	public int getMobile() {
		return mobile;
	}

	public void setMobile(int mobile) {
		this.mobile = mobile;
	}

	public String getEmailid() {
		return emailid;
	}

	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Blob getProfilepic() {
		return profilepic;
	}

	public void setProfilepic(Blob blob) {
		this.profilepic = blob;
	}

	public String getProfilestatus() {
		return profilestatus;
	}

	public void setProfilestatus(String profilestatus) {
		this.profilestatus = profilestatus;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Timestamp getLastlogin() {
		return lastlogin;
	}

	public void setLastlogin(Timestamp lastlogin) {
		this.lastlogin = lastlogin;
	}
}