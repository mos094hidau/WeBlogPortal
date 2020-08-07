package com.WeBlogPortal.model;

import java.sql.Blob;

public class Category {
   int cid;
String cname;
String cdescription;
   Blob pic;
   public Category(int cid, String cname, String cdescription, Blob pic, int supercid) {
	super();
	this.cid = cid;
	this.cname = cname;
	this.cdescription = cdescription;
	this.pic = pic;
	this.supercid = supercid;
}
public Category() {
	super();
}
public Category(String cname) {
	super();
	this.cname = cname;
}
int supercid;
public int getCid() {
	return cid;
}
public void setCid(int cid) {
	this.cid = cid;
}
public String getCname() {
	return cname;
}
public void setCname(String cname) {
	this.cname = cname;
}
public String getCdescription() {
	return cdescription;
}
public void setCdescription(String cdescription) {
	this.cdescription = cdescription;
}
public Blob getPic() {
	return pic;
}
public void setPic(Blob pic) {
	this.pic = pic;
}
public int getSupercid() {
	return supercid;
}
public void setSupercid(int supercid) {
	this.supercid = supercid;
}
   
   
}
