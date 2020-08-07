package com.WeBlogPortal.model;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

public class Blog {
	int blogid;
	String title;
    String content;
    Timestamp bdatetime;
    int id;
    String description;
    public Blog(int blogid, String title, String content, Timestamp bdatetime, int id, String description, Blob image,
			int cid) {
		super();
		this.blogid = blogid;
		this.title = title;
		this.content = content;
		this.bdatetime = bdatetime;
		this.id = id;
		this.description = description;
		this.image = image;
		this.cid = cid;
	}
	Blob image;
    int cid;
    public Blog() {
		super();
	}
	public int getBlogid() {
		return blogid;
	}
	public void setBlogid(int blogid) {
		this.blogid = blogid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getBdatetime() {
		return bdatetime;
	}
	public void setBdatetime(Timestamp bdatetime) {
		this.bdatetime = bdatetime;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Blob getImage() {
		return image;
	}
	public void setImage(Blob image) {
		this.image = image;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public Blog(String title, String content, Timestamp bdatetime, int id, String description, Blob image,
			int cid) {
		super();
		this.title = title;
		this.content = content;
		this.bdatetime = bdatetime;
		this.id = id;
		this.description = description;
		this.image = image;
		this.cid = cid;
	}
    
}