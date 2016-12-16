/**
 * auth:wushuang
 * 2016-11-20
 */

//最顶层window
var topwindow = window.top.window;

$(function($) {
	
	//绑定按钮方式打开tab页面
	$('button[data-addtab], a[data-addtab]').on("click", function(){
		$.tabPanel.open($(this));
	});
	//绑定按钮方式打开模态窗口页面
	$('button[data-dialog], a[data-dialog]').on("click", function(){
		$.dialog.open($(this).attr('url'),{width:$(this).attr('width'), height:$(this).attr('height'), data:$(this).attr('data'), title : $(this).attr('title'), id : $(this).attr('data-dialog')});
	});
	//表格全选/取消全选
	$('.dataTable .box input[type=checkbox]').on("click", function(){
		if($(this).is(':checked')){
			$(this).parents('.dataTable').find('input[type="checkbox"][name="_id"]').attr("checked",true); 
		}else{
			$(this).parents('.dataTable').find('input[type="checkbox"][name="_id"]').attr("checked",false); 
		}
	});	
	//绑定ajax
	$('button[target=ajax], a[target=ajax]').on("click", function(){
		alert($(this).html());
	});
});
/**
 * 主页窗口高度自动调整，不包含tab iframe调整，iframe调整在tab插件里面自动调整
 */
function reWinSize(){
	var h = $(window).height() - 133; //title100 + 底部33计算内容高度
	$("#mainContent").css({"height" : h});
	$("#home").css({"height" : h-42, "overflow":"auto"});//42代表tab标签高度
}
/**
 * 初始化组件
 */
function init(){
	//绑定日期控件调用
	$('.datepicker').datetimepicker({
		minView: "month",//设置只显示到月份
		format : "yyyy-mm-dd",//日期格式
		autoclose:true,//选中关闭
		todayBtn: true //今日按钮
	});
	$('.timepicker').datetimepicker({
		format : "yyyy-mm-dd hh:ii:ss",//日期格式
		autoclose:true,//选中关闭
		todayBtn: true //今日按钮
	});
}
/**
 * 模态对话框
 */
