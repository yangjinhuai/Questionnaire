<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%pageContext.setAttribute("APP_PATH",request.getContextPath()); 
  pageContext.setAttribute("formId",request.getSession().getAttribute("FormId"));
  pageContext.setAttribute("FormNode",request.getSession().getAttribute("FormNode"));
  pageContext.setAttribute("QuestionTitle",request.getSession().getAttribute("QuestionTitle"));
  pageContext.setAttribute("Comment",request.getSession().getAttribute("Comment"));
  pageContext.setAttribute("CurrentPage",request.getSession().getAttribute("CurrentPage"));
  pageContext.setAttribute("QueNum",request.getSession().getAttribute("QueNum"));
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/common.css">  
   <link rel="stylesheet" type="text/css" href="${APP_PATH}/ckeditor/samples/css/samples.css">
   <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/bootstrap.min.css">
   <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/font-awesome.min.css">
   
   <script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
   <script type="text/javascript" src="${APP_PATH}/static/js/layer.js"></script>
   
   <script type="text/javascript" src="${APP_PATH}/ckeditor/ckeditor.js"></script>
   <script type="text/javascript" src="${APP_PATH}/ckeditor/samples/js/sample.js"></script>
   <script type="text/javascript" src="${APP_PATH}/static/js/addQuestions.js"></script>
<style type="text/css">
	*{
		font-family:Microsoft YaHei;
	}
	.leftcontent{
		border:1px solid #D9DFE4;
		border-raduis:3px;
		padding:0;
		
	}
	.leftcontentInner{
		padding-left:60px;
	}
	/*右边编辑框 固定布局*/
	.rightcontent{
		height:380px;
		position:fixed;
		top:60px;
		right:10px;
		overflow:yes;
		overflow-y:scroll;	
	}
	.rightcontent2{
		
		hegiht:380px;
		position:obsolute;	
	}
	.rightcontentinner{
		border:1px solid #D9DFE4;
		height:100%;
		border-radius:3px;
	}
	.rightHead{		
		border:1px solid #2A94DE;
		border-radius:3px;
		height:25px;
	}
	.rightHead sapn:hover{
		cursor:pointer;
	}
	.span1,.span2{
		width:50%;
		line-height:25px;
		height:25px;
	}
	.itemmargintop{
		width:100%;
		height:23px;
		margin-top:10px;
	}
	.itemr,.iteml{
		display:block-inline;
		width:100px;
		height:22px;
		border:1px solid #D9DFE4;
		border-radius:2px;
		padding-left:6px;
		line-height:22px;
	}
	.iteml:hover,.itemr:hover{
		cursor:pointer;
	}
	.iteml{
		margin-left:16px;
	}
	.itemr{
		margin-right:16px;
	}
	
	/*悬浮编辑字段样式*/
	.addDiv:hover{
		cursor:pointer;
	}
	.itemEditHead{
		width:100%;height:25px;background-color:#F5F1F1;padding-left:10px;margin-top:10px;
	}
	.itemEditHead h4{
		line-height:25px;
	}
	.itemEditContent{
		padding-top:16px;
		padding-left:10px;
		padding-right:6px;
	}
	.itemEditContentInput{
		width:100%;
		border-raduis:3px;
		padding-left:6px;
	}
	.must{
		font-size:20px;
		color:red;
		position:absolute;
        top: -15px;
        left:15px;
	}
	.itemEditContentlitleInputR,.itemEditContentlitleInputC,.itemEditContentlitleInputS,.itemEditContentlitleInputTS{
		margin-top:6px;
	}
	.itemEditContentlitleInputTS{
		margin-top:6px;
	}
	.twoSelectData{
		width:180px;
	}
	select{
		height:30px;
		width:180px;
	}
	.previewFormButton
	{	
		position:fixed;
	   	right:22px;
	   	top:450px;
		color:white;
	}
	.previewFormButton a{
		color:white;
		text-decoration: none;	
	}
	
	.previewFormButton button
	{
	    margin-right:25px; 	
	}
