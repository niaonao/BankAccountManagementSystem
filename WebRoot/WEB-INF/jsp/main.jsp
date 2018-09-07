<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./common/head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${appTitle }</title>
<link rel="icon" href="${ctx }/resource/icon.jfif" type="image/x-icon" />
<link href="${ctx }/themes/azure/style.css" rel="stylesheet"
	type="text/css" media="screen" />
<link href="${ctx }/themes/css/core.css" rel="stylesheet"
	type="text/css" media="screen" />
<link href="${ctx }/themes/css/print.css" rel="stylesheet"
	type="text/css" media="print" />
<link href="${ctx }/uploadify/css/uploadify.css" rel="stylesheet"
	type="text/css" media="screen" />
<style type="text/css">
.circlegray {
	float: left;
	text-align: center;
	margin: 15px;
	line-height: 90px;
	width: 90px;
	height: 90px;
	background-color: #CCCCCC;
	border-radius: 50%;
	-moz-border-radius: 50%;
	-webkit-border-radius: 50%;
	font-size: 12px;
	font-family: YouYuan;
	font-weight:bold;
}

.circleblue {
	float: left;
	text-align: center;
	margin: 15px;
	line-height: 90px;
	width: 90px;
	height: 90px;
	background-color: #60c0ff;
	border-radius: 50%;
	-moz-border-radius: 50%;
	-webkit-border-radius: 50%;
	font-size: 12px;
	font-family: YouYuan;
	font-weight:bold;
}

.circlered {
	float: left;
	text-align: center;
	margin: 15px;
	line-height: 90px;
	width: 90px;
	height: 90px;
	background-color: #FF6699;
	border-radius: 50%;
	-moz-border-radius: 50%;
	-webkit-border-radius: 50%;
	font-size: 12px;
	font-family: YouYuan;
	font-weight:bold;
}
.circlepurple {
	float: left;
	text-align: center;
	margin: 15px;
	line-height: 90px;
	width: 90px;
	height: 90px;
	background-color: #a000ff;
	border-radius: 50%;
	-moz-border-radius: 50%;
	-webkit-border-radius: 50%;
	font-size: 13px;
	font-family: YouYuan;
	font-weight:bold;
}

.circleyellow {
	float: left;
	text-align: center;
	margin: 15px;
	line-height: 90px;
	width: 90px;
	height: 90px;
	background-color: #ffc040;
	border-radius: 50%;
	-moz-border-radius: 50%;
	-webkit-border-radius: 50%;
	font-size: 12px;
	font-family: YouYuan;
	font-weight:bold;
}

.mainlinecenter {
	line-height: 90px;
}
</style>

<!--[if IE]>
<link href="${ctx }/themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
<![endif]-->

<!--[if lte IE 9]>
<script src="${ctx }/js/speedup.js" type="text/javascript"></script>
<![endif]-->

<script src="${ctx }/js/jquery-1.7.2.js" type="text/javascript"></script>
<script src="${ctx }/js/jquery.cookie.js" type="text/javascript"></script>
<script src="${ctx }/js/jquery.validate.js" type="text/javascript"></script>
<script src="${ctx }/js/jquery.bgiframe.js" type="text/javascript"></script>
<script src="${ctx }/xheditor/xheditor-1.2.1.min.js"
	type="text/javascript"></script>
<script src="${ctx }/xheditor/xheditor_lang/zh-cn.js"
	type="text/javascript"></script>
<script src="${ctx }/uploadify/scripts/jquery.uploadify.js"
	type="text/javascript"></script>

<!-- svg图表  supports Firefox 3.0+, Safari 3.0+, Chrome 5.0+, Opera 9.5+ and Internet Explorer 6.0+ -->
<!-- <script type="text/javascript" src="${ctx }/chart/raphael.js"></script> -->
<!-- <script type="text/javascript" src="${ctx }/chart/g.raphael.js"></script> -->
<!-- <script type="text/javascript" src="${ctx }/chart/g.bar.js"></script> -->
<!-- <script type="text/javascript" src="${ctx }/chart/g.line.js"></script> -->
<!-- <script type="text/javascript" src="${ctx }/chart/g.pie.js"></script> -->
<!-- <script type="text/javascript" src="${ctx }/chart/g.dot.js"></script> -->

