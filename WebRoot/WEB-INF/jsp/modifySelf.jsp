<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./common/head.jsp"%>
<link href="${ctx }/themes/css/content.css" rel="stylesheet"
	type="text/css" media="screen" />
<link href="${ctx }/themes/css/stickynote.css" rel="stylesheet"
	type="text/css" media="screen" />
<c:if test="${SESSION_BEAN.role!='SuperUser' }">
	<h2 class="contentTitle">个人资料</h2>
</c:if>
<c:if test="${SESSION_BEAN.role=='SuperUser' }">
	<h2 class="contentTitle">密码修改</h2>
</c:if>
<div class="pageContent">
	<form method="post" action="${ctx}/com/modifySelf.action"
		class="pageForm required-validate" enctype="multipart/form-data"
		onsubmit="return iframeCallback(this)">
		<div class="pageFormContent" layoutH="97">
			<c:if test="${SESSION_BEAN.role!='SuperUser' }">
				<div class="sticky">
					<h1>操作提示</h1>
					<p></p>
					<p>账户密码不修改则不填写!</p>
					<p></p>
				</div>
			</c:if>
			<table>
				<c:if test="${SESSION_BEAN.role!='SuperUser' }">
					<tr>
						<td colspan="2"><dl>
								<dt>登录名称：</dt>
								<dd>
									<input id="userinputstyle" name="uname"
										value="${SESSION_BEAN.user.user.uname }" type="text"
										class="required" readonly="readonly" />
								</dd>
							</dl></td>
					</tr>
				</c:if>

				<tr>
					<td colspan="2"><dl>
							<dt>密码：</dt>
							<dd>
								<input
									style="  width: 80%;height: 20px;margin: 0 0 1em 0;border: 1px solid #DDD;border-radius: 10px;"
									name="bean.userPassword" value="" id="w_validation_pwd"
									type="password" class="alphanumeric" minlength="6"
									maxlength="20" />
							</dd>
						</dl></td>
				</tr>

				<tr>
					<td colspan="2"><dl>
							<dt>确认密码：</dt>
							<dd>
								<input id="userinputstyle" name="repassword" value=""
									type="password" class="" equalto="#w_validation_pwd" />
							</dd>
						</dl></td>
				</tr>
				<c:if test="${SESSION_BEAN.role!='SuperUser' }">
					<tr>
						<td colspan="2"><dl>
								<dt>姓名：</dt>
								<dd>
									<input id="userinputstyle" name="bean.userName"
										value="${SESSION_BEAN.user.user.userName }" type="text"
										class="required" />
								</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
								<dt>性别：</dt>
								<dd>
									<select name="bean.userGender">
										<option value="0"
											<c:if test="${SESSION_BEAN.user.user.userGender==0}">selected="selected"</c:if>>女</option>
										<option value="1"
											<c:if test="${SESSION_BEAN.user.user.userGender==1}">selected="selected"</c:if>>男</option>
									</select>
								</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
								<dt>联系电话：</dt>
								<dd>
									<input id="userinputstyle" name="bean.userPhone"
										value="${SESSION_BEAN.user.user.userPhone}" type="text"
										class="phone" />
								</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
								<dt>邮箱：</dt>
								<dd>
									<input id="userinputstyle" name="bean.userEmail"
										value="${SESSION_BEAN.user.user.userEmail }" type="text"
										class="email" />
								</dd>
							</dl></td>
					</tr>

					<tr>
						<td colspan="2"><dl>
								<dt>出生日期：</dt>
								<dd>
									<input id="userinputstyle" name="bean.userBirth"
										value="${SESSION_BEAN.user.user.userBirth }" type="text"
										class="date" />
								</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
								<dt>联系地址：</dt>
								<dd>
									<input id="userinputstyle" name="bean.userAddress"
										value="${SESSION_BEAN.user.user.userAddress }" type="text"
										class="" />
								</dd>
							</dl></td>
					</tr>
				</c:if>
				<!-- 超级管理员不能为空的字段 -->
				<c:if test="${SESSION_BEAN.role=='SuperUser' }">
					<tr style="display:none ">
						<td colspan="2"><dl>
								<dd>
									<input id="userinputstyle" name="uname"
										value="${SESSION_BEAN.user.user.uname }" type="text"
										class="required" readonly="readonly" />
								</dd>
							</dl></td>
					</tr>
					<tr style="display:none ">
						<td colspan="2"><dl>
								<dd>
									<select name="bean.userGender">
										<option value="0"
											<c:if test="${SESSION_BEAN.user.user.userGender==0}">selected="selected"</c:if>>女</option>
										<option value="1"
											<c:if test="${SESSION_BEAN.user.user.userGender==1}">selected="selected"</c:if>>男</option>
									</select>
								</dd>
							</dl></td>
					</tr>
					<tr style="display:none ">
						<td colspan="2"><dl>
								<dd>
									<input id="userinputstyle" name="bean.userName"
										value="${SESSION_BEAN.user.user.userName }" type="text"
										class="required" />
								</dd>
							</dl></td>
					</tr>
				</c:if>

			</table>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">提交</button>
						</div>
					</div></li>
				<li><div class="button">
						<div class="buttonContent">
							<button type="reset" class="reset">重置</button>
						</div>
					</div></li>
			</ul>
		</div>
	</form>
</div>
