<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>

<form id="pagerForm" method="post"
	action="${ctx}/sys/querySimpleUser.action">
	<input type="hidden" name="pageNum" value="" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);"
		action="${ctx}/sys/querySysUser.action" method="post">
		<div class="searchBar">
			<ul class="searchContent">
				<li><label>管理员账户：</label> <input type="text"
					name="s_user.uname" value="" /></li>
				<li><label>管理员姓名：</label> <input type="text"
					name="s_user.userName" value="" /></li>
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
			<li><a class="add" href="${ctx}/sys/add2SysUser.action"
				target="navTab" rel="baseAdd" title="添加信息"> <span>添加管理</span></a></li>
			<li><a class="edit"
				href="${ctx}/sys/getSysUser.action?uid={sid_select}" target="navTab"
				rel="baseAdd" warn="请选择一条信息,点击需要修改的行" title="修改信息"><span>更新管理员账户</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<!-- <th width="3%"><input type="checkbox" group="ids" class="checkboxCtrl"></th> -->
				<th width="100">账户名</th>
				<th width="100">姓名</th>
				<th width="100">性别</th>
				<th width="100">联系电话</th>
				<th width="100">邮箱</th>
				<th width="100">出生日期</th>
				<th width="100">联系地址</th>
				<th width="70">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${SESSION_PAGE.list}" var="item">
				<tr target="sid_select" rel="${item.id }">
					<%-- <td><input name="ids" value="${item.id }" type="checkbox"></td> --%>
					<td>${item.user.uname}</td>
					<td>${item.user.userName}</td>
					<td><c:if test="${item.user.userGender ==1}">男</c:if> <c:if
							test="${item.user.userGender ==0}">女</c:if></td>
					<td>${item.user.userPhone}</td>
					<td>${item.user.userEmail}</td>
					<td>${item.user.userBirth}</td>
					<td>${item.user.userAddress}</td>
					<td width="70"><a title="更新账户信息"
						href="${ctx}/sys/getSysUser.action?uid=${item.id}" class="btnEdit"
						target="navTab" rel="baseAdd">详细信息</a> <a title="确实要删除这条记录吗?"
						target="ajaxTodo"
						href="${ctx}/sys/deleteSysUser.action?ids=${item.id}"
						class="btnDel" style="margin-left: 10px">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>共${SESSION_PAGE.totalNumber}条</span>
		</div>
	</div>
</div>
<%@ include file="../common/clear.jsp"%>
