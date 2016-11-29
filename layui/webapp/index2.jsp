<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>首页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>layui/css/layui.css"/>
	<script type="text/javascript" src="<%=basePath%>layui/layui.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.7.2.min.js"></script>
	
	<script type="text/javascript" src="<%=basePath%>js/common.js"></script>
	<style type="text/css">
		.layui-tab{
			margin: 0px;
		}
	</style>
  </head>
  <body>
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			
		</div>
		<div class="layui-side layui-bg-black" >	
			<div class="layui-tab">
				<ul class="layui-nav layui-nav-tree">
				  <li class="layui-nav-item"><a href="">菜单</a></li>
				  <li class="layui-nav-item layui-nav-itemed layui-this">
				    <a class="" href="javascript:;" >产品</a>
				    <dl class="layui-nav-child">
				      <dd><a href="home.jsp" target="navTab" rel="page_1">移动模块</a></dd>
				      <dd><a href="" target="navTab" rel="page_2">后台模版</a></dd>
				      <dd><a href="" target="navTab" rel="page_3">电商平台</a></dd>
				    </dl>
				  </li>
				  <li class="layui-nav-item"><a href="">大数据</a></li>		
				  <li class="layui-nav-item"><a href="">云市场</a></li>
				  <li class="layui-nav-item">
				    <a href="javascript:;">解决方案</a>
				    <dl class="layui-nav-child">
				      <dd><a href="">移动模块</a></dd>
				      <dd><a href="">后台模版</a></dd>
				      <dd><a href="">电商平台</a></dd>
				    </dl>
				  </li>
				  <li class="layui-nav-item"><a href="">社区</a></li>
				</ul>
			</div>
		</div>
		<div class="layui-body">
			<div class="layui-tab layui-tab-card" >
			  <ul class="layui-tab-title">
			    <li class="layui-this">用户基本管理</li>
			  </ul>
			  <div class="layui-tab-content">
			    <div class="layui-tab-item" id="navTab">
			    	<iframe width="100%" height="500" frameborder="0" id="navTab" name="navTab" scrolling="no"></iframe>
			    </div>
			  </div>
			</div>     		  
		</div>
		<div class="layui-footer">
		
		</div>
	</div>
	<script type="text/javascript">
		 layui.use('element', function(){
		  var element = layui.element();
		  	element.on('tab(menus)', function(data){
		    	alert(this, data);
		  });
		}); 
		
		/* $(".layui-nav-tree li dl dd a").on("click", function(){
			alert( $(this).attr("href"));
		}); */
	</script>
  </body>
</html>
