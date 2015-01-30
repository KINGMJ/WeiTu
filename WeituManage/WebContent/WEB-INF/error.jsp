<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
    pageEncoding="UTF-8"%>
 <%String path=request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>漂亮的蓝天白云404错误页面 - 源码之家</title>
<meta http-equiv="refresh" content="60;url=http://www.mycodes.net/">
<!-- content="60，即60秒后返回主页，可根据需要修改或者删除这段代码 -->
<link href="css/error.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!-- 代码 开始 -->
<div id="container"><img class="png" src="images/404.png" /> <img class="png msg" src="images/404_msg.png" />
  <p><a href="<%=path%>/login.jsp" target="_blank"><img class="png" src="images/404_to_index.png" /></a> </p>
</div>
<div id="cloud" class="png"></div>
<!-- 代码 结束 -->

 
</body>
</html>