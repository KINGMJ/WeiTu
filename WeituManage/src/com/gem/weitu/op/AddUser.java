package com.gem.weitu.op;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gem.weitu.bean.User;
import com.gem.weitu.bean.UserOpBean;

@WebServlet("/AddUser")
public class AddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 开始更新数据
		User user = getUserObj(request);

		boolean value = UserOpBean.AddUser(user, request);
		PrintWriter out = response.getWriter();
		if (value) {
			out.println("<script type='text/javascript'>alert('添加成功!');location.href='../WeituManage/UserContorl';</script>");
		} else {
			out.println("<script type='text/javascript'>alert('添加失败!');location.href='../WeituManage/UserContorl';</script>");
		}
	}

	private User getUserObj(HttpServletRequest request) {
		User user = new User();
		user.setUser_id(request.getParameter("UserId"));
		user.setUser_name(request.getParameter("UserName"));
		user.setUser_phone(request.getParameter("UserPhone"));
		// Date dt=new Date(request.getParameter("CSRQ").toString());
		// student.setCSRQ(dt);
		user.setUser_email(request.getParameter("UserEmail"));
		user.setUser_password(request.getParameter("UserPassword"));
		user.setUser_gender(request.getParameter("UserGender"));
		user.setUser_address(request.getParameter("UserAddress"));
		user.setUser_sign(request.getParameter("UserSign"));
		user.setUser_avatar(request.getParameter("UserAvatar"));
		user.setUser_medal(Integer.parseInt(request.getParameter("UserMedal")));
		return user;
	}
}
