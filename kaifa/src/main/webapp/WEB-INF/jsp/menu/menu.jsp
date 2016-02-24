<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%> 
<html>
<head>
	
	<title>小小可爱后台管理</title>
	<link rel="stylesheet" href="../easyui1.4/css/default.css" type="text/css"></link>
	<link rel="stylesheet" href="../easyui1.4/themes/metro/easyui.css" type="text/css"></link>
	<link rel="stylesheet" href="../JqueryUi/js/themes/icon.css" type="text/css"></link>
	<script type="text/javascript" src="../JqueryUi/js/jquery-1.4.2.min.js"></script> 
	<script type="text/javascript" src="../JqueryUi/js/jquery.easyui.min-1.2.0.js"></script> 
	<script type="text/javascript" src='../JqueryUi/js/outlook.js'> </script>

 
<script type="text/javascript">

     
     
var _menus = {};
//同步获取
$.ajax({
    type: 'POST',
    url: '../menu/getMenuData.do',
    data : {},
	async : false,
	cache : false,
	dataType: "json",
    success: function (json) {
        _menus = json;
    },
    error: function () {
        alert("操作失败"); //
    }
});
    </script>
	
<Style>
#css3menu li{ float:left; list-style-type:none;
              
}
#css3menu li a{	color:#fff; padding-right:20px;font-size: 16px;}
#css3menu li a.active{color:yellow;}

#weclome li{ 
   float:right; list-style-type:none;
}

</style>	
</head>
<body class="easyui-layout" style="overflow-y: hidden"  scroll="no">
	<div region="north" split="true" border="false" style="overflow: hidden; height: 30px;
        background: url(../images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%;
        line-height: 20px;color: #fff; font-family: Verdana, 微软雅黑,黑体">
        

        <span style="padding-left:10px; font-size: 16px; float:left;"><img src="../images/blocks.gif" width="20" height="20" align="absmiddle" /> </span>
		<ul id="css3menu" style="padding:0px; margin:0px;list-type:none; float:left; margin-left:40px;">
				<li ><a class="active" name="basic" href="javascript:;" title="系统管理" >系统管理</a></li>
				<li><a name="point" href="javascript:;" title="视频管理">视频管理</a></li>
				<li><a name="education" href="javascript:;" title="教育资源管理">教育资源管理</a></li>
			</ul>
	  <ul id="weclome" style="padding:0px; margin:0px;list-type:none; float:right; margin-right:40px;">
				<li >欢迎&nbsp;<span style="font-size: 15px">test1老师&nbsp;</span>登陆小小可爱后台管理系统
				</li>
			</ul>
			
    </div>
    <div region="south" split="true" style="height: 30px; background: #D2E0F2; ">
        <div class="footer">By hzz </div>
    </div>
    
     <div region="west" hide="true" split="true" title="导航菜单" style="width:180px;" id="west">
		<div id='wnav' class="easyui-accordion" fit="true" border="false">
		<!--  导航内容 -->
		</div>
    </div>
	<div id="mainPanle" region="center" style="background: #eee; overflow-y:hidden">
        <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
			<div title="首页" style="padding:20px;overflow:hidden;" id="home">
				<h1>欢迎使用小小可爱后台管理系统!</h1>
			</div>
		</div>
    </div>
	
	
	
	
</body>
</html>
