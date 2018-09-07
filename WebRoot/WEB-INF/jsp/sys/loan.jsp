<%@ page contentType="text/html; charset=UTF-8"
	import="cn.hpu.edu.common.util.DateUtil" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<link href="${ctx }/themes/css/content.css" rel="stylesheet"
	type="text/css" media="screen" />
<link href="${ctx }/themes/css/stickynote.css" rel="stylesheet"
	type="text/css" media="screen" />
<link href="${ctx }/themes/css/stickynote.css" rel="stylesheet"
	type="text/css" media="screen" />
<h2 class="contentTitle">添加一笔贷款</h2>

<div class="pageContent">
	<form method="post" action="${ctx}/sys/addLoan.action"
		class="pageForm required-validate" enctype="multipart/form-data"
		onsubmit="return iframeCallback(this,navTabAjaxDone)">
		<div class="pageFormContent" layoutH="97">
			<div class="sticky">
				<h1>操作提示</h1>
				<p></p>
				<p>1.单次贷款额度不超过100万元</p>
				<p>2.还款日期从贷款之日起计算还款日期</p>
				<p>3.贷款额度不低于60万元还款期限3个月</p>
				<p>4.贷款额度不低于30万元还款期限2个月</p>
				<p>5.贷款额度若低于30万元还款期限1个月</p>
				<p></p>
			</div>
			<table>
				<tr>
					<td colspan="2"><dl>
							<dt>贷款账号：</dt>
							<dd>
								<input id="userinputstyle" name="loan.account.sid" type="text"
									size="40" class="required" />
							</dd>
						</dl></td>
				</tr>
				<tr>
					<td colspan="2"><dl>
							<dt>贷款金额：</dt>
							<dd>
								<input id="userinputstyle" name="loan.money" type="text"
									class="required number" min="1000" />
							</dd>
						</dl></td>
				</tr>
				<tr>
					<td colspan="2"><dl>
							<dt>贷款日期：</dt>
							<dd>
								<input id="userinputstyle" name="loan.addDate" type="text"
									readonly="true" class="required" readonly="readonly"
									value="<%=DateUtil.getInstance().getCurrentTime()%>" />
							</dd>
						</dl></td>
				</tr>
				<tr>
					<td colspan="2"><dl>
							<dt>贷款分期：</dt>
							<dd>
								<input id="userinputstyle" name="loan.month" type="text"
									class="required" min="6" />
							</dd>
						</dl></td>
				</tr>
				<tr>
					<td colspan="2"><dl>
							<dt>贷款利率：</dt>
							<dd>
								<input id="userinputstyle" name="loan.rate" type="text"
									class="required number" min="6" /><font color=red >%</font>
							</dd>
						</dl></td>
				</tr>
			</table>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">添加贷款</button>
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
