<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="modal-body">
    <form action="<%=basePath%>user/addUser" name="userForm" id="userForm" onsubmit="return submitCallback(this, callback, true, true, '${tid}');">
	姓名：<input type="text" class="form-control" name="userName">
	年龄：<input type="text" class="form-control" name="age">
	</form>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default" onclick="$.dialog.colseCurrent(this)">关闭</button>
    <button type="button" class="btn btn-primary" onclick="addUser()">保存</button>
</div>
    
<script type="text/javascript">
	function addUser(){
		var form = $('#userForm');
		form.submit();
	}
	/*回调函数*/
	function callback(msg){
		//$.dialog.colse('userEditPanel');//手动关闭
	}
</script>