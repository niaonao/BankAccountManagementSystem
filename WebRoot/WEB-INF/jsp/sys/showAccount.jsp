<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<link href="${ctx }/themes/css/detailinfo.css" rel="stylesheet"
	type="text/css" media="screen" />

<h2 class="contentTitle">银行账户详细</h2>

<div class="pageContent">
		<div class="pageFormContent" layoutH="97">
			
			<div class="container">
				<form id="contact" action="" method="post">
					<h4>${modifybean.realname}</h4>
					<fieldset>
						<input readonly="readonly" value="身份证号:&nbsp;&nbsp;${modifybean.idcard }" type="tel" tabindex="3" required>
					</fieldset>
					<fieldset>
						<input readonly="readonly" value="银行账户:&nbsp;&nbsp;${modifybean.sid }" type="tel" tabindex="3" required>
					</fieldset>
					<fieldset>
						<c:if test="${modifybean.gender==0}"><input readonly="readonly" value="客户性别:&nbsp;&nbsp;女" type="tel" tabindex="3" required></c:if>
						<c:if test="${modifybean.gender==1}"><input readonly="readonly" value="客户性别:&nbsp;&nbsp;男" type="tel" tabindex="3" required></c:if>
					</fieldset>
					<fieldset>
						<input readonly="readonly" value="联系电话:&nbsp;&nbsp;${modifybean.phone }" type="tel" tabindex="3" required>
					</fieldset>
					<fieldset>
					
						<input readonly="readonly" value="账户状态:&nbsp;&nbsp;${modifybean.status }" type="tel" tabindex="3" required>
					</fieldset>
					<fieldset>
						<input readonly="readonly" value="账户类型:&nbsp;&nbsp;${modifybean.accountType }" type="tel" tabindex="3" required>
					</fieldset>
					<fieldset>
						<c:if test="${modifybean.useType=='贷款'}"><input readonly="readonly" value="贷款账户:&nbsp;&nbsp;是贷款账户支持贷款业务" type="tel" tabindex="3" required></c:if>
				<c:if test="${modifybean.useType!='贷款'}"><input readonly="readonly" value="贷款账户:&nbsp;&nbsp;不是贷款账户不支持贷款业务"" type="tel" tabindex="3" required></c:if>
						
					</fieldset>
					<fieldset>
						<input readonly="readonly" value="账户金额:&nbsp;&nbsp;${modifybean.balance }" type="tel" tabindex="3" required>
					</fieldset>
					<fieldset>
						<c:if test="${modifybean.overduerepay=='1'}"><input readonly="readonly" value="逾期还款:&nbsp;&nbsp;存在逾期还款记录" type="tel" tabindex="3" required></c:if>
						<c:if test="${modifybean.overduerepay=='0'}"><input readonly="readonly" value="逾期还款:&nbsp;&nbsp;账户操作记录良好" type="tel" tabindex="3" required></c:if>
						
					</fieldset>
				</form>
	
			</div>
			
		</div>
		
</div>

			<%-- <div style="width:55%;margin-left: 45%">
				<hr>
				<br>
				<div class="fontwidth">身份证:</div>
				<font class="fontcolor">${modifybean.idcard } </font><br>
				<br>
				<hr>
				<br>
				<div class="fontwidth">银行账户:</div>
				<font class="fontcolor"> ${modifybean.sid } </font><br> <br>
				<hr>
				<br>
				<div class="fontwidth">客户:</div>
				<font class="fontcolor"> ${modifybean.realname} </font> <br> <br>
				<hr>
				<br>
				<div class="fontwidth">性别:</div>
				<font class="fontcolor"> <c:if test="${modifybean.gender==0}">女</c:if>
					<c:if test="${modifybean.gender==1}">男</c:if>
				</font><br> <br>
				<hr>
				<br>
				<div class="fontwidth">联系电话:</div>
				<font class="fontcolor"> ${modifybean.phone } </font><br> <br>
				<hr>
				<br>
				<div class="fontwidth">账户状态:</div>
				<font class="fontcolor"> ${modifybean.status } </font><br> <br>
				<hr>
				<br>
				<div class="fontwidth">账户类型:</div>
				<font class="fontcolor"> ${modifybean.accountType } </font><br>
				<br>
				<hr>
				<div class="fontwidth">是否贷款账户:</div>
				<font class="fontcolor"> <c:if test="${modifybean.useType=='贷款'}">是</c:if>
				<c:if test="${modifybean.useType!='贷款'}">否</c:if>
				</font><br> <br>
				<hr>
				<br>
				<div class="fontwidth">账户金额:</div>
				<font class="fontcolor"> ${modifybean.balance } </font><br> <br>
				<hr>
			</div> --%>