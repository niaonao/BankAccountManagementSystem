<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<link href="${ctx }/themes/css/stickynote.css" rel="stylesheet"
	type="text/css" media="screen" />
	<link href="${ctx }/themes/css/content.css" rel="stylesheet"
	type="text/css" media="screen" />
<h2 class="contentTitle">取款- 输入卡号和金额</h2>
<div class="pageContent">
	<form method="post" action="${ctx}/sys/updateAccountWithdraw.action" class="pageForm required-validate" enctype="multipart/form-data" onsubmit="return iframeCallback(this,navTabAjaxDone)">
		<div class="pageFormContent" layoutH="97">
			<table>
					<tr>
						<td colspan="2"><dl>
							<dt>卡号：</dt>
							<dd><input id="userinputstyle" name="sid" value="${modifybean.sid}" type="text" size="40" class="required"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>密码：</dt>
							<dd> 
								<input id="userinputstyle" name="password" type="password"  class="required" minlength="6" maxlength="20"/>
							</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>取款金额：</dt>
							<dd><input id="userinputstyle" name="balance"  type="text"  class="number required"/></dd>
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
