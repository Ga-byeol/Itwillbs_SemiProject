package com.reservation.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ReservationDAO {
	
	private Connection con = null;
	private String sql = "";
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private Connection getConnect() {
		try {
			Context initCTX = new InitialContext();
			DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/Mysql");
			con = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public void insertReservation(String uid, String carNum, String stime, int time, String userId) {
		try {
			con = getConnect();
			sql = "insert into reservation(res_num, res_car_num, res_stime, res_time, user_num) "
				+ "values(?, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, uid);
			pstmt.setString(2, carNum);
			pstmt.setString(3, stime.split(" ~ ")[0]);
			pstmt.setInt(4, time);
			pstmt.setString(5, userId);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	
	private void closeDB() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
