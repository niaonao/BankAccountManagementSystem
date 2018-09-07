<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<link href="${ctx }/themes/css/content.css" rel="stylesheet"
	type="text/css" media="screen" />
<h2 class="contentTitle">添加 柜员 信息</h2>
<div class="pageContent">
	<form method="post" action="${ctx}/sys/addSimpleUser.action" class="pageForm required-validate" enctype="multipart/form-data" onsubmit="return iframeCallback(this)" >
		<div class="pageFormContent" layoutH="97">
			<table>
					<tr>
						<td colspan="2"><dl>
							<dt><h4><h4>账户名：</h4></h4></dt>
							<dd><input id="userinputstyle" name="user.uname"  type="text"  class="required alphanumeric"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt><h4>密码：</h4></dt>
							<dd> 
								<input style=" width: 80%;height: 20px;margin: 0 0 1em 0;border: 1px solid #DDD;border-radius: 10px;" name="user.userPassword"   id="w_validation_pwd" type="password"  class="required alphanumeric" minlength="6" maxlength="20"/>
							</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt><h4>密码确认：</h4></dt>
							<dd><input id="userinputstyle" name="repassword"    type="password" class="required" equalto="#w_validation_pwd"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt><h4>姓名：</h4></dt>
							<dd><input id="userinputstyle"name="user.userName"  type="text"  class="required"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt><h4>性别：</h4></dt>
							<dd>
								<select name="user.userGender">
									<option value="0">女</option>
									<option value="1">男</option>
								</select>
							</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt><h4>联系电话：</h4></dt>
							<dd><input id="userinputstyle" name="user.userPhone"  type="text"  class="phone"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt><h4>邮箱：</h4></dt>
							<dd><input id="userinputstyle" name="user.userEmail"  type="text"  class="email"/></dd>
							</dl></td>
					</tr>
					
					<tr>
						<td colspan="2"><dl>
							<dt><h4>出生日期：</h4></dt>
							<dd><input id="userinputstyle" name="user.userBirth"  type="text"  class="date"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt><h4>联系地址：</h4></dt>
							<dd><input id="userinputstyle" name="user.userAddress"  type="text"  class=""/></dd>
							</dl></td>
					</tr>
				</table>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="reset" class="reset">重置</button></div></div></li>
			</ul>
		</div>
	</form>
</div>
