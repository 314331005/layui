/**
 * auth:wushuang
 * 2016-11-20
 */

//最顶层window
var topwindow = window.top.window;

$(function($) {
	
	//绑定按钮方式打开tab页面
	$('button[data-addtab]').on("click", function(){
		$.tabPanel.open($(this));
	});
	//绑定按钮方式打开模态窗口页面
	$('button[data-dialog]').on("click", function(){
		$.dialog.open($(this).attr('url'), $(this).attr('title'), $(this).attr('data-dialog'), $(this).attr('data'), $(this).attr('model'));
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
	 * @param {String} data 提交参数
	 * @param {String} model 是否模态
	 */
	open : function(url, title, id , data, model){
		htmlhead = '<div class="modal fade" id="'+id+'" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">'
					+'<div class="modal-dialog">'
						+'<div class="modal-content">'
							+' <div class="modal-header">'
								+' <button type="button" class="close" data-dismiss="modal"></button>'
								+' <h4 class="modal-title" id="myModalLabel">'+title+'</h4>'
							+'</div>';
		htmlend = 		'</div>'
					+'</div>'
				+'</div>';
		$.ajax({
			   type: "POST",
			   url: url,
			   dataType: "html",
			   data: data,
			   success: function(msg){
			   		$('body').append( htmlhead + msg +htmlend);
			   		$('#' + id).modal('show');
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
		var id = $obj.parents('div[class="modal fade in"]').attr("id");
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
		var dialog = window.top.window.jDialog.message(msg,{
			autoClose : time,    // 1.5s后自动关闭
			padding : '30px',    // 设置内部padding
			modal: modal         // 非模态，即不显示遮罩层
		});
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
	}
}
})(jQuery);

/**
 * 普通ajax表单提交
 * @param {Object} form
 * @param {function} callback
 * @param {String} confirmMsg 提示确认信息
 * @param {boolean} isClose 执行完关闭
 * @param {boolean} tid 刷新父窗口
 * @param {String} type 2 ：tab窗口
 */
function submitCallback(form, callback, confirmMsg, isClose, tid, type) {
	
	var $form = $(form);	
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
				
				if (typeof(confirmMsg) != "undefined") {
					if (confirmMsg) {
				    	$.message.msg(msg.message);
				    }
				}
				if (typeof(tid) != "undefined") {
					//查找tab下iframe的searchpanel面板的form表单并提交
					$(topwindow.document.getElementById('tab_'+ tid + '_f')).contents().find('body .searchPanel form').submit();
				}
				if (typeof(isClose) != "undefined") {
					if(isClose && msg.statusCode == 200){
						if(type == '2'){
							//关闭当前tab页面
							var tabid = $('#tabs', topwindow.document).find('li.active a').attr('aria-controls');//取得当前活动tab
							$.tabPanel.close(tabid);
							
						}else{
							//关闭模态窗口
							var id = $form.parent('div[class="modal fade in"]').attr('id');
					    	$.dialog.colse(id)
						}
				    	
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
function submitTabCallback(form, callback, confirmMsg, isClose, tid) {
	
	submitCallback(form, callback, confirmMsg, isClose, tid, 2);
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