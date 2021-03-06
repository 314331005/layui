<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jstl/core" prefix="c" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<meta charset="UTF-8">
<title>ws</title>
<link rel="stylesheet" href="<%=basePath%>bootstrap/css/bootstrap.min.css">
<link href="<%=basePath%>bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<link href="<%=basePath%>bootstrap/css/bootstrap-table.min.css" rel="stylesheet" media="screen">
<link rel="stylesheet" href="<%=basePath%>css/common.css">

<script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
<!-- bootstrap datepicker -->
<script type="text/javascript" src="<%=basePath%>bootstrap/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=basePath%>bootstrap/locales/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
<!-- bootstrap table -->
<script type="text/javascript" src="<%=basePath%>bootstrap/js/bootstrap-table.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=basePath%>bootstrap/locales/bootstrap-table-zh-CN.js" charset="UTF-8"></script>

<!-- validate  -->
<script type="text/javascript" src="<%=basePath%>js/validate/dist/jquery.validate.js"></script>
<script src="<%=basePath%>js/validate/dist/localization/messages_zh.js"></script>
<!-- validate end -->
<script type="text/javascript" src="<%=basePath%>js/common.js"></script>

