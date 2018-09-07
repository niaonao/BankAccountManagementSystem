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
				<li><label>贷款卡号：</label> <input type="text" name="ids" value=""
					maxlength="19" /></li>
			</ul>
			<div class="subBar">
				<ul>
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">查询</button>
							</div>
						</div></li>
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
				<th width="70">还款期数<input id="repayloanmonth"
					style="width:30%; margin-left:5px; padding-left:5px; height:auto;" /></th>
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
					
					<a title="还款结果" target="navTab"
						onclick="repayloanclick(this,${item.id });" class="btnSelect"
						style="margin-left: 10px">现金还款</a>
						<c:if test="${item.def01 != null }"><font color="red">${item.def01}</font></c:if>
					</td>

				</tr>
			</c:forEach>
			<tr>
				<td colspan="8">预计每次总还款: <fmt:formatNumber value="${total}"
						pattern="#,#00.0#" minFractionDigits="2">
					</fmt:formatNumber>
				</td>
			</tr>
		</tbody>
	</table>
	<div class="panelBar"></div>
</div>
<%@ include file="../common/clear.jsp"%>

<script type="text/javascript">
	function repayloanclick(obj,id) {
		//alert('${ctx}' + "/sys/repayLoan.action?ids=" + id+ "." + document.getElementById("repayloanmonth").value);
		//href="${ctx}/sys/repayLoan.action?ids=${item.id }"//onclick="repayloanclick();"
		obj.href = '${ctx}' + "/sys/repayLoan.action?ids=" + id+ "." + document.getElementById("repayloanmonth").value;
				 //获取session中user对象的name属性+"&ids"+document.getElementById("repayloanmonth").value;
	}
</script>
