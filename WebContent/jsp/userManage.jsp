<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	$(function(){
		 $("#datagrid").datagrid({
			 title : "用户管理",
			 fitColumns : true, 
			 pagination : true, 
			 rownumbers : true,
			 fit : true,
			 url : "${pageContext.request.contextPath}/user/getUserList.do",
			 pageSize : 10,
			 pageList : [10,20,30],
			 toolbar : "#tb",
			 frozenColumns:[[
			     {sortable:false, resizable:true, align:'center', title:'', field:'ck',checkbox:true},
			     {sortable:false, resizable:true, align:'center', width:"150", title:'编号', field:'id'},
			     {sortable:false, resizable:true, align:'center', width:"150", title:'用户名', field:'userName'},
			     {sortable:false, resizable:true, align:'center', width:"150", title:'密码', field:'password'},
			     {sortable:false, resizable:true, align:'center', width:"150", title:'真实姓名', field:'trueName'},
			     {sortable:false, resizable:true, align:'center', width:"150", title:'邮件', field:'email'},
			     {sortable:false, resizable:true, align:'center', width:"150", title:'联系电话', field:'phone'},
			     {sortable:false, resizable:true, align:'center', width:"150", title:'角色', field:'roleName'}
			     ]]
		 })
	});
	
	var url;
	function openUserAddDialog(){
		$("#dialog").dialog("open").dialog("setTitle","添加用户信息");
		url = "${pageContext.request.contextPath}/user/addOrUpdateUser.do";
	}
	
	function openUserModifyDialog(){
		var rows = $("#datagrid").datagrid("getSelections");
		if(rows.length != 1){
			$.messager.alert("系统提示","请选择一条记录");
			return;
		}
		var row = rows[0];
		$("#dialog").dialog("open").dialog("setTitle","编辑用户信息");
		$("#fm").form("load",row);
		url = "${pageContext.request.contextPath}/user/addOrUpdateUser.do?id="+row.id;
	}
	
	function saveUser(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				if ($("#roleType").combobox("getValue")=="") {
					$.messager.alert("系统提示", "请选择用户角色");
					return false;
				}
				return $(this).form("validate");
			},
			success:function(result){
				var result = eval('('+ result +')');
				if(result.success){
					$.messager.alert("系统提示", "保存成功");
					resetValue();
					$("#dialog").dialog("close");
					$("#datagrid").datagrid("reload");
				}else {
					$.messager.alert("系统提示", "保存失败");
					return;
				}
			}
		});
	}
	
	function resetValue(){
		$("#userName").val("");
		$("#password").val("");
		$("#trueName").val("");
		$("#email").val("");
		$("#phone").val("");
		$("#roleType").combobox("setValue", "");
	}
	
	function closeUserDialog(){
		$("#dialog").dialog("close");
		resetValue();
	}
	
	function deleteUser(){
		var rows = $("#datagrid").datagrid("getSelections");
		if(rows.length == 0){
			$.messager.alert("系统提示","请至少选择一条记录");
			return;
		}
		var strIds = [];
		$.each(rows, function(index,val) {
			strIds.push(val.id);
		}); 
		var ids = strIds.join(",");
		$.messager.confirm("系统提示","确定删除这<font color=red>"+rows.length+"</font>条记录吗？",function(r){
			if (r) {
				$.post("${pageContext.request.contextPath}/user/deleteUser.do",{ids:ids},function(result){
					if (result.success) {
						$.messager.alert("系统提示","删除成功");
						$("#datagrid").datagrid("reload");
					}else {
						$.messager.alert("系统提示","删除失败，请联系管理员");
					}
				},"json");
			}
		});
	}
	
 function searchUser(){
	 $("#datagrid").datagrid('load',{
		"userName":$("#s_userName").val()
	 });
 }
</script>
<title>用户管理</title>
</head>
<body style="margin: 1px">
	 <table id="datagrid" class="easyui-datagrid" >
	 </table>
	 <div id="tb">
	 	<div>
	 		<a href="javascript:openUserAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
	 		<a href="javascript:openUserModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
	 		<a href="javascript:deleteUser()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
	 	</div>
	 	<div>
	 		&nbsp;用户名：&nbsp;<input type="text" id="s_userName" size="20" onkeydown="if(event.keyCode==13) searchUser()"/>
	 		<a href="javascript:searchUser()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
	 	</div>
	 </div>
	 <div id="dialog" class="easyui-dialog" style="width:320px; height:250px; padding:10px 20px"
	  closed="true" buttons="#dialogButtons">
	  	<form id="fm" method="post">
	  		<table>
	  			<tr>
	  				<td>用户名：</td>
	  				<td><input type="text" id="userName" name="userName" style="width:154px" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
	  			</tr>
	  			<tr>
	  				<td>密码：</td>
	  				<td><input type="text" id="password" name="password" style="width:154px" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
	  			</tr>
	  			<tr>
	  				<td>真实姓名：</td>
	  				<td><input type="text" id="trueName" name="trueName" style="width:154px" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
	  			</tr>
	  			<tr>
	  				<td>邮箱：</td>
	  				<td><input type="text" id="email" name="email" style="width:154px" class="easyui-validatebox" validType="email" required="true"/>&nbsp;<font color="red">*</font></td>
	  			</tr>
	  			<tr>
	  				<td>联系电话：</td>
	  				<td><input type="text" id="phone" name="phone" style="width:154px" class="easyui-validatebox" required="true"/>&nbsp;<font color="red">*</font></td>
	  			</tr>
	  			<tr>
	  				<td>角色类型：</td>
	  				<td>
	  					<select class="easyui-combobox" id="roleType" name="roleType" style="width:158px" editable="false" panelHeight="auto">
	  						<option value="">--请选择--</option>
	  						<option value="1">系统管理员</option>
	  						<option value="2">销售主管</option>
	  						<option value="3">客户经理</option>
	  						<option value="4">高管</option>
	  					</select>
	  					&nbsp;<font color="red">*</font>
	  				</td>
	  			</tr>
	  		</table>
	  	</form>
	  </div>
	  
	  <div id="dialogButtons">
	  	<a href="javascript:saveUser()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
	  	<a href="javascript:closeUserDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	  </div>
</body>
</html>