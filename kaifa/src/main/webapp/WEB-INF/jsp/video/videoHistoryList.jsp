<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%> 
<html>
<head>
	
	<title>观看历史</title>
	<link rel="stylesheet" href="../JqueryUi/themes/default/easyui.css" type="text/css"></link>
	<link rel="stylesheet" href="../JqueryUi/themes/icon.css" type="text/css"></link>
	<link rel="stylesheet" href="../JqueryUi/themes/demo.css" type="text/css"></link>
	<script type="text/javascript" src="../JqueryUi/js/jquery.min.js"></script> 
	<script type="text/javascript" src="../JqueryUi/js/jquery.easyui.min.js"></script> 
	<script type="text/javascript">
	
	</script>
	
	
</head>
<body>
	<div id="tb" style="padding:5px;height:auto">
        <!-------------------------------搜索框----------------------------------->
        <fieldset>
            <legend>信息查询</legend>
            <form id="ffSearch" method="post">
                <div id="toolbar">
                    <table cellspacing="0" cellpadding="0">
                        <tr>
                             <th>
                                <label for="txtProvinceName">id：</label>
                            </th>
                            <td>
                                <input type="text" ID="id" name="txtProvinceName" style="width:100px"  />
                            </td>
                            
                            <td colspan="2">
                                <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="btnSearch"  onclick="secrch()">查询</a>
                                
                            </td>
                          </tr>
                    </table>
                </div>
            </form>
        </fieldset>
        <table id="grid" style="width: 1024px" title="" iconcls="icon-view">            
            </table>
    </div>
    
	
	<script type="text/javascript">
	document.getElementById('btnSearch').click();
	//实现对DataGird控件的绑定操作
    function InitGrid(queryData) {
    	
        $('#grid').datagrid({   //定位到Table标签，Table标签的ID是grid
            url: '../video/videoHistoryVoJson.do',   //指向后台的Action来获取当前菜单的信息的Json格式的数据
           // title: '年龄分类',
            iconCls: 'icon-view',
            height: 400,
            width: function () { return document.body.clientWidth * 0.9 },
            nowrap: true,
            autoRowHeight: false,
            striped: true,
            collapsible: false,
            pagination: true,
            pageSize: 5,
            pageList: [1,5,10],
            rownumbers: true,
            singleSelect:true,
            //sortName: 'ID',    //根据某个字段给easyUI排序
            sortOrder: 'asc',
            remoteSort: false,
            idField: 'ID',
            queryParams: queryData,  //异步查询的参数
            columns: [[
                 { title: '观看历史ID', field: 'id', width: "25%"},
                 { title: '视频ID', field: 'videoID', width: "25%" },
                 { title: '用户ID', field: 'userID', width:"25%" },
                 { title: '创建时间', field: 'created_string', width: "25%" }
                 
            ]]
           
        })
	};
	function  secrch(){
		//按条件进行查询数据，首先我们得到数据的值
        $("#btnSearch").click(function () {
            //得到用户输入的参数，取值有几种方式：$("#id").combobox('getValue'), $("#id").datebox('getValue'), $("#id").val()
            //字段增加WHC_前缀字符，避免传递如URL这样的Request关键字冲突
            var queryData = {
            		id: $("#id").val()
            }
            InitGrid(queryData);
            return false;
        });
		
	}
	
	
	</script>
	
	
	
	
	
</body>
</html>
