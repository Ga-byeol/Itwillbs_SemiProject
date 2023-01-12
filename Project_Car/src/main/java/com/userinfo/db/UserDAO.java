package com.userinfo.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public Connection getConnection() throws Exception {
		
		
		Context init = new InitialContext();
		
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		
		con=ds.getConnection();
		return con;
	}
	
	public void close() {
		if(rs != null) try{rs.close();}catch(SQLException ex) {}
		if(pstmt != null) try{pstmt.close();}catch(SQLException ex) {}
		if(con != null) try{con.close();}catch(SQLException ex) {}
		
	}
	
	// insertFirst(BoardDTO dto)
	public void insertUserinfo(UserDTO dto) {
		System.out.println("UserDTO : " + dto);
		try {
			con=getConnection();
			
			String sql="insert into userinfo(user_id,user_pass,user_name) values(?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
			
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getUser_pass());
			pstmt.setString(3, dto.getUser_name());
			pstmt.setString(4, dto.getUser_hp());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getAddress());
			pstmt.setInt(7, dto.getUser_pt());
			pstmt.setString(8, dto.getLicense_num());
			pstmt.setString(9, dto.getLicense_type());
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		return;
	}
	
	 public UserDTO UserCheck(String user_id, String user_pass) {
         UserDTO dto = null;
         try {
            con = getConnection();
            String sql="select * from userinfo where user_id=? and user_pass=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, user_id);
            pstmt.setString(2, user_pass);
            ResultSet rs = pstmt.executeQuery();
            
            if(rs.next()){
               dto = new UserDTO();
               dto.setUser_id(rs.getString("user_id"));
               dto.setUser_pass(rs.getString("user_pass"));
            }else{
               
            }
         } catch (Exception e) {
            e.printStackTrace();
         }finally {
            
         }
         return dto;
      }
	public UserDTO getUserinfo(String user_id) {
		UserDTO dto = null;
		
		try {
			con = getConnection();
			String sql="select * from userinfo where user_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
//			pstmt.setString(2, dto.getUser_pass());
//			pstmt.setString(3, dto.getUser_name());
//			pstmt.setString(4, dto.getUser_hp());
//			pstmt.setString(5, dto.getEmail());
//			pstmt.setString(6, dto.getAddress());
//			pstmt.setInt(7, dto.getUser_pt());
//			pstmt.setString(8, dto.getLicense_num());
//			pstmt.setString(9, dto.getLicense_type());
			
			
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto = new UserDTO();
				
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_pass(rs.getString("user_pass"));
				dto.setUser_name(rs.getString("user_name"));
				
			}else {
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		
		}finally {
			
		}
		System.out.println(dto);
		return dto;
	}
	
	public void updateUserinfo(UserDTO dto) {
		System.out.println("FirstDAO updateFirst");
		System.out.println("dto " + dto);
		
		try {
			con = getConnection();
			String sql = "update userinfo set user_name=? ,user_pass=? ,user_hp=?, email=?, address=?,license_num=?, license_type=?   where user_id =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getUser_name());
			pstmt.setString(2, dto.getUser_pass());
			pstmt.setString(3, dto.getUser_hp());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getAddress());
			pstmt.setString(6, dto.getLicense_num());
			pstmt.setString(7, dto.getLicense_type());
			pstmt.setString(8, dto.getUser_id());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		return;
		
	}
	
	public void deleteUserinfo(UserDTO dto) {
		
		try {
			con = getConnection();
			
			String sql="delete from userinfo where user_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, dto.getUser_id());
//			pstmt.setString(2, dto.getUser_pass());
//			pstmt.setString(3, dto.getUser_name());
//			pstmt.setString(4, dto.getUser_hp());
//			pstmt.setString(5, dto.getEmail());
//			pstmt.setString(6, dto.getAddress());
//			pstmt.setInt(7, dto.getUser_pt());
//			pstmt.setString(8, dto.getLicense_num());
//			pstmt.setString(9, dto.getLicense_type());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		return;
	}

}
