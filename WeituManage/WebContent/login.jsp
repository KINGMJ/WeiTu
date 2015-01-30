<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML>
<HEAD>
<base href="<%=basePath%>">
<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<TITLE>登录页面</TITLE>
<script src="js/jquery.js"></script>
<STYLE>
body{
	background: #ebebeb;
	font-family: "Helvetica Neue","Hiragino Sans GB","Microsoft YaHei","\9ED1\4F53",Arial,sans-serif;
	color: #222;
	font-size: 12px;
}
*{padding: 0px;margin: 0px;}
.top_div{
	background: #008ead;
	width: 100%;
	height: 600px;
}
.ipt{
	border: 1px solid #d3d3d3;
	padding: 10px 10px;
	width: 290px;
	border-radius: 4px;
	padding-left: 5px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
	box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
	-webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
	transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s
}
.ipt:focus{
	border-color: #66afe9;
	outline: 0;
	-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
	box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)
}
.u_logo{
	background: url("images/username.png") no-repeat;
	padding: 10px 10px;
	position: absolute;
	top: 43px;
	right: 50px;

}
.p_logo{
	background: url("images/password.png") no-repeat;
	padding: 10px 10px;
	position: absolute;
	top: 12px;
	right: 50px;
}
a{
	text-decoration: none;
}
.tou{
	background: url("images/tou.png") no-repeat;
	width: 97px;
	height: 92px;
	position: absolute;
	top: -87px;
	left: 140px;
}
.left_hand{
	background: url("images/left_hand.png") no-repeat;
	width: 32px;
	height: 37px;
	position: absolute;
	top: -38px;
	left: 150px;
}
.right_hand{
	background: url("images/right_hand.png") no-repeat;
	width: 32px;
	height: 37px;
	position: absolute;
	top: -38px;
	right: -64px;
}
.initial_left_hand{
	background: url("images/hand.png") no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -12px;
	left: 100px;
}
.initial_right_hand{
	background: url("images/hand.png") no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -12px;
	right: -112px;
}
.left_handing{
	background: url("images/left-handing.png") no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -24px;
	left: 139px;
}
.right_handinging{
	background: url("images/right_handing.png") no-repeat;
	width: 30px;
	height: 20px;
	position: absolute;
	top: -21px;
	left: 210px;
}

span{margin-left:-220px;margin-buttom:0px}





</STYLE>
     
<SCRIPT type="text/javascript">
$(function(){
	//得到焦点
	$("#password").focus(function(){
		$("#left_hand").animate({
			left: "150",
			top: " -38"
		},{step: function(){
			if(parseInt($("#left_hand").css("left"))>140){
				$("#left_hand").attr("class","left_hand");
			}
		}}, 2000);
		$("#right_hand").animate({
			right: "-64",
			top: "-38px"
		},{step: function(){
			if(parseInt($("#right_hand").css("right"))> -70){
				$("#right_hand").attr("class","right_hand");
			}
		}}, 2000);
	});
	//失去焦点
	$("#password").blur(function(){
		$("#left_hand").attr("class","initial_left_hand");
		$("#left_hand").attr("style","left:100px;top:-12px;");
		$("#right_hand").attr("class","initial_right_hand");
		$("#right_hand").attr("style","right:-112px;top:-12px");
	});
});




function checkname(){
					var myform=document.getElementById("myform");
					if(myform.elements[0].value==""){
					warning1.innerHTML="<font color='red'>&nbsp;"+myform.elements[0].title+"不能为空！</font>";	
					myform.elements[0].focus();
					
					
					}else{
						warning1.innerHTML="";
						myform.elements[1].focus();
					}
			}  
			
function checkpassword(){
					var myform=document.getElementById("myform");
					if(myform.elements[1].value==""){
					warning2.innerHTML="<font color='red'>&nbsp;"+myform.elements[1].title+"不能为空！</font>";	
					myform.elements[1].focus();
					
					}else{
						warning2.innerHTML="";
						myform.elements[2].focus();
					}
			} 	


	

function reloadImage(){
	window.location.reload();
	}
			
</SCRIPT>


<META name="GENERATOR" content="MSHTML 11.00.9600.17496">
</HEAD>
<BODY>


<form action="LoginServlet" method="post"  name="myform" id="myform">


	<DIV class="top_div">
		<p align=center>
			<img style="margin: 100px" src="images/login_01.png">
		</p>
	</DIV>
	<DIV
		style="background: rgb(255, 255, 255); margin: -270px auto auto; border: 1px solid rgb(231, 231, 231); border-image: none; width: 400px; height: 285px; text-align: center;">
		<DIV style="width: 165px; height: 96px; position: absolute;">
			<DIV class="tou"></DIV>
			
				<DIV class="initial_left_hand" id="left_hand"></DIV>
				<DIV class="initial_right_hand" id="right_hand"></DIV>
		</DIV>
		<P style="padding: 30px 0px 15px; position: relative;">
			<SPAN class="u_logo"></SPAN> 
			
			
			<INPUT class="ipt" type="text" id="user" name="username" placeholder="请输入管理员账号" value="" title="账号"  onblur="checkname()"> <br>
<span id="warning1"></span>
</P>

<P style="position: relative; ">   
<SPAN class="p_logo"></SPAN>    
<INPUT class="ipt" id="password" type="password" name="password" placeholder="请输入密码" value="" title="密码" onblur="checkpassword()">   <br>
<span id="warning2"></span>
  </P>
  
  <P style=" margin-left:-70px;padding-top:10px">   
  <table>
  <tr><td><INPUT class="ipt" style="width:200px;margin-left:45px;" id="seccode" name="identify" placeholder="请输入验证码" value="" >   </td>
  <td>
  <img src="IdentifyServlet" id="identify"  onload="identify.disabled=false;" onclick="reloadImage()"/></td></</tr>
  </table>
<span></span>





  </P>
<DIV style="height: 10px; line-height: 10px; margin-top: 8px; border-top-color: rgb(231, 231, 231); border-top-width: 1px; border-top-style: solid;">

     <div class="panel-foot text-center">
	 <input type="submit" style="background: rgb(0, 142, 173); padding: 10px 100px;margin-top:15px; border-radius: 4px; border: 1px solid rgb(26, 117, 152); 
	 border-image: none; color: rgb(255, 255, 255); font-weight: bold" value="立即登录后台"></div> 
           </SPAN>         </P></DIV></DIV>
<div style="text-align:center;">

</div>
</form>
<div style="margin-top:15px" align=center><small >©2015 WeiTu 微图公司版权所有 京ICP证030179号 </small></div>

<script type="text/javascript">
			document.getElementById("user").focus();
		</script>
</BODY></HTML>

