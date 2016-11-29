/**
 * auth:wushuang
 * 2016-11-20
 */

/**
 * 首页布局自动调整
 */
function reWinSize(){
	var h = $(window).height() - 133; //title100 + 底部35计算内容高度
	$("#mainContent").css({"height" : h});
	$("#home").css({"height" : h-42, "overflow":"auto"});
}

/**
 * 模态对话框
 */
(function($){
//
$.dialog = {	
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
			   data: "",
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
$.message = {
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
})(jQuery);

/**
 * 普通ajax表单提交
 * @param {Object} form
 * @param {function} callback
 * @param {String} confirmMsg 提示确认信息
 * @param {boolean} isClose 执行完关闭
 * * @param {boolean} tid 刷新父窗口
 */
function submitCallback(form, callback, confirmMsg, isClose, tid) {
	
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
				if (typeof(isClose) != "undefined") {
					if(isClose && msg.statusCode == 200){
				    	var id = $form.parents('div[class="modal fade in"]').attr("id");
				    	$('#'+id).modal('hide');
				    	$('#'+id).remove();//删除窗口防止缓存
				    }
				}
				if (typeof(confirmMsg) != "undefined") {
					if (confirmMsg) {
				    	$.message.msg(msg.message);
				    }
				}
				if (typeof(tid) != "undefined") {
					$(window.top.window.document.getElementById('tab_'+ tid + '_f')).contents().find('body .searchPanel form').submit();
				}  			
			}
		});
	}
	_submitFn();
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