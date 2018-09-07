<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);"
		action="${ctx}/sys/queryBankAccount.action" method="post">
		<div class="searchBar">
			<ul class="searchContent">
				<li><label>银行账户：</label> <input type="text" name="s_account.sid"
					value="" /></li>
				<li><label>客户名称：</label> <input type="text"
					name="s_account.realname" value="" /></li>
				<li><label>身份证：</label> <input type="text"
					name="s_account.idcard" value="" /></li>
			</ul>
			<div class="subBar">
				<ul>
					<li><div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">搜索</button>
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
			<li><a class="edit"
				href="${ctx}/sys/getAccount.action?uid={sid_select}"
				target="navTab" rel="baseAdd" warn="请选择一条信息,点击需要修改的行" title="账户详细"><span>账户详细</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="100">银行账户</th>
				<th width="100">客户名称</th>
				<th width="100">性别</th>
				<th width="100">金额</th>
				<th width="70">冻结银行卡</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${SESSION_PAGE.list}" var="item">
				<tr target="sid_select" rel="${item.id }">
					<td>${item.sid}</td>
					<td>${item.realname}</td>
					<td>
						<c:if test="${item.gender==0}">女</c:if>
						<c:if test="${item.gender==1}">男</c:if>
					</td>
					<td>${item.balance}</td>
					<td width="70"><c:if test="${item.status=='正常' }">
							<a title="确实要挂失?" target="ajaxTodo"
								href="${ctx}/sys/updateAccountLost.action?uid=${item.id}"
								class="btnDel" style="margin-left: 10px">挂失</a>
						</c:if></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- <div class="panelBar"></div> -->
	<div class="panelBar">
		<div class="pages">
			<span>共${SESSION_PAGE.totalNumber}条</span>
			<span>&nbsp;&nbsp;</span>
			<span>共${SESSION_PAGE.totalPage}页</span>
		</div>
		<div class="pagination" targetType="navTab" totalCount="${SESSION_PAGE.totalNumber}" numPerPage="${SESSION_PAGE.itemsPerPage}" pageNumShown="10" currentPage="${SESSION_PAGE.currentPageNumber}"></div>
	</div>
</div>
<%@ include file="../common/clear.jsp"%>
