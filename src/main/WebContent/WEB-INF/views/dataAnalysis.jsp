<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%pageContext.setAttribute("APP_PATH",request.getContextPath());
  pageContext.setAttribute("AdminType",request.getSession().getAttribute("userType"));
%>
               
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/common.css">
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/dataAnalysis.css">
  
  <script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
  
  <script type="text/javascript" src="${APP_PATH}/static/js/layer.js"></script>
  <style type="text/css">
   body{
   background-color:#fff;
  }
  .row2 .formlist .form-item-wrapper:hover{
    background-color:#F5F5F5;
  }
  .row2 .formlist
{ 
    background-color: #fff;
}
.hint{
position: absolute;
top:0;
left: 0;
}
  </style>
</head>
<body>
	<div class="row2" style="padding-left:20px;padding-top:10px;padding-right:20px;">
		<div style="border-left:2px solid #0098CD;padding-left:6px;width:100%;"><h4>表单数据</h4></div>
		<div style="border-top: 1px solid #D9DFE4;margin-bottom:10px;"></div>
		<div class="formlist" id="showDiv">				
			<!-- 动态生成表单位置 -->	
		</div>

		<!-- 分页信息 -->
		<div class="col-md-4 margin-top10 margin-left" id="page_info"></div>
		<!-- 分页导航 -->
		<div class="col-md-4" id="page_nav" style="display:none;width:500px;"><nav><ul class="pagination"><ul></ul><li><a href="#">首页</a></li><li class="active"><a href="#">1</a></li><li><a href="#">2</a></li><li><a href="#">&gt;&gt;</a></li><li><a href="#">末页</a></li></ul></nav></div>
    </div>
    
    <!-- 悬浮提示框B -->	
    <div class="hint"></div>
    <!-- 悬浮提示框E -->	
</body>
<script type="text/javascript">
   //悬浮提示B
   $(document).on("mouseover",".form-item-wrapper",function(){
	   $(this).attr("title",$(this).find("p").text()); 
   });
   //悬浮提示E
   
     //修改按钮点击事件
	  $(document).ready(function(){
          getAllReleaseForm(1);
		  //获取所有发布的表单
		  function getAllReleaseForm(pn){		
			  $("#showDiv ").empty();
			  var load = layer.msg("正在加载数据,请稍后!",{icon:16,shade:0.05,time:38*1000});
			  $.ajax({
					url:'${APP_PATH}/Form/getAllReleaseForm',
					type:'get',
					data:'pn='+pn,
					success:function(data){
						if(data.code==200){
							layer.close(load);
							var form = data.extend.form.list;
							if(form!=""){
								$("#page_nav").css("display","block");							
							}
							var i=0;
							$.each(form,function(index,item){
								i++;	
								var divp = $("<div></div>").attr("id",item.id);divp.addClass('form-item-wrapper fl');
								   var p=$("<p></p>").append(item.name);                     //表单名称background-size:35px 35px;
								 
								   var divbg=$("<div></div>");
								   var divc=$("<div></div>");divc.addClass('form-data');
								      var span_c=$("<span></span>").append("0");span_c.addClass('count');
								      var span_t=$("<span></span>").append("数据");span_t.addClass('text');							   
								                                                           
								 divc.append(span_c)
								     .append(span_t);
								 divp.append(p)
								     .append(divbg)
								     .append(divc);
								 divp.appendTo("#showDiv");
								 $(".form-item-wrapper").css("cursor","pointer");
								 divbg.addClass("bg"+i+"");
								
							});
							// 分页信息显示
							makePageInfo(data)
							//导航信息显示
							makePageNav(data);
							getRelesedAnswerNum();
						}else{
						}
					}
				})			
		  }
				
			//分页信息
			function makePageInfo(data){
				//清空文档
				$("#page_info").empty();
				var pageInfo = $("<span></span>").append("当前第"+data.extend.form.pageNum+"页，共"+data.extend.form.pages+"页,总共"+data.extend.form.total+"条记录");
				pageInfo.appendTo("#page_info");
				currentPage = data.extend.form.pageNum;
				total = data.extend.form.total;	
			}
			
			//导航信息 
			function makePageNav(data){
				//清空内容
				$("#page_nav").empty();
				var ul = $("<ul><ul>").addClass("pagination");
				var fristPageLi = $("<li></li>").append($("<a></a>").attr("href","#").append("首页"));
				//给li 绑定点击事件
				fristPageLi.click(function(){
					getAllReleaseForm(1)
				})
				ul.append(fristPageLi);
				
				if(data.extend.form.hasPreviousPage==true){
					var previousPageLi = $("<li></li>").append($("<a></a>").attr("href","#").append("<<"));
					previousPageLi.click(function(){
						getAllReleaseForm(data.extend.form.pageNum-1);
					});
					ul.append(previousPageLi);
				}
				
				var pageNums = data.extend.form.navigatepageNums;
				//遍历每一项
				$.each(pageNums,function(index,item){
					if(data.extend.form.pageNum==item){
						var pageLi = $("<li></li>").append($("<a></a>").attr("href","#").append(item)).addClass("active");
					}else{
						var pageLi = $("<li></li>").append($("<a></a>").attr("href","#").append(item));
					}
					pageLi.click(function(){
						getAllReleaseForm(item);
					})
					ul.append(pageLi);
				})
				
				if(data.extend.form.hasNextPage==true){
					var nextPageLi = $("<li></li>").append($("<a></a>").attr("href","#").append(">>"));
					nextPageLi.click(function(){
						getAllReleaseForm(data.extend.form.pageNum+1);
					})					
					ul.append(nextPageLi);
				}
				
				var lastPageLi = $("<li></li>").append($("<a></a>").attr("href","#").append("末页"));
				lastPageLi.click(function(){
					getAllReleaseForm(data.extend.form.pages);
				})
				ul.append(lastPageLi);
				
				$("<nav></nav>").append(ul).appendTo("#page_nav");
			}
		  
		 //表单预览
		  $(document).on("click",".priview",function(){
			  var formId=$(this).attr("id");
			  $.ajax({
					url:'${APP_PATH}/FormPreview/getForm',
					data:'formId='+formId,
					type:'post',
					success:function(data){
						if(data.code==200){
							window.open("${APP_PATH}/Views/previewForm");
						}else{
							layer.alert("预览失败");
						}							
					}	
				}) 
		  }); 
	  })
	  //获取答案
		  $(document).on("click",".form-item-wrapper",function(){
			  var formId=$(this).attr("id");
			  window.open("${APP_PATH}/Views/dataSummarize?id="+formId);			
		  });
		   	
	  getRelesedAnswerNum();
	 //获取已发布表单的答案数
	  function getRelesedAnswerNum(){
		  $.ajax({
				url:'${APP_PATH}/Data/getRelesedAnswerNum',
				type:'get',
				data:'',
				success:function(data){
					if(data.code==200){						
						var anwserNum=data.extend.anwserNum.list; 
						$.each(anwserNum,function(index,item){				
							var id=item.id;
							var ID='#'+id;
							if($(ID)!=null)
								$(ID).find(".count").text(item.answerNum);	
						});						 
					}else{
					}
				}
			})	
	  }	  	    	  	  
</script>
</html>