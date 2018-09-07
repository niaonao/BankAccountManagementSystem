<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%-- <link href="${pageContext.request.contextPath }/favicon.ico" rel="shortcut icon"/> --%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>小型银行柜台业务管理系统</title>
<link rel="icon" href="resource/icon.jfif" type="image/x-icon" />
<link href="themes/login/login.css" rel="stylesheet" rev="stylesheet"
	type="text/css" media="all" />
<script type="text/javascript" src="themes/login/jQuery1.7.js"></script>
<script type="text/javascript" src="themes/login/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="themes/login/jquery1.42.min.js"></script>
<script type="text/javascript"
	src="themes/login/Validform_v5.3.2_min.js"></script>
<script type="text/javascript">
var currenttabindex = 0;
	$(document).ready(function(){
		var $tab_li = $('#tab ul li');
		$tab_li.hover(function(){
			$(this).addClass('selected').siblings().removeClass('selected');
			var index = $tab_li.index(this);
			$('div.tab_box > div').eq(index).show().siblings().hide();
			if(index != currenttabindex){$("#checkcode"+index).click();}
			currenttabindex = index;
		});	
	});
</script>
<script type="text/javascript">
$(function(){
/*柜员登录信息验证*/
$("#stu_username_hide").focus(function(){
 var username = $(this).val();
 if(username=='输入账号'){
 $(this).val('');
 }
});
$("#stu_username_hide").focusout(function(){
 var username = $(this).val();
 if(username==''){
 $(this).val('输入账号');
 }
});
$("#stu_password_hide").focus(function(){
 var username = $(this).val();
 if(username=='输入密码'){
 $(this).val('');
 }
});
$("#stu_password_hide").focusout(function(){
 var username = $(this).val();
 if(username==''){
 $(this).val('输入密码');
 }
});
$("#stu_code_hide").focus(function(){
 var username = $(this).val();
 if(username=='输入验证码'){
 $(this).val('');
 }
});
$("#stu_code_hide").focusout(function(){
 var username = $(this).val();
 if(username==''){
 $(this).val('输入验证码');
 }
});
$(".stu_login_error").Validform({
	tiptype:function(msg,o,cssctl){
		var objtip=$(".stu_error_box");
		cssctl(objtip,o.type);
		objtip.text(msg);
	},
	ajaxPost:false
});
/*管理员登录信息验证*/
$("#tea_username_hide").focus(function(){
 var username = $(this).val();
 if(username=='请输入柜员账户'){
 $(this).val('');
 }
});
$("#tea_username_hide").focusout(function(){
 var username = $(this).val();
 if(username==''){
 $(this).val('请输入柜员账户');
 }
});
$("#tea_password_hide").focus(function(){
 var username = $(this).val();
 if(username=='输入密码'){
 $(this).val('');
 }
});
$("#tea_password_hide").focusout(function(){
 var username = $(this).val();
 if(username==''){
 $(this).val('输入密码');
 }
});
$("#tea_code_hide").focus(function(){
 var username = $(this).val();
 if(username=='输入验证码'){
 $(this).val('');
 }
});
$("#tea_code_hide").focusout(function(){
 var username = $(this).val();
 if(username==''){
 $(this).val('输入验证码');
 }
});
$(".tea_login_error").Validform({
	tiptype:function(msg,o,cssctl){
		var objtip=$(".tea_error_box");
		cssctl(objtip,o.type);
		objtip.text(msg);
	},
	ajaxPost:false
});
/*登录信息验证*/
$("#sec_username_hide").focus(function(){
 var username = $(this).val();
 if(username=='输入账号'){
 $(this).val('');
 }
});
$("#sec_username_hide").focusout(function(){
 var username = $(this).val();
 if(username==''){
 $(this).val('输入账号');
 }
});
$("#sec_password_hide").focus(function(){
 var username = $(this).val();
 if(username=='输入密码'){
 $(this).val('');
 }
});
$("#sec_password_hide").focusout(function(){
 var username = $(this).val();
 if(username==''){
 $(this).val('输入密码');
 }
});
$("#sec_code_hide").focus(function(){
 var username = $(this).val();
 if(username=='输入验证码'){
 $(this).val('');
 }
});
$("#sec_code_hide").focusout(function(){
 var username = $(this).val();
 if(username==''){
 $(this).val('输入验证码');
 }
});
$(".sec_login_error").Validform({
	tiptype:function(msg,o,cssctl){
		var objtip=$(".sec_error_box");
		cssctl(objtip,o.type);
		objtip.text(msg);
	},
	ajaxPost:false
});
});
</script>
<script type="text/javascript">
$(function(){
	$(".screenbg ul li").each(function(){
		$(this).css("opacity","0");
	});
	$(".screenbg ul li:first").css("opacity","1");
	var index = 0;
	var t;
	var li = $(".screenbg ul li");	
	var number = li.size();
	function change(index){
		li.css("visibility","visible");
		li.eq(index).siblings().animate({opacity:0},3000);
		li.eq(index).animate({opacity:1},3000);
	}
	function show(){
		index = index + 1;
		if(index<=number-1){
			change(index);
		}else{
			index = 0;
			change(index);
		}
	}
	t = setInterval(show,8000);
	//根据窗口宽度生成图片宽度
	var width = $(window).width();
	$(".screenbg ul img").css("width",width+"px");
});
</script>
</head>	

