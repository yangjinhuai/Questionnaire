<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%pageContext.setAttribute("APP_PATH",request.getContextPath());
    pageContext.setAttribute("confirmType",request.getSession().getAttribute("confirmType")); 
    pageContext.setAttribute("address",request.getSession().getAttribute("address")); 
    %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>答题认证</title>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/common.css"> 
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/sui.min.css">
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="${APP_PATH}/static/js/sui.min.js"></script> 
   <script type="text/javascript" src="${APP_PATH}/static/js/layer.js"></script>

<style type="text/css">
    body{
        background-color:#E1E6F6;
         background-size:cover;
         background-attachment: fixed;
         overflow:hidden;
    }
    .userRegist{  
         margin-top:15%;
         overflow:hidden;  
         
    }
    .sui-form{
       max-width: 394px;
       max-height: 300px;
       min-width: 360px;
       min-height: 210px;
       width: 28%;
       height: 100%;
       margin: 0 auto;
       padding-top: 20px;
       padding-left: 20px;
       padding-bottom: 10px;
       background-color: #FFFFFF;
    }
    
</style>
</head>
<body>
  <!-- 认证框B -->
  <div class="userRegist sui-row-fluid">       
          <form class="sui-form form-horizontal">
             <div  class="control-group" style="margin: 0 auto;margin-bottom:40px;text-align: center;font-size: 20px;">答题认证</div>
             <div class="control-group" id="name">
                <label class="control-label" for="inputName">姓名：</label>
                <div class="controls" >
                   <input name="name" style="width: 160px;" id="inputName" type="text" placeholder="姓名">
                </div>
                <div class="controls" style="color: red;text-align: right;" id="hint-name">
                </div>
             </div>
             <div class="control-group"  id="number">
                <label class="control-label" for="inputNumber">学号：</label>
                <div class="controls">
                   <input name="number" style="width: 160px;" title="密码" id="inputNumber" type="text" placeholder="学号">
                </div>
                <div class="controls" style="color: red;" id="hint-number">
                </div>
             </div>
             <div class="control-group" id="identity">
                 <label class="control-label" for="inputIdentity">身份证：</label>
                 <div class="controls">
                     <input name="identity" style="width: 160px;" id="inputIdentity" type="text" placeholder="身份证">
                 </div>
                 <div class="controls" style="color: red;" id="hint-identity">
                 </div>
             </div>
              <div class="control-group" id="verificationCode">
                 <label class="control-label" for="inputCode">验证码：</label>
                 <div class="controls">
                     <input name="code" style="width: 32px;height:20px; margin-right: 10px;" id="inputCode" type="text" placeholder="验证码">
                     <img class="changeImage" id="imgCode" src="${APP_PATH}/Views/imageCode"   style="width:80px;height:25px;margin-left:-9px;"/><a herf="#" class="changeImage" style="margin-left:6px;margin-top:16px;text-decoration: none;cursor: pointer;">看不清？</a>
                 </div>
                 <div class="controls" style="color: red;" id="hint-code">
                 </div>
             </div>
             <div class="control-group">
                 <div class="controls">
                      <input type="button" style="margin-left: 120px;margin-top: 7px;" class="pop-ok sui-btn btn-primary" value="立即认证" onclick="authenticate();"/>
                 </div>
             </div>
          </form>
     </div>
  <!-- 认证框E -->
</body>
<script>

    $(document).ready(function () {
    	/*屏幕适应B*/
    	adaptiveDisplay();
    	function adaptiveDisplay(){
          var h=$(window).height(); 
      
          $("body").css("height",h);
    	}
       	  $(window).resize(function() {
        	adaptiveDisplay();
    	  });
      
       	/*屏幕适应E*/  
       	//验证码改变事件B
    		$(".changeImage").click(function(){
    			
    			changeImageSrc();
    		});
    		function changeImageSrc(){
    			$("#imgCode").attr('src',"${APP_PATH}/Views/imageCode?"+Math.random());
    		}
    	 	//验证码改变事件B
    	 	
		//初始化先隐藏输入框
		$('#name,#number,#identity').css("display","none");
        
         var jurisdicte='${confirmType}';
        //根据权限显示输入框
		if(jurisdicte==3)
         $('#name,#identity').css("display","inline-block");
        else if(jurisdicte==2)
		  $('#name,#number').css("display","inline-block");
		else if(jurisdicte==4)
		  $('#name,#number,#identity').css("display","inline-block");
		//else 所有人可填

    })
    
    //确定
    function authenticate(){
    	var jurisdicte='${confirmType}';
		var name = $("input[name='name']").val();
		var code = $("input[name='code']").val();
		var data = "type="+jurisdicte+"&name="+name+"&";
		
		if(name==""){
			$("input[name='name']").focus();
			$("#hint-name").text("请填写姓名");
			return;
		}else{
			$("#hint-name").text("");
		}
		
    	if(jurisdicte==2){
    		var number = $("input[name='number']").val();
    		data+="number="+number+"&codE="+code;
    		if(number==""){
    			$("input[name='number']").focus();
    			$("#hint-number").text("请填写学号");
    			return;
    		}else{
    			$("#hint-number").text("");
    		}
    	}else if(jurisdicte==3){
    		var identity = $("input[name='identity']").val();
    		data+="identity="+identity+"&codE="+code;
    		if(identity==""){
    			$("input[name='identity']").focus();
    			$("#hint-identity").text("请填写身份证号");
    			return;
    		}else{
    			$("#hint-identity").text("");
    		}
    	}else if(jurisdicte==4){
    		var number = $("input[name='number']").val();
    		var identity = $("input[name='identity']").val();
    		data+="identity="+identity+"&number="+number+"&codE="+code;
    		
    		if(number==""){
    			$("input[name='number']").focus();
    			$("#hint-number").text("请填写学号");
    			return;
    		}
    		else if(identity==""){
    			$("input[name='identity']").focus();
    			$("#hint-identity").text("请填写身份证");
    			return;
    		}
    		
    		if(number!=""){
    			$("#hint-number").text("");
    		}
    		else if(identity!=""){
    			$("#hint-identity").text("");
    		}
    	}
    	if(code==""){
			$("input[name='code']").focus();
			$("#hint-code").text("请填写验证码");
			return;
		}else{
			$("#hint-code").text("");
		}
    	$.ajax({
    		url:'${APP_PATH}/Confirm/confirmUser',
    		data:data+"&address=${address}",
    		type:'post',
    		success:function(result){
    			console.log(result);
    			if(result.code==200){
    				window.location.replace("/Questionnaire/fabu/${address}.html");
    			}else if(result.code==300){
    				layer.alert("验证码错误，请重试",{icon:2});
    				changeImageSrc();
    			}else{
    				layer.alert("信息验证错误，请重试",{icon:2});
    				changeImageSrc();
    			}
    		},
    		error:function(result){
    			layer.alert("服务器错误，请联系管理员",{icon:2});
    		}
    	})
    }

</script>
</html>