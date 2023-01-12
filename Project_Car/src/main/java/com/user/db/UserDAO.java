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
		
		// DB�뿰寃�
		public Connection getConnection() throws Exception {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/Mysql");
			con = ds.getConnection();
			return con;
		}
		
		// 湲곗뼲�옣�냼�빐�젣
		public void close() {
			if(rs!=null) try{rs.close();} catch(SQLException ex) {}
			if(pstmt2!=null) try{pstmt2.close();}catch(SQLException ex) {}
			if(pstmt1!=null) try{pstmt1.close();}catch(SQLException ex) {}
			if(con!=null) try{con.close();}catch(SQLException ex) {}
		}
		
		
		// insert
		public void insertUser(UserDTO dto) {
			try {
				con = getConnection();
				String sql1 = "select max(user_num) from userinfo";
				pstmt1 = con.prepareStatement(sql1);
				rs = pstmt1.executeQuery();
				
				//�쉶�썝踰덊샇�뒗 媛��엯�븷�븣留덈떎 1�뵫 而ㅼ쭚. 
				int num = 0; 
				if(rs.next()) {
					System.out.println(rs.getInt("max(user_num)"));
					num = rs.getInt("max(user_num)") + 1;
					System.out.println(num);
				}
				
				System.out.println(dto);
				System.out.println("���옣�맂 user_num : " + dto.getUser_num());
				
				String sql2="insert into userinfo(user_num, user_id , user_pass , user_name, user_hp, email, address, user_birth, license_num, license_type) values(?,?,?,?,?,?,?,?,?,?)";
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
			}finally {
				
			}
			return;
		}
		
		public UserDTO UserCheck(String user_id, String user_pass) {
			// �꽌踰꾩뿉�꽌 �엯�젰諛쏆� user_id�� user_pass媛믪쓣 usercheck()�뿉 諛쏆쓬.
			// �씠嫄� 荑쇰━�뿉 �꽔�뼱�꽌 where�젅 議곌굔�� �씪移섑븯�뒗 �쑀���젙蹂대�� 媛�吏�怨좎샂.
			// 媛�吏�怨� �삩 �쑀���젙蹂대�� rs�뿉 ���옣�븿. -> dto�뿉 ���옣�븿.
			UserDTO dto = null;
			
			try {
				con = getConnection();
				String sql="select * from userinfo where user_id=? and user_pass=?";
				pstmt1 = con.prepareStatement(sql);
				pstmt1.setString(1, user_id);
				pstmt1.setString(2, user_pass);
				
				rs = pstmt1.executeQuery();
				
				if(rs.next()){
					dto = new UserDTO();
					//�뵒鍮꾩뿉�꽌 媛��졇�삩 �뜲�씠�꽣媛믪쓣 dto�뿉 �떞�븘以�.
					dto.setUser_id(rs.getString("user_id"));
					dto.setUser_pass(rs.getString("user_pass"));
					dto.setUser_name(rs.getString("user_name"));
					dto.setUser_hp(rs.getString("user_hp"));
					dto.setEmail(rs.getString("email"));
					dto.setAddress(rs.getString("address"));
					dto.setLicense_num(rs.getString("license_num"));
					dto.setLicense_type(rs.getString("license_type"));
					dto.setUser_pt(rs.getInt("user_pt"));
					
					System.out.println("여기서 확인: " + dto.getUser_name());
				}else{
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				
			}
			return dto;
		}
		
		public List<UserDTO> getUserList() {
			List<UserDTO> userList = new ArrayList<UserDTO>();
			try {
				con = getConnection();
				String sql="select * from userinfo";
				pstmt1 = con.prepareStatement(sql);
				rs = pstmt1.executeQuery();
				
				//荑쇰━ �떎�뻾 寃곌낵媛� �븳以꾩뵫 dto�뿉 �떞湲곌쾶�맖.
				while(rs.next()){
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
			}finally {
			}
			return userList;
		} public boolean confirmId(String user_id) {
			boolean result = false;
			try {
				con = getConnection();
				String sql="select * from userinfo where user_id=?";
				pstmt1 = con.prepareStatement(sql);
				pstmt1.setString(1, user_id);
				rs = pstmt1.executeQuery();
				
				if(rs.next()) {
					result = true;
					System.out.println(result);
				} else {
					result = false;
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
			}
			return result;
			
		}
		
		public String FindID(String user_name, String user_email) {
			try {
				con = getConnection();
				String sql="select * from userinfo where user_name=? and email=?";
				pstmt1 = con.prepareStatement(sql);
				pstmt1.setString(1, user_name);
				pstmt1.setString(2, user_email);
				
				rs = pstmt1.executeQuery();
				
				
				while(rs.next()){
					
					return rs.getNString("user_id");
					
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				
			}
		
			return null;
		}
		
		public String FindPass(String user_id, String user_email) {
			try {
				con = getConnection();
				String sql="select * from userinfo where user_id=? and email=?";
				pstmt1 = con.prepareStatement(sql);
				pstmt1.setString(1, user_id);
				pstmt1.setString(2, user_email);
				
				rs = pstmt1.executeQuery();
				
				
				while(rs.next()){
					
					return rs.getNString("user_pass");
					
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				
			}
		
			return null;
		}

		
}

