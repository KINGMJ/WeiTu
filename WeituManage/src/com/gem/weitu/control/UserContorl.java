package com.gem.weitu.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gem.weitu.bean.PageBean;
import com.gem.weitu.dao.UserDao;

@WebServlet("/UserContorl")
public class UserContorl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public UserContorl() {
		super();
	}

	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			processRquest(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			processRquest(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void processRquest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 这是我们的核心逻辑

		String pageIndex = request.getParameter("pageIndex");
		int currPage;
		String sqlstr;
		if (pageIndex == null) {
			// 这语句块是第一次登录时与点击查询时会调用
			currPage = 1;
			sqlstr = CreateSqlStr(request);// 得到最新的sqlstr
			request.getSession().setAttribute("sqlstr", sqlstr);// 将最新的sqlstr放入session
		} else {
			// 翻页时使用
			currPage = Integer.parseInt(pageIndex);
			sqlstr = request.getSession().getAttribute("sqlstr").toString();
		}

		// 需要一个DAO，从数库中获取相关信息
		UserDao stu_dao = new UserDao(request);
		// 开始构建pageBean
		PageBean pageBean = stu_dao.getPageBean(currPage, sqlstr);

		request.setAttribute("pageBean", pageBean);

		request.getRequestDispatcher("/user/UserManage.jsp").forward(
				request, response);

	}

	private String CreateSqlStr(HttpServletRequest request) {
		String sqlstr = "";
		String userId = request.getParameter("UserId");
		if (userId != null) {
			if (!userId.equals("")) {
				sqlstr = "user_id LIKE '%" + userId + "%'";
			}
		}

		return sqlstr;
	}

}
