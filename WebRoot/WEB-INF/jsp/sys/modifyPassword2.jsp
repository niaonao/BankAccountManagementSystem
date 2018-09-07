<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<link href="${ctx }/themes/css/content.css" rel="stylesheet"
	type="text/css" media="screen" />
<h2 class="contentTitle">修改密码- 输入新密码</h2>
<div class="pageContent">
	<form method="post" action="${ctx}/sys/updateAccountPassword.action" class="pageForm required-validate" enctype="multipart/form-data" onsubmit="return iframeCallback(this,navTabAjaxDone)">
		<input type="hidden" value="${modifybean.id}" name="id"/>
		<div class="pageFormContent" layoutH="97">
			<table>
					<tr>
						<td colspan="2"><dl>
							<dt>卡号：</dt>
							<dd><input name="sid" id="userinputstyle"  value="${modifybean.sid}" type="text" size="40" readonly="readonly"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>密码：</dt>
							<dd> 
								<input name="password" style=" width: 80%;height: 20px;margin: 0 0 1em 0;border: 1px solid #DDD;border-radius: 10px;"  id="w_validation_pwd" type="password"  class="required alphanumeric" minlength="6" maxlength="20"/>
							</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>密码确认：</dt>
							<dd><input name="repassword"  id="userinputstyle"   type="password" class="required" equalto="#w_validation_pwd"/></dd>
							</dl></td>
					</tr>
					 
				</table>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">修改密码</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="reset" class="reset">重置</button></div></div></li>
			</ul>
		</div>
	</form>
</div>
