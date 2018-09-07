<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<link href="${ctx }/themes/css/content.css" rel="stylesheet"
	type="text/css" media="screen" />
<link href="${ctx }/themes/css/stickynote.css" rel="stylesheet"
	type="text/css" media="screen" />
<h2 class="contentTitle">修改 柜员 信息</h2>
<div class="pageContent">
	<form method="post" action="${ctx}/sys/updateSimpleUser.action" class="pageForm required-validate" enctype="multipart/form-data" onsubmit="return iframeCallback(this)" >
		<input type="hidden" value="${modifybean.id }" name="id">
		<div class="pageFormContent" layoutH="97">
			<div class="sticky">
					<h1>操作提示</h1>
					<p></p>
					<p>账户密码不修改则不填写!</p>
					<p></p>
				</div>
			<table>
					<tr>
						<td colspan="2"><dl>
							<dt><h4>账户名：</h4></dt>
							<dd><input id="userinputstyle" name="user.uname" value="${modifybean.user.uname }" type="text"  class="required" readonly="readonly" nullmsg="身份证不能为空！" datatype="*18" errormsg="身份证格式有误!"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt><h4>密码：</h4></dt>
							<dd> 
								<input style=" width: 80%;height: 20px;margin: 0 0 1em 0;border: 1px solid #DDD;border-radius: 10px;" name="user.userPassword"  value="" id="w_validation_pwd" type="password"  class="alphanumeric" minlength="6" maxlength="20"/>
							</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt><h4>密码确认：</h4></dt>
							<dd> 
							<input id="userinputstyle" name="repassword"  value=""  type="password" class="" equalto="#w_validation_pwd"/>
							</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt><h4>姓名：</h4></dt>
							<dd><input id="userinputstyle" name="user.userName" value="${modifybean.user.userName }"  type="text"  class="required"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt><h4>性别：</h4></dt>
							<dd>
								<select name="user.userGender">
									<option value="0" <c:if test="${modifybean.user.userGender==0}">selected="selected"</c:if> >女</option>
									<option value="1" <c:if test="${modifybean.user.userGender==1}">selected="selected"</c:if>>男</option>
								</select>
							</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt><h4>联系电话：</h4></dt>
							<!-- <dd><input name="user.userPhone" type="text"   nullmsg="请完善手机号码！" datatype="n11-11" errormsg="手机号码有误！"/></dd> -->
							<dd><input id="userinputstyle" name="user.userPhone" value="${modifybean.user.userPhone }"  type="text"  class="phone"  nullmsg="请完善手机号码！" datatype="m" errormsg="手机号码有误！"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt><h4>邮箱：</h4></dt>
							<dd><input id="userinputstyle" name="user.userEmail" value="${modifybean.user.userEmail }"  type="text"  class="email" nullmsg="请完善邮箱信息！" datatype="e" errormsg="邮箱格式有误！" /></dd>
							</dl></td>
					</tr>
					
					<tr>
						<td colspan="2"><dl>
							<dt><h4>出生日期：</h4></dt>
							<dd><input id="userinputstyle" name="user.userBirth" value="${modifybean.user.userBirth }"  type="text"  class="date"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt><h4>联系地址：</h4></dt>
							<dd><input id="userinputstyle" name="user.userAddress" value="${modifybean.user.userAddress }"  type="text"  class="" nullmsg="请完善地址信息！" datatype="*1-20" /></dd>
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
	