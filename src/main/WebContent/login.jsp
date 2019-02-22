<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%pageContext.setAttribute("APP_PATH",request.getContextPath());%>
<html><head>
<meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1' />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta name="renderer" content="webkit"/>
<title>请登录--问卷调查管理系统</title> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/js/layer.js"></script>
<link href="${APP_PATH}/static/css/common.css" rel="stylesheet" type="text/css" />
<link href="${APP_PATH}/static/css/login.css" rel="stylesheet" type="text/css" />
<link href="${APP_PATH}/static/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

<style type="text/css">
	.changeImage:hover{
		cursor:pointer;
	}
	body{
		min-width:900px;
	}
	.loginOutner{
		min-width:380px;
	}
	.form-group{
		
	}
</style>
</head>

<body>

	<div style="width:380px;height:320px;margin: 180px auto;" class="loginOutner">
		<h1 style="color:white; -moz-user-select: none;-webkit-user-select: none;-ms-user-select: none;-khtml-user-select: none;user-select: none;cursor:default">问卷调查管理系统<sup>V2017</sup></h1>
		<div style="width:380px;height:320px;background-color:#fff;margin-top:10px;border-radius:2px;min-width:380px;">
			<center><h2 style="padding-top:10px;-moz-user-select: none;-webkit-user-select: none;-ms-user-select: none;-khtml-user-select: none;user-select: none;cursor:default">请登录</h2></center>
			<hr style="margin-top:10px;"/>
			<form class="form-horizontal" autocomplete="off">
					<div class="form-group">
						<label for="username" class="col-sm-3 control-label">用户名:</label>
						<div class="col-sm-8">
							<input type="text" name="username" class="form-control" id="name" placeholder="用户名"/>
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-3 control-label">密 码:</label>
						<div class="col-sm-8">
							<input type="password" name="password" class="form-control" id="specifications" placeholder="密 码"/>
						</div>
					</div>
					<div class="form-group">
						<label for="code" class="col-sm-3 control-label">验证码:</label>
						<div class="col-sm-4">
							<input type="text" name="code" class="form-control" id="code" placeholder="验证码"/>

						</div>
						<img class="changeImage" id="imgCode" src="${APP_PATH}/Views/imageCode"   style="width:100px;height:38px;margin-top:-5px;margin-left:-9px;"/><a herf="#" class="changeImage" style="margin-left:6px;margin-top:16px;">看不清？</a>
					</div>
					<center><input type="button" id="login" class="btn btn-primary" name="" value="立即登录" style="margin-top:16px;"/></center>
				</form>
		</div>
	</div>
<script type="text/javascript">
		//判断浏览器版本
		function getVendorPrefix() {
		// 使用body是为了避免在还需要传入元素
		var body = document.body || document.documentElement,
		    style = body.style,
		    vendor = ['webkit', 'khtml', 'moz', 'ms', 'o'],
		    i = 0;
		
		while (i < vendor.length) {
		    // 此处进行判断是否有对应的内核前缀
		    if (typeof style[vendor[i] + 'Transition'] === 'string') {
		        return vendor[i];
		    }
		    i++;
		    }
		}
		if(typeof(getVendorPrefix())=="undefined"){
			alert("您的浏览器内核版本过低，请更换其他浏览器，如果使用的是多核浏览器，如360 请更换至 【极速模式】");
		}
		$(function(){
			
			//验证码改变事件
			$(".changeImage").click(function(){
				
				changeImageSrc();
			});
			function changeImageSrc(){
				$("#imgCode").attr('src',"${APP_PATH}/Views/imageCode?"+Math.random());
			}
			//立即登录按钮点击事件
			$("#login").click(function(){
				var name = $("#name").val();
				var pass = $("#specifications").val();
				var code = $("#code").val();
				if(name==""||pass==""||code==""){
					layer.alert("必填信息不能为空");
					return;
				}
				
				var load = layer.msg("正在登录,请稍后!",{icon:16,shade:0.06,time:38*1000});					//提示
				$.ajax({
					url:'${APP_PATH}/Login/login',
					data:$("form").serialize(),
					type:'post',
					success:function(result){
						if(result.code==200){                         
							window.location.href="${APP_PATH}/Views/index";
							window.event.returnValue=false;  
						}else if(result.code==300){
							layer.alert("验证码输入有误");
							//更改验证码
							changeImageSrc();
						}else{
							layer.alert("用户名或密码错误");
							//更改验证码
							changeImageSrc();
						}
					},error:function(result){
						layer.alert("系统出错 请联系管理员");
					}
				})
			})
			
		})
</script>
</body></html>