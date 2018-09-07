<%@ page contentType="text/html; charset=UTF-8" import="cn.hpu.edu.common.util.DateUtil" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<link href="${ctx }/themes/css/content.css" rel="stylesheet"
	type="text/css" media="screen" />
	<link href="${ctx }/themes/css/stickynote.css" rel="stylesheet"
	type="text/css" media="screen" />
		<link href="${ctx }/themes/css/stickynote.css" rel="stylesheet"
	type="text/css" media="screen" />
<h2 class="contentTitle">客户开通银行账户</h2>
<div class="pageContent">
	<form method="post" action="${ctx}/sys/addAccount.action" class="pageForm required-validate" enctype="multipart/form-data" onsubmit="return iframeCallback(this,navTabAjaxDone)">
		<div class="pageFormContent" layoutH="97">
			<div class="sticky">
				<h1>操作提示</h1>
				<p></p>
				<p>1.开户系统自动分配银行账户</p>
				<p>2.定期银行账户存款利息为万分之0.5</p>
				<p>3.活期银行账户存款利息为万分之0.3</p>
				<p>4.活期银行账户优先参与本银行活动</p>
				<p></p>
			</div>
			<table>
					<tr>
						<td colspan="2"><dl>
							<dt>身份证：</dt>
							<dd><input  id="userinputstyle" name="idcard"  type="text"  class="required"  minlength="18" maxlength="18"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>密码：</dt>
							<dd> 
								<input style="  width: 80%;height: 20px;margin: 0 0 1em 0;border: 1px solid #DDD;border-radius: 10px;" name="password"   id="w_validation_pwd" type="password"  class="required alphanumeric" minlength="6" maxlength="20"/>
							</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>密码确认：</dt>
							<dd><input  id="userinputstyle" name="repassword"    type="password" class="required" equalto="#w_validation_pwd"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>姓名：</dt>
							<dd><input  id="userinputstyle" name="realname"  type="text"  class="required"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>性别：</dt>
							<dd>
								<select name="gender">
									<option value="0">女</option>
									<option value="1">男</option>
								</select>
							</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>类型：</dt>
							<dd>
								<select name="accountType">
									<option value="定期">定期</option>
									<option value="活期">活期</option>
								</select>
							</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>联系电话：</dt>
							<dd><input  id="userinputstyle" name="phone"  type="text"  class="phone required" nullmsg="请完善联系电话！" errmsg="联系电话格式有误!"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>预存金额：</dt>
							<dd><input  id="userinputstyle" name="balance"  type="text"  class="number required"  nullmsg="请输入存款金额！" datatype="n1-20" /></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>开户日期：</dt>
							<dd><input id="userinputstyle" name="openDate"  type="text" readonly="true"  class="required" readonly="readonly" value="<%=DateUtil.getInstance().getCurrentTime() %>"/></dd>
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