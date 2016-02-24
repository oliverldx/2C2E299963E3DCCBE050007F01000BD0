<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<title>小小可爱后台管理</title>
	<link rel="stylesheet" type="text/css" href="../easyui1.4/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../easyui1.4/themes/icon.css">
	<script type="text/javascript" src="../easyui1.4/jquery.min.js"></script>
	<script type="text/javascript" src="../easyui1.4/jquery.easyui.min.js"></script>
	
</head>
<body >
    <div style="margin:20px 0;"></div>
     <div style="margin:20px 0;">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="preCreate()">新建</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="edit()">修改</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="save()">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="cancel()">取消</a>
    </div>
    
    <table id="tg" class="easyui-treegrid" title="TreeGrid ContextMenu" style="width:100%;height:250px"
            data-options="
                iconCls: 'icon-ok',
                rownumbers: true,
                animate: true,
                collapsible: true,
                fitColumns: true,
                url: '../functree/getFuncTreeChildren.do',
                method: 'get',
                idField: 'id',
                treeField: 'text',
                onContextMenu: onContextMenu">
        <thead>
            <tr>
                <th data-options="field:'text',width:150,editor:{type:'text'}">Task Name</th>
                <th data-options="field:'menuType',width:80,formatter:formatMenuType,editor:{type:'combobox',options:{valueField:'menuTypeId',textField:'menuTypeName',data:menuTypes,required:true}}">菜单类型</th>
                <th data-options="field:'menu',width:200,align:'right',editor:{type:'text'}">菜单</th>
                <th data-options="field:'iconCls',width:100,align:'right',editor:{type:'text'}">图标</th>
                <th data-options="field:'isEnable',width:40,align:'right',formatter:formatEnable,editor:{type:'combobox',options:{valueField:'value',textField:'name',data:isEnables,required:true,panelHeight:'50px'}}">是否有效</th>
            </tr>
        </thead>
    </table>
    <div id="mm" class="easyui-menu" style="width:120px;">
        <div onclick="preCreate()" data-options="iconCls:'icon-add'">Append</div>
        <div onclick="removeIt()" data-options="iconCls:'icon-remove'">Remove</div>
        <div class="menu-sep"></div>
        <div onclick="collapse()">Collapse</div>
        <div onclick="expand()">Expand</div>
    </div>
    <div id="new" class="easyui-dialog" title="新增" data-options="closed:true" style="width:450px;height:250px;padding:10px;">
			 <div class="easyui-layout" fit="true">
	            <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
    				<form id="funcTreeForm" action="?">
		                <table cellpadding=3>
			                    <tr>
			                        <td>菜单名称：</td>
			                        <td><input id="funcName" name="funcName" type="text" class="txt01" /></td>
			                    </tr>
			                    <tr>
			                        <td>菜单类型：</td>
			                        <td><select id="menuType" name="menuType" >
			                        	</select>
			                        </td>
			                    </tr>
			                    <tr>
			                        <td>菜单链接：</td>
			                        <td><input id="menu" name="menu" type="text" class="txt01" /></td>
			                    </tr>
			                    <tr>
			                        <td>图标：</td>
			                        <td>
			                        	<input id="icon" name="icon" type="text" class="txt01" />
			                        	<input id="parentFuncCode" name="parentFuncCode" type="hidden" />
			                        	<input id="isEnable" name="isEnable" type="hidden" />
			                        </td>
			                    </tr>
			                </table>
			            </div>
			            <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
			                <a id="btnEp" class="easyui-linkbutton" icon="icon-ok" onclick="create()" > 确定</a> 
			                <a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" onclick="closeAddDialog();">取消</a>
			            </div>
				</form>
        	</div>
	</div>
    <script type="text/javascript">
	  //1：模块菜单2：功能菜单分类3：具体功能菜单4：页面按钮
		var menuTypes = [{menuTypeId:'1',menuTypeName:'模块菜单'},  
	                 {menuTypeId:'2',menuTypeName:'功能菜单分类'},  
	                 {menuTypeId:'3',menuTypeName:'具体功能菜单'},
	                 {menuTypeId:'4',menuTypeName:'页面按钮'}
	                 ];
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
        function formatMenuType(value){
            if (value){
            	var s = '';
            	for(var i=0;i<menuTypes.length;i++) {
            		if(value == menuTypes[i].menuTypeId) {
            			s =  menuTypes[i].menuTypeName;
            		}
            	}
            	return s;
            } else {
                return '';
            }
        }
        function onContextMenu(e,row){
            e.preventDefault();
            $(this).treegrid('select', row.id);
            $('#mm').menu('show',{
                left: e.pageX,
                top: e.pageY
            });
        }
        function preCreate() {
        	var node = $('#tg').treegrid('getSelected');
        	if(!node) {
        		alert("请选择节点进行新增");
        		return;
        	}
        	$("#parentFuncCode").val(node.id);
        	$("#isEnable").val("Y");
        	$("#menuType").empty();
        	for(var i=0;i<menuTypes.length;i++) {
        		$("#menuType").append('<option value='+menuTypes[i].menuTypeId+'>'+menuTypes[i].menuTypeName+'</option>');
        	}
        	$('#new').window('open');
        }
        function create() {
        	$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/functree/saveFuncTree.do",
				data : $("#funcTreeForm").serialize(),
				async : false,
				cache : false,
				dataType: "json",
				success : function(result, textStatus){
					if(result.success) {
		    			alert("修改成功");
		    			closeAddDialog();
		    			var node = $('#tg').treegrid('getSelected');
		    			$('#tg').treegrid('reload',node.id);
		    		}else {
		    			alert("修改失败");
		    		}
				}
			});
        }
        function removeIt(){
            var node = $('#tg').treegrid('getSelected');
            if (node){
            	var paramArray = new Array();
            	paramArray.push(node.id);
            	getNodeIdWithChild(node.children,paramArray);
            	var paramStr = JSON.stringify(paramArray);
            	$.ajax({
    				type : "post",
    				url : "${pageContext.request.contextPath}/functree/deleteFuncTree.do",
    				data : {funcTreeJsonArrayStr:paramStr},
    				async : false,
    				cache : false,
    				dataType: "json",
    				success : function(result, textStatus){
    					if(result.success) {
    		    			alert("删除成功");
    		    			$('#tg').treegrid('remove', node.id);
    		    			if(node._parentId) {
	    		    			$('#tg').treegrid('reload',node._parentId);
    		    			}
    		    		}else {
    		    			alert("删除失败");
    		    		}
    				}
    			});
                
            }
        }
        function getNodeIdWithChild(nodes,paramArray) {
        	if (!nodes || nodes.length == 0) return;
			for (var i=0, l=nodes.length; i<l; i++) {
				paramArray.push(nodes[i].id);
				getNodeIdWithChild(nodes[i].children,paramArray);
			}
        }
        
        function collapse(){
            var node = $('#tg').treegrid('getSelected');
            if (node){
                $('#tg').treegrid('collapse', node.id);
            }
        }
        function expand(){
            var node = $('#tg').treegrid('getSelected');
            if (node){
                $('#tg').treegrid('expand', node.id);
            }
        }
        var editingId;
		function edit(){
			if (editingId != undefined){
				$('#tg').treegrid('select', editingId);
				return;
			}
			var row = $('#tg').treegrid('getSelected');
			if (row){
				editingId = row.id
				$('#tg').treegrid('beginEdit', editingId);
			}
		}
		function save(){
			if (editingId != undefined){
				var t = $('#tg');
				t.treegrid('endEdit', editingId);
				editingId = undefined;
				var persons = 0;
				var node = t.treegrid('getSelected');
				var str = JSON.stringify(node);
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/functree/updateFuncTree.do",
					data : {funcTreeJsonStr:str},
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
			if (editingId != undefined){
				$('#tg').treegrid('cancelEdit', editingId);
				editingId = undefined;
			}
		}
		function closeAddDialog(){
			$('#new').window('close');
		}
		
    </script>

</body>
</html>
