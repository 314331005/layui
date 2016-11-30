<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="head.jsp"></jsp:include>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12  formPanel">
			<div class="panel panel-default">
			  <div class="panel-heading">添加用户</div>
			  <div class="panel-body">
				  <form  action="<%=basePath%>user/addUser" name="userForm" id="userForm" onsubmit="return submitTabCallback(this, callback, true, true, '${tid}');">
					  <div class="form-group">
					    <label for="inputEmail3" class="col-sm-1 control-label">姓名</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" name="userName" placeholder="姓名" minlength="2" required>
					    </div>
					     <label for="inputEmail3" class="col-sm-1 control-label">年龄</label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control"  name="age" placeholder="年龄">
					    </div>
					  </div>
				 </form>
			  </div>
			</div>
		</div>
	</div>
</div>
<div class="tabfooter">
    <button type="button" class="btn btn-default" onclick="$.tabPanel.closeCurrent()">关闭</button>
    <button type="button" class="btn btn-primary" onclick="addUser()">保存</button>
</div>
    
<script type="text/javascript">
	function addUser(){
		var $form = $('#userForm');
		$form.submit();
	}
	/*回调函数*/
	function callback(msg){
		//$.dialog.colse('userEditPanel');//手动关闭
	}
	//验证表单
	$(function($){
	    $("#userForm").validate();
	});
</script>
</body>