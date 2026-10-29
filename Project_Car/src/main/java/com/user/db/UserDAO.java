package com.user.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {
	Connection con = null;
	PreparedStatement pstmt2 = null;
	PreparedStatement pstmt1 = null;
	ResultSet rs = null;
	
	// DB 연결
	public Connection getConnection() throws Exception {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/Mysql");
		con = ds.getConnection();
		return con;
	}
	
	// 자원 해제
	public void close() {
		if (rs != null) try { rs.close(); } catch (SQLException ex) {}
		if (pstmt2 != null) try { pstmt2.close(); } catch (SQLException ex) {}
		if (pstmt1 != null) try { pstmt1.close(); } catch (SQLException ex) {}
		if (con != null) try { con.close(); } catch (SQLException ex) {}
	}
	
	// 회원가입
	public void insertUser(UserDTO dto) {
		try {
			con = getConnection();
			String sql1 = "select max(user_num) from userinfo";
			pstmt1 = con.prepareStatement(sql1);
			rs = pstmt1.executeQuery();
			
			int num = 1; 
			if (rs.next()) {
				num = rs.getInt("max(user_num)") + 1;
			}
			
			String sql2 = "insert into userinfo(user_num, user_id, user_pass, user_name, user_hp, email, address, user_birth, license_num, license_type) values(?,?,?,?,?,?,?,?,?,?)";
			pstmt2 = con.prepareStatement(sql2);
			pstmt2.setInt(1, num);
			pstmt2.setString(2, dto.getUser_id());
			pstmt2.setString(3, dto.getUser_pass());
			pstmt2.setString(4, dto.getUser_name());
			pstmt2.setString(5, dto.getUser_hp());
			pstmt2.setString(6, dto.getEmail());
			pstmt2.setString(7, dto.getAddress());
			pstmt2.setString(8, dto.getUser_birth());
			pstmt2.setString(9, dto.getLicense_num());
			pstmt2.setString(10, dto.getLicense_type());
			pstmt2.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	// 로그인 체크
	public UserDTO UserCheck(String user_id, String user_pass) {
		UserDTO dto = null;
		try {
			con = getConnection();
			String sql = "select * from userinfo where user_id=? and user_pass=?";
			pstmt1 = con.prepareStatement(sql);
			pstmt1.setString(1, user_id);
			pstmt1.setString(2, user_pass);
			
			rs = pstmt1.executeQuery();
			
			if (rs.next()) {
				dto = new UserDTO();
				dto.setUser_num(rs.getInt("user_num"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_pass(rs.getString("user_pass"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setUser_hp(rs.getString("user_hp"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress(rs.getString("address"));
				dto.setUser_birth(rs.getString("user_birth"));
				dto.setLicense_num(rs.getString("license_num"));
				dto.setLicense_type(rs.getString("license_type"));
				dto.setUser_pt(rs.getInt("user_pt"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}
	
	// 회원 목록 조회
	public List<UserDTO> getUserList() {
		List<UserDTO> userList = new ArrayList<UserDTO>();
		try {
			con = getConnection();
			String sql = "select * from userinfo";
			pstmt1 = con.prepareStatement(sql);
			rs = pstmt1.executeQuery();
			
			while (rs.next()) {
				UserDTO dto = new UserDTO();
				dto.setUser_num(rs.getInt("user_num"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_pass(rs.getString("user_pass"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setUser_hp(rs.getString("user_hp"));
				dto.setUser_birth(rs.getString("user_birth"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress(rs.getString("address"));
				dto.setLicense_num(rs.getString("license_num"));
				dto.setLicense_type(rs.getString("license_type"));
				dto.setUser_pt(rs.getInt("user_pt"));
				userList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return userList;
	}
	
	// 아이디 중복 확인
	public boolean confirmId(String user_id) {
		boolean result = false;
		try {
			con = getConnection();
			String sql = "select * from userinfo where user_id=?";
			pstmt1 = con.prepareStatement(sql);
			pstmt1.setString(1, user_id);
			rs = pstmt1.executeQuery();
			
			if (rs.next()) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	// 아이디 찾기
	public String FindID(String user_name, String user_email) {
		try {
			con = getConnection();
			String sql = "select * from userinfo where user_name=? and email=?";
			pstmt1 = con.prepareStatement(sql);
			pstmt1.setString(1, user_name);
			pstmt1.setString(2, user_email);
			
			rs = pstmt1.executeQuery();
			if (rs.next()) {
				return rs.getString("user_id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return null;
	}
	
	// 비밀번호 찾기
	public String FindPass(String user_id, String user_email) {
		try {
			con = getConnection();
			String sql = "select * from userinfo where user_id=? and email=?";
			pstmt1 = con.prepareStatement(sql);
			pstmt1.setString(1, user_id);
			pstmt1.setString(2, user_email);
			
			rs = pstmt1.executeQuery();
			if (rs.next()) {
				return rs.getString("user_pass");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return null;
	}
}
