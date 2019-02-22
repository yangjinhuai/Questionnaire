<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%pageContext.setAttribute("APP_PATH",request.getContextPath());
  pageContext.setAttribute("FormNode",request.getSession().getAttribute("FormNode"));
  pageContext.setAttribute("QuestionTitle",request.getSession().getAttribute("QuestionTitle"));
  pageContext.setAttribute("QuestionDescribe",request.getSession().getAttribute("QuestionDescribe"));
%>
             
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>表单预览</title>
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/common.css">
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/formPreview.css">
  <script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/js/layer.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/js/perviewForm.js"></script>
</head>
<body>
    <div class="container">
       <!-- 电脑B -->
       <div class="computer" id="pc">
           <!-- 顶部B -->
           <div class="form_tilte">${QuestionTitle}</div>
           <div class="form_describ">
             <h4>${QuestionTitle}</h4>
             <span>${QuestionDescribe}</span>
            </div>
            <!-- 顶部E -->
          
            <!-- 内容B -->
            <div class="col-md-9 leftcontent" > 
               ${FormNode}        
	        </div>
	        <!-- 内容E --> 
	    
	        <!-- 底部B -->
	        <div class="Bottom clear">
	           <input class="submit" type="button" value="提交">    
	        </div>
	        <!-- 底部E -->
       </div>
        <!-- 电脑E -->
	    
	    <!-- 手机B -->
	    <div class="mobileQhone_bg"  id="mb">
	    
	   <div id="release">
	    <div class="mobileQhone" id="mbg">
	       <!-- 顶部B -->
           <div class="form_tilte">${QuestionTitle}</div>
           <div class="form_describ">
             <h5>${QuestionTitle}</h5>
             <span>${QuestionDescribe}</span>
           </div>
           <!-- 顶部E -->
          
           <!-- 内容B -->
           <div class="col-md-9 leftcontent" > 
             ${FormNode}        
	       </div>
	       <!-- 内容E --> 
	    
	       <!-- 底部B -->
	       <div class="Bottom clear">
	         <input class="submit" type="button"  value="提交" >    
	       </div>
	       <!-- 底部E -->
	    </div>
	  </div>
	   </div>
	    <!-- 手机E -->
	    <div class="button_container">
	        <input type="button" value="手机" onclick="mb_show()">
	        <input type="button" value="电脑" onclick="pc_show()">
	        <input type="button" value="返回" onclick="window.close()">
	    </div>
	   
    </div>  
</body>
   <script type="text/javascript">
   //预览模式控制
   function mb_show()
   {	
	   $("#mb").css("visibility","visible");
	   $("#mbg").css("visibility","visible");
	   
	   $("body").css("overflow-y","hidden");
	   $("#pc").css("visibility","hidden");
   }
   function pc_show()
   {	
	   $("#mb").css("visibility","hidden"); 
	   $("#mbg").css("visibility","hidden");
	   $("body").css("overflow-y","scroll");
	   $("#pc").css("visibility","visible");
   }
   </script>
</html>