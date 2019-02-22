<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%pageContext.setAttribute("APP_PATH",request.getContextPath());%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link href="${APP_PATH}/static/css/common.css" rel="stylesheet" type="text/css" />
<link href="${APP_PATH}/static/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<title>提交完成</title>
<style type="text/css">
	@media screen and (min-width: 980px) {
		#show
		{
			width:380px;height:180px;margin:200px auto;border-radius:6px; padding:20px 0 0 20px;	
		};
		#showImg{
			
		}
		#showTip{
			font-size:28px;width:210px;float:right;margin:10px  35px 0 0;
		}
	}
	@media screen and (max-width: 540px) {
		#show
		{	
			width:380px;height:180px;margin:200px auto;border-radius:6px; padding:20px 0 0 20px;	
			margin-top:180px;
		};
		#showImg{
			
			width:100px;
		}
		#showTip{
			font-size:28px;width:210px;float:right;margin:10px 35px 0 0;
		}
	}
</style>
</head>
<body>
		<div id="show">
			<img id="showImg" style="margin-left:40px;" src="${APP_PATH}/static/images/error.png"/><div id="showTip" >问卷已停止收集</div>
		</div>
</body>
<script type="text/javascript">
window.history.forward(1);
</script>
</html>