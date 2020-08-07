package com.WeBlogPortal.dao;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.WeBlogPortal.control.DBConnection;
import com.WeBlogPortal.model.Category;

public class CategoryDao {
	private Connection con;
	public CategoryDao(Connection con) {
		super();
		this.con = con;
	}
	
	
	  public ArrayList<Category> categoryList(){
    	  ArrayList<Category> list=new ArrayList<>();
    	  try{
    		 String query="select * from category"; 
    		 PreparedStatement ps=con.prepareStatement(query);
    		 ResultSet rs=ps.executeQuery();
    		 while(rs.next()){
    			 int cid=rs.getInt("cid");
    			 String cname=rs.getString("cname");
    			 String cdescription=rs.getString("cdescription");
    			 Blob pic=rs.getBlob("pic");
    			 int supercid=rs.getInt("supercid"); 
    			 Category c=new Category(cid,cname,cdescription,pic,supercid);
    			 list.add(c);
    		 }
    	  }catch(Exception e){
    		  e.printStackTrace();
    	  }
			return list;
	    	  
	      }
	  public Category getCatById(int cid){
		  Category c=null;
		  try{
		  String query="select * from category where cid=?"; 
 		 PreparedStatement ps=con.prepareStatement(query);
 		 ps.setInt(1, cid);
 		 ResultSet rs=ps.executeQuery();
 		 while(rs.next()){
 			 String cname=rs.getString("cname");
 			 String cdescription=rs.getString("cdescription");
 			 Blob pic=rs.getBlob("pic");
 			 int supercid=rs.getInt("supercid"); 
 			  c=new Category(cid,cname,cdescription,pic,supercid);
 		 }
 	  }catch(Exception e){
 		  e.printStackTrace();
 	  }
			return c;
	  }
	
      public boolean addCategory(Category category){
		return false;
      }
      public boolean editCategory(Category category){
		return false;
    	  
      }
      public Category specificCategory(){
		return null;
    	  
      }
      public boolean deleteCategory(){
		return false;
    	  
      }
      
      public static void main(String args[]){
    	  CategoryDao cdao=new CategoryDao(DBConnection.getConnection());
			ArrayList<Category> list=cdao.categoryList();
			System.out.println("hi");
			for(Category c:list)
			{
				System.out.println(c);
			}
      }
}


