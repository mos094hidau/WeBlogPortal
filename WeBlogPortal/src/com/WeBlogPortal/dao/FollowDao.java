package com.WeBlogPortal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class FollowDao {
	private Connection con;

	public FollowDao(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean followUser(int bloggerid,int followerid,String requeststatus){
		Boolean status=false;
		String query="insert into follow(id,followerid,requeststatus)values(?,?,?)";
		try{
			PreparedStatement ps=this.con.prepareStatement(query);
			ps.setInt(1, bloggerid);
			ps.setInt(2, followerid);
			ps.setString(3, requeststatus);
			if(ps.executeUpdate()!=0){
				status=true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return status;
	}
	
	public boolean UnFollowUser(int bloggerid,int followerid){
		Boolean status=false;
		String query="delete from follow where id=? and followerid=?";
		try{
			PreparedStatement ps=this.con.prepareStatement(query);
			ps.setInt(1, bloggerid);
			ps.setInt(2, followerid);
			if(ps.executeUpdate()!=0){
				status=true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return status;
	}
	
	public String getRequestStatus(int followerid,int bloggerid){
		String requeststatus=null;
		String query="select requeststatus from follow where id=? and followerid=?";
		try{
			PreparedStatement ps=this.con.prepareStatement(query);
			ps.setInt(1, bloggerid);
			ps.setInt(2, followerid);

			 ResultSet rs = ps.executeQuery();
		      if(rs.next()){
		    	  requeststatus=rs.getString("requeststatus");
		      }
		}catch(Exception e){
			e.printStackTrace();
		}
		return requeststatus;
	}
}
