<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<!-- 引入自定义文本输入框样式 -->
<link href="${ctx }/themes/css/content.css" rel="stylesheet"
	type="text/css" media="screen" />
<link href="${ctx }/themes/css/stickynote.css" rel="stylesheet"
	type="text/css" media="screen" />
<h2 class="contentTitle">存款- 输入卡号</h2>
<div class="pageContent">
	<form method="post" action="${ctx}/sys/add2AccountSave2.action" class="pageForm required-validate" enctype="multipart/form-data" onsubmit="return navTabSearch(this);">
		<div class="pageFormContent" layoutH="97">
			<table>
					<tr>
						<td colspan="2"><dl>
							<dt>卡号：</dt>
							<dd><input id="userinputstyle" name="sid"  type="text" size="40" class="required"/></dd>
							</dl></td>
					</tr>
					 
					 
				</table>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="reset" class="reset">重置</button></div></div></li>
			</ul>
		</div>
	</form>
</div>
