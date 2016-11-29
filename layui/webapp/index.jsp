<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>吉林省佳硕科技有限责任公司</title>
    <link rel="stylesheet" href="<%=basePath%>bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>bootstrap/css/bootstrap.addtabs.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="<%=basePath%>css/index.css">
    <script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/jquery.layout.js"></script>
    <script type="text/javascript" src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>bootstrap/js/bootstrap.addtabs.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/common.js"></script>
	<!-- dialog -->
	<link rel="stylesheet" href="<%=basePath%>js/dialog/jDialog/jDialog.css" type="text/css">
	<script type="text/javascript" src="<%=basePath%>js/dialog/jDialog.js"></script>
</head>
<body>
<div id="layout">
  <div id="header">
  	<div class="logo"><img src="img/system/logo.png" width="100" height="80"><span>吉林省佳硕科技有限责任公司</span>
  	</div>
  	<div class="logoright">
  	
		<div class="btn-group">
		  <button type="button" class="btn btn-default">桌面</button>
		  <button type="button" class="btn btn-default">个人中心</button>
		
		  <div class="btn-group">
		    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
		      	注销&nbsp;<span class="caret"></span>
		    </button>
		    <ul class="dropdown-menu" role="menu" style="min-width: 80px;">
		      <li><a href="#">退出</a></li>
		      <li><a href="#">重新登录</a></li>
		    </ul>
		  </div>
		</div>
  	</div>
  </div>
  <div id="headerline"></div>
  <div id="mainContent">
    <div id="sidebar"><jsp:include page="menu.jsp"></jsp:include></div>
    <div id="content">
    	<div class="main">
			<div id="tabs">
			    <!-- Nav tabs -->
			    <ul class="nav nav-tabs" role="tablist">
			        <li role="presentation" class="active">
			            <a href="#home" aria-controls="home" role="tab" data-toggle="tab">桌面</a>
			        </li>
			    </ul>
			    <!-- Tab panes -->
		        <div class="tab-content">
		            <div role="tabpanel" class="tab-pane active" id="home">
		                <jsp:include page="home.jsp"></jsp:include>
		            </div>
				</div>
			</div>
    		<!-- <div id="navigation"><span class="glyphicon glyphicon-home"></span>桌面</div>
    		<iframe id="frame" name="frame" width="100%" height="100%" src="home.jsp" frameborder="0" style="overflow-x:hidden"></iframe> -->
    	</div>
    </div>
  </div>
  <div id="footer">版权所有：吉林省佳硕科技有限责任公司  吉ICP备11011xxx号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
</div>	

<script type="text/javascript">
$(document).ready(function(){
    $('#tabs').addtabs();
       
	$(window).resize(function () { 
		reWinSize();
	});
	reWinSize();
	
});
</script>
</body>
