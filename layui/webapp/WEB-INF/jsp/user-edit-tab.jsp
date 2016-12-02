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
			  <fieldset>
    			<legend>基础信息</legend>
				  <form  action="<%=basePath%>user/addUser" name="userForm" id="userForm" onsubmit="return submitTabCallback(this, callback, true, true, '${tid}');">
					  <div class="row">
						  <div class="form-group">
						    <label class="col-sm-2 control-label">姓名 :</label>
						    <div class="col-sm-3 control-text">
						      <input type="text" class="form-control" name="userName" placeholder="姓名" minlength="2" required>
						    </div>
						     <label class="col-sm-2 control-label">年龄 :</label>
						    <div class="col-sm-3 control-text">
						      <input type="text" class="form-control"  name="age" placeholder="年龄"  range="[0,150]" required>
						    </div>
						  </div>
					  </div>
					  <div class="row">
						  <div class="form-group">
						    <label class="col-sm-2 control-label">电话 :</label>
						    <div class="col-sm-3 control-text">
						      <input type="text" class="form-control" name="userTel" placeholder="电话">
						    </div>
						     <label class="col-sm-2 control-label">住址 :</label>
						    <div class="col-sm-3 control-text">
						      <input type="text" class="form-control"  name="userAddr" placeholder="住址">
						    </div>
						  </div>
					 </div>
					 <div class="row">
						  <div class="form-group">
						    <label class="col-sm-2 control-label">出生日期 :</label>
						    <div class="col-sm-3 control-text">
						      <input type="text" class="form-control datetimepicker" name="userBirthday"  placeholder="出生日期" data-date-format="yyyy-mm-dd hh:ii:ss">
						    </div>
						    <label class="col-sm-2 control-label">Email :</label>
						    <div class="col-sm-3 control-text">
						    	<div class="input-group">
							      <div class="input-group-addon">@</div>
							      <input class="form-control" type="email" name="email" placeholder="Enter email" email="true">
							    </div>
						    </div>
						  </div>
					 </div>
					 <div class="row">
						  <div class="form-group">
						    <label class="col-sm-2 control-label">职务 :</label>
						    <div class="col-sm-3 control-text">
						      <select class="form-control" name="zhiwu">
								  <option>董事长</option>
								  <option>总经理</option>
								  <option>工程师</option>
								  <option>技术总监</option>
								  <option>财务主管</option>
								</select>
						    </div>
						    <label class="col-sm-2 control-label">部门 :</label>
						    <div class="col-sm-3 control-text">
							      <input type="text" class="form-control"  name="deptName" placeholder="部门">
						    </div>
						  </div>
					 </div>
					 <div class="row">
						  <div class="form-group">
						    <label class="col-sm-2 control-label">性别 :</label>
						    <div class="col-sm-3 control-text">
						   		<label class="radio-inline">
						      		<input type="radio"  name="userSex"  value="1" checked >男
						      	</label>
						      	<label class="radio-inline">
						      		<input type="radio" name="userSex"  value="2">女
						      	</label>
						    </div>
						    <label class="col-sm-2 control-label">爱好 :</label>
						    <div class="col-sm-3 control-text">
						    	<label class="checkbox-inline">
								  <input type="checkbox" id="inlineCheckbox1" name="hobby"  value="option1"> 体育
								</label>
								<label class="checkbox-inline">
								  <input type="checkbox" id="inlineCheckbox2" name="hobby" value="option2"> 音乐
								</label>
								<label class="checkbox-inline">
								  <input type="checkbox" id="inlineCheckbox3" name="hobby" value="option3"> 书法
								</label>
						    </div>
						  </div>
					 </div>
					 <div class="row">
						  <div class="form-group">
						    <label class="col-sm-2 control-label">家庭详址 :</label>
						    <div class="col-sm-8 control-text">
						      <input type="text" class="form-control" name="userAddrsDetail" placeholder="出生日期">
						    </div>						   
						  </div>
					 </div>
					 <div class="row">
						  <div class="form-group">
						    <label class="col-sm-2 control-label">简介 :</label>
						    <div class="col-sm-8 control-text">
						      <textarea class="form-control" name="intro" rows="3"></textarea>
						    </div>						   
						  </div>
					 </div>
				 </form>
				</fieldset>
				<fieldset>
    			<legend>其他信息</legend>
    				<div class="row">
						  <div class="form-group">
						    <label class="col-sm-2 control-label">工作经历 :</label>
						    <div class="col-sm-8 control-text">
						      <textarea class="form-control" name="workDetile" rows="3"></textarea>
						    </div>						   
						  </div>
					 </div>
					 <div class="row">
						  <div class="form-group">
						    <label class="col-sm-2 control-label">教育经历 :</label>
						    <div class="col-sm-8 control-text">
						      <textarea class="form-control" name="studyDetail" rows="3"></textarea>
						    </div>						   
						  </div>
					 </div>
    		  </fieldset>
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