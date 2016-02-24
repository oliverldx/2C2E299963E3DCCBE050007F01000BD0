<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="utf-8">
<title>小小可爱后台管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/login/css/supersized.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/login/css/login.css">
<link href="${pageContext.request.contextPath}/login/css/bootstrap.min.css" rel="stylesheet">
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
	<script src="${pageContext.request.contextPath}/login/js/html5.js"></script>
<![endif]-->
<script type="text/javascript">  
var webContext='${pageContext.request.contextPath}';
var loginContext=webContext+'/login/';
</script>
<script src="${pageContext.request.contextPath}/login/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/login/js/jquery.form.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/login/js/tooltips.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/login/js/login.js"></script>
<script src="${pageContext.request.contextPath}/login/js/supersized.3.2.7.min.js"></script>
<script src="${pageContext.request.contextPath}/login/js/supersized-init.js"></script>
<script src="${pageContext.request.contextPath}/login/js/scripts.js"></script>
<script type="text/javascript">  
    $(document).ready(function(){ 
    	$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/home/checkIsLogin.do",
			data : {},
			async : false,
			cache : false,
			dataType: "json",
			success : function(result, textStatus){
		    		if(result.isLogin == false){
		    		       var status = '${status}';
		    		       if(status && status=='fail') {
		    		    	   //alert('${statusMsg}');
		    		    	   show_err_msg('${statusMsg}');
		    		    	   status=null;
		    		       }
		    		}
				}
		});
    	captcha();
    }); 
    function captcha() {
    	$("#captcha_img").attr("src","${pageContext.request.contextPath}/captcha.jpg?n=" + Math.random());
    }
</script>  
</head>
<body background="${pageContext.request.contextPath}/login/images/backgrounds/0.jpg">
<form id="mainForm" action="<%=request.getContextPath()%>/home/login.do" method="post">
<div class="page-container">
	<div class="main_box">
		<div class="login_box">
			<div class="login_logo">
				<img src="${pageContext.request.contextPath}/login/images/logo.png" >
			</div>
		
			<div class="login_form">
				<form action="index.html" id="login_form" method="post" >
					<div class="form-group">
						<label for="j_username" class="t">用户名：</label> 
						<input id="loginName"  name="loginName" type="text" value="test1" class="form-control x319 in" 
						autocomplete="off">
					</div>
					<div class="form-group">
						<label for="j_password" class="t">密　码：</label> 
						<input id="password"  name="password" type="password" value="123456"
						class="password form-control x319 in">
					</div>
					<div class="form-group">
						<label for="j_captcha" class="t">验证码：</label>
						 <input id="captcha_key1" name="captcha" type="text" class="form-control x164 in">
						<img id="captcha_img" onclick="captcha();" alt="点击更换" title="点击更换"  class="m">
					</div>
					<!-- <div class="form-group">
						<label class="t"></label>
						<label for="j_remember" class="m">
						<input id="j_remember" type="checkbox" value="true">&nbsp;记住登陆账号!</label>
					</div> -->
					<div class="form-group space">
						<label class="t"></label>　　　
						<button type="button"  id="submit_btn" 
						class="btn btn-primary btn-lg">&nbsp;登&nbsp;录&nbsp; </button>
						<input type="reset" value="&nbsp;重&nbsp;置&nbsp;" class="btn btn-default btn-lg">
					</div>
				</form>
			</div>
		</div>
		<div class="bottom">Copyright &copy; 2014 - 2015 </div>
	</div>
</div>
</form>
</body>
</html>