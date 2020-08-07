package com.WeBlogPortal.dao;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.WeBlogPortal.model.Blog;
import com.WeBlogPortal.model.Blogger;
public class BloggerDao{
	private Connection con;

	public BloggerDao(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean register(Blogger blogger){
		boolean status=false;
		try{
			String query="insert into Blogger(Fullname,Username,Emailid,Password,gender)values(?,?,?,?,?)";
			PreparedStatement ps=this.con.prepareStatement(query);
			ps.setString(1, blogger.getFullname());
			ps.setString(2, blogger.getUsername());
			ps.setString(3, blogger.getEmailid());
			ps.setString(4, blogger.getPassword());
			ps.setString(5, blogger.getGender());
			if(ps.executeUpdate()!=0){
				status=true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return status;	
	}
	public boolean editprofile(Blogger blogger){
		boolean status=false;
		try{
			String query="Update Blogger set Username = ?,Emailid=?,Mobile=?,Address=?,city=?,state=?,country=?,profilestatus=?,description=? where id= ?";
			PreparedStatement ps=this.con.prepareStatement(query);
			ps.setString(1, blogger.getUsername());
			ps.setString(2, blogger.getEmailid());
			ps.setInt(3, blogger.getMobile());
			ps.setString(4, blogger.getAddress());
			ps.setString(5, blogger.getCity());
			ps.setString(6, blogger.getState());
			ps.setString(7, blogger.getCountry());
			ps.setString(8, blogger.getProfilestatus());
			ps.setString(9, blogger.getDescription());
			ps.setInt(10, blogger.getId());
			if(ps.executeUpdate()!=0){
				status=true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return status;	
	}
	public Blob fetchProfilePic(int id){
		Blob blob=null;
		try{
			String query="select profilepic from Blogger where id=?";
			PreparedStatement ps=this.con.prepareStatement(query);
			ps.setInt(1, id);
			
			 ResultSet rs = ps.executeQuery();
		      if(rs.next()){
		    	  blob=rs.getBlob("profilepic");
		      }
		      
		}catch(Exception e){
			e.printStackTrace();
		}
		return blob;
	}
	
	public boolean authenticate(String Username,String Password){
		Boolean status=false;
		try{
			String query="select * from Blogger where Username = ? and Password = ?";
			PreparedStatement ps=this.con.prepareStatement(query);
			ps.setString(1, Username);
			ps.setString(2, Password);
			 ResultSet rs = ps.executeQuery();
		      if(rs.next()){
		      status=true;
		      }  
		}catch(Exception e){
			e.printStackTrace();
		}
		return status;	
	}
	public Blogger fetchData(String Username,String Password){
		Blogger blogger=null;
		try{
			String query="select * from Blogger where Username = ? and Password = ?";
			PreparedStatement ps=this.con.prepareStatement(query);
			ps.setString(1, Username);
			ps.setString(2, Password);
			 ResultSet rs = ps.executeQuery();
		      if(rs.next()){
		      blogger=new Blogger();
		      }
		      blogger.setId(rs.getInt("id"));
		      blogger.setUsername(rs.getString("Username"));
		      blogger.setFullname(rs.getString("Fullname"));
		      blogger.setEmailid(rs.getString("Emailid"));
		      blogger.setPassword(rs.getString("Password"));
		      blogger.setDescription(rs.getString("description"));
		      blogger.setMobile(rs.getInt("Mobile"));
		      blogger.setGender(rs.getString("Gender"));
		      blogger.setProfilepic(rs.getBlob("Profilepic"));
		      blogger.setProfilestatus(rs.getString("Profilestatus"));
		      blogger.setRegdate(rs.getDate("Regdate"));
		      blogger.setLastlogin(rs.getTimestamp("Lastlogin"));
		      blogger.setAddress(rs.getString("Address"));
		      blogger.setCity(rs.getString("city"));
		      blogger.setState(rs.getString("state"));
		      blogger.setCountry(rs.getString("country"));
		      
		}catch(Exception e){
			e.printStackTrace();
		}
		return blogger;	
	}
	public boolean updateUsernamePassword(Blogger blogger){
		boolean status=false;
		try{
			String query="Update Blogger set Username = ?,Password=? where Emailid= ?";
			PreparedStatement ps=this.con.prepareStatement(query);
			ps.setString(1, blogger.getUsername());
			ps.setString(2, blogger.getPassword());
			ps.setString(3, blogger.getEmailid());
			if(ps.executeUpdate()!=0){
				status=true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return status;	
	}
	public  Boolean Authenticateemail(String emailid) {
        Boolean status=false;
        try {
            String query = "select * from Blogger where Emailid=?";
            PreparedStatement ps=this.con.prepareStatement(query);
            ps.setString(1, emailid);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
       		    status=true;
       		      }            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return status;
    }
	public boolean updateLastLogin(Blogger blogger){
		boolean status=false;
		try{
			String query="Update Blogger set LastLogin=? where Username=? and Password=?";
			PreparedStatement ps=this.con.prepareStatement(query);
			Date date=new Date();
			long time=date.getTime();
			Timestamp ts=new Timestamp(time);
			System.out.println("Current Time stamp:"+ts);
		    ps.setTimestamp(1, ts);;
			ps.setString(2, blogger.getUsername());
			ps.setString(3, blogger.getPassword());
			if(ps.executeUpdate()!=0){
				status=true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return status;	
	}
	public boolean updateprofilepic(int id,InputStream inputstream){
		boolean status=false;
		try{
			String query="Update Blogger set profilepic=? where id=? ";
			PreparedStatement ps=this.con.prepareStatement(query);
			System.out.println(inputstream);
		    ps.setBlob(1, inputstream);;
			ps.setInt(2, id);
			if(ps.executeUpdate()!=0){
				status=true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return status;	
	}
	public boolean changePassword(int id,String newpassword){
		boolean status=false;
		try{
			String query="Update Blogger set password=? where id=? ";
			PreparedStatement ps=this.con.prepareStatement(query);
		    ps.setString(1, newpassword);;
			ps.setInt(2, id);
			if(ps.executeUpdate()!=0){
				status=true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return status;	
	}
	public boolean deleteProfilePic(int id){
		boolean status=false;
		try{
			String query="Update Blogger set profilepic=NULL where id=? ";
			PreparedStatement ps=this.con.prepareStatement(query);
			ps.setInt(1, id);
			if(ps.executeUpdate()!=0){
				status=true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return status;	
	}
	public boolean deleteAccount(int id,String emailid){
		boolean status=false;
		try{
			String query="delete from blogger where id=? and emailid=? ";
			PreparedStatement ps=this.con.prepareStatement(query);
			ps.setInt(1, id);
			ps.setString(2, emailid);
			if(ps.executeUpdate()!=0){
				status=true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return status;	
	}
	public Blogger getBloggerbyid(int id){
		Blogger blogger=null;
		try{
			String query="select * from Blogger where id=?";
			PreparedStatement ps=this.con.prepareStatement(query);
			ps.setInt(1, id);
			 ResultSet rs = ps.executeQuery();
		      if(rs.next()){
		      blogger=new Blogger();
		      }
		      blogger.setId(rs.getInt("id"));
		      blogger.setUsername(rs.getString("Username"));
		      blogger.setFullname(rs.getString("Fullname"));
		      blogger.setEmailid(rs.getString("Emailid"));
		      blogger.setPassword(rs.getString("Password"));
		      blogger.setDescription(rs.getString("description"));
		      blogger.setMobile(rs.getInt("Mobile"));
		      blogger.setGender(rs.getString("Gender"));
		      blogger.setProfilepic(rs.getBlob("Profilepic"));
		      blogger.setProfilestatus(rs.getString("Profilestatus"));
		      blogger.setRegdate(rs.getDate("Regdate"));
		      blogger.setLastlogin(rs.getTimestamp("Lastlogin"));
		      blogger.setAddress(rs.getString("Address"));
		      blogger.setCity(rs.getString("city"));
		      blogger.setState(rs.getString("state"));
		      blogger.setCountry(rs.getString("country"));
		      
		}catch(Exception e){
			e.printStackTrace();
		}
		return blogger;	
	}
	public ArrayList<Blogger> getAllUsers(){
		ArrayList<Blogger> list=new ArrayList<>();
		try{
			String query="select * from blogger";
			PreparedStatement ps=this.con.prepareStatement(query);
			 ResultSet rs=ps.executeQuery();
			 while(rs.next()){
				  int id=rs.getInt("id");
			      String Username=rs.getString("Username");
			      String fullname=rs.getString("Fullname");
			    String emailid= rs.getString("Emailid");
			     String password= rs.getString("Password");
			    String description= rs.getString("description");
			    int mobile=  rs.getInt("Mobile");
			     String gender= rs.getString("Gender");
			     Blob b= rs.getBlob("Profilepic");
			    String status= rs.getString("Profilestatus");
			      Date regdate=rs.getDate("Regdate");
			      Timestamp ts=rs.getTimestamp("Lastlogin");
			   String address= rs.getString("Address");
			    String city= rs.getString("city");
			    String state= rs.getString("state");
			      String country=rs.getString("country");
				    Blogger user=new Blogger(id,Username,fullname,mobile,emailid,password,description,b,status,gender,(java.sql.Date) regdate,ts,address,city,state,country);
				    list.add(user);
			 }
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}

	public String getProfilestatus(int bid) {
		// TODO Auto-generated method stub
		String status=null;
		try{
			String query="select Profilestatus from Blogger where id=?";
			PreparedStatement ps=this.con.prepareStatement(query);
			ps.setInt(1, bid);
			
			 ResultSet rs = ps.executeQuery();
		      if(rs.next()){
		    	  status=rs.getString("Profilestatus");
		      }
		      
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return status;
	}
}