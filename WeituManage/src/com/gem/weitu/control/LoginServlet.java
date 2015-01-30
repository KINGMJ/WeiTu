package com.gem.weitu.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gem.weitu.bean.UserOpBean;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//这是一个控制器,接受用户密码
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		String u=request.getParameter("username");
		String p=request.getParameter("password");
		String identify=request.getParameter("identify");
		request.getSession().setAttribute("username", u);
		if(UserOpBean.checkUser(u,p, request)&& identify.equals(session.getAttribute("randomString")) ){
			request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
		}else{
			 out.println("<script>alert('用户信息输入错误！请重试。')</script>");
			  out.println("<script>history.go(-1)</script>");
			//request.getRequestDispatcher("login.jsp").forward(request,response);
		}
	}

}
