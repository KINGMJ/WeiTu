package com.gem.weitu.bean;

//此bean对应系统管理员的表（system_users）
public class SysUser {
	private int userid;   //用户ID
	private String username;//用户名
	private String password; //用户 密码
	
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
}
