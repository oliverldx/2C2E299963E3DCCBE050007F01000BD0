<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>小小可爱后台管理</title>
<link rel="stylesheet" type="text/css"
	href="../easyui1.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="../easyui1.4/themes/icon.css">
<script type="text/javascript" src="../easyui1.4/jquery.min.js"></script>
<script type="text/javascript" src="../easyui1.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../easyui1.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../js/common/DateFomatter.js"></script>
</head>
<body>
	<table id="tt" class="easyui-datagrid"
		style="width: 100%; height: 400px" title="Load Data" iconCls="icon-ok" 
		pagination="true" 
		data-options="idField:'userCode',rownumbers:true,singleSelect:true,selectOnCheck:false,checkOnSelect:false,url:'../user/loadUser.do',method:'get',toolbar:'#tb'">
		<thead>
			<tr>
				<th data-options="field:'userCode',checkbox:true"></th>
				<th field="userName" width="20%" data-options="editor:'textbox'">用户名称</th>
				<th field="job" width="16%" data-options="editor:'textbox'">用户职责</th>
				<th width="16%" data-options="field:'sex',align:'right',formatter:formatSex,editor:{type:'combobox',options:{valueField:'value',textField:'name',data:sexs,required:true,panelHeight:'50px'}}">性别</th>
				<th width="16%" data-options="field:'enterGroupDate',align:'right',formatter:formatDatebox,editor:'datebox'">进入学校时间</th>
				<th width="16%" data-options="field:'leaveGroupDate',align:'right',formatter:formatDatebox,editor:'datebox'">离开学校时间</th>
				<th field="contact" width="16%" data-options="editor:'textbox'">联系方式</th>
			</tr>
		</thead>
	</table>
	 <div id="tb" style="padding:2px 5px;">
		 <div  style="padding:2px 5px;margin-bottom:5px;border-bottom: 1px solid #dddddd;">
	        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="preCreate();">增加</a>
	        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="edit()">修改</a>
	        <a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="save()">保存</a>
	        <a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="cancel()">取消</a>
	        <a href="#" class="easyui-linkbutton" iconCls="icon-ok" plain="true" onclick="addUserRole();">配置角色</a>
	        <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="remove();">删除</a>
	    </div>
	    <div>
	        Date From: <input class="easyui-datebox" style="width:110px">
	        To: <input class="easyui-datebox" style="width:110px">
	        Language: 
	        <select class="easyui-combobox" panelHeight="auto" style="width:100px">
	            <option value="java">Java</option>
	            <option value="c">C</option>
	            <option value="basic">Basic</option>
	            <option value="perl">Perl</option>
	            <option value="python">Python</option>
	        </select>
	        <a href="#" class="easyui-linkbutton" iconCls="icon-search">Search</a>
        </div>
    </div>
    <div id="new" class="easyui-dialog" title="新增" data-options="closed:true" style="width:600px;height:300px;padding:10px;">
			 <div class="easyui-layout" fit="true">
    				<form id="userForm" action="?">
	            		<div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
		                	<table cellpadding=3>
			                    <tr>
			                        <td>用户名称：</td>
			                        <td><input id="userName" name="userName" type="text" class="txt01" /></td>
			                        <td>职责：</td>
			                        <td>
			                        	<input id="job" name="job" />
			                        	<input id="isEnable" name="isEnable" type="hidden" />
			                        </td>
			                    </tr>
			                    <tr>
			                    	<td>职责代码：</td>
			                        <td><input id="jobCode" name="jobCode" type="text" class="txt01" /></td>
			                        <td>性别：</td>
			                        <td>
			                        	<select name="sex">
			                        		<option value="1">男</option>
			                        		<option value="0">女</option>
			                        	</select>
			                        </td>
			                    </tr>
			                    <tr>
			                    	<td>邮件：</td>
			                        <td><input id="email" name="email" type="text" class="txt01" /></td>
			                        <td>联系方式：</td>
			                        <td>
			                        	<input id="contact" name="contact" />
			                        </td>
			                    </tr>
			                    <tr>
			                    	<td>进入学校时间：</td>
			                        <td><input id="enterGroupDate" name="enterGroupDate" class="easyui-datebox" /></td>
			                        <td>离开学校时间：</td>
			                        <td>
			                        	<input id="leaveGroupDate" name="leaveGroupDate" class="easyui-datebox" />
			                        </td>
			                    </tr>
			                </table>
			            </div>
			            <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
			                <a id="btnEp" class="easyui-linkbutton" icon="icon-ok" onclick="create()" > 确定</a> 
			                <a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" onclick="closeDialog('new');">取消</a>
			            </div>
					</form>
        	</div>
	</div>
	<div id="addUserRole" class="easyui-dialog" data-options="closed:true" style="width:550px;height:450px;padding:5px">
		<input id="selectUserCode" name="selectUserCode" type="hidden" />
		<table id="userRoleTable" class="easyui-datagrid"
			style="width: 90%; height: 450px" title="Load Data" iconCls="icon-ok" 
			pagination="true" 
			data-options="idField:'roleCode',rownumbers:true,singleSelect:true,selectOnCheck:false,checkOnSelect:false,url:'../role/loadRole.do',method:'get',toolbar:'#userCodeTb'">
			<thead>
				<tr>
					<th width="10%" data-options="field:'roleCode',checkbox:true"></th>
					<th field="roleName" width="45%" data-options="editor:'textbox'">角色名称</th>
					<th field="roleJobDesc" width="45%" data-options="editor:'textbox'">角色描述</th>
				</tr>
			</thead>
		</table>
		<div id="userCodeTb" style="padding:2px 5px;">
		 <div  style="padding:2px 5px;margin-bottom:5px;border-bottom: 1px solid #dddddd;">
	        <a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="saveUserRole()">保存</a>
	    </div>
    </div>
    </div>
	<script type="text/javascript">
		var sexs= [{value:'1',name:'男'},  
		 	               {value:'0',name:'女'}];
	     function formatSex(value){
	     	if (value){
	         	var s = '';
	         	for(var i=0;i<sexs.length;i++) {
	         		if(value == sexs[i].value) {
	         			s =  sexs[i].name;
	         		}
	         	}
	         	return s;
	         } else {
	             return '';
	         }
	     }
		function preCreate() {
	    	$("#isEnable").val("Y");
	    	$('#new').window('open');
	    }
	    function create() {
	    	$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/user/saveUser.do",
				data : $("#userForm").serialize(),
				async : false,
				cache : false,
				dataType: "json",
				success : function(result, textStatus){
					if(result.success) {
		    			alert("修改成功");
		    			closeDialog('new');
		    			$("#tt").datagrid("reload");
		    		}else {
		    			alert("修改失败");
		    		}
				}
			});
	    }
	    function remove(){
            var rows = $('#tt').datagrid('getChecked');
            if (rows && rows.length > 0){
            	var paramArray = new Array();
            	for(var i=0;i<rows.length;i++) {
	            	paramArray.push(rows[i].userCode);
            	}
            	var paramStr = JSON.stringify(paramArray);
            	$.ajax({
    				type : "post",
    				url : "${pageContext.request.contextPath}/user/deleteUser.do",
    				data : {userArrayStr:paramStr},
    				async : false,
    				cache : false,
    				dataType: "json",
    				success : function(result, textStatus){
    					if(result.success) {
    		    			alert("删除成功");
    		    			$("#tt").datagrid("reload");
    		    		}else {
    		    			alert("删除失败");
    		    		}
    				}
    			});
            } else {
            	alert("请选择要删除的列");
            }
        }
	    function closeDialog(dialogId){
			$('#'+dialogId).window('close');
		}
	    function addUserRole(){
	    	var node = $('#tt').datagrid('getSelected');
	    	$("#selectUserCode").val('');
	    	if(node) {
	    		var selectUserCode = node.userCode;
	    		$("#selectUserCode").val(selectUserCode);
				$('#addUserRole').window('open');
	    	}else {
	    		alert("请选择一个用户进行配置角色");
	    	}
		}
	    function saveUserRole() {
	    	var selectUserCode = $("#selectUserCode").val();
	    	var rows = $('#userRoleTable').datagrid('getChecked');
	    	var paramArray = new Array();
	    	for(var i=0;i<rows.length;i++) {
	    		paramArray.push(rows[i].roleCode);
	    	}
	    	var param={};
	    	param.userCode=selectUserCode;
	    	param.roleCodes=paramArray;
	    	var paramStr = JSON.stringify(param);
	    	$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/user/saveUserRole.do",
				data : {userRoleStr:paramStr},
				async : false,
				cache : false,
				dataType: "json",
				success : function(result, textStatus){
					if(result.success) {
		    			alert("配置功能树成功");
		    		}else {
		    			alert("配置功能树失败");
		    		}
					closeDialog('addUserRole');					
				}
			});
	    }
	    var editIndex;
		function edit(){
			if (editIndex != undefined){
				$('#tt').datagrid('selectRow', editIndex);
				return;
			}
			var row = $('#tt').datagrid('getSelected');
			if (row){
                var index = $('#tt').datagrid("getRowIndex", row);
                $('#tt').datagrid("beginEdit", index);
                editIndex = index;
			}
		}
		function save(){
			if (editIndex != undefined){
				var t = $('#tt');
				t.datagrid('endEdit', editIndex);
				editIndex = undefined;
				var node = t.datagrid('getSelected');
				var str = JSON.stringify(node);
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/user/updateUser.do",
					data : {userJsonStr:str},
					async : false,
					cache : false,
					dataType: "json",
					success : function(result, textStatus){
				    		if(result.success) {
				    			alert("修改成功");
				    		}else {
				    			alert("修改失败");
				    		}
					}
				});
			}
		}
		function cancel(){
			if (editIndex != undefined){
				$('#tt').datagrid('endEdit', editIndex);
				editIndex = undefined;
			}
		}
	
	</script>
</body>
</html>