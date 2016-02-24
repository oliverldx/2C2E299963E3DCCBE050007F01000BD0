<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%> 
<html>
<head>
	
	<title>年龄分类</title>
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
                                <label for="txtProvinceName">分类id：</label>
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
    
    <div id="new" class="easyui-dialog" title="新增" data-options="closed:true" style="width:450px;height:200px;padding:10px;">
		 <div class="easyui-layout" fit="true">
            <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
                <table cellpadding=3>
                    <tr>
                        <td>分类名称：</td>
                        <td><input id="name" type="text" class="txt01" /></td>
                    </tr>
                    
                </table>
            </div>
            <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
                <a id="btnEp" class="easyui-linkbutton" icon="icon-ok" onclick="save()" > 确定</a> 
                <a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" onclick="colse()">取消</a>
            </div>
        </div>
	</div>
	
	<div id="update" class="easyui-dialog" title="修改" data-options="closed:true" style="width:450px;height:200px;padding:10px;">
		 <div class="easyui-layout" fit="true">
            <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
                <table cellpadding=3>
                 <tr  style="display: none">
                        <td>分类名称：</td>
                        <td><input id="idu" type="text" class="txt01" /></td>
                    </tr>
                    <tr>
                        <td>分类名称：</td>
                        <td><input id="nameu" type="text" class="txt01" /></td>
                    </tr>
                    
                </table>
            </div>
            <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
                <a id="btnEp" class="easyui-linkbutton" icon="icon-ok" onclick="update()" > 确定</a> 
                <a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" onclick="colse()">取消</a>
            </div>
        </div>
	</div>
	
	<div id="show" class="easyui-dialog" title="修改" data-options="closed:true" style="width:450px;height:200px;padding:10px;">
		 <div class="easyui-layout" fit="true">
            <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
                <table cellpadding=3>
                    <tr>
                        <td>分类名称：</td>
                        <td><input id="names" type="text" class="txt01" /></td>
                    </tr>
                    
                </table>
            </div>
            <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
                
                <a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" onclick="colse()">取消</a>
            </div>
        </div>
	</div>
	
	<script type="text/javascript">
	document.getElementById('btnSearch').click();
	//实现对DataGird控件的绑定操作
    function InitGrid(queryData) {
        $('#grid').datagrid({   //定位到Table标签，Table标签的ID是grid
            url: '../video/videoAvgJson.do',   //指向后台的Action来获取当前菜单的信息的Json格式的数据
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
                 { title: '分类ID', field: 'id', width: "15%"},
                 { title: '分类名称', field: 'name', width: "15%" },
                 { title: '创建者', field: 'creator', width:"15%" },
                 { title: '创建时间', field: 'createDateString', width: "15%" },
                 { title: '修改者', field: 'updator', width: "15%" },
                 { title: '修改时间', field: 'updatedString', width: "15%" }
                 
            ]],
            toolbar: [{
                id: 'btnAdd',
                text: '添加',
                iconCls: 'icon-add',
                handler: function () {
                    ShowAddDialog();//实现添加记录的页面
                }
            }, '-', {
                id: 'btnEdit',
                text: '修改',
                iconCls: 'icon-edit',
                handler: function () {
                    //ShowEditOrViewDialog();//实现修改记录的方法
                    var row = $("#grid").datagrid("getSelected");
		            if (row) {
		                $("#update").dialog("open").dialog('setTitle', '修改');
		                $("#nameu").val(row.name);
		                $("#idu").val(row.id);
		            }else{
		            	alert("没有选择数据");
		            }
                }
            }, '-', {
                id: 'btnDelete',
                text: '删除',
                iconCls: 'icon-remove',
                handler: function () {
                    //Delete();//实现直接删除数据的方法
                    var row = $("#grid").datagrid("getSelected");
		            if (row) {
		                    $.messager.confirm('提示', '你确定要删除数据?', function (r) {
		                        if (r) {
		                            $.post('../video/delateVideoAvg.do', { id: row.id }, function (result) {
		                                if (result=="success") {
		                                    $('#grid').datagrid('reload');    // reload the user data  
		                                    alert("删除成功");
		                                } else {
		                                    $.messager.show({   // show error message  
		                                        title: 'Error',
		                                        msg: result.errorMsg
		                                    });
		                                    $('#grid').datagrid('reload');  
		                                }
		                            }, 'json');
		                        }
		                    });
		          
		               
		            }else{
		            	alert("没有选择数据");
		            }
                }
            }, '-', {
                id: 'btnView',
                text: '查看',
                iconCls: 'icon-large-smartart',
                handler: function () {
                	var row = $("#grid").datagrid("getSelected");
                    if (row) {
                        $("#show").dialog("open").dialog('setTitle', '查看');
                        $("#names").val(row.name);
                       
                        
                    }else{
                    	alert("没有选择数据");
                    }

                }
            }]
           
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
	
	function ShowAddDialog(){
		$('#new').window('open');
		$("#name").val('');
	}
	
	function  save(){
		$.ajax({ 
	           type: "post", 
	           url: "../video/saveVideoAvg.do?name="+$("#name").val(), 
	           dataType: "json", 
	           success: function (data) { 
	        	   alert("保存成功");
	                $("#grid").datagrid("reload");
	                $('#new').window('close');
	                                    }, 
	           error: function (XMLHttpRequest, textStatus, errorThrown) { 
	                                                alert(errorThrown); 
	                                        } 
	           });
	} 
	
	function  update(){
		$.ajax({ 
	           type: "post", 
	           url: "../video/updateVideoAvg.do?name="+$("#nameu").val()+"&id="+$("#idu").val(), 
	           dataType: "json", 
	           success: function (data) { 
	        	   alert("保存成功");
	                $("#grid").datagrid("reload");
	                $('#update').window('close');
	                                    }, 
	           error: function (XMLHttpRequest, textStatus, errorThrown) { 
	                                                alert(errorThrown); 
	                                        } 
	           });
	} 
	function colse(){
		$('#new').window('close');
		$('#update').window('close');
		$('#show').window('close');
	}
	</script>
	
	
	
	
	
</body>
</html>
