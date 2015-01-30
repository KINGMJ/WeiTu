package com.gem.weitu.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.gem.weitu.conn.DBConn;

public class AttentionOpBean {

	public static boolean UpdateUserInfo(Attention attention, HttpServletRequest request) {

		// 具体更新的业务逻辑
		Connection conn = DBConn.getConnection(request);
		try {
			PreparedStatement pstmt = conn
					.prepareStatement("UPDATE t_user_attention SET user_id=?,att_id=?,att_group=? WHERE attention_id=?");
			pstmt.setString(1, attention.getUser_id());
			pstmt.setString(2, attention.getAtt_id());
			pstmt.setInt(3, attention.getAtt_group());
			pstmt.setString(4, attention.getAttention_id());
			

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

	public static boolean DeleteAttentionInfo(HttpServletRequest request) {
		// String XH=request.getParameter("XH");

		String[] attentionIds = request.getParameterValues("AttentionId");
		String attentionNums = "";
		for (String attentionId : attentionIds) {
			attentionNums += "'" + attentionId + "',";
		}

		attentionNums = attentionNums.substring(0, attentionNums.length() - 1);

		System.out.println(attentionNums);

		Connection conn = DBConn.getConnection(request);
		try {
			String sqlstr = "DELETE FROM t_user_attention WHERE attention_id IN ("
					+ attentionNums + ")";
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
	public ArrayList<Attention> findAttention(String attentionId, HttpServletRequest request) {
		ArrayList<Attention> al = new ArrayList<Attention>();
		try {
			Connection conn = DBConn.getConnection(request);
			PreparedStatement pstmt = conn
					.prepareStatement("select * from t_user_attention where attention_id=?");
			pstmt.setString(1, attentionId);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Attention attention=new Attention();
				attention.setAttention_id(rs.getString(1));
				attention.setUser_id(rs.getString(2));
				attention.setAtt_id(rs.getString(3));
				attention.setAtt_group(rs.getInt(4));
				
				al.add(attention);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

	public static boolean AddAttention(Attention attention, HttpServletRequest request) {
		// 具体插入的业务逻辑
		Connection conn = DBConn.getConnection(request);
		try {
			PreparedStatement pstmt = conn
					.prepareStatement("INSERT INTO t_user_attention VALUES(?,?,?,?);");
			pstmt.setString(1, attention.getAttention_id());
			pstmt.setString(2, attention.getUser_id());
			pstmt.setString(3, attention.getAtt_id());                     
			pstmt.setInt(4, attention.getAtt_group());                     
			                                                               
                                                                           
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
}