(function($){
	/**
	 * 模态对话框
	 */
$.dialog = {
	/**
	 * 模态对话框
	 * @param {String} url 
	 * @param {String} title 标题
	 * @param {String} id 窗口id
	 * @param {Object} option 窗口属性 option
	 * @param {String} data 提交参数
	 * @param {String} model 是否模态，默认false
	 * @param {int} width 宽度,默认850px
	 * @param {int} height 高度，默认跟随内容高度
	 */
	open : function(url, option){
		opt = {
			url : url,
			id : (typeof(eval(option).id) != "undefined") ? eval(option).id : new Date().getTime(),
			title : (typeof(eval(option).title) != "undefined") ? eval(option).title : '新窗口',
			data : eval(option).data,
			width : (typeof(eval(option).width) != "undefined") ? eval(option).width : '850',
			height : (typeof(eval(option).height) != "undefined") ? eval(option).height : '',
			model : (typeof(eval(option).model) != "undefined") ? eval(option).model : false
		};	
		htmlhead = '<div class="modal fade myModelDialog" id="'+ opt.id +'" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">'
					+'<div class="modal-dialog" style="width:'+ opt.width +'px;">'
						+'<div class="modal-content" style="height:'+ opt.height +'px;overflow:auto;">'
							+' <div class="modal-header">'
								+' <button type="button" class="close" data-dismiss="modal"></button>'
								+' <h4 class="modal-title" id="">'+ opt.title +'</h4>'
							+'</div>';
		
		htmlend = 		'</div>'
					+'</div>'
				+'</div>';
		$.ajax({
			   type: "POST",
			   url: url,
			   dataType: "html",
			   data: opt.data,
			   success: function(msg){
			   		$('body').append( htmlhead + msg +htmlend);
			   		$('#' + opt.id).modal('show');
			   		init();//重新加载初始化
			   }
		});
		/*$('#'+id).on('hide.bs.modal', function () {
			//$(this).unbind('hidden.bs.modal');
			//$('#userEditPanel').remove();
			alert($(this).html());
		});*/
	},
	colse : function(id){
		$('#'+id).modal('hide');
		$('#'+id).remove();
	},
	colseCurrent : function(obj){
		var $obj = $(obj);	
		var id = $obj.parents('div[class="modal fade myModelDialog in"]').attr("id");
		$('#'+id).modal('hide');
		$('#'+id).remove();
	},
	colseCurrentCallback : function(obj, callback, param){
		var $obj = $(obj);	
		var id = $obj.parents('div[class="modal fade in"]').attr("id");
		$('#'+id).modal('hide');
		$('#'+id).remove();
		callback(param);
	}
}
/**
 * 提示信息
 */
$.message = {
	/**
	 * 提示信息
	 * @param {String} msg 信息内容 
	 * @param {boolean} modal 是否模态
	 * @param {int} time 停留时间毫秒
	 */
	msg : function(msg, modal, time){
		var model = true;
		var time = 1000;
		if (typeof(modal) != "undefined") {
			model = model;
		}
		if (typeof(a) != "undefined") {
			time = time;
		}
		var dialog = topwindow.jDialog.message(msg,{
			autoClose : time,    // 1.5s后自动关闭
			padding : '30px',    // 设置内部padding
			modal: modal         // 非模态，即不显示遮罩层
		});
	},
	/**
	 * 确认对话框
	 * @param {String} msg 提示信息 
	 * @param {function} yesCallback 确认调用
	 * @param {function} noCallback 取消调用
	 */
	confirm : function(msg, yesCallback, noCallback){
		var text = typeof(msg) != "undefined" ? msg : '是否确认操作？'
		var dialog = topwindow.jDialog.confirm(text,{
			handler : function(button,dialog) {
				dialog.close();
				yesCallback();
			}
		},{
			handler : function(button,dialog) {
				dialog.close();
				noCallback();
			}
		});
	},
	/**
	 * 判断表格选择
	 * @param {array} array 要判断数组 
	 * @param {boolean} more 多选【ture】 单选 【false】 默认单选
	 */
	checksel : function(array, more){
		if(state = typeof(array) == "undefined") return false;
		var state = typeof(more) != "undefined" ? more : false;
		if(array.length == 0){
			$.message.msg('请选择记录！');
			return false;
		}
		if(!state && array.length != 1){//单选判断
			$.message.msg('只能选择一条记录！');
			return false;
		}
		return true;
	}
}
/**
 * 主页面调用bootstrap.addtabs.js对象
 */
$.tabPanel = {
	open : function (obj){
		topwindow.Addtabs.add({
            id: $(obj).attr('data-addtab'),
            title: $(obj).attr('title') ? $(obj).attr('title') : $(obj).html(),
            content: topwindow.Addtabs.options.content ? topwindow.Addtabs.options.content : $(obj).attr('content'),
            iframeHeight: topwindow.iframeHeight,
            url: $(obj).attr('url'),
            ajax: false
        });
	},
	openJs : function (url, id, title){
		topwindow.Addtabs.add({
            id: id,
            title: title,
            content: topwindow.Addtabs.options.content ? topwindow.Addtabs.options.content : '',
            iframeHeight: topwindow.iframeHeight,
            url: url,
            ajax: false
        });
	},
	close : function (id){
		topwindow.Addtabs.close(id);
	},
	closeCurrent : function (){
		var tabid = $('#tabs', topwindow.document).find('li.active a').attr('aria-controls');//取得当前活动tab
		$.tabPanel.close(tabid);
	}
}
/**
 * 分页表格
 */
/**
 * 数据表格
 * @param {String} id 元素id
 * @param {String} 加载数据url 返回json
 * @param {object} option 表格属性[待扩展]
 * @param {array obj} column 表格字段，写法遵循bootstraptable写法
 */
$.tablePage = {
	show : function(id, url, option, column){
		$('#' + id).bootstrapTable({
			url : url,//url默认走的是get
			//method : 'post',
			striped : true,
			dataType: 'json',
			pagination : eval(option).pagination,
			pageList : [ 15, 20, 25 ],
			pageSize : 10,
			selectItemName : 'id',
			pageNumber : 1,
			queryParamsType: "",//这里只是选择适合我后台的逻辑，可以选择传入页数和显示数量
			queryParams: function queryParams(params) {   //设置查询参数  
				form = $('#'+$('#' + id).attr('fromSearch')).serializeArray();//取得查询条件元素
				var p =  {
					pageSize : params.pageSize,//键就是自己后台的参数
					pageNumber : params.pageNumber	
				};
				$.each(form, function(i, field){//查询参数
					var obj = field.value; 
					p[field.name] = obj; 
			    });
				return p;                   
			},  
			sidePagination : 'server',//设置为服务器端分页
			columns :  column 
		});
	},
	getSelect : function (id) {//获取选中行
		var array = $('#' + id).bootstrapTable('getSelections');
		var selarray = [];
		for(i = 0; i<array.length; i++){
			selarray.push(eval(array[i]).id);
		}
		return selarray;
	},
	refresh : function (id, param){
		$('#' + id).bootstrapTable('refresh',param);
	}
}
})(jQuery);

/**
 * 普通ajax表单提交
 * @param {Object} form
 * @param {function} callback
 * @param {String} option 选项参数：{}
 * @param {boolean} isClose 执行完关闭
 * @param {boolean} tid 刷新父窗口tab id 只在tab方式下调用
 * @param {String} type 2 ：tab窗口
 */
