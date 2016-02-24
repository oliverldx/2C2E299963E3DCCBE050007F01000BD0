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
</head>
<body>
	<table id="tt" class="easyui-datagrid"
		style="width: 100%; height: 400px" title="Load Data" iconCls="icon-ok" 
		pagination="true" 
		data-options="idField:'roleCode',rownumbers:true,singleSelect:true,selectOnCheck:false,checkOnSelect:false,url:'../role/loadRole.do',method:'get',toolbar:'#tb'">
		<thead>
			<tr>
				<th data-options="field:'roleCode',checkbox:true"></th>
				<th field="roleName" width="30%" data-options="editor:'textbox'">角色名称</th>
				<th field="roleJobDesc" width="30%" data-options="editor:'textbox'">角色描述</th>
				<th width="30%" data-options="field:'isEnable',align:'right',formatter:formatEnable,editor:{type:'combobox',options:{valueField:'value',textField:'name',data:isEnables,required:true,panelHeight:'50px'}}">是否有效</th>
			</tr>
		</thead>
	</table>
	 <div id="tb" style="padding:2px 5px;">
		 <div  style="padding:2px 5px;margin-bottom:5px;border-bottom: 1px solid #dddddd;">
	        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="preCreate();">增加</a>
	        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="edit()">修改</a>
	        <a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="save()">保存</a>
	        <a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="cancel()">取消</a>
	        <a href="#" class="easyui-linkbutton" iconCls="icon-ok" plain="true" onclick="addFunctree();">配置功能树</a>
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
    <div id="new" class="easyui-dialog" title="新增" data-options="closed:true" style="width:450px;height:250px;padding:10px;">
			 <div class="easyui-layout" fit="true">
    				<form id="roleForm" action="?">
	            		<div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
		                	<table cellpadding=3>
			                    <tr>
			                        <td>角色名称：</td>
			                        <td><input id="roleName" name="roleName" type="text" class="txt01" /></td>
			                    </tr>
			                    <tr>
			                        <td>角色描述：</td>
			                        <td>
			                        	<input id="roleJobDesc" name="roleJobDesc" />
			                        	<input id="isEnable" name="isEnable" type="hidden" />
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
	<div id="addFunctree" class="easyui-dialog" data-options="closed:true" style="width:450px;height:450px;padding:5px">
		<input id="selectRoleCode" name="selectRoleCode" type="hidden" />
		<a id="saveRoleFunctree" class="easyui-linkbutton" icon="icon-ok" onclick="saveRoleFunctree()" > 保存</a> 
        <ul id="functree" class="easyui-tree" data-options="url:'../functree/getFuncTreeChildren.do',method:'get',animate:true,checkbox:true"></ul>
    </div>
	<script type="text/javascript">
		var isEnables= [{value:'Y',name:'是'},  
		 	               {value:'N',name:'否'}];
	     function formatEnable(value){
	     	if (value){
	         	var s = '';
	         	for(var i=0;i<isEnables.length;i++) {
	         		if(value == isEnables[i].value) {
	         			s =  isEnables[i].name;
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
				url : "${pageContext.request.contextPath}/role/saveRole.do",
				data : $("#roleForm").serialize(),
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
	            	paramArray.push(rows[i].roleCode);
            	}
            	var paramStr = JSON.stringify(paramArray);
            	$.ajax({
    				type : "post",
    				url : "${pageContext.request.contextPath}/role/deleteRole.do",
    				data : {roleArrayStr:paramStr},
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
	    function addFunctree(){
	    	var node = $('#tt').datagrid('getSelected');
	    	$("#selectRoleCode").val('');
	    	if(node) {
	    		var selectRoleCode = node.roleCode;
	    		$("#selectRoleCode").val(selectRoleCode);
				$('#addFunctree').window('open');
	    	}else {
	    		alert("请选择一个角色进行配置功能树");
	    	}
		}
	    function saveRoleFunctree() {
	    	var selectRoleCode = $("#selectRoleCode").val();
	    	var nodes = $("#functree").tree('getChecked');
	    	var paramArray = new Array();
	    	for(var i=0;i<nodes.length;i++) {
	    		paramArray.push(nodes[i].id);
	    	}
	    	var param={};
	    	param.roleCode=selectRoleCode;
	    	param.funcTreeCodes=paramArray;
	    	var paramStr = JSON.stringify(param);
	    	$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/role/saveRoleFunctree.do",
				data : {roleFunctreeStr:paramStr},
				async : false,
				cache : false,
				dataType: "json",
				success : function(result, textStatus){
					if(result.success) {
		    			alert("配置功能树成功");
		    		}else {
		    			alert("配置功能树失败");
		    		}
					closeDialog('addFunctree');					
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
					url : "${pageContext.request.contextPath}/role/updateRole.do",
					data : {roleJsonStr:str},
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