.form-control {
    width: 610px;
}	
.edit_area
{
   width:837px;
   height:270px;
   margin:0px 0px 0px -18px;
}
/*二级下拉菜单样式*/
.twoSelect1{
	margin-top:5px;
	border:2px solid #000;
	border-radius:2px;
}
.twoselect2{
	height:20px;
	margin-top:2px;
	width:150px;
}
.addSelect1:hover,.divSelect1:hover,.addSelect2:hover,.divSelect2:hover,.addMradioI:hover,.divMradioI:hover,.addMradioT:hover,.divMradioT:hover,.addRowR:hover,.divRowR:hover,.addRowC:hover,.divRowC:hover{
	cursor:pointer;
}
/*单选矩阵样式*/	
.mradio{
	width:620px;
}
.mradioItemDiv{
	margin-top:10px;
}
.form-group> input{
  float:left;
}
.form-group .otherSpan :first-child
{
  float:left;
}
</style>
</head>
<body>
	<div class="row2" style="padding-left:20px;padding-top:10px;padding-right:20px;">
		<div style="border-left:2px solid #0098CD;padding-left:6px;width:100%;"><h4>添加问卷</h4></div>
		<div style="border-top: 1px solid #D9DFE4;margin-bottom:10px;"></div>
			
		<div class="row">
			<div class="col-md-9 leftcontent" id="leftcontents">
				<div style="height:50px;width:100%;background-color:#2A94DE"></div>
				<div style="height:20px;"></div>
				<div class="leftcontentInner" id="extractFormNode">
					<form class="form-horizontal1" id="formnode"  onsubmit="return false;">
					    			 
						<div class="form-group" id="formhead" style="position=relative;margin-top=20px">
							<div class="col-sm-10">
								<input type="text" name="questionnaireName" class="form-control" id="questionnaireName" value="表 单 名 称" queNum='0' queCount='0'>
							</div>						
							<div style="height:28px;"></div>
						</div>
						
						<!-- 描述编辑区域B -->						
						<div class="edit_area" id="edit_area">
						     <div class="grid-container">
                                <div class="grid-width-100">
                                <!--此注释是个标记动不得BB-->	
		                           <div id="editor">${Comment}</div>
		                        <!--此注释是个标记动不得EE-->	    
	                            </div>
                             </div>					
						</div>
						<!-- 描述编辑区域E -->
						
						${FormNode}		
							
					</form>
				</div>
				<div class='initTip'>
				    <h4 style='margin-left:182px;'>请在右侧点击字段添加</h4>
				</div>
			</div>
			<div class="col-md-3 rightcontent">
				<div class="rightcontent2">
					<div class="rightcontentinner" id="rightcontentinner">
						<!-- 选项卡B -->
						<div class="rightHead">
							<div class="span1 fl add"><center><sapn >添加字段</sapn></center></div>
							<div class="span2 fr edit"><center><sapn >编辑字段</sapn></center></div>
						</div>
						<!-- 选项卡E -->
						<!-- 字段B -->
						<div class="item"  id="click_r">
							<div style="height:10px;"></div>
							<div class="itemmargintop">
								<div class="iteml fl" id="oneLineText"><span class="glyphicon glyphicon-font"></span> 单行文字</div>
								<div class="itemr fr" id="MulLineText"><span class="fa fa-file-powerpoint-o" ></span> 多行文字</div>
							</div>
							<div class="itemmargintop">
								<div class="iteml fl" id="oneSelect"><i class="fa fa-dot-circle-o" ></i> 单项选择</div>
								<div class="itemr fr" id="MulSelect"><span class="fa fa-check-square" ></span> 多项选择</div>
							</div>
							<div class="itemmargintop">
								<div class="iteml fl" id="matrixOneSelect"><i class="fa fa-table" ></i> 矩阵单选</div>
								<div class="itemr fr" id="matrixMulSelect"><span class="fa fa-th" ></span> 矩阵多选</div>
							</div>
							<div class="itemmargintop">
								<div class="iteml fl" id="number"><span class="fa fa-bar-chart" ></span> 数 字</div>
								<div class="itemr fr" id="date"><span class="fa fa-calendar-o" ></span> 日 期</div>
							</div>
							<div class="itemmargintop">
								<div class="iteml fl" id="selectDown"><span class="fa fa-caret-square-o-down" ></span> 下拉菜单</div>
								<div class="itemr fr" id="score"><span class="fa fa-star-o" ></span> 评 分</div>
							</div>
							<div class="itemmargintop">
								<div class="iteml fl" id="phone"><span class="fa fa-mobile-phone (alias)" ></span> 手机号码</div>
								<div class="itemr fr" id="email"><span class="fa fa-envelope" ></span> 邮 箱</div>
							</div>
							<div class="itemmargintop">
								<div class="iteml fl" id="username"><span class="fa fa-address-card-o" ></span> 姓 名</div>
								<div class="itemr fr" id="common"><span class="fa fa-text-width" ></span> 通用输入框</div>
							</div>
							<div class="itemmargintop">
								<div class="iteml fl" id="twoSelect"><span class="fa fa-angle-double-down" ></span> 两级下拉框</div>
								<div class="itemr fr" id="jumpChoose"><span class="fa fa-level-down" ></span> 选择跳转</div>
							</div>
						</div>
						
						<!-- 编辑字段 -->
						<div class="itemEdit" style="display:block;">	
						</div>					
					</div>				
				</div>
			</div>
			<div class="previewFormButton">
				<a href="${APP_PATH}/Views/previewForm" target="_blank"><button id="previewForm" class="btn btn-info btn-xs ">预览表单</button></a>
				<a><button class="btn btn-info btn-xs" id="saveForm">保存表单</button></a>
			</div>		
		</div>
	</div>
