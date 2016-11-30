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
	  <div class="col-md-12 searchPanel">
	  	<div class="panel panel-default">
		  <div class="panel-heading">查询</div>
		  <div class="panel-body">
		  	<form action="<%=basePath%>user/list">
		  		<input type="hidden" name="tid" id ="tid" value="${tid}"/>
		  		账号：<input type="text" class="form-control"/>
				用户名：<input type="text" class="form-control"/>
				<button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-zoom-in"></span>查询</button>
				<button class="btn btn-default" type="reset"><span class="glyphicon glyphicon-repeat"></span>重置</button>
		  	</form>
		  </div>
		</div>
	  </div>
	</div>
	<div class="row">
	  <div class="col-md-12 toolsBar">
		  <div class="panel panel-default">
			  <div class="panel-body">
			  	<button id="addUserJs" type="button" class="btn btn-primary" ><span class="glyphicon glyphicon-plus"></span>添加js</button>
			  	<button id="addUser" type="button" class="btn btn-primary" data-dialog="addUserDialog" title="添加用户" url="/layui/user/edit?tid=${tid}" data=""><span class="glyphicon glyphicon-plus"></span>添加</button>
			  	<button type="button" class="btn btn-primary" data-addtab="tabUserAdd" url="user/edit?type=2&tid=${tid}"><span class="glyphicon glyphicon-plus"></span>TAB添加</button>
			  	<button id="addUserTabJs" type="button" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span>jsTAB添加</button>
			  	<button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span>编辑</button>
			  	<button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-trash"></span>删除</button>
			  	<button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-ban-circle"></span>禁用</button>
			  </div>
		  </div>
	  </div>
	</div>
	<div class="row">
	  <div class="col-md-12 dataTablePanle">
	  	<div class="panel panel-default">
		  <div class="panel-body">
			<table class="table table-condensed table-bordered dataTable">
				<thead>
					<tr>
						<th class="no">序号</th>
						<th>账号</th>
						<th>用户名</th>
						<th>创建时间</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${userList}" var="u">
						<tr>
							<td>${u.id}</td><td>${u.userName}</td><td>${u.age}</td><td>2016-11-11</td><td>禁用</td><td><a class="btn btn-default" href="#" role="button">查看</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>    
		  </div>
		</div>
	  </div>
	</div>
	<div class="row">
	  <div class="col-md-12 pageBar">
		  <div class="panel panel-default">
			  <div class="panel-body">
			  	<nav>
				  	<ul class="pagination">
				        <li class="disabled"><a href="#">«</a></li>
				        <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
				        <li><a href="#">2</a></li>
				        <li><a href="#">3</a></li>
				        <li><a href="#">4</a></li>
				        <li><a href="#">5</a></li>
				        <li><a href="#">»</a></li>
				     </ul>
				</nav>
			  </div>
		  </div>
	  </div>
	</div>  
</div>
<script type="text/javascript">
$("#addUserJs").on("click", function(){
	$.dialog.open('/layui/user/edit?tid=${tid}', '添加用户', 'userEditPanel');
});
$("#addUserTabJs").on("click", function(){
	$.tabPanel.openJs('/layui/user/edit?type=2&tid=${tid}', '132132132', '添加用户');
});
</script>
</body>
</html>