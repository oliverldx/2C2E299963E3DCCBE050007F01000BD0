// JavaScript Document
//支持Enter键登录
		document.onkeydown = function(e){
			if($(".bac").length==0)
			{
				if(!e) e = window.event;
				if((e.keyCode || e.which) == 13){
					var obtnLogin=document.getElementById("submit_btn")
					obtnLogin.focus();
				}
			}
		}

    	$(function(){
			//提交表单
			$('#submit_btn').click(function(){
				show_loading();
				if(!$('#loginName').val()){
					show_err_msg('用户名还没填呢！');	
				}else if(!$('#password').val()){
					show_err_msg('密码还没填呢！');
					$('#password').focus();
				}else if(!$('#captcha_key1').val()){
					show_err_msg('验证码还没填呢！');
					$('#password').focus();
				}else{
					formSubmit();
				}
			});
		});
    	
    	function formSubmit() {
        	$("#mainForm").submit();
        }

        