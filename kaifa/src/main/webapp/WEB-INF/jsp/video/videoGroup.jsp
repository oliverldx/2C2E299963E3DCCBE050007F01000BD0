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
	<link rel="stylesheet" href="../easyui1.4/themes/metro/easyui.css" type="text/css"></link>
	<link rel="stylesheet" href="../JqueryUi/themes/icon.css" type="text/css"></link>
	<link rel="stylesheet" href="../JqueryUi/themes/demo.css" type="text/css"></link>
	<script type="text/javascript" src="../JqueryUi/js/jquery.min.js"></script> 
	<script type="text/javascript" src="../JqueryUi/js/jquery.easyui.min.js"></script> 
	<script type="text/javascript">
	
	</script>
	
	
</head>
<body >
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
                                <input type="text" ID="id" name="txtProvinceName" style="width:200px"  />
                            </td>
                            <td colspan="2">
                                <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="btnSearch"  onclick="secrch()">查询</a>
                            </td>
                          </tr>
                    </table>
                </div>
                
            </form>
        </fieldset>
        <table id="grid" style="width: 1366px" title="用户操作" iconcls="icon-view">    </table>
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
	
	
	
	
	<script type="text/javascript">
	//实现对DataGird控件的绑定操作
	
	 $(function(){
        $('#grid').datagrid({   //定位到Table标签，Table标签的ID是grid
            url: '../video/videoGroupJson.do',   //指向后台的Action来获取当前菜单的信息的Json格式的数据
            title: '视频分类',
            iconCls: 'icon-view',
            height: $(window).height()-35,
            width: $(window).width()-10,
            width: function () { return document.body.clientWidth * 0.9},
            nowrap: true,
            autoRowHeight: false,
            striped: true,
            collapsible: false,
            pagination: true,
            pageSize: 5,
            pageList: [1,5,10],
            loadMsg:'数据加载中！',
            rownumbers: true,
            //sortName: 'ID',    //根据某个字段给easyUI排序
            sortOrder: 'asc',
            remoteSort: false,
            idField: 'ID',
            columns: [[
                 { title: '分类ID', field: 'id', width: "15%"},
                 { title: '分类名称', field: 'name', width: "15%" },
                 { title: '创建者', field: 'creator', width:"15%"},
                 { title: '创建时间', field: 'created', width: "15%",
                	 formatter: function (value, row, index) {
                     return formatDate(row.ReturnTime);
                 }},
                 { title: '修改者', field: 'updator', width: "15%" },
                 { title: '修改时间', field: 'updated', width: "15%",
                	 formatter: function (value, row, index) {
                         return formatDate(row.ReturnTime);
                	 }
                  	 
                 }
                 
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
		                            $.post('../video/delateVideoGroup.do', { id: row.id }, function (result) {
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
	})
	;
	
	
	function ShowAddDialog(){
		$('#new').window('open');
		$("#name").val('');
	}
	
	function  save(){
		$.ajax({ 
	           type: "post", 
	           url: "../video/saveVideoGroup.do?name="+$("#name").val(), 
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
	           url: "../video/updateVideoGroup.do?name="+$("#nameu").val()+"&id="+$("#idu").val(), 
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
	
	function formatDate(str) {
	    if (str != null) {
	        return (new Date(parseInt(str.substring(str.indexOf('(') + 1, str.indexOf(')'))))).format("yyyy-MM-dd");
	    }

	}
	
	</script>
	
	
	
	
	
</body>
</html>
