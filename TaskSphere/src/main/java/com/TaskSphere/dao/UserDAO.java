package com.TaskSphere.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.TaskSphere.model.User;
import com.TaskSphere.utility.DBConnection;

public class UserDAO{
	Connection con = null;
	String status = "fail";
	DBConnection db = new DBConnection();
	
	public String registerUser(User user) {
		try {
			con = db.getConnection();
			PreparedStatement ps = con.prepareStatement("insert into users(name, email, password) values(?,?,?)");
			
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			
			int n = ps.executeUpdate();
			if(n > 0) {
				status = "success";
			}
			
		}catch(Exception e){
			System.out.println(e);
		}
		return status;
	}
	
	public String loginUser(User user) {
		try {
			con = db.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from users where email=? and password=?");
			
			ps.setString(1, user.getEmail());
			ps.setString(2, user.getPassword());
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				status = "success";
			}
			
		}catch(Exception e){
			System.out.println(e);
		}
		return status;
	}
}

