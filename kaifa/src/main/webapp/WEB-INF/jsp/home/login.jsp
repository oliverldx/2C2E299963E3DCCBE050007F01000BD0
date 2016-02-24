<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>仓库管理系统</title>
<link rel="stylesheet" href="<c:url value="/easyui/themes/default/easyui.css"/>" type="text/css" media="screen" />
<link rel="stylesheet" href="<c:url value="/easyui/themes/icon.css"/>" type="text/css" media="screen" />
<link rel="stylesheet" href="<c:url value="/css/main.css"/>" type="text/css" media="screen" />
<script src="<c:url value="/easyui/jquery-1.6.2.min.js"/>"></script>
<script src="<c:url value="/easyui/jquery.easyui.min.js"/>"></script>
<script src="<c:url value="/easyui/locale/easyui-lang-zh_CN.js"/>"></script>
<script type="text/javascript">  
    $(document).ready(function(){ 
    	$.post("${pageContext.request.contextPath}/home/checkIsLogin.do",{},function(data){
    		if(data.isLogin == false){
    		       var status = '${status}';
    		       if(status && status=='fail') {
    		    	   alert('${statusMsg}');
    		    	   status=null;
    		       }
    		}
    	});
    });  
</script>  
<script type="text/javascript">
function formSubmit() {
	if(!$("#loginName").val()) {
		alert("请输入用户名");
		return;
	}
	if(!$("#password").val()) {
		alert("请输入密码");
		return;
	}
	if(!$("#captcha_key1").val()) {
		alert("请输入验证码");
		return;
	}
	$("#mainForm").submit();
}
</script>	
<script type="text/javascript">
	function captcha1_0() {
		var $input = $("#captcha_key1");
		var $img = $("img", $("#captcha_div1")).first();
		if ($img.attr("src") == "") {
			$img.attr("src", "${pageContext.request.contextPath}/captcha.jpg?n=" + Math.random());
		}
		if($("#box-tab02").css("display")=="block"){
			$("#captcha_div1").show().css("left", $input.offset().left).css("top",
					$input.offset().top + $input.height() +3);
		} else {
			$("#captcha_div1").show().css("left", $input.offset().left + $input.width()+8).css("top",
					$input.offset().top);
		}
		window.clearTimeout(window.captchaTimer);
	}
	function captcha1_1() {
		window.captchaTimer = window.setTimeout(function() {
			$("#captcha_div1").hide();
		}, 100);
	}
	function captcha1_2() {
		$('#captcha_key1').focus();
		$("img", $("#captcha_div1")).first().attr("src",
				"${pageContext.request.contextPath}/captcha.jpg?n=" + Math.random());
	}
</script>
</head>
<body style="visibility:visible">
	<div class="easyui-dialog" style="width:500px;height:300px;background:#fafafa;overflow:hidden"
			title="登录系统" closable="false" border="false">
		<div class="header" style="height:60px;">
			<div class="toptitle">仓库管理系统</div>
		</div>
		<div style="padding:60px 0;">
			<form action="<c:url value='/home/login'/>" method="post">
				<div style="padding-left:150px">
					<table cellpadding="0" cellspacing="3">
						<tr>
							<td>登录帐号</td>
							<td><input type="text" name="loginName" id="loginName"/></td>
						</tr>
						<tr>
							<td>登录密码</td>
							<td><input type="password" name="password" id="password" /></td>
						</tr>
						<tr>
				            <td align="right">验证码：</td>
				            <td>
				            	<table width="100%" border="0" cellspacing="0" cellpadding="0">
					              <tr>
					                <td width="120">
					                	<input type="text" name="captcha" id="captcha_key1"
											tabindex="10" maxlength="4" tabindex="3"
											style="width: 70px" onfocus="captcha1_0();"
											onblur="captcha1_1()"
											onkeypress="if (window.event.keyCode == 13) {formSubmit();}" />
										<div id="captcha_div1" style="display: none; position: absolute; border: 1px solid blue; padding: 2px; background-color: #FFF">
											<img border="0" onclick="captcha1_2();" src="" />
					                </td>
					                <td width="80"></td>
					                <td style="color:#CCC; font-size:12p;"></td>
					                </tr>
					              </table>
				              </td>
				          </tr>
						<tr>
							<td></td>
							<td>
								<input class="login" type="submit" value="" style="width:74px;height:21px;border:0" />
							</td>
						</tr>
					</table>
				</div>
				
			</form>
		</div>
	</div>
</body>
</html>