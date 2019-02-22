<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% pageContext.setAttribute("APP_PATH",request.getContextPath());
   pageContext.setAttribute("USER",request.getSession().getAttribute("username"));
   pageContext.setAttribute("AdminType",request.getSession().getAttribute("userType"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>后台管理系统</title>
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/common.css">
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/index.css">
  <script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
</head>

<body>  
        <!-- 顶部导航B -->    
        <div class="head clearfix">
            <div class="headlogo left">
                <h3><a href="#"></a></h3>
            </div>
            <div class="headlogo2 left">
                
            </div>
            <ul class="headlink right clearfix">
                <li id="link_0">
                    <a href="${APP_PATH}/Views/passwordModify" target="main" id="hellow">你好！${USER}</a>
                </li>
                <li id="link_4" class="margin-right20">
                    <a href='${APP_PATH}/Login/exit' >退出</a>
                </li>
            </ul>
        </div>
        <!-- 顶部导航E --> 
        
        <!-- 左侧导航B--> 
        <div class="leftmenu" id="leftmenu"> 
            <!-- 左侧菜单B-->        
            <div id="leftmenu_1" class="leftmenu-item">
                <dl>
                    <dt>
                        <span class="bg_weijuanguanli"></span>
                        <span class="text_weijuanguanli">问卷管理</span>
                    </dt>
                    <dd>
                       <ul class="clearfix">
                          <li id="addQuest"><a href="${APP_PATH}/Views/addQuestions" target="main" ><span>添加问卷</span></a></li>
                          <li><a href="${APP_PATH}/Views/formManage" target="main"><span>表单管理</span></a></li>                                           
                       </ul>
                    </dd>
                </dl>
                <dl>
                    <dt>
                        <span class="bg_shujuguanli"></span>
                        <span class="text_shujuguanli">数据管理</span>
                    </dt>                
                    <dd>
                        <ul class="clearfix">
                            <li><a href="${APP_PATH}/Views/dataAnalysis" target="main"><span>表单数据</span></a></li>  
                       </ul>
                    </dd>
                </dl>
                <dl>
                    <dt>
                        <span class="bg_shujukeshihua"></span>
                        <span class="text_shujukeshihua">数据可视化</span>
                    </dt>
                    <dd>
                        <ul class="clearfix">
                            <li><a href="${APP_PATH}/Views/dataVisualization;" target="main"><span>可视化</span></a></li>                                                
                        </ul>
                    </dd>
                </dl>
                <dl>
                    <dt>
                        <span class="bg_xitongguanli"></span>
                        <span class="text_xitongguanli">系统管理</span>
                    </dt>
                    <dd>
                        <ul class="clearfix">
                            <li><a href="${APP_PATH}/Views/passwordModify;"  target="main"><span>账户修改</span></a></li>
                            <li id="isShow"><a href="${APP_PATH}/Views/adminManage;" target="main"><span>管理员管理</span></a></li>
                            <li><a href="${APP_PATH}/Views/comfirmData;" target="main"><span>验证数据</span></a></li>                          
                        </ul>
                    </dd>
                </dl>
            </div>
            <!-- 左侧菜单E--> 

        </div>
        <!-- 左侧导航E--> 
        
        <!-- 右侧主框架B-->
        <div class="rightmain">
            <div class="rightcontent">
                <iframe id="main" name="main" frameborder="0" scrolling="auto" src="${APP_PATH}/Views/dataVisualization"></iframe>
            </div>
        </div>
        <!-- 右侧主框架E-->
     
        <script type="text/javascript" src="${APP_PATH}/static/js/HeadAndLeftmenu.js"></script>      
    </body>
    <script type="text/javascript">
    $(document).ready(function(){
    	//普通用户不可见管理员管理B
		var adtp='${AdminType}';
		if(adtp==2){
			$("#isShow").css("display","none");
		}
		//普通用户不可见管理员管理E
    });
    //清除Session
    $(document).on('click','#addQuest',function(){
    	 $.ajax({
				url:'${APP_PATH}/Form/clearSession',                 //传到控制器controller
				type:'post',
				success:function(data){
					if(data.code==200){
						return;
					}else{
						return;
					}
				}
			});		
    });
    </script>
</html>