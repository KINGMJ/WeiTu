package com.gem.weitu.dao;

import java.sql.SQLException;

import com.gem.weitu.bean.PageBean;

public interface BaseDaoInterFace {
	//设置总行数
	public void setTotalRow(String sql) throws SQLException;
	//设置总页数
	public void setTotalPage();
	
	
	//返回PageBean对象
	public PageBean<?> getPageBean(int currPage,String QueryCondition) throws Exception;
}
