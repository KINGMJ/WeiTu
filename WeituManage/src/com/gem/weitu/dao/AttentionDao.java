package com.gem.weitu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.gem.weitu.bean.Attention;
import com.gem.weitu.bean.PageBean;
import com.gem.weitu.conn.DBConn;

public class AttentionDao implements BaseDaoInterFace {
	
	private Connection conn;
	private PageBean<Attention> pageBean;
	private ArrayList<Attention> list = new ArrayList<Attention>();
	
	public AttentionDao(HttpServletRequest request) {
		this.conn = DBConn.getConnection(request);
		pageBean = new PageBean<Attention>();
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
	public PageBean<?> getPageBean(int currPage, String QueryCondition)
			throws Exception {
		
		
		String sqlStr = "";
		String sqlStr1 = "";
		if (QueryCondition.equals("")) {
			sqlStr = "SELECT * FROM t_user_attention LIMIT " + (currPage - 1)
					* pageBean.getPageSize() + "," + pageBean.getPageSize();
			sqlStr1 = "SELECT count(attention_id) FROM t_user_attention";
		} else {
			sqlStr = "SELECT * FROM t_user_attention WHERE " + QueryCondition
					+ " LIMIT " + (currPage - 1) * pageBean.getPageSize() + ","
					+ pageBean.getPageSize();
			sqlStr1 = "SELECT count(attention_id) FROM t_user_attention WHERE "
					+ QueryCondition;
		}

		PreparedStatement listpstmt = conn.prepareStatement(sqlStr);
		ResultSet rs = listpstmt.executeQuery();
		// 把查询到的结果集放到list中去
		while (rs.next()) {
			Attention attention=new Attention();
			attention.setAttention_id(rs.getString(1));
			attention.setUser_id(rs.getString(2));
			attention.setAtt_id(rs.getString(3));
			attention.setAtt_group(rs.getInt(4));
			this.list.add(attention);
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
