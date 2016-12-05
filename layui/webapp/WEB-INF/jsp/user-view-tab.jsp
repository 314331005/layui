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
			  <div class="panel-heading">用户详情</div>
			  <div class="panel-body">
			  <fieldset>
    			<legend>基础信息</legend>
					  <div class="row">
						  <div class="form-group">
						    <label class="col-sm-2 control-label">姓名 :</label>
						    <div class="col-sm-3 control-text">
						      ${user.userName}
						    </div>
						     <label class="col-sm-2 control-label">年龄 :</label>
						    <div class="col-sm-3 control-text">
						      12
						    </div>
						  </div>
					  </div>
					  <div class="row">
						  <div class="form-group">
						    <label class="col-sm-2 control-label">电话 :</label>
						    <div class="col-sm-3 control-text">
						      13030033110
						    </div>
						     <label class="col-sm-2 control-label">住址 :</label>
						    <div class="col-sm-3 control-text">
						      	长春市朝阳区飞跃路东北亚文化创意园
						    </div>
						  </div>
					 </div>
					 <div class="row">
						  <div class="form-group">
						    <label class="col-sm-2 control-label">出生日期 :</label>
						    <div class="col-sm-3 control-text">
						      1987-08-12
						    </div>
						    <label class="col-sm-2 control-label">Email :</label>
						    <div class="col-sm-3 control-text">
						    	wntt@126.com
						    </div>
						  </div>
					 </div>
					 <div class="row">
						  <div class="form-group">
						    <label class="col-sm-2 control-label">职务 :</label>
						    <div class="col-sm-3 control-text">
								工程师
						    </div>
						    <label class="col-sm-2 control-label">部门 :</label>
						    <div class="col-sm-3 control-text">
							    研发
						    </div>
						  </div>
					 </div>
					 <div class="row">
						  <div class="form-group">
						    <label class="col-sm-2 control-label">性别 :</label>
						    <div class="col-sm-3 control-text">
						   		男
						    </div>
						    <label class="col-sm-2 control-label">爱好 :</label>
						    <div class="col-sm-3 control-text">
						    	<label class="checkbox-inline">
								  <input type="checkbox" id="inlineCheckbox1" name="hobby"  value="option1" checked="checked"> 体育
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
						      吉林省长春市朝阳区飞跃路东北亚文化创意园
						    </div>						   
						  </div>
					 </div>
					 <div class="row">
						  <div class="form-group">
						    <label class="col-sm-2 control-label">简介 :</label>
						    <div class="col-sm-8 control-text">
						      <textarea class="form-control" name="intro" rows="3">的说法都是发生的发生的服务wewcew额外热我认为如此温柔委员 各位如果干</textarea>
						    </div>						   
						  </div>
					 </div>
				</fieldset>
				<fieldset>
    			<legend>其他信息</legend>
    				<div class="row">
						  <div class="form-group">
						    <label class="col-sm-2 control-label">工作经历 :</label>
						    <div class="col-sm-8 control-text">
						      <textarea class="form-control" name="workDetile" rows="3">的说法都是发生的发生的服务wewcew额外热我认为如此温柔委员 各位如果干</textarea>
						    </div>						   
						  </div>
					 </div>
					 <div class="row">
						  <div class="form-group">
						    <label class="col-sm-2 control-label">教育经历 :</label>
						    <div class="col-sm-8 control-text">
						      <textarea class="form-control" name="studyDetail" rows="3">的说法都是发生的发生的服务wewcew额外热我认为如此温柔委员 各位如果干</textarea>
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
    <button type="button" class="btn btn-primary" onclick="editUser()">编辑</button>
</div>
    
<script type="text/javascript">
	function editUser(){
	
	}
</script>
</body>