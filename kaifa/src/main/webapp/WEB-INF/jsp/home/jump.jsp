<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>小小可爱后台管理系统</title>
<script src="<c:url value="/easyui/jquery-1.6.2.min.js"/>"></script>
<script type="text/javascript">
	$(document).ready(function(){ 
    	$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/home/jumpAjax.do",
			data : {},
			async : false,
			cache : false,
			dataType: "json",
			success : function(result, textStatus){
				window.location.href = result.url;
				}
		});
    }); 
	
</script>
</head>
<body>
</body>
</html>