<script src="${ctx }/js/dwz.core.js" type="text/javascript"></script>
<script src="${ctx }/js/dwz.util.date.js" type="text/javascript"></script>
<script src="${ctx }/js/dwz.validate.method.js" type="text/javascript"></script>
<script src="${ctx }/js/dwz.regional.zh.js" type="text/javascript"></script>
<script src="${ctx }/js/dwz.barDrag.js" type="text/javascript"></script>
<script src="${ctx }/js/dwz.drag.js" type="text/javascript"></script>
<script src="${ctx }/js/dwz.tree.js" type="text/javascript"></script>
<script src="${ctx }/js/dwz.accordion.js" type="text/javascript"></script>
<script src="${ctx }/js/dwz.ui.js" type="text/javascript"></script>
<script src="${ctx }/js/dwz.theme.js" type="text/javascript"></script>
<script src="${ctx }/js/dwz.switchEnv.js" type="text/javascript"></script>
<script src="${ctx }/js/dwz.alertMsg.js" type="text/javascript"></script>
<script src="${ctx }/js/dwz.contextmenu.js" type="text/javascript"></script>
<script src="${ctx }/js/dwz.navTab.js" type="text/javascript"></script>
<script src="${ctx }/js/dwz.tab.js" type="text/javascript"></script>
<script src="${ctx }/js/dwz.resize.js" type="text/javascript"></script>
<script src="${ctx }/js/dwz.dialog.js" type="text/javascript"></script>
<script src="${ctx }/js/dwz.dialogDrag.js" type="text/javascript"></script>
<script src="${ctx }/js/dwz.sortDrag.js" type="text/javascript"></script>
<script src="${ctx }/js/dwz.cssTable.js" type="text/javascript"></script>
<script src="${ctx }/js/dwz.stable.js" type="text/javascript"></script>
<script src="${ctx }/js/dwz.taskBar.js" type="text/javascript"></script>
<script src="${ctx }/js/dwz.ajax.js" type="text/javascript"></script>
<script src="${ctx }/js/dwz.pagination.js" type="text/javascript"></script>
<script src="${ctx }/js/dwz.database.js" type="text/javascript"></script>
<script src="${ctx }/js/dwz.datepicker.js" type="text/javascript"></script>
<script src="${ctx }/js/dwz.effects.js" type="text/javascript"></script>
<script src="${ctx }/js/dwz.panel.js" type="text/javascript"></script>
<script src="${ctx }/js/dwz.checkbox.js" type="text/javascript"></script>
<script src="${ctx }/js/dwz.history.js" type="text/javascript"></script>
<script src="${ctx }/js/dwz.combox.js" type="text/javascript"></script>
<script src="${ctx }/js/dwz.print.js" type="text/javascript"></script>
<!--
<script src="${ctx }/bin/dwz.min.js" type="text/javascript"></script>
-->
<script src="${ctx }/js/dwz.regional.zh.js" type="text/javascript"></script>

