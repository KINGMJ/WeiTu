package com.gem.weitu.conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

public class DBConn {
	public static Connection getConnection(HttpServletRequest request){
		String driver=request.getServletContext().getInitParameter("Driver");
		String url=request.getServletContext().getInitParameter("ServerUrl");
		String user=request.getServletContext().getInitParameter("User");
		String pass=request.getServletContext().getInitParameter("Pass");
		
		try {
			Class.forName(driver);
			return DriverManager.getConnection(url,user,pass);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
