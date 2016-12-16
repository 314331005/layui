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
		  	<form id="userSearchForm">
		  		<input type="hidden" name="tid" id ="tid" value="${tid}"/>
		  		账号：<input type="text" class="form-control" name= "ft_userName_eq"/>
				用户名：<input type="text" class="form-control" name= "ft_tureName_eq"/>
				<button class="btn btn-default" type="button" onclick="$.tablePage.refresh('userteble', '')"><span class="glyphicon glyphicon-zoom-in"></span>查询</button>
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
			  	<button type="button" class="btn btn-primary" onclick="edit()"><span class="glyphicon glyphicon-pencil"></span>编辑</button>
			  	<button type="button" class="btn btn-primary" onclick="dels()"><span class="glyphicon glyphicon-trash"></span>删除</button>
			  	<button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-ban-circle"></span>禁用</button>
			  </div>
		  </div>
	  </div>
	</div>
	<div class="row">
	  <div class="col-md-12 dataTablePanle">
	  	<div class="panel panel-default">
		  <div class="panel-body">
			<table id="userteble" data-toggle="table" fromSearch="userSearchForm"></table>
		  </div>
		</div>
	  </div>
	</div>  
</div>
<script type="text/javascript">
$("#addUserJs").on("click", function(){
	$.dialog.open('/layui/user/edit?tid=${tid}',{title : '用户添加', id : 'userEditPanel'});
});
$("#addUserTabJs").on("click", function(){
	$.tabPanel.openJs('/layui/user/edit?type=2&tid=${tid}', '132132132', '添加用户');
});
$.tablePage.show('userteble','<%=basePath%>user/jsonlist', {pagination : true},//带分页
	[{
		checkbox : true
	}, {
		field : 'id',
		title : '编号',
		visible : false
	}, {
		field : 'userName',
		title : '用户名'
	}, {
		field : 'age',
		title : '年龄'
	},{
        title : '操作',
        field : 'id',
        width : 150,
        align : 'center',
        formatter:function(value,row,index){  
			var e = '<a href="#" mce_href="#" onclick="view(\''+ row.id + '\')">查看</a> ';  
		    var d = '<a href="#" mce_href="#" onclick="del(\''+ row.id +'\')">删除</a> ';  
          	return e+d;  
      } 
    }
	]);
	//查看详情
	function view(id){
		$.tabPanel.openJs('user/viewUser?id='+id+'&type=2&tid=${tid}', 'id3434', '查看用户');
	}
	//删除
	function dels(){
		var ids = $.tablePage.getSelect('userteble');//获取选中数据
		if($.message.checksel(ids, true)){//验证选则（多选）
			$.message.confirm('确认删除？',
				function(){
					alert(ids); //执行删除
				}
			);
		}
	}
	//编辑
	function edit(){
		var ids = $.tablePage.getSelect('userteble');//获取选中数据
		if($.message.checksel(ids)){//验证选则（单选）
			alert(ids);//执行修改
		}
	}
</script>
</body>
</html>