<script type="text/javascript">
	/**
	 * 页面初始化JS动作
	 */
	$(function() {
		DWZ.init("${ctx }/dwz.frag.xml", {
			loginUrl : "login_dialog.html",
			loginTitle : "登录",
			//		loginUrl:"login.html",	
			statusCode : {
				ok : 200,
				error : 300,
				timeout : 301
			},
			pageInfo : {
				pageNum : "pageNum",
				numPerPage : "numPerPage",
				orderField : "orderField",
				orderDirection : "orderDirection"
			},
			debug : false,
			callback : function() {
				initEnv();
				$("#themeList").theme({
					themeBase : "${ctx }/themes"
				});
			}
		});
	});
	/**
	 * 设置标签的显示或隐藏
	 */
	function displaybyhrefid(hrefid) {
		var mainhref = document.getElementById(hrefid);
		if (mainhref.getAttribute("display") != "none") {
			mainhref.style.display = "none";
			mainhref.setAttribute("display", "none");
		} else {
			mainhref.style.display = "inline";
			mainhref.setAttribute("display", "inline");
		}

	};

	function mainshowlead() {
		var mainArray = new Array("mainadd2AccountSave1",
				"mainadd2AccountWithdraw1", "mainadd2AccountTransfe",
				"mainshowBalance1", "mainadd2AccountCancel",
				"mainadd2Password1", "mainadd2Account", "mainlistAccount",
				"mainadd2UnlockAccount", "mainlistAccountForLoan",
				"mainadd2Loan", "mainlistLoan");
		for (var i = 0; i < mainArray.length; i++) {
			var mainhref = document.getElementById(mainArray[i]);

			//if(i){}
			
			if (i < 8 && i != 4) {
				mainhref.style.display = "inline";
				mainhref.setAttribute("display", "inline");
			} else {
				mainhref.style.display = "none";
				mainhref.setAttribute("display", "none");
			}
		}
	};

	function mainshow() {
		var mainArray = new Array("mainadd2AccountSave1",
				"mainadd2AccountWithdraw1", "mainadd2AccountTransfe",
				"mainshowBalance1", "mainadd2AccountCancel",
				"mainadd2Password1", "mainadd2Account", "mainlistAccount",
				"mainadd2UnlockAccount", "mainlistAccountForLoan",
				"mainadd2Loan", "mainlistLoan");
		for (var i = 0; i < mainArray.length; i++) {
			var mainhref = document.getElementById(mainArray[i]);
			mainhref.style.display = "inline";
			mainhref.setAttribute("display", "inline");
		}

		document.getElementById("mainbuttonnone").style.display = "inline";
		document.getElementById("mainbuttonshow").style.display = "none";

	};

	function mainnone() {
		var mainArray = new Array("mainadd2AccountSave1",
				"mainadd2AccountWithdraw1", "mainadd2AccountTransfe",
				"mainshowBalance1", "mainadd2AccountCancel",
				"mainadd2Password1", "mainadd2Account", "mainlistAccount",
				"mainadd2UnlockAccount", "mainlistAccountForLoan",
				"mainadd2Loan", "mainlistLoan");
		for (var i = 0; i < mainArray.length; i++) {
			var mainhref = document.getElementById(mainArray[i]);
			mainhref.style.display = "none";
			mainhref.setAttribute("display", "none");
		}
		document.getElementById("mainbuttonnone").style.display = "none";
		document.getElementById("mainbuttonshow").style.display = "inline";
	};
