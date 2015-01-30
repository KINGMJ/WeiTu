<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>添加用户</title>
<link rel="stylesheet" rev="stylesheet" href="../css/style.css"
	type="text/css" media="all" />

<script language="JavaScript" type="text/javascript">
	function tishi() {
		var a = confirm('数据库中保存有该人员基本信息，您可以修改或保留该信息。');
		if (a != true)
			return false;
		window
				.open(
						"冲突页.htm",
						"",
						"depended=0,alwaysRaised=1,width=800,height=400,location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
	}

	function check() {
		document.getElementById("aa").style.display = "";
	}
</script>
<style type="text/css">
<!--
.atten {
	font-size: 12px;
	font-weight: normal;
	color: #F00;
}
-->
</style>
</head>

<body class="ContentBody">
	<form action="../AddUser" method="post" name="form" >
		<div class="MainDiv">
			<table width="99%" border="0" cellpadding="0" cellspacing="0"
				class="CContent">
				<tr>
					<th class="tablestyle_title">用户基本信息录入</th>
				</tr>
				<tr>
					<td class="CPanel">
						<table border="0" cellpadding="0" cellspacing="0"
							style="width: 100%">
							<tr>
								<td align="left">
									<input type="submit" name="Submit" value="保存" class="button" /> 
									<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);" />
								</td>
							</tr>
							<tr>
								<td width="100%">
									<fieldset style="height: 100%;">
										<legend>用户信息</legend>
										<table border="0" cellpadding="2" cellspacing="1"
											style="width: 100%">

											<tr>
												<td nowrap align="right" width="15%">用户编号:</td>
												<td width="35%">
													<input name='UserId' type="text" class="text" style="width:154px" /> 
													<span class="red">*</span>
												</td>
												<td width="16%" align="right" nowrap="nowrap">用户昵称:</td>
												<td width="34%">
													<input  type="text" class="text" name='UserName' style="width:154px" />
												</td>
											</tr>

											<tr>
												<td nowrap="nowrap" align="right">用户手机号:</td>
												<td>
													<input type="text" class="text" name='UserPhone' style="width: 154px"  />
												</td>
												<td align="right">用户邮箱:</td>
												<td>
												   <input type="text" class="text" name='UserEmail' style="width: 154px"  />
												</td>
											</tr>
											
											<tr>
												<td nowrap="nowrap" align="right">用户密码:</td>
												<td>
													<input type="password" class="text" name='UserPassword' style="width: 154px"  />
												</td>
												<td align="right">用户性别:</td>
												<td>
												   <input  name="UserGender" type="radio" value="男" checked="checked" />男
    											   <input  type="radio" name="UserGender" value="女" />女
												</td>
											</tr>
											
											<tr>
												<td nowrap="nowrap" align="right">用户地区:</td>
												<td>
													<input type="text" class="text" name='UserAddress' style="width: 154px" />
												</td>
												<td align="right">用户所获勋章数:</td>
												<td>
													<input type="text" class="text" name='UserMedal' style="width: 154px" />
												</td>
											</tr>
											<tr>
												<td nowrap="nowrap" align="right">用户头像:</td>
												<td>
													<img src="../images/avatar.jpg" alt="" name="UserAvatar" width="55px" height="55px"/>
												</td>
												
											</tr>

											<tr>
												<td align="right">用户个性签名:</td>
												<td colspan="3">
													<textarea name="UserSign" cols="100" rows="8"></textarea>
												</td>
											</tr>
										</table>
										<br/>
									</fieldset>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center" height="50px">
						<input type="submit" name="Submit" value="保存" class="button" /> 
						<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);" />
					</td>
				</tr>
			</table>
			</td>
			</tr>
			</table>
		</div>
	</form>
</body>
</html>