<body>
	<div id="tab">
		<ul class="tab_menu">
			<li class="selected">管理员</li>
			<li>柜员</li>
		</ul>
		<div class="tab_box">
			<!-- 开始 -->
			<div>
				<div class="stu_error_box errormsg">
					<c:if test="${not empty signErrorMessage }">${signErrorMessage }</c:if>
				</div>
				<form action="${pageContext.request.contextPath }/com/login.action"
					method="post" class="stu_login_error">
					<input type="hidden" value="SysUser" name="logintype" />
					<div id="username">
						<label>账&nbsp;&nbsp;&nbsp;号：</label> <input type="text"
							id="stu_username_hide" name="loginid" value="admin"
							nullmsg="账号不能为空！" datatype="s2-18" errormsg="账号范围在2~18个字符之间！"
							sucmsg=" "  style="height:25px;" />
						<!--ajaxurl="demo/valid.jsp"-->
					</div>
					<div id="password">
						<label>密&nbsp;&nbsp;&nbsp;码：</label> <input type="password"
							id="stu_password_hide" name="password" value="123456"
							nullmsg="密码不能为空！" datatype="*6-16" errormsg="密码范围在6~16位之间！"
							sucmsg=" " style="height:25px;" />
					</div>
					<div id="code">
						<label>验证码：</label> <input type="text" id="stu_code_hide"
							name="checkcode" value="输入验证码" nullmsg="验证码不能为空！" datatype="*4-4"
							errormsg="验证码有4位数！" sucmsg=" " style="height:25px;" /> <img id="checkcode0"
							src="${pageContext.request.contextPath }/checkcode" title="点击更换"
							alt="验证码占位图"
							onclick="this.src = '${pageContext.request.contextPath }/checkcode?' + Math.random();" style="height:35px;" />
					</div>
					<div id="remember"></div>
					<div id="login">
						<button type="submit">登录</button>
					</div>
				</form>
			</div>
			<!-- 结束-->
			<!-- 开始-->
			<div class="hide">
				<div class="tea_error_box"></div>
				<form action="${pageContext.request.contextPath }/com/login.action"
					method="post" class="tea_login_error">
					<input type="hidden" value="SimpleUser" name="logintype" />
					<div id="username">
						<label>账&nbsp;&nbsp;&nbsp;户：</label> <input type="text" id="tea_username_hide"
							name="loginid"  value="jerry" nullmsg="账户名称不能为空！" datatype="s2-18"
							errormsg="账号范围在16~18个字符之间！" sucmsg=" " style="height:25px;"  />
						<!--ajaxurl="demo/valid.jsp"-->
					</div>
					<div id="password">
						<label>密&nbsp;&nbsp;&nbsp;码：</label> <input type="password"
							id="tea_password_hide" name="password" value="123456"
							nullmsg="密码不能为空！" datatype="*6-16" errormsg="密码范围在6~16位之间！"
							sucmsg=" " style="height:25px;" />
					</div>
					<div id="code">
						<label>验证码：</label> <input type="text" id="tea_code_hide"
							name="checkcode" value="输入验证码" nullmsg="验证码不能为空！" datatype="*4-4"
							errormsg="验证码有4位数！" sucmsg=" " style="height:25px;" /> <img id="checkcode1"
							src="${pageContext.request.contextPath }/checkcode" title="点击更换"
							alt="验证码占位图"
							onclick="this.src = '${pageContext.request.contextPath }/checkcode?'" style="height:35px;" />
					</div>
					<div id="remember"></div>
					<div id="login">
						<button type="submit">登录</button>
					</div>
				</form>
			</div>
			<!-- 结束-->
	</div>
	<div class="bottom" style="color:black">
		Copyright &copy; 2017<br />版权所有 河南理工大学 中国 河南焦作 高新区 世纪路2001号 [454000]
		豫ICP备05002483号 焦公网安备4108000002号
	</div>
	<div class="screenbg">
		<ul>
			<!-- 
			登陆背景图片轮播
			<li><a href="javascript:;"><img src="themes/login/0.jpg"></a></li>
			<li><a href="javascript:;"><img src="themes/login/1.jpg"></a></li>
			 -->
			<li><a href="javascript:;"><img src="themes/login/2.jpg"></a></li>
			<li><a href="javascript:;"><img src="themes/login/3.jpg"></a></li>
		</ul>
	</div>
	
	
</body>
</html>
<%session.removeAttribute("signErrorMessage"); %>
