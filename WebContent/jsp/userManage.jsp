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

 function searchUser(){
	 $("#datagrid").datagrid('load',{
		"userName":$("#s_userName").val() 
	 });
 }
</script>
<title>Insert title here</title>
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
</body>
</html>