<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<form id="pagerForm" method="post" action="${ctx}/sys/listLoan.action">
	<input type="hidden" name="pageNum" value="" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);"
		action="${ctx}/sys/listLoan.action" method="post">
		<div class="searchBar">
			<ul class="searchContent">
			</ul>
			<div class="subBar">
				<ul>
				</ul>
			</div>
		</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="icon"
				href="${ctx}/sys/getLoanDetail.action?uid={sid_select}"
				target="navTab" rel="baseView" warn="请选择一条信息,点击需要修改的行" title="查看详细"><span>查看记录</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="100">卡号</th>
				<th width="70">贷款金额</th>
				<th width="70">贷款日期</th>
				<th width="70">还款分期</th>
				<th width="70">已还期数</th>
				<th width="70">每次还款</th>
				<th width="70">还款状态</th>
				<th width="70">还款结果</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="item">
				<tr target="sid_select" rel="${item.id }">
					<td>${item.account.sid}</td>
					<td><fmt:formatNumber value="${item.money}" pattern="#,#00.0#"
							minFractionDigits="2">
						</fmt:formatNumber></td>
					<td>${item.addDate}</td>
					<td>${item.month}</td>
					<td>${item.repaymonth}</td>
					<td><fmt:formatNumber value="${item.perPayMoney}"
							pattern="#,#00.0#" minFractionDigits="2">
						</fmt:formatNumber></td>
					<td>${item.repaystatus}</td>

<!-- 不打开新页面 -->
					<td width="70">
					
					
						<c:if test="${item.def01 != null }"><font color="red">${item.def01}</font></c:if>
					</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar"></div>
</div>
<%@ include file="../common/clear.jsp"%>

