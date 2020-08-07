package com.WeBlogPortal.dao;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.WeBlogPortal.model.Blog;

public class BlogDao {
   
	private Connection con;

	public BlogDao(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean createBlog(String title,String content,Timestamp ts,int id,String links,InputStream inputstreamimage,int cid){
		boolean status=false;
		try{
			String query="insert into blog(title,content,id,description,image,cid,bdatetime)values(?,?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,title);
			ps.setString(2, content);
			ps.setInt(3,id);
			ps.setString(4, links);
			ps.setBlob(5, inputstreamimage);
			ps.setInt(6, cid);
			ps.setTimestamp(7,ts);
			if(ps.executeUpdate()!=0){
				status=true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return status;
		
	}
	
	public List<Blog> getAllBlogs(){
		List<Blog> list=new ArrayList<>();
		try{
			String query="select * from blog order by bdatetime ASC";
			PreparedStatement ps=this.con.prepareStatement(query);
			 ResultSet rs=ps.executeQuery();
			 while(rs.next()){
				    int blogid=rs.getInt("blogid");
					String title=rs.getString("title");
				    String content=rs.getString("content");
				    Timestamp bdatetime=rs.getTimestamp("bdatetime");
				    int id=rs.getInt("id");
				    String description=rs.getString("description");
				    Blob image=rs.getBlob("image");
				    int cid=rs.getInt("cid");
				    Blog blog=new Blog(blogid,title,content,bdatetime,id,description,image,cid);
				    list.add(blog);
			 }
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}
	public List<Blog> getBlogsbycid(int cid){
		List<Blog> list=new ArrayList<>();
		
		try{
			String query="select * from blog where cid=? order by bdatetime ASC";
			PreparedStatement ps=this.con.prepareStatement(query);
			ps.setInt(1, cid);
			 ResultSet rs=ps.executeQuery();
			 while(rs.next()){
				    int blogid=rs.getInt("blogid");
					String title=rs.getString("title");
				    String content=rs.getString("content");
				    Timestamp bdatetime=rs.getTimestamp("bdatetime");
				    int id=rs.getInt("id");
				    String description=rs.getString("description");
				    Blob image=rs.getBlob("image");
				    Blog blog=new Blog(blogid,title,content,bdatetime,id,description,image,cid);
				    list.add(blog);
			 }
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}

	public List<Blog> getBlogsbyUserid(int bloggerid){
		List<Blog> list=new ArrayList<>();
		
		try{
			String query="select * from blog where id=? order by blogid ASC";
			PreparedStatement ps=this.con.prepareStatement(query);
			ps.setInt(1, bloggerid);
			 ResultSet rs=ps.executeQuery();
			 while(rs.next()){
				    int blogid=rs.getInt("blogid");
					String title=rs.getString("title");
				    String content=rs.getString("content");
				    Timestamp bdatetime=rs.getTimestamp("bdatetime");
				    int cid=rs.getInt("cid");
				    String description=rs.getString("description");
				    Blob image=rs.getBlob("image");
				    Blog blog=new Blog(blogid,title,content,bdatetime,bloggerid,description,image,cid);
				    list.add(blog);
			 }
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}

	public Blob getBlogImage(int blogid) {
		Blob image=null;
		String query="select image from blog where blogid=?";
		try {
			PreparedStatement ps=this.con.prepareStatement(query);
			ps.setInt(1, blogid);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				image=rs.getBlob("image");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return image;
	}
	public Blog getBlogbyBlogId(int blogid){
		Blog blog=null;
		String query="select * from blog where blogid=?";
		try{
			PreparedStatement ps=this.con.prepareStatement(query);
			ps.setInt(1, blogid);
			 ResultSet rs=ps.executeQuery();
			 while(rs.next()){
					String title=rs.getString("title");
				    String content=rs.getString("content");
				    Timestamp bdatetime=rs.getTimestamp("bdatetime");
				    int id=rs.getInt("id");
				    String description=rs.getString("description");
				    Blob image=rs.getBlob("image");
				    int cid=rs.getInt("cid");
				   blog=new Blog(blogid,title,content,bdatetime,id,description,image,cid);
			 }
		}catch(Exception e){
			e.printStackTrace();
		}
		return blog;
	}
	
	public int blogCountbyUserId(int id){
		int count=0;
		String query="select * from blog where id=?";
		try{
			PreparedStatement ps=this.con.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				count++;
			}	
		}catch(Exception e){
			e.printStackTrace();
		}
		return count;
	}
	
}