</script>
</he;ad>
<body scroll="no">
	<div id="layout">
		<div id="header">
			<div class="headerNav">
				<img src="${ctx}/resource/images.jfif" width="45px" height="45px"
					style="margin-top: 5px;float: left" /> <span
					style="line-height:normal;float: left; color:white;font-size: 30px;font-weight: bold;margin-top: 8px;">
					${appTitle }</span>
				<ul class="nav">
					<li>${SESSION_BEAN.user.user.uname}| <a
						href="${ctx }/com/logout.action">退出</a></li>
				</ul>
				<ul class="themeList" id="themeList">
				</ul>
			</div>
			<!-- navMenu -->
		</div>
		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse">
						<div></div>
					</div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse">
					<h2>操作菜单</h2>
					<div>收缩</div>
				</div>
				<div class="accordion" fillSpace="sidebar">
					<c:if test="${SESSION_BEAN.role=='SysUser' }">
						<div class="accordionHeader">
							<h2>
								<span>Folder</span>系统管理
							</h2>
						</div>
						<div class="accordionContent">
							<ul class="tree treeFolder">
								<li><a href="${ctx}/sys/querySimpleUser.action"
									target="navTab" rel="mainquery">柜台员工列表</a></li>
								<li><a href="${ctx}/sys/queryBankAccount.action"
									target="navTab" rel="mainquery">银行账户列表</a></li>
							</ul>
						</div>
						<div class="accordionHeader"> 
 								<h2><span>Folder</span>我的信息</h2> 
 							</div> 
 						<div class="accordionContent"> 
 							<ul class="tree treeFolder"> 
 								 <li><a href="${ctx}/com/toSelf.action" target="navTab" rel="mainquery">个人资料</a></li> 
 							</ul> 
 						</div> 
					</c:if>
					<c:if test="${SESSION_BEAN.role=='SimpleUser' }">
						<div class="accordionHeader">
							<h2>
								<span>Folder</span>基本业务
							</h2>
						</div>
						<div class="accordionContent">
							<ul class="tree treeFolder">
								<li><a href="${ctx}/sys/add2AccountSave1.action"
									target="navTab" rel="baseAdd">存款管理</a></li>
								<li><a href="${ctx}/sys/add2AccountWithdraw1.action"
									target="navTab" rel="baseAdd">取款管理</a></li>
								<li><a href="${ctx}/sys/add2AccountTransfe.action"
									target="navTab" rel="baseAdd">转账管理</a></li>
								<li><a href="${ctx}/sys/showBalance1.action"
									target="navTab" rel="baseAdd">余额查询</a></li>
								<li><a href="${ctx}/sys/add2AccountCancel.action"
									target="navTab" rel="baseAdd">账户销户</a></li>
							</ul>
						</div>

						<div class="accordionHeader">
							<h2>
								<span>Folder</span>客户业务
							</h2>
						</div>
						<div class="accordionContent">
							<ul class="tree treeFolder">
								<li><a href="${ctx}/sys/add2Password1.action"
									target="navTab" rel="baseAdd">密码修改</a></li>
								<li><a href="${ctx}/sys/add2Account.action" target="navTab"
									rel="baseAdd">账户开户</a></li>
								<li><a href="${ctx}/sys/listAccount.action" target="navTab"
									rel="mainquery">银行卡挂失</a></li>
								<li><a href="${ctx}/sys/add2UnlockAccount.action"
									target="navTab" rel="baseAdd">银行卡解锁</a></li>
								<li><a href="${ctx}/sys/listAccountForLoan.action"
									target="navTab" rel="mainquery">贷款账户设置</a></li>
								<li><a href="${ctx}/sys/add2Loan.action" target="navTab"
									rel="baseAdd">贷款业务办理</a></li>
								<li><a href="${ctx}/sys/listLoan.action" target="navTab"
									rel="mainquery">还款查询</a></li>
							</ul>
						</div>
						<div class="accordionHeader"> 
 								<h2><span>Folder</span>我的信息</h2> 
 							</div> 
 						<div class="accordionContent"> 
 							<ul class="tree treeFolder"> 
 								 <li><a href="${ctx}/com/toSelf.action" target="navTab" rel="mainquery">个人资料</a></li> 
 							</ul> 
 						</div> 
					</c:if>
					<c:if test="${SESSION_BEAN.role=='SuperUser' }">
						<div class="accordionHeader">
							<h2>
								<span>Folder</span>系统管理
							</h2>
						</div>
						<div class="accordionContent">
							<ul class="tree treeFolder">
								<li><a href="${ctx}/sys/querySysUser.action"
									target="navTab" rel="mainquery">管理员列表</a></li>
							</ul>
						</div>
						<div class="accordionHeader"> 
 								<h2><span>Folder</span>账户安全</h2> 
 							</div> 
 						<div class="accordionContent"> 
 							<ul class="tree treeFolder"> 
 								 <li><a href="${ctx}/com/toSelf.action" target="navTab" rel="mainquery">密码修改</a></li> 
 							</ul> 
 						</div> 
					</c:if>
				</div>
			</div>
		</div>
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent">
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span
										class="home_icon">我的主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div>
					<div class="tabsRight">right</div>
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:;">我的主页</a></li>
				</ul>
				<c:if test="${SESSION_BEAN.role=='SysUser' }">
					<div class="navTab-panel tabsPageContent layoutBox"
						style="background: url(${ctx }/themes/default/images/main/main.jpg); background-size:100% 100%; ">
						<div class="page unitBox">
							<div class="pageFormContent" layoutH="80">
								<a href="${ctx}/com/toSelf.action" target="navTab" rel="mainquery">
									<p style="color:blue;font-family:SimHei   ; font-size: 20px ">欢迎您:
										${SESSION_BEAN.user.user.userName}&nbsp;&nbsp;&nbsp;</p>
								</a>

							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${SESSION_BEAN.role=='SimpleUser' }">
					<div class="navTab-panel tabsPageContent layoutBox"
						style="background: url(${ctx }/themes/default/images/main/backsimpleuser.jpg); background-size:100% 100%; ">
						<div class="page unitBox">
							<div class="pageFormContent" layoutH="80">
								<a href="${ctx}/com/toSelf.action" target="navTab" rel="mainquery">
									<p style="color:blue;font-family:SimHei   ; font-size: 20px ">欢迎您:
										${SESSION_BEAN.user.user.userName}&nbsp;&nbsp;&nbsp;
										</p>
										</a>
								
									<div style=" float:right; width: 11% " >
										<ul>
											<li><div class="buttonActive">
													<div class="buttonContent">
														<button onclick="mainshowlead()">功能引导</button>
													</div>
												</div></li>
											<li id="mainbuttonnone"><div class="button">
													<div class="buttonContent">
														<button onclick="mainnone()">隐藏全部</button>
													</div>
												</div></li>
											<li style="display:none;" id="mainbuttonshow"><div
													class="button">
													<div class="buttonContent">
														<button onclick="mainshow()">显示全部</button>
													</div>
												</div></li>
										</ul>
									</div>
									<div style="margin: 30px; ">
										<br> <a href="${ctx}/sys/add2AccountSave1.action"
											target="navTab" rel="baseAdd" id="mainadd2AccountSave1">
												<div class="circleyellow">存款管理</div>
										</a> <a href="${ctx}/sys/add2AccountWithdraw1.action"
											target="navTab" rel="baseAdd" id="mainadd2AccountWithdraw1">
												<div class="circlegray">取款管理</div>
										</a> <a href="${ctx}/sys/add2AccountTransfe.action"
											target="navTab" rel="baseAdd" id="mainadd2AccountTransfe">
												<div class="circleblue">转账管理</div>
										</a> <a href="${ctx}/sys/showBalance1.action" target="navTab"
											rel="baseAdd" id="mainshowBalance1">
												<div class="circleblue">余额查询</div>
										</a> <a href="${ctx}/sys/add2AccountCancel.action" target="navTab"
											rel="baseAdd" id="mainadd2AccountCancel"
											style="display:none;">
												<div class="circlered">账户销户</div>
										</a> <a href="${ctx}/sys/add2Account.action" target="navTab"
											rel="baseAdd" id="mainadd2Account">
												<div class="circleblue">账户开户</div>
										</a> <a href="${ctx}/sys/add2Password1.action" target="navTab"
											rel="baseAdd" id="mainadd2Password1">
												<div class="circlepurple">密码修改</div>
										</a> <a href="${ctx}/sys/listAccount.action" target="navTab"
											rel="mainquery" id="mainlistAccount">
												<div class="circlegray">银行卡挂失</div>
										</a> <a href="${ctx}/sys/add2UnlockAccount.action" target="navTab"
											rel="baseAdd" id="mainadd2UnlockAccount"
											style="display:none;">
												<div class="circleblue">银行卡解锁</div>
										</a> <a href="${ctx}/sys/listAccountForLoan.action"
											target="navTab" rel="mainquery" id="mainlistAccountForLoan"
											style="display:none;">
												<div class="circlered">贷款账户设置</div>
										</a> <a href="${ctx}/sys/add2Loan.action" target="navTab"
											rel="baseAdd" id="mainadd2Loan" style="display:none;">
												<div class="circleblue">贷款业务办理</div>
										</a> <a href="${ctx}/sys/listLoan.action" target="navTab"
											rel="mainquery" id="mainlistLoan" style="display:none;">
												<div class="circleblue">还款查询</div>
										</a>
									</div>
							</div>
						</div>
					</div>

				</c:if>
				<c:if test="${SESSION_BEAN.role=='SuperUser' }">
					<div class="navTab-panel tabsPageContent layoutBox"
						style="background: url(${ctx }/themes/default/images/main/backsuperuser03.jpg); background-size:100% 100%; ">
						<div class="page unitBox">
							<div class="pageFormContent" layoutH="80">
								<p style="color:blue;font-family:SimHei   ; font-size: 20px ">欢迎您:
									${SESSION_BEAN.user.user.userName}&nbsp;&nbsp;&nbsp;</p>

							</div>
						</div>
					</div>
				</c:if>

			</div>
		</div>
	</div>
	<div id="footer">
		版权所有 河南理工大学 中国 河南焦作 高新区 世纪路2001号 | Copyright &copy; 2017 | [454000]
		豫ICP备05002483号 焦公网安备4108000002号<br />
	</div>
</body>
</html>