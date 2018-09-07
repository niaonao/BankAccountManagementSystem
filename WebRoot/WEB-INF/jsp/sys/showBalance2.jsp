<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<link href="${ctx }/themes/css/content.css" rel="stylesheet"
	type="text/css" media="screen" />
	<link href="${ctx }/themes/css/stickynote.css" rel="stylesheet"
	type="text/css" media="screen" />
<h2 class="contentTitle">余额查询- 余额信息</h2>
<div class="pageContent">
	<form method="post" action="${ctx}/sys/showBalance2.action" class="pageForm required-validate" enctype="multipart/form-data" onsubmit="return navTabSearch(this);">
		<div class="pageFormContent" >
			<table>
					<tr>
						<td colspan="2"><dl>
							<dt>卡号：</dt>
							<dd><input  id="userinputstyle" value="${modifybean.sid}" type="text" size="40" readonly="readonly"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>存款：</dt>
							<dd><input id="userinputstyle" value="${modifybean.def01}" type="text" readonly="readonly"/></dd>
							</dl></td>
					</tr> 
					<tr>
						<td colspan="2"><dl>
							<dt>余额：</dt>
							<dd><input id="userinputstyle" value="${modifybean.balance}" type="text" readonly="readonly"/></dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>存款利息：</dt>
							<dd><input id="userinputstyle" value="${modifybean.interest}" type="text" readonly="readonly"/></dd>
							</dl></td>
					</tr> 
				</table>
		</div>
		 
	</form>
</div>