function submitCallback(form, callback, option, tid) {
	
	var $form = $(form);
	if(!$form.valid())return;
	var _submitFn = function(){
		$.ajax({
			type: form.method || 'POST',
			//url:$form.attr("action") + '?t=' + Math.random(1000)  ,
			url:$form.attr("action") ,
			data:$form.serializeArray(),
			dataType: "json",
			cache: false,
			success: function(msg){
				if (typeof(callback) != "undefined") {
					 callback(msg);
				}
				if (typeof(msg.message) != "undefined") {
					$.message.msg(msg.message);
				}
				if (typeof(eval(option).reftable) != "undefined") {
					//alert(eval(option).reftable);
					if (typeof(tid) != "undefined") {
						alert('tab_'+ tid + '_f');
						//查找tab下iframe的searchpanel面板的form表单并提交
						//var tablieid = $(topwindow.document.getElementById('tab_'+ tid + '_f')).contents().find('body .searchPanel form').submit();//-----bug- iframe 刷新父表格---未完成
						topwindow.document.getElementById('tab_'+ tid + '_f').contentWindow.$.tablePage.refresh(eval(option).reftable, '');
					}else{
						$.tablePage.refresh(eval(option).reftable, '');
					}
				}
				if(typeof(eval(option).dlClose) != "undefined"){
					if(eval(option).dlClose && msg.statusCode == 200){
						//关闭模态窗口
						var id = $form.parents('div[class="modal fade myModelDialog in"]').attr('id');
				    	$.dialog.colse(id);
					}
				}
				if(typeof(eval(option).tabClose) != "undefined"){
					if(eval(option).tabClose && msg.statusCode == 200){
						//关闭当前tab页面
						var tabid = $('#tabs', topwindow.document).find('li.active a').attr('aria-controls');//取得当前活动tab
						$.tabPanel.close(tabid);
					}
				}
			}
		});
	}
	_submitFn();
	return false;
}
/**
 * tab页面普通ajax表单提交
 * @param {Object} form
 * @param {function} callback
 * @param {String} confirmMsg 提示确认信息
 * @param {boolean} isClose 执行完关闭
 * * @param {boolean} tid 刷新父窗口
 */
function submitTabCallback(form, callback, option, tid) {
	submitCallback(form, callback, option, tid);
	return false;
}

/**
 * 扩展String方法
 */
$.extend(String.prototype, {
	isPositiveInteger:function(){
		return (new RegExp(/^[1-9]\d*$/).test(this));
	},
	isInteger:function(){
		return (new RegExp(/^\d+$/).test(this));
	},
	isFloat:function(){
		return (new RegExp(/^(\d+|\d+\.{1}\d{1})$/).test(this));
	},
	isNumber: function(value, element) {
		return (new RegExp(/^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/).test(this));
	},
	trim:function(){
		return this.replace(/(^\s*)|(\s*$)|\r|\n/g, "");
	},
	startsWith:function (pattern){
		return this.indexOf(pattern) === 0;
	},
	endsWith:function(pattern) {
		var d = this.length - pattern.length;
		return d >= 0 && this.lastIndexOf(pattern) === d;
	},
	replaceSuffix:function(index){
		return this.replace(/\[[0-9]+\]/,'['+index+']').replace('#index#',index);
	},
	trans:function(){
		return this.replace(/&lt;/g, '<').replace(/&gt;/g,'>').replace(/&quot;/g, '"');
	},
	encodeTXT: function(){
		return (this).replaceAll('&', '&amp;').replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll(" ", "&nbsp;");
	},
	replaceAll:function(os, ns){
		return this.replace(new RegExp(os,"gm"),ns);
	},
	replaceTm:function($data){
		if (!$data) return this;
		return this.replace(RegExp("({[A-Za-z_]+[A-Za-z0-9_]*})","g"), function($1){
			return $data[$1.replace(/[{}]+/g, "")];
		});
	},
	replaceTmById:function(_box){
		var $parent = _box || $(document);
		return this.replace(RegExp("({[A-Za-z_]+[A-Za-z0-9_]*})","g"), function($1){
			var $input = $parent.find("#"+$1.replace(/[{}]+/g, ""));
			return $input.val() ? $input.val() : $1;
		});
	},
	isFinishedTm:function(){
		return !(new RegExp("{[A-Za-z_]+[A-Za-z0-9_]*}").test(this)); 
	},
	skipChar:function(ch) {
		if (!this || this.length===0) {return '';}
		if (this.charAt(0)===ch) {return this.substring(1).skipChar(ch);}
		return this;
	},
	isValidPwd:function() {
		return (new RegExp(/^([_]|[a-zA-Z0-9]){6,32}$/).test(this)); 
	},
	isValidMail:function(){
		return(new RegExp(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/).test(this.trim()));
	},
	isSpaces:function() {
		for(var i=0; i<this.length; i+=1) {
			var ch = this.charAt(i);
			if (ch!=' '&& ch!="\n" && ch!="\t" && ch!="\r") {return false;}
		}
		return true;
	},
	isPhone:function() {
		return (new RegExp(/(^([0-9]{3,4}[-])?\d{3,8}(-\d{1,6})?$)|(^\([0-9]{3,4}\)\d{3,8}(\(\d{1,6}\))?$)|(^\d{3,8}$)/).test(this));
	},
	isUrl:function(){
		return (new RegExp(/^[a-zA-z]+:\/\/([a-zA-Z0-9\-\.]+)([-\w .\/?%&=:]*)$/).test(this));
	},
	isExternalUrl:function(){
		return this.isUrl() && this.indexOf("://"+document.domain) == -1;
	}
});