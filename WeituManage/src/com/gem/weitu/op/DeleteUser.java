package com.gem.weitu.op;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gem.weitu.bean.UserOpBean;


@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public DeleteUser() {
		super();
	}

	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	private void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		boolean value = UserOpBean.DeleteUserInfo(request);
		
		PrintWriter out = response.getWriter();
		if (value) {
			out.println("<script type='text/javascript'>alert('删除成功!');location.href='../WeituManage/UserContorl';</script>");
		} else {
			out.println("<script type='text/javascript'>alert('删除失败!');location.href='../WeituManage/UserContorl';</script>");
		}
	}

}
