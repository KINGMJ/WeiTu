<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传与下载操作</title>
<link rel="stylesheet" rev="stylesheet" href="../css/style.css" type="text/css" media="all" />
</head>
<body class="ContentBody">

  <form action="../upload" method="post" enctype="multipart/form-data" name="uploadform" target="mainFrame" >
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" style="text-align:center" >文件上传</th>
  </tr>
  <tr>
    <td class="CPanel">
      <table border="0" cellpadding="0" cellspacing="0" style="width:100%">
		
		<TR>
		  <td height="26">	
			<table width="100%" border="0" cellpadding="2" align="center" cellspacing="1">	
					<tr class="TablePanel" >
						<td width="50%" align="center">文件路径</td>	
						<td width="50%" align="center">文件描述</td>		     	
					</tr>
					
					<tr>
						
						<td align="left"><input type="file" name="file1" style="width:300px" /></td>	        	
					    <td align="left"><input type="text" name="fileinfo1" style="width:450px"></td>
					</tr>
					
					<tr>
						
						<td align="left"><input type="file" name="file1" style="width:300px" /></td>	        	
					    <td align="left"><input type="text" name="fileinfo1" style="width:450px"></td>
					</tr>
					
					
			</table>								  
		</TD>									
	</TR>
</TABLE>
</td>
</tr>
<TR>
<TD colspan="2" align="center" height="50px">
<input type="button" value="上传"  onClick="uploadform.submit()"/>
<input type="reset"  value="重置"  /></TD>
</TR>
</TABLE>
 

</div>
</form>
</body>
</html>