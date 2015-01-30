package com.gem.weitu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.gem.weitu.bean.PageBean;
import com.gem.weitu.bean.User;
import com.gem.weitu.conn.DBConn;

public class UserDao implements BaseDaoInterFace {
	private Connection conn;
	private PageBean<User> pageBean;
	private ArrayList<User> list = new ArrayList<User>();

	public UserDao(HttpServletRequest request) {
		this.conn = DBConn.getConnection(request);
		pageBean = new PageBean<User>();
		pageBean.setPageSize(10);
	}

	@Override
	public void setTotalRow(String sql) throws SQLException {
		PreparedStatement rowpstmt = conn.prepareStatement(sql);
		ResultSet rs1 = rowpstmt.executeQuery();
		rs1.next();
		pageBean.setTotalRows(rs1.getInt(1));
	}

	@Override
	public void setTotalPage() {
		int totalPages = pageBean.getTotalRows() % pageBean.getPageSize() == 0 ? pageBean
				.getTotalRows() / pageBean.getPageSize()
				: (pageBean.getTotalRows() / pageBean.getPageSize() + 1);
		pageBean.setTotalPages(totalPages);
	}

	@Override
	public PageBean<User> getPageBean(int currPage, String QueryCondition)
			throws Exception {
		String sqlStr = "";
		String sqlStr1 = "";
		if (QueryCondition.equals("")) {
			sqlStr = "SELECT * FROM t_user_register LIMIT " + (currPage - 1)
					* pageBean.getPageSize() + "," + pageBean.getPageSize();
			sqlStr1 = "SELECT count(user_id) FROM t_user_register";
		} else {
			sqlStr = "SELECT * FROM t_user_register WHERE " + QueryCondition
					+ " LIMIT " + (currPage - 1) * pageBean.getPageSize() + ","
					+ pageBean.getPageSize();
			sqlStr1 = "SELECT count(user_id) FROM t_user_register WHERE "
					+ QueryCondition;
		}

		PreparedStatement listpstmt = conn.prepareStatement(sqlStr);
		ResultSet rs = listpstmt.executeQuery();
		// 把查询到的结果集放到list中去
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
			this.list.add(user);
		}

		pageBean.setList(list); // 完成把查询到的页面数据放入到pageBean的list集合中了

		// 设置当前页
		pageBean.setCurrPage(currPage);

		// 设置总行数
		setTotalRow(sqlStr1);
		// 设置总页数
		setTotalPage();

		return pageBean;
	}

}
