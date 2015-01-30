<%@ page contentType="text/html;charset=gb2312"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<html>
	<head>
		<title>文件下载</title>
		<style type="text/css">
	#td1{background-color: #6795B4}
</style>
		<link href="css/css.css" rel="stylesheet" type="text/css" />
	<script type="text/JavaScript">
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
	    document.getElementById("fom").action="files/file_upload.jsp";
	   document.getElementById("fom").submit();
	}
</script>	
	</head>
	
	<body>
<form name="fom" id="fom" method="post" action="">	
<c:set var="files" value="${requestScope.filelist}" />

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  
  <tr>
    <td height="30">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="62" background="images/nav04.gif"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="21"><img src="images/ico07.gif" width="20" height="18" /></td>
              <td width="538">文件名查询：
                <input name="textfield" type="text" size="12" readonly="readonly"/>
                  <input name="Submit4" type="button" class="right-button02" value="查 询" /></td>
              <td width="144" align="left"><a href="#" onclick="sousuo()">
                <input name="Submit3" type="button" class="right-button07" value="高级搜索" />
              </a></td>
            </tr>
          </table></td>
        </tr>
    </table></td></tr>
  <tr>
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          	 <tr>
               <td height="20"><span class="newfont07">选择：<a href="#" class="right-font08" onclick="selectAll();">全选</a>-<a href="#" class="right-font08" onclick="unselectAll();">反选</a></span>
	              <input name="Submit" type="button" class="right-button08" value="删除所选文件" />
	              <input name="Submit2" type="button" class="right-button08" value="上传文件" onclick="link();"/></td>
          	 </tr>
              <tr>
                <td height="40" class="font42">
				<table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
				 <tr class="CTitle" >
                    	<td height="22" id="td1" colspan="6" align="center"  style="font-size:16px">文件详细列表</td>
                  </tr>
                  <tr bgcolor="#EEEEEE">
				    <td width="4%" align="center" height="30">选择</td>
                    <td width="10%">文件名称</td>
					<td width="10%">文件大小</td>
					<td width="10%">文件描述</td>
					<td width="8%">下载</td>
                  </tr>
				  
                 
				  
				  
				  
				  
                 
                  <c:if test="${!empty files}">
								<c:forEach var="file" varStatus="fvs" items="${files}">
									<c:if test="${fvs.index%2==0}">
										<c:set var="bgc" value="white" />
									</c:if>
									<c:if test="${fvs.index%2!=0}">
										<c:set var="bgc" value="white" />
									</c:if>
									<tr bgcolor="${bgc}">
									
									 <td height="20"><input type="checkbox" name="delid"/></td>
										<td>
											${file.fileName}
										</td>
										<td>
											${file.fileSize} 字节
										</td>
										<td>
											${file.fileInfoForShow}
										</td>
										<td align="center">
											<a href="downloadrun?downname=${file.saveName}">下载</a>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty files}">
								<tr height="50" bgcolor="white" align="center">
									<td colspan="5">
										没有文件！
									</td>
								</tr>
							</c:if>
                  
            </table></td>
        </tr>
      </table>
      
      <!-- 分页显示区 -->
      
      		
      		<!--分页显示区  -->
      
      </td>
  </tr>
</table>


		
			</table>
		</form>
	</body>
</html>