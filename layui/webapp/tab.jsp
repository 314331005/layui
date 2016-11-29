<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
    <link rel="stylesheet" href="<%=basePath%>bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>bootstrap/css/bootstrap.addtabs.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="<%=basePath%>css/index.css">
    <script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/jquery.layout.js"></script>
    <script type="text/javascript" src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>bootstrap/js/bootstrap.addtabs.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/common.js"></script>
</head>
<body>
<script type="text/javascript">
    $(function () {
        $('#tabs').addtabs();
       
    })
</script>
<ul class="list-group">
    <a href="javascript:void(0);" data-addtab="userMenu1" url="http://www.baidu.com" class="list-group-item">用户菜单 1</a>
    <a href="javascript:void(0);" data-addtab="userMenu2" url="user/list" class="list-group-item">用户菜单 2</a>
    <a href="javascript:void(0);" data-addtab="userMenu3" url="user/list" class="list-group-item">用户菜单 3</a>
    <a href="javascript:void(0);" data-addtab="userMenu4" url="user/list" class="list-group-item">用户菜单 4</a>
    <a href="javascript:void(0);" data-addtab="userMenu5" url="user/list" class="list-group-item">用户菜单 5</a>
</ul>

<div class="main">
	<div id="tabs">
	    <!-- Nav tabs -->
	    <ul class="nav nav-tabs" role="tablist">
	        <li role="presentation" class="active">
	            <a href="#home" aria-controls="home" role="tab" data-toggle="tab">Home</a></li>
	    </ul>
	    <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="home">
                
            </div>
		</div>
	</div>
</div>
</body>
</html>