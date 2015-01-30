package com.gem.weitu.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.gem.weitu.conn.DBConn;

public class UserOpBean {

	public static boolean UpdateUserInfo(User user, HttpServletRequest request) {

		// 具体更新的业务逻辑
		Connection conn = DBConn.getConnection(request);
		try {
			PreparedStatement pstmt = conn
					.prepareStatement("UPDATE t_user_register SET user_name=?,user_phone=?,user_email=?,user_password=?,user_gender=?,user_address=?,user_sign=?,user_avatar=?,user_medal=? WHERE user_id=?");
			pstmt.setString(1, user.getUser_name());
			pstmt.setString(2, user.getUser_phone());
			pstmt.setString(3, user.getUser_email());
			pstmt.setString(4, user.getUser_password());
			pstmt.setString(5, user.getUser_gender());
			pstmt.setString(6, user.getUser_address());
			pstmt.setString(7, user.getUser_sign());
			pstmt.setString(8, user.getUser_avatar());
			pstmt.setInt(9, user.getUser_medal());
			pstmt.setString(10, user.getUser_id());

			// 执行更新,value中会保存执行后影响的行数
			int value = pstmt.executeUpdate();
			if (value != 0) {
				return true;
			} else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public static boolean DeleteUserInfo(HttpServletRequest request) {
		// String XH=request.getParameter("XH");

		String[] userIds = request.getParameterValues("UserId");
		String userNums = "";
		for (String userId : userIds) {
			userNums += "'" + userId + "',";
		}

		userNums = userNums.substring(0, userNums.length() - 1);

		System.out.println(userNums);

		Connection conn = DBConn.getConnection(request);
		try {
			String sqlstr = "DELETE FROM t_user_register WHERE user_id IN ("
					+ userNums + ")";
			PreparedStatement pstmt = conn.prepareStatement(sqlstr);
			int value = pstmt.executeUpdate();
			System.out.println(value);
			if (value != 0) {
				return true;
			} else {
				return false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;

	}

	// 通过学生ID查询对应的学生信息，用户回显
	public ArrayList<User> findUser(String userId, HttpServletRequest request) {
		ArrayList<User> al = new ArrayList<User>();
		try {
			Connection conn = DBConn.getConnection(request);
			PreparedStatement pstmt = conn
					.prepareStatement("select * from t_user_register where user_id=?");
			pstmt.setString(1, userId);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setUser_id(rs.getString(1));
				user.setUser_name(rs.getString(2));
				user.setUser_phone(rs.getString(3));
				user.setUser_email(rs.getString(4));
				user.setUser_password(rs.getString(5));
				user.setUser_gender(rs.getString(6));
				user.setUser_address(rs.getString(7));
				user.setUser_sign(rs.getString(8));
				user.setUser_avatar(rs.getString(9));
				user.setUser_medal(rs.getInt(10));
				al.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

	public static boolean AddUser(User user, HttpServletRequest request) {
		// 具体插入的业务逻辑
		Connection conn = DBConn.getConnection(request);
		try {
			PreparedStatement pstmt = conn
					.prepareStatement("INSERT INTO t_user_register VALUES(?,?,?,?,?,?,?,?,?,?);");
			pstmt.setString(1, user.getUser_id());
			pstmt.setString(2, user.getUser_name());
			pstmt.setString(3, user.getUser_phone());
			pstmt.setString(4, user.getUser_email());
			pstmt.setString(5, user.getUser_password());
			pstmt.setString(6, user.getUser_gender());
			pstmt.setString(7, user.getUser_address());
			pstmt.setString(8, user.getUser_sign());
			pstmt.setString(9, user.getUser_avatar());
			pstmt.setInt(10, user.getUser_medal());

			// 执行更新,value中会保存执行后影响的行数
			int value = pstmt.executeUpdate();
			if (value != 0) {
				return true;
			} else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	//验证用户登陆
	public static boolean checkUser(String u, String p,HttpServletRequest request) {
		boolean b = false;
		try {
			
			Connection conn = DBConn.getConnection(request);
			PreparedStatement pstmt = conn.prepareStatement("select * from system_users where username = ? and password = ? ");
			pstmt.setString(1, u);
			pstmt.setString(2, p);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				b = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return b;
	}

}
