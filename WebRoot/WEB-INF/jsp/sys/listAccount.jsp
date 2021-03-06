<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<form id="pagerForm" method="post" action="${ctx}/sys/listAccount.action">
	<input type="hidden" name="pageNum" value="" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${ctx}/sys/listAccount.action" method="post">
	<div class="searchBar">
		<ul class="searchContent">
			<li>
				<label>身份证：</label>
				<input type="text" name="ids" value="" maxlength="18"/>
			</li>
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">查询</button></div></div></li>
			</ul>
		</div>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="100">身份证</th>
				<th width="100">卡号</th>
				<th width="100">姓名</th>
				<th width="100">类型</th>
				<th width="100">状态</th>
				<th width="100">电话</th>
				<th width="70">冻结银行卡</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="item">
			<tr target="sid_select" >
				<td>${item.idcard}</td>
				<td>${item.sid}</td>
				<td>${item.realname}</td>
				<td>${item.accountType}</td>
				<td>${item.status}</td>
				<td>${item.phone}</td>
				<td width="70">
					<c:if test="${item.status=='正常' }">
					<a title="确实要挂失?" target="ajaxTodo" href="${ctx}/sys/updateAccountLost.action?uid=${item.id}" class="btnDel" style="margin-left: 10px">挂失</a>
					</c:if>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
	</div> 
	
</div>
<%@ include file="../common/clear.jsp"%>
