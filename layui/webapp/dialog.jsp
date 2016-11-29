<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>dialog 实例</title>
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

<script type="text/javascript">
$(function(){
	$("#test1").click(function(){
		var dialog = jDialog.alert('欢迎使用jDialog组件，我是alert！',{},{
		showShadow: false,// 不显示对话框阴影
		buttonAlign : 'center',
		events : {
			show : function(evt){
				var dlg = evt.data.dialog;
			},
			close : function(evt){
				var dlg = evt.data.dialog;
			},
			enterKey : function(evt){
				alert('enter key pressed!');
			},
			escKey : function(evt){
				alert('esc key pressed!');
				evt.data.dialog.close();
			}
		}
	  });
	}) ; 
	
	$("#test2").click(function(){
		var dialog = jDialog.confirm('欢迎使用jDialog组件，我是confirm！',{
			handler : function(button,dialog) {
				alert('你点击了确定！');
				dialog.close();
			}
		},{
			handler : function(button,dialog) {
				alert('你点击了取消！');
				dialog.close();
			}
		});
	});
	
	$("#test3").click(function(){
		// 通过options参数，控制iframe对话框
		var dialog = jDialog.iframe('http://www.juheweb.com/',{
			title : '代码编辑器 - 聚合分享出品',
			width : 1100,
			height : 550
		});
	});
	
	$("#test4").click(function(){
		// 通过options参数，控制dialog
		var dialog = jDialog.dialog({
			title : '自定义对话框',
			content : '大家好，欢迎访问聚合分享，请大家加QQ群：774780837，一起交流！'
		});
	});
	
	$("#test5").click(function(){
		// 通过options参数，控制dialog
		var dialog = jDialog.dialog({
			title : '自定义对话框',
			content : '大家好，我是jDialog.dialog！',
			buttons : [
				{
					type : 'highlight',
					text : '你好',
					handler:function(button,dialog)
					{
						dialog.close();
					}
				}
			]
		});	
	});
	
	$("#test6").click(function(){
		var dialog = jDialog.message('大家好，欢迎访问聚合分享',{
			autoClose : 3000,    // 3s后自动关闭
			padding : '30px',    // 设置内部padding
			modal: true         // 非模态，即不显示遮罩层
		});
	});
	
	$("#test7").click(function(){
		var dialog = jDialog.tip('大家好，欢迎访问聚合分享',{
			target : $('#test7'),
   			position : 'left-top',
   			trianglePosFromStart :0,
			autoClose : 1000,
			offset : {
        		top :-20,
				left:10,
				right:0,
				bottom:0
   			}
		});
	});
	
});
</script>
<br/><br/><br/>
<center>
<button id="test1">alert方式调用</button>
<br/><br/>
<button id="test2">confirm方式调用</button>
<br/><br/>
<button id="test3">iframe方式调用</button>
<br/><br/>
<button id="test4">只显示内容对话框</button>
<br/><br/>
<button id="test5">对话框配置按钮</button>
<br/><br/>
<button id="test6">message方式调用</button>
<br/><br/>
<button id="test7">tip方式调用</button>
</center>

</body>
</html>