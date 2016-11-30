<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jstl/core" prefix="c" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<meta charset="UTF-8">
<title>ws</title>
<link rel="stylesheet" href="<%=basePath%>bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=basePath%>css/common.css">

<script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
<!-- validate  -->
<script type="text/javascript" src="<%=basePath%>js/validate/dist/jquery.validate.js"></script>
<script src="<%=basePath%>js/validate/dist/localization/messages_zh.js"></script>
<!-- validate end -->
<script type="text/javascript" src="<%=basePath%>js/common.js"></script>

