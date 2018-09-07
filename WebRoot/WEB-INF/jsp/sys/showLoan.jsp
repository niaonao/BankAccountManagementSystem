<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<link href="${ctx }/themes/css/detailinfo.css" rel="stylesheet"
	type="text/css" media="screen" />

<h2 class="contentTitle">银行账户贷款详细</h2>

<div class="pageContent">
		<div class="pageFormContent" layoutH="97">
			
			<div class="container">
				<form id="contact" action="" method="post">
					<h4>${modifybean.account.realname}</h4>
					<fieldset>
						<input readonly="readonly" value="银行卡号:&nbsp;&nbsp;${modifybean.account.sid}" type="tel" tabindex="3" required>
					</fieldset>
					<fieldset>
						<input readonly="readonly" value="贷款金额:&nbsp;&nbsp;${modifybean.money }" type="tel" tabindex="3" required>
					</fieldset>
					<fieldset>
						<input readonly="readonly" value="贷款利率:&nbsp;&nbsp;${modifybean.rate }%" type="tel" tabindex="3" required>
					</fieldset>
					<fieldset>
						<input readonly="readonly" value="还款期限:&nbsp;&nbsp;${modifybean.addDate }&nbsp;(贷款日期)/${modifybean.startPayDate }&nbsp;(还款日期)" type="tel" tabindex="3" required>
					</fieldset>
					<fieldset>
						<input readonly="readonly" value="分期详细:&nbsp;&nbsp;${modifybean.repaymonth }&nbsp;(已还分期)/${modifybean.month }&nbsp;(还款分期)" type="tel" tabindex="3" required>
					</fieldset>
					<fieldset>
						<input readonly="readonly" value="每期还款:&nbsp;&nbsp;${modifybean.perPayMoney }" type="tel" tabindex="3" required>
					</fieldset>
					<fieldset>
						<input readonly="readonly" value="逾期利息:&nbsp;&nbsp;${modifybean.overdueinterest }"  type="tel" tabindex="3" required>
					</fieldset>
					<fieldset>
						<input readonly="readonly" value="还款状态:&nbsp;&nbsp;${modifybean.repaystatus }"  type="tel" tabindex="3" required>
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