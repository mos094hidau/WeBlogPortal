package com.WeBlogPortal.model;

public class Follow {
 int fid;
 int id;
 int followerid;
 String requeststatus;
public int getFid() {
	return fid;
}
public void setFid(int fid) {
	this.fid = fid;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getFollowerid() {
	return followerid;
}
public void setFollowerid(int followerid) {
	this.followerid = followerid;
}
public Follow(int fid, int id, int followerid,String requeststatus) {
	super();
	this.fid = fid;
	this.id = id;
	this.followerid = followerid;
	this.requeststatus=requeststatus;
}
public Follow() {
	super();
}
 
}
