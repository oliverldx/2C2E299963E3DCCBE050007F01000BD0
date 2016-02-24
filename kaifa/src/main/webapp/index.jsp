<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="common.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <title>后台页面</title>
     <link rel="stylesheet" type="text/css" href="${path}/js/themes/gray/easyui.css" id="swicth-style">
	<script type="text/javascript" src="${path}/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="${path}/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${path}/js/easyloader.js"></script>
	<link rel="stylesheet" type="text/css" href="${path}/js/themes/icon.css">
	<script type="text/javascript" src="${path}/js/test.js"></script>
	<link  rel="stylesheet" href="${path}/css/default.css" type="text/css" />
  	 <script type="text/javascript">
	 var _menus = {"menus":[
						{"menuid":"1","icon":"icon-sys","menuname":"测试数据",
							"menus":[
									{"menuid":"13","menuname":"用户管理","icon":"icon-users","url":"${path}/hl/test.jsp"},
									{"menuid":"14","menuname":"角色管理","icon":"icon-role","url":"${path}/hl/test.jsp"},
									{"menuid":"15","menuname":"权限设置","icon":"icon-set","url":"${path}/hl/test.jsp"},
									{"menuid":"16","menuname":"系统日志","icon":"icon-log","url":"${path}/hl/test.jsp"}
								]
						}
				]};
    </script>
</head>

<body class="easyui-layout" style="overflow-y: hidden"  scroll="no">
<noscript>
<div style=" position:absolute; z-index:100000; height:2046px;top:0px;left:0px; width:100%; background:white; text-align:center;">
    <img src="images/noscript.gif" alt='抱歉，请开启脚本支持！' />
</div></noscript>
	   <div region="north" title="用户登陆" split="true" style="height:60px;">
	   		<span style="font-family: 黑体;color: blue; text-align: center;"> 
		   		欢迎${userinfo.userName}登陆红利商城后台，现在时间是：
		   		<%=new Date() %> 
	   		</span>
	   		
    </div>
       <div region="south" title="广告信息" split="true" style="height:60px;">
        <span style="font-family: 黑体;color: blue; text-align: center;">广告招商电话：110120112</span>
    </div>
    <div region="west" hide="true" split="true" title="导航菜单" style="width:180px;" id="west">
	<div id="nav" class="easyui-accordion" fit="true" border="false">
	<privilege:enable operateID="用户管理">
		  <div title="用户管理" iconCls="icon-reload" style="overflow:auto;padding:10px;" border="false">  
       			<ul class="navlist">
			<li>
			<privilege:enable operateID="新增用户">
				<div >
				<a ref="1" href="#" rel="${path}/hl/test.jsp">
				<span class="icon icon-users">&nbsp;</span>
				<span class="nav">新增用户</span></a>
				</div>
			</privilege:enable>
			<privilege:enable operateID="修改用户">
				<div >
				<a ref="2" href="#" rel="${path}/hl/test.jsp">
				<span class="icon icon-users">&nbsp;</span>
				<span class="nav">修改用户</span></a>
				</div>
			</privilege:enable>
			<privilege:enable operateID="删除用户">
				<div >
				<a ref="3" href="#" rel="${path}/hl/test.jsp">
				<span class="icon icon-users">&nbsp;</span>
				<span class="nav">删除用户</span></a>
				</div>
			</privilege:enable>
			<privilege:enable operateID="查询用户">
				<div >
				<a ref="3" href="#" rel="${path}/hl/userInfoList.jsp">
				<span class="icon icon-users">&nbsp;</span>
				<span class="nav">查询用户</span></a>
				</div>
			</privilege:enable>
			</li>
		</ul>	
    	</div>  
    </privilege:enable>
    <privilege:enable operateID="商品管理">
		  <div title="商品管理" iconCls="icon-reload" style="overflow:auto;padding:10px;" border="false">  
       			<ul class="navlist">
			<li>
			<privilege:enable operateID="新增商品">
				<div >
				<a ref="1" href="#" rel="${path}/hl/test.jsp">
				<span class="icon icon-sys">&nbsp;</span>
				<span class="nav">新增商品</span></a>
				</div>
			</privilege:enable>
			<privilege:enable operateID="修改商品">
				<div >
				<a ref="3" href="#" rel="${path}/hl/test.jsp">
				<span class="icon icon-sys">&nbsp;</span>
				<span class="nav">修改商品</span></a>
				</div>
			</privilege:enable>
					<privilege:enable operateID="查询商品">
				<div >
				<a ref="4" href="#" rel="${path}/hl/test.jsp">
				<span class="icon icon-sys">&nbsp;</span>
				<span class="nav">查询商品</span></a>
				</div>
			</privilege:enable>
					<privilege:enable operateID="删除商品">
				<div >
				<a ref="5" href="#" rel="${path}/hl/test.jsp">
				<span class="icon icon-sys">&nbsp;</span>
				<span class="nav">删除商品</span></a>
				</div>
			</privilege:enable>
			</li>
		</ul>	
    	</div>  
    </privilege:enable>	
	    <privilege:enable operateID="系统管理">
		  <div title="系统管理" iconCls="icon-reload" style="overflow:auto;padding:10px;" border="false">  
       			<ul class="navlist">
			<li>
			<privilege:enable operateID="角色管理">
				<div >
				<a ref="1" href="#" rel="${path}/hl/roleManage.jsp">
				<span class="icon icon-users">&nbsp;</span>
				<span class="nav">角色管理</span></a>
				</div>
			</privilege:enable>
			<privilege:enable operateID="权限设置">
				<div >
				<a ref="3" href="#" rel="${path}/hl/funManager.jsp">
				<span class="icon icon-set">&nbsp;</span>
				<span class="nav">权限设置</span></a>
				</div>
			</privilege:enable>	
			</li>
		</ul>	
    	</div>  
    </privilege:enable>	
	</div>

    </div>
      <div id="mainPanle" region="center" style="background: #eee; overflow-y:hidden">
        <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
			<div title="欢迎使用" style="padding:20px;overflow:hidden; color:red; " >
				<h1 style="font-size:24px;">测试</h1>
		<h1 style="font-size:24px;">红利商城 </h1>
		<h1 style="font-size:24px;">成员：javen,wish,meng,hong,shadwo</h1>
				<h1 style="font-size:24px;">毕业项目</h1>
			</div>
		</div>
    </div>
    
<div id="mm" class="easyui-menu" style="width:150px;">
         <div id="refresh">刷新</div>
         <div class="menu-sep"></div>
         <div id="close">关闭</div>
         <div id="closeall">全部关闭</div>
         <div id="closeother">除此之外全部关闭</div>
         <div class="menu-sep"></div>
         <div id="closeright">当前页右侧全部关闭</div>
         <div id="closeleft">当前页左侧全部关闭</div>
         <div class="menu-sep"></div>
         <div id="exit">退出</div>
 </div>
    
</body>
</html>

