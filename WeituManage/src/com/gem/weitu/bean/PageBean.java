package com.gem.weitu.bean;

import java.sql.SQLException;
import java.util.ArrayList;

public class PageBean<T> {
	private int pageSize; //页面尺寸
	private int currPage; //当前页码
	private int totalRows; //总行数
	private int totalPages; //总页数
	//当前页的学生信息列表
	private ArrayList<T> list=new ArrayList<T>();
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCurrPage() {
		return currPage;
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	public int getTotalRows() {
		return totalRows;
	}
	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	
	public ArrayList<T> getList() {
		return list;
	}
	
	
	public void setList(ArrayList<T> list) throws SQLException {
		
		
		this.list = list;
	}
	
	
	
}
