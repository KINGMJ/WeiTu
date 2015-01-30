<%@page import="com.gem.weitu.bean.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.gem.weitu.bean.PageBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	PageBean<User> pageBean = (PageBean<User>)request.getAttribute("pageBean");
	int totalRow = pageBean.getTotalRows();
	int totalPage = pageBean.getTotalPages();
	int currPage = pageBean.getCurrPage();
	ArrayList<User> userlist = pageBean.getList();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>项目管理系统</title>
<link href="<%=path %>/css/css.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript">
function abc(){
	return window.confirm("确定删除吗？");
}
function sousuo(){
	window.open("gaojisousuo.htm","","depended=0,alwaysRaised=1,width=800,height=510,location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
}
function selectAll(){
	var obj = document.fom.elements;
	for (var i=0;i<obj.length;i++){
		if (obj[i].name == "delid"){
			obj[i].checked = true;
		}
	}
}

function unselectAll(){
	var obj = document.fom.elements;
	for (var i=0;i<obj.length;i++){
		if (obj[i].name == "delid"){
			if (obj[i].checked==true) obj[i].checked = false;
			else obj[i].checked = true;
		}
	}
}

function link(){
    document.getElementById("fom").action="user/AddUser.jsp";
   	document.getElementById("fom").submit();
}
</script>
</head>

<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
		    <td height="30">      
			    <table width="100%" border="0" cellspacing="0" cellpadding="0">
			        <tr>
			          <td height="62" background="<%=path %>/images/nav04.gif">
			          	   <form action="UserContorl" id="fom" method="post">
						   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
						    <tr>
							  <td width="24"><img src="<%=path %>/images/ico07.gif" width="20" height="18" /></td>
							  <td width="519">
							  	<label>
							  		用户编号:<input type="text" type="text" name="UserId" />
							  	</label>
							    <input name="Submit" type="submit" class="right-button02" value="查 询" />
							  </td>
							   <td width="679" align="left"></td>	
						    </tr>
				          </table>
				          </form>
			          </td>
			        </tr>
			    </table>
		    </td>
	    </tr>
	  <tr>
	    <td>
	    <table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
	        <tr>
	          <td>
	            <form action="DeleteUser" method="post" id="fom">
	          	<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
	          	 <tr>
	               <td height="20">
	               	<span class="newfont07">选择：<a href="#" class="right-font08" onclick="selectAll();">全选</a>-<a href="#" class="right-font08" onclick="unselectAll();">反选</a></span>
			        <input name="Submit" type="button" class="right-button08" value="删除所选用户信息" /> <input name="Submit" type="button" class="right-button08" value="添加用户信息" onclick="link();" />
		           </td>
	          	 </tr>
	          	 <tr>
         			 <td height="6"><img src="../images/spacer.gif" width="1" height="1" /></td>
        		 </tr>
	              <tr>
	                <td height="40" class="font42">
		                <table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
							<tr>
		                    	<td height="20" colspan="14" align="center" bgcolor="#EEEEEE"class="tablestyle_title" style="text-align:center" >用户详细信息列表</td>
		                    </tr>
		                  	<tr>
							    <td width="7%" align="center" bgcolor="#EEEEEE">选择</td>
								<td width="7%" height="20" align="center" bgcolor="#EEEEEE">用户编号</td>
			                    <td width="7%" align="center" bgcolor="#EEEEEE">用户昵称</td>
			                    <td width="7%" align="center" bgcolor="#EEEEEE">用户手机号</td>
			                    <td width="7%" align="center" bgcolor="#EEEEEE">用户邮箱</td>
								<td width="7%" align="center" bgcolor="#EEEEEE">用户密码</td>
								<td width="7%" align="center" bgcolor="#EEEEEE">用户性别</td>
								<td width="10%" align="center" bgcolor="#EEEEEE">用户地区</td>
								<td width="10%" align="center" bgcolor="#EEEEEE">用户个性签名</td>
								<td width="10%" align="center" bgcolor="#EEEEEE">用户头像</td>
								<td width="10%" align="center" bgcolor="#EEEEEE">用户所获勋章数</td>
			                    <td width="7%" align="center" bgcolor="#EEEEEE">操作</td>
		                  	</tr>
		                  	<!-- 数据的显示区 -->
							<%
								if (userlist.size() > 0) {
									for (User user : userlist) {
							%>
		                  	<tr onmouseover="this.className='rowHover'" onmouseout="this.className=''">
							    <td bgcolor="#FFFFFF" align="center"><input type="checkbox" name="delid" value="<%=user.getUser_id()%>"/></td>
								<td height="20" bgcolor="#FFFFFF" align="center"><a href="listyuangongmingxi.html"><%=user.getUser_id() %></a></td>
			                    <td bgcolor="#FFFFFF" align="center"><a href="listyuangongmingxi.html"><%=user.getUser_name() %></a></td>
			                    <td height="20" bgcolor="#FFFFFF" align="center"><%=user.getUser_phone() %></td>
			                    <td bgcolor="#FFFFFF" align="center"><%=user.getUser_email()%></td>
			                    <td bgcolor="#FFFFFF" align="center"><%=user.getUser_password()%></td>
			                    <td bgcolor="#FFFFFF" align="center"><%=user.getUser_gender()%></td>
								<td bgcolor="#FFFFFF" align="center"><%=user.getUser_address()%></td>
								<td bgcolor="#FFFFFF" align="center"><%=user.getUser_sign()%></td>
								<td bgcolor="#FFFFFF" align="center"><%=user.getUser_avatar()%></td>
								<td bgcolor="#FFFFFF" align="center"><%=user.getUser_medal()%></td>
								<td bgcolor="#FFFFFF">
									<a href="<%=path%>/user/EditUser.jsp?UserId=<%=user.getUser_id()%>&UserName=<%=user.getUser_name()%>&UserPhone=<%=user.getUser_phone()%>&UserEmail=<%=user.getUser_email()%>&UserPassword=<%=user.getUser_password()%>&UserGender=<%=user.getUser_gender()%>&UserAddress=<%=user.getUser_address()%>&UserSign=<%=user.getUser_sign()%>&UserAvatar=<%=user.getUser_avatar()%>&UserMedal=<%=user.getUser_medal()%>">编辑</a>&nbsp;|
									<a href="DeleteUser?UserId=<%=user.getUser_id()%>" onclick="return abc()">删除</a></td>
		                    </tr>
		                    <%
									}
									} else {
										//没有stulist是空集合
							%>
							<tr onmouseover="this.className='rowHover'"
								onmouseout="this.className=''">
									<td colspan="12" class="row" align="center">暂无数据</td>
							</tr>
							<%
								}
							%>
		                </table>
	                </td>
	              </tr>
	            </table>
	            </form>
	           </td>
	        </tr>
	      </table>
	     	  <!-- 分页显示区 -->
			  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
			 	 <tr>
          			<td height="6"><img src="../images/spacer.gif" width="1" height="1" /></td>
        		</tr>
				<tr>
					<td style="width: 50%; text-align: left">
					    <img src='<%=path%>/images/arrowPages.gif' />
					          总记录数:<span style='font-weight: bold; color: #E96300;'><%=totalRow%></span>
						总页数:<span style='font-weight: bold; color: #E96300;'><%=totalPage%></span> 
						当前页:<span style='font-weight: bold; color: #E96300;'><%=currPage%></span>
					</td>
					<td style="width: 50%; text-align: right"><a
						href="UserContorl?pageIndex=1">首页</a> <a
						href="UserContorl?pageIndex=<%=currPage - 1 == 0 ? 1 : currPage - 1%>">上一页</a>
						<!-- 页序号显示 --> 
						<%
						 	for (int i = 1; i <= totalPage; i++) {
						 		if (i == currPage) {
						 			out.println(i);
						 		} else {
						 			out.println("<a href='UserContorl?pageIndex=" + i
						 					+ "'>[" + i + "]</a>");
						 		}
						 	}
					   %> 
					 	<a href="UserContorl?pageIndex=<%=currPage + 1 > totalPage ? totalPage : currPage + 1%>">下一页</a>
						<a href="UserContorl?pageIndex=<%=totalPage%>">尾页</a>
					</td>
				</tr>
			 </table>
	      </td>
	  </tr>
	</table>
</body>
</html>
