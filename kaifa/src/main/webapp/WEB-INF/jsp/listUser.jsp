<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%> 
<html>
<head>
	
	<title>用户列表</title>
	<link rel="stylesheet" href="../JqueryUi/themes/default/easyui.css" type="text/css"></link>
	<link rel="stylesheet" href="../JqueryUi/themes/icon.css" type="text/css"></link>
	<link rel="stylesheet" href="../JqueryUi/themes/demo.css" type="text/css"></link>
	<script type="text/javascript" src="../JqueryUi/js/jquery.min.js"></script> 
	<script type="text/javascript" src="../JqueryUi/js/jquery.easyui.min.js"></script> 
	<script type="text/javascript" src='../JqueryUi/js/outlook.js'> </script>
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
        <table id="dg" title="用户列表" class="easyui-datagrid" style="height:400px"
        data-options="
        		url:'../user/listJson.do',   
				rownumbers:true,
				singleSelect:true,
				autoRowHeight:true,
				pagination:true,
				toolbar:toolbar
				">
		<thead> 
			<tr>  
                <th field="id" width="25%">id</th>  
                <th field="userName" width="25%">名字</th>  
                <th field="password" width="25%">密码</th>  
                <th field="age" width="25%">年龄</th>  
        	</tr>   
		</thead> 
</table>
    </div>
	
	
	<div id="w" class="easyui-dialog" title="新增" data-options="closed:true" style="width:500px;height:300px;padding:10px;">
		 <div class="easyui-layout" fit="true">
            <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
                <table cellpadding=3>
                    <tr>
                        <td>id：</td>
                        <td><input id="id" type="text" class="txt01" /></td>
                    </tr>
                    <tr>
                        <td>名字：</td>
                        <td><input id="userName" type="text" class="txt01" /></td>
                    </tr>
                    <tr>
                        <td>密码：</td>
                        <td><input id="password" type="text" class="txt01" /></td>
                    </tr>
                    <tr>
                        <td>年龄：</td>
                        <td><input id="age" type="text" class="txt01" /></td>
                    </tr>
                </table>
            </div>
            <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
                <a id="btnEp" class="easyui-linkbutton" icon="icon-ok" onclick="save()" >
                    确定</a> <a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" onclick="colse()">取消</a>
            </div>
        </div>
	</div>
	
	<div id="u" class="easyui-dialog" title="修改" data-options="closed:true" style="width:500px;height:300px;padding:10px;">
		 <div class="easyui-layout" fit="true">
            <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
                <table cellpadding=3>
                    <tr>
                        <td>id：</td>
                        <td><input id="idu" type="text" class="txt01" /></td>
                    </tr>
                    <tr>
                        <td>名字：</td>
                        <td><input id="userNameu" type="text" class="txt01" /></td>
                    </tr>
                    <tr>
                        <td>密码：</td>
                        <td><input id="passwordu" type="text" class="txt01" /></td>
                    </tr>
                    <tr>
                        <td>年龄：</td>
                        <td><input id="ageu" type="text" class="txt01" /></td>
                    </tr>
                </table>
            </div>
            <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
                <a id="btnEpu" class="easyui-linkbutton" icon="icon-ok" onclick="update()" >
                    确定</a> <a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" onclick="updatecolse()">取消</a>
            </div>
        </div>
	</div>
	
	
	<script type="text/javascript">
	
	
	 

	
	
	var toolbar = [{
		text:'新增',
		iconCls:'icon-add',
		handler:function(){
		newwindow();
		}
	}, '-', {
        id: 'btnEdit',
        text: '修改',
        iconCls: 'icon-edit',
        handler: function () {
        	var row = $("#dg").datagrid("getSelected");
            if (row) {
                $("#u").dialog("open").dialog('setTitle', '修改');
                $("#idu").val(row.id);
                $("#userNameu").val(row.userName);
                $("#passwordu").val(row.password);
                $("#ageu").val(row.age);
                $("#btnEpu").show();
                
            }else{
            	alert("没有选择数据");
            }

        }
    }, '-', {
        id: 'btnDelete',
        text: '删除',
        iconCls: 'icon-remove',
        handler: function () {
        	var row = $("#dg").datagrid("getSelected");
            if (row) {
            	
                    $.messager.confirm('提示', '你确定要删除数据?', function (r) {
                        if (r) {
                            $.post('../user/delateUser.do', { userId: row.id }, function (result) {
                                if (result=="success") {
                                    $('#dg').datagrid('reload');    // reload the user data  
                                    alert("删除成功");
                                } else {
                                    $.messager.show({   // show error message  
                                        title: 'Error',
                                        msg: result.errorMsg
                                    });
                                    $('#dg').datagrid('reload');  
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
        	var row = $("#dg").datagrid("getSelected");
            if (row) {
                $("#w").dialog("open").dialog('setTitle', '查看');
                $("#id").val(row.id);
                $("#userName").val(row.userName);
                $("#password").val(row.password);
                $("#age").val(row.age);
                $("#btnEp").hide();
                
            }else{
            	alert("没有选择数据");
            }

        }
    }];
	
	function newwindow(){
		$('#w').window('open');
		$("#id").val('');
        $("#userName").val('');
        $("#password").val('');
        $("#age").val('');
        $("#btnEp").show();
	}
	function colse(){
		$('#w').window('close');
	}
	function updatecolse(){
		$('#u').window('close');
	}
	function  secrch(){
		$.ajax({ 
	           type: "post", 
	           url: "../user/listJsonSeach.do?id="+$("#id").val(), 
	           dataType: "json", 
	           success: function (data) { 
	        	   //$('#dg').datagrid(data).datagrid('clientPaging');
	                $("#dg").datagrid("reload");
	                                    }, 
	                    error: function (XMLHttpRequest, textStatus, errorThrown) { 
	                                                alert(errorThrown); 
	                                        } 
	                                });
		
		
	}
	
	
	
	function  save(){
		$.ajax({ 
	           type: "post", 
	           url: "../user/saveUser.do?id="+$("#id").val()+"&userName="+$("#userName").val()+"&password="+$("#password").val()+"&age="+$("#age").val(), 
	           dataType: "json", 
	           success: function (data) { 
	        	   alert("保存成功");
	                $("#dg").datagrid("reload");
	                $('#w').window('close');
	                                    }, 
	                    error: function (XMLHttpRequest, textStatus, errorThrown) { 
	                                                alert(errorThrown); 
	                                        } 
	                                });
		
		
	} 
	
	function  update(){
		$.ajax({ 
	           type: "post", 
	           url: "../user/updateUser.do?id="+$("#idu").val()+"&userName="+$("#userNameu").val()+"&password="+$("#passwordu").val()+"&age="+$("#ageu").val(), 
	           dataType: "json", 
	           success: function (data) { 
	        	   alert("修改成功");
	                $("#dg").datagrid("reload");
	                $('#u').window('close');
	                                    }, 
	                    error: function (XMLHttpRequest, textStatus, errorThrown) { 
	                                                alert(errorThrown); 
	                                        } 
	                                });
		
		
	} 
	</script>
	
	
	
	
	
</body>
</html>