</body>
	<script type="text/javascript">
		$(document).ready(function(){	  
			var title='${QuestionTitle}';
		   if(title!=""){
			   $(".initTip").css("display","none");
			   var queNum='${QueNum}';
			   $("#questionnaireName").attr("queNum",queNum);
			   var QueCount='${QueCount}';
			   $("#questionnaireName").attr("QueCount",QueCount);
			$("#questionnaireName").val(title);
		   }
		   $(".form-group").css({"position":"relative","margin-top":"20px"});
			  $(".must").css({"position":"absolute","top": "-15px","left":"15px"});
			 
			  var labels=$(".form-group").find("label");
			  $(labels[0]).css("max-width","96%");
			  for(var i=1;i<labels.length;i++){
			    $(labels[i]).css("max-width","92%");
			  }
			  
			  
			//获取表单
			$(document).on('click','#previewForm',function(){	
																				//去除页面跳转提示
						window.onbeforeunload = function(){
							return;
						}
				        var queName=$("#questionnaireName").val();              //获取标题	
				        $("#formhead").css("display",'none');                   //隐藏标题输入框
						                                            
						var Describe=document.getElementsByTagName("iframe")[0].contentWindow.document.getElementsByTagName("body")[0];
						if(Describe.innerText=="描述你的表单!")
						Describe=" ";
				        var queComment=$(Describe).html();                      //获取描述内容
						  
						$("#formnode").find("#edit_area").css("display","none");//隐藏编辑区域
						var FormNode=$("#extractFormNode");                     //获取需要预览的表单节点	
				        var nodeArr=$(FormNode).html();	
				        var start=nodeArr.indexOf("<!--此注释是个标记动不得BB-->");
						var end=nodeArr.indexOf("<!--此注释是个标记动不得EE-->");
						var removeNode=nodeArr.substring(start,end);
						nodeArr=nodeArr.replace(removeNode,"");

				        $("#formnode").find("#edit_area").css("display","block");//显示编辑区域
				        $("#formhead").css("display",'block');                  //显示标题输入框
		        		            	      	    	      
				        $.ajax({
							url:'${APP_PATH}/FormPreview/getPreviewForm',       //传到控制器controller
							data:{'formNode':nodeArr,'questionTitle':queName,'questionDescribe':queComment},
							type:'post',
							success:function(data){}
						})			
					});
			
			//保存表单
			$(document).on('click','#saveForm',function(){
					
					window.onbeforeunload = function(){
						return;
					}
				    var queName=$("#questionnaireName").val();              //获取标题	
			        $("#formhead").css("display",'none');                   //隐藏标题输入框
					                                            
					var Describe=document.getElementsByTagName("iframe")[0].contentWindow.document.getElementsByTagName("body")[0];
					if(Describe.innerText=="描述你的表单!")
						Describe=" ";
			        var queComment=$(Describe).html();                      //获取描述内容
										 
					$("#formnode").find("#edit_area").css("display","none");//隐藏编辑区域
					var FormNode=$("#extractFormNode");                     //获取需要预览的表单节点		      
			        var nodeArr=$(FormNode).html();		  
			        var start=nodeArr.indexOf("<!--此注释是个标记动不得BB-->");
					var end=nodeArr.indexOf("<!--此注释是个标记动不得EE-->");
					var removeNode=nodeArr.substring(start,end);
					nodeArr=nodeArr.replace(removeNode,"");
					
			        $("#formnode").find("#edit_area").css("display","block");//显示编辑区域
			        $("#formhead").css("display",'block');                  //显示标题输入框
			        
				        var queCreatDate=getNowFormatDate();//获取表单创建日期			        
				        var queNum = $("#questionnaireName").attr('queCount');
				        var index = layer.msg("请稍后",{icon:16,shade:0.01,time:20*1000});
				        
				        var title='${QuestionTitle}';
				        var formId='${formId}';
				        var currentPage='${CurrentPage}';
				        var path='';
				        var dat='';
				        var openUrl='';
						if(title!=""){
							 var publish1 = GetQueryString("publish");
							 if(publish1==1){
								 path='${APP_PATH}/Form/publishModefiyForm';
							     dat={id:formId,quesHtml:nodeArr,name:queName,quesNum:queNum,comment:queComment,quesDate:queCreatDate};
							     openUrl="${APP_PATH}/Views/formManage?currentPage="+currentPage;
							 }else{
								 path='${APP_PATH}/Form/modefiyForm';
							     dat={id:formId,quesHtml:nodeArr,name:queName,quesNum:queNum,comment:queComment,quesDate:queCreatDate};
							     openUrl="${APP_PATH}/Views/formManage?currentPage="+currentPage;
							 }
						     
						 }else{
							 path='${APP_PATH}/Form/saveForm'; 
							 dat={quesHtml:nodeArr,name:queName,quesNum:queNum,comment:queComment,quesDate:queCreatDate};
							 openUrl="${APP_PATH}/Views/formManage?lastPages="+'lastPages';
						 }
						
				        $.ajax({
							url:path,                 //传到控制器controller
							data:dat,
							type:'post',
							success:function(data){
								console.log(data);
								if(data.code==200){
									//layer.alert(index);
									layer.confirm('保存成功！', {
										  closeBtn: 0,
										  btn: ['确定'] //按钮				
										},  
										function(){
											window.open(openUrl,"main");											
										});
								}else{
									layer.alert("保存失败");
								}
							}
						});		        	        
					});
			
			//获取当前时间B
			function getNowFormatDate() {
			    var date = new Date();
			    var seperator1 = "-";
			    var seperator2 = ":";
			    var month = date.getMonth() + 1;
			    var strDate = date.getDate();
			    if (month >= 1 && month <= 9) {
			        month = "0" + month;
			    }
			    if (strDate >= 0 && strDate <= 9) {
			        strDate = "0" + strDate;
			    }
			    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
			            + " " + date.getHours() + seperator2 + date.getMinutes()
			            + seperator2 + date.getSeconds();
			    return currentdate;
			}
			//获取当前时间E
			
			function GetQueryString(name)
			{
			     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
			     var r = window.location.search.substr(1).match(reg);
			     if(r!=null)return  decodeURI(r[2]); return null;
			}
			
			
		})
		
	</script>
</html>