<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%> 
<html>
<head>
	
	<title>管理视频</title>
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
                                <label for="txtProvinceName">视频类型：</label>
                            </th>
                            <td>
                                <input type="text" ID="id" name="txtProvinceName" style="width:100px"  />
                            </td>
                             <th>
                                <label for="txtProvinceName">年龄段：</label>
                            </th>
                            <td>
                               <input id="avgid" class="easyui-combobox" name="dept"   data-options="valueField:'id',textField:'name',url:'../video/VideoAvgCombobox.do'" /> 
                            </td>
                            <th>
                                <label for="txtProvinceName">时间：</label>
                            </th>
                            <td>
                            <input id="dd" type="text" class="easyui-datebox" ></input>  
                            
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
    
    <div id="new" class="easyui-dialog" title="新增" data-options="closed:true" style="width:650px;height:400px;padding:10px;">
		 <div class="easyui-layout" fit="true">
            <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
            <form method="post" id="letvform" enctype="multipart/form-data" action="../video/upload.do">
                <table border="1">
                 <tr>
                    	<td>视频</td>
                        <td colspan="3"><input  id="letv"  type="file" name="letv" size="50"></td>
                    </tr>
                    <tr>
                    
                        <td>视频类型</td>
                        <td ><select id="groupID" class="easyui-combobox" name="groupID" style="width:200px;">   
							    <option value="1">groupID1</option>   
							    <option value="2">groupID2</option> 
							    <option value="3">groupID3</option> 
							    <option value="4">groupID4</option>  
							    <option value="5">groupID5</option>   
							</select> </td>
                         <td>年龄段 </td>
                        <td ><select id="avgID" class="easyui-combobox" name="avgID" style="width:200px;">   
							    <option value="1">avgID1</option>   
							    <option value="2">avgID2</option> 
							    <option value="3">avgID3</option> 
							    <option value="4">avgID4</option>  
							    <option value="5">avgID5</option>   
							</select></td>
                    </tr>
                    <tr>
                        <td>标题</td>
                        <td><input class="easyui-validatebox"  id="Name3" name="Name" style="width:99%;margin:2px;"/></td>
                         <td>视频关键字 </td>
                        <td><input class="easyui-validatebox"  id="Name4" name="Name" style="width:99%;margin:2px;" /></td>
                    </tr>
                    <tr>
                       
                    </tr>
                    <tr >
                        <td>视频简介 </td>
                        <td colspan="3"><textarea rows="" cols="4" style="width:99%;margin:2px;"></textarea></td>
                    </tr>
                    <tr>
                        <td>下载所需积分</td>
                        <td><input class="easyui-combobox"  id="Name6" name="Name" /></td>
                        <td>下载所属群组 </td>
                        <td><input class="easyui-combobox"  id="Name7" name="Name" /></td>
                    </tr>
                   
                    
                </table>
                <input type="submit" id="tj" style="display: none;"/>
                </form>
            </div>
            
            <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
                <a id="btnEp" class="easyui-linkbutton" icon="icon-ok" onclick="save()" > 确定</a> 
                <a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" onclick="colse()">取消</a>
            </div>
        </div>
	</div>
	
	
	
	
	
	<script type="text/javascript">
	document.getElementById('btnSearch').click();
	//实现对DataGird控件的绑定操作
    function InitGrid(queryData) {
        $('#grid').datagrid({   //定位到Table标签，Table标签的ID是grid
            url: '../video/videoVoJson.do',   //指向后台的Action来获取当前菜单的信息的Json格式的数据
           // title: '年龄分类',
            iconCls: 'icon-view',
            height: $(window).height()-35,
            width: $(window).width()-10,
            width: function () { return document.body.clientWidth * 0.9 },
            nowrap: true,
            autoRowHeight: false,
            striped: true,
            collapsible: false,
            pagination: true,
            pageSize: 5,
            pageList: [1,5,10],
            loadMsg:"数据正在加载。。。",
            rownumbers: true,
            singleSelect:true,
            //sortName: 'ID',    //根据某个字段给easyUI排序
            sortOrder: 'asc',
            remoteSort: false,
            idField: 'ID',
            queryParams: queryData,  //异步查询的参数
            columns: [[
                 { title: '视频分类', field: 'groupID', width: "15%"},
                 { title: '年龄分类', field: 'avgIDMc', width: "15%" },
                 { title: '标题', field: 'title', width:"15%" },
                 { title: '视频关键字', field: 'keywords', width: "15%" },
                 { title: '视频简介', field: 'content', width: "15%" },
                 { title: '下载所需积分', field: 'creditXlID', width: "15%" },
                 { title: '下载所属群组', field: 'laodID', width: "15%" }
                 
            ]],
            toolbar: [{
                id: 'btnAdd',
                text: '添加',
                iconCls: 'icon-add',
                handler: function () {
                	$('#new').window('open');//实现添加记录的页面
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
	
	function  save(){
		alert("aa");
		var targetForm = document.forms[ "lstvform" ];
		targetForm.submit();
		 
	//	alert(document.getElementById("letv").value );
		
	/* 	return;
		$.ajax({ 
	           type: "post", 
	           url: "../video/uploadFile.do?letv="+$("#letv").val(), 
	           dataType: "json", 
	           data: '',
	           success: function (data) { 
	        	   alert("保存成功");
	                $("#grid").datagrid("reload");
	                $('#new').window('close');
	                                    }, 
	                               
	           error: function (XMLHttpRequest, textStatus, errorThrown) { 
	                                                alert(errorThrown); 
	                                        } 
	           }); */
	} 
	
	</script>
	
	
	
	
	
</body>
</html>
