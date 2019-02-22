<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%pageContext.setAttribute("APP_PATH",request.getContextPath());
  pageContext.setAttribute("AdminType",request.getSession().getAttribute("userType"));
  pageContext.setAttribute("CurrentPageFaBu",request.getSession().getAttribute("CurrentPageFaBu"));
%>
              
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/common.css">
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/bootstrap.min.css">
  
  <script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/js/layer.js"></script>
  <style type="text/css">
  #showDiv{
   height:290px;
   }
   td, th {
	word-break: keep-all; /* 不换行 */
	white-space: nowrap; /* 不换行 */
	overflow: hidden; /* 内容超出宽度时隐藏超出部分的内容 */
	text-overflow: ellipsis;
	text-align: center;
}

  </style>
</head>
<body>
    
	<div class="row2" style="padding-left:20px;padding-top:10px;padding-right:20px;">
		<div style="border-left:2px solid #0098CD;padding-left:6px;width:100%;"><h4>表单管理</h4></div>
		<div style="border-top: 1px solid #D9DFE4;margin-bottom:30px;"></div>
		<div style="border: 1px solid #D9DFE4;margin-top:10px;padding-top:20px;padding-right:5px;padding-left:5px;border-radius:2px;" id="showDiv">
			
			
			<table id="showTable" class="table table-hover">
			    <thead>
			      <tr align="center">
			        <th width="10%"><strong>序号</strong></th>
			        <th width="25%"><strong>问卷名称</strong></th>			       
			        <th width="15%"><strong>问题数量</strong></th>
			        <th width="15%"><strong>状 态</strong></th>
			        <th width="40%"><strong>操 作</strong></th>
			      </tr>
			    </thead>
			    <tbody>
			      
			</table>         
		 </div>
		
			<!-- 分页信息 -->
			<div class="col-md-4 margin-top10 margin-left" id="page_info">
				
			</div>
			<!-- 分页导航 -->
			<div class="col-md-4" id="page_nav" style="display:none;width:500px;">
				
			</div>
   </div>
   
   
  <!--复制弹出框B--> 
  <div class="modal fade" tabindex="-1" role="dialog" id="copy_modal">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content" style="width: 450px;">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title"></h4>
		      </div>
		      <div class="modal-body">
		        	<form class="form-horizontal" id="form_modefiy_confirm">
		        	      <div class="form-group">
						    <label class="col-sm-2 control-label" style="display: inline-block;width: 300px;text-align: left;font-weight: normal;">你的表单已复制成功，新表单名称如下：</label>					   
						  </div>
						  <div class="form-group">
						    <label class="col-sm-2 control-label" id="form-title" style="display: inline-block;width: 300px; text-align: left;"></label>					   
						  </div>
						  <div class="form-group">
						    <label class="col-sm-2 control-label" style="display: inline-block;width: 300px; text-align: left;font-weight: normal;">已复制的内容包括：</label>	
						    <label class="col-sm-2 control-label" style="display: inline-block;width: 300px; text-align: left;font-weight: normal;">&nbsp;●&nbsp;表单字段和样式</label>	
						    <label class="col-sm-2 control-label" style="display: inline-block;width: 300px; text-align: left;font-weight: normal;">&nbsp;●&nbsp;表单提示文案</label>						    				   
						  </div>						 						  					  
					</form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-info btn-sm" id="copy_look" data-dismiss="modal">查看表单</button>
		        <button type="button" class="btn btn-info btn-sm" id="copy_edit" data-dismiss="modal">编辑表单</button>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog --> 
	 </div>
  <!--复制弹出框E--> 
</body>
<script type="text/javascript">

 
	  $(document).ready(function(){
		  
		var query = location.search.substring(1);
	    var pages = query.substring(query.indexOf('=') + 1);
	    if(pages!=""){
	    	if(pages=="lastPages"){
	    		showLastForm();                              //显示最后一页
	    	}else{
	    		getAllSupplipes(parseInt(pages));           //显示第pages页
	    	}
	    }		
	    else
		    getAllSupplipes(1);                        //显示第一页
		 
	  //显示最后一页B
		   function showLastForm(){
		    	
			   var pn=1;
			   $.ajax({
				    url:'${APP_PATH}/Form/getForm',
					type:'get',
					data:'pn='+pn,
					success:function(data){
						if(data.code==200){
							var num=data.extend.form.pages;
							getAllSupplipes(num);			
						}else{}
					} 
		   })  
		 }
	     //显示最后一页E
	     
		// 填充数据
			function getAllSupplipes(pn){
				$("#showTable tbody").empty();
				var load = layer.msg("正在加载数据,请稍后!",{icon:16,shade:0.05,time:38*1000});
				$.ajax({
					url:'${APP_PATH}/Form/getForm',
					type:'get',
					data:'pn='+pn,
					success:function(data){
						if(data.code==200){
							layer.close(load)
							var form = data.extend.form.list;
							if(form!=""){
								$("#page_nav").css("display","block");	
							}
							var currentPage=parseInt(data.extend.form.pageNum);//当前页
							var pageSize=parseInt(data.extend.form.pageSize);  //每页数量				
							var i=pageSize*currentPage-(pageSize-1);
							
							$.each(form,function(index,item){
								var tr = $("<tr align='centers'></tr>");
								var indexTd = $("<td></td>").append(i++);
								var nameTd = $("<td></td>").append(item.name);
								var queNumTd = $("<td></td>").append(item.quesNum);
								
								var queStatuTd =item.quesStatu==0?$("<td></td>").append("等待发布"):$("<td></td>").append("已经发布");
								var buttonTd="";
								if(item.quesStatu==0){
									var buttonTd = $("<td><button class='btn btn-info btn-xs release' id='"+item.id+"'><span class='glyphicon glyphicon-open' aria-hidden='true'></span> 发 布 </button>&nbsp;&nbsp;<button class='btn btn-info btn-xs priview' id='"+item.id+"'><span class='glyphicon glyphicon-eye-open' aria-hidden='true'></span> 预 览</button>&nbsp;&nbsp;<button class='btn btn-success btn-xs copy' id='"+item.id+"'><span class='glyphicon glyphicon-copy' aria-hidden='true'></span> 复制</button>&nbsp;&nbsp;<button class='btn btn-warning btn-xs modefiy' id='"+item.id+"' publish='0'><span class='glyphicon glyphicon-edit' aria-hidden='true'></span> 编辑</button>&nbsp;&nbsp;<button class='btn btn-danger btn-xs delete' id='"+item.id+"'><span class='glyphicon glyphicon-trash' aria-hidden='true'></span> 删 除</button></td>")
								}else{
									var buttonTd = $("<td><button class='btn btn-info btn-xs release ' disabled id='"+item.id+"'><span class='glyphicon glyphicon-open' aria-hidden='true'></span> 发 布 </button>&nbsp;&nbsp;<button class='btn btn-info btn-xs priview' id='"+item.id+"'><span class='glyphicon glyphicon-eye-open' aria-hidden='true'></span> 预 览</button>&nbsp;&nbsp;<button class='btn btn-success btn-xs copy' id='"+item.id+"'><span class='glyphicon glyphicon-copy' aria-hidden='true'></span> 复制</button>&nbsp;&nbsp;<button class='btn btn-warning btn-xs modefiy'  publish='1' id='"+item.id+"'><span class='glyphicon glyphicon-edit' aria-hidden='true'></span> 编辑</button>&nbsp;&nbsp;<button class='btn btn-danger btn-xs delete' id='"+item.id+"'><span class='glyphicon glyphicon-trash' aria-hidden='true'></span> 删 除</button></td>")
								}
								var idTd = $("<td></td>").append(item.id).css("display","none");
								
								tr.append(indexTd)
								.append(nameTd)
								.append(queNumTd)
								.append(queStatuTd)
								.append(buttonTd)
								.append(idTd);
								tr.appendTo("#showTable tbody");
							});
							
							// 分页信息显示
							makePageInfo(data)
							//导航信息显示
							makePageNav(data);
						}else{

						}
					}
				})
			}
			
			//分页信息
			function makePageInfo(data){
				//清空文档
				$("#page_info").empty();
				var pageInfo = $("<span></span>").append("当前第"+data.extend.form.pageNum+"页 , 共"+data.extend.form.pages+"页 , 总共"+data.extend.form.total+"条记录");
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
					getAllSupplipes(1)
				})
				ul.append(fristPageLi);
				
				if(data.extend.form.hasPreviousPage==true){
					var previousPageLi = $("<li></li>").append($("<a></a>").attr("href","#").append("<<"));
					previousPageLi.click(function(){
						getAllSupplipes(data.extend.form.pageNum-1);
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
						getAllSupplipes(item);
					})
					ul.append(pageLi);
				})
				
				if(data.extend.form.hasNextPage==true){
					var nextPageLi = $("<li></li>").append($("<a></a>").attr("href","#").append(">>"));
					nextPageLi.click(function(){
						getAllSupplipes(data.extend.form.pageNum+1);
					})					
					ul.append(nextPageLi);
				}
				
				var lastPageLi = $("<li></li>").append($("<a></a>").attr("href","#").append("末页"));
				lastPageLi.click(function(){
					getAllSupplipes(data.extend.form.pages);
				})
				ul.append(lastPageLi);
				
				$("<nav></nav>").append(ul).appendTo("#page_nav");
			}
			//表单编辑B
	          $(document).on('click','.modefiy',function(){
	          	  var load = layer.msg("正在加载数据,请稍后!",{icon:16,shade:0.05,time:38*1000});
	        	  var formId=$(this).parents("tr").find("td:eq(5)").text();
	        	  var form="diredit";
	        																	//获取表单的发布状态
	        	  var publish = $(this).attr("publish");		
	        	  var url = "";
	        	  if(publish==1){
	        		  url = "${APP_PATH}/Views/addQuestions?publish=1";
	        	  }else{
	        		  url = "${APP_PATH}/Views/addQuestions?publish=0";
	        	  }
	        	  $.ajax({
	    				url:'${APP_PATH}/Form/getFormById',
	    				type:'post',
	    				data:{"formId":formId,"form":form},    	
	    				success:function(data){
	    					if(data.code==200){
	    						layer.close(load);
	    						window.open(url,"main");				
	    					}else{
	    						layer.alert("出现错误!");
	    					}
	    				}
	    			});			  
			 });
			//表单编辑E
			
			   var newFormId="";
			 //表单复制B
	          $(document).on('click','.copy',function(){
	        	  var load = layer.msg("正在复制数据,请稍后!",{icon:16,shade:0.05,time:38*1000});
	        	  var formId=$(this).parents("tr").find("td:eq(5)").text();
	        	  var formTitle=$(this).parents("tr").find("td:eq(1)").text();
	        	  $.ajax({
	    				url:'${APP_PATH}/Form/getOneForm',
	    				type:'post',
	    				data:'formId='+formId,
	    				success:function(data){
	    					if(data.code==200){   						
	    						newFormId = data.extend.newFormId;    	//获取新表单ID				
	    						layer.close(load);
	    						$('#copy_modal .modal-title').text("表单复制成功");
	    			        	$('#copy_modal #form-title').text('[新]'+formTitle);
	    						$('#copy_modal').modal({"backdrop":"static"});					
	    					}else{
	    						layer.alert("复制失败!");
	    					}
	    				}
	    			});			  
			 });
	            //查看表单B
	            $(document).on('click','#copy_look',function(){          
	            	showLastForm();//显示最后一页	
	            });
	           //查看表单E 
	           
	           //弹出框编辑表单B
	           $(document).on('click','#copy_edit',function(){
	        	   var load = layer.msg("正在加载数据,请稍后!",{icon:16,shade:0.05,time:38*1000});
	        	   var form="copyedit";
	        	  $.ajax({
	    				url:'${APP_PATH}/Form/getFormById',
	    				type:'post',
	    				data:{"formId":newFormId,"form":form},
	    				success:function(data){
	    					if(data.code==200){
	    						layer.close(load);
	    						window.open("${APP_PATH}/Views/addQuestions","main");				
	    					}else{
	    						layer.alert("遇到错误!");
	    					}
	    				}
	    			});			  
			 });
	           //弹出框编辑表单E
	         //表单复制E
			  
	         
		 //表单预览B
		  $(document).on("click",".priview",function(){
			  var load = layer.msg("正在加载数据,请稍后!",{icon:16,shade:0.05,time:38*1000});
			  var formId=$(this).attr("id");
			  $.ajax({
					url:'${APP_PATH}/FormPreview/getForm',
					data:'formId='+formId,
					type:'post',
					success:function(data){
						console.log(data);
						if(data.code==200){
							layer.close(load);
							window.open("${APP_PATH}/Views/previewForm");
						}else{
							layer.alert("预览失败");
						}							
					}	
				}) 
		  });
		 //表单预览E
		
			 //表单删除B
			  $(document).on("click",".delete",function(){
				  var formId=$(this).attr("id");
	
				  layer.confirm("是否删除表单【"+$(this).parents("tr").find("td:eq(1)").text()+"】以及该表单收集的数据?",{icon:3},function(index){
					  var load = layer.msg("正在删除表单,请稍后!",{icon:16,shade:0.05,time:38*1000});
					  $.ajax({
							url:'${APP_PATH}/Form/deleteForm',
							data:'id='+formId,
							type:'post',
							success:function(data){
								console.log(data);
								if(data.code==200){
									layer.close(load);
									
									 getAllSupplipes(currentPage);
								}else{
									layer.alert("删除失败！");
								}							
							}	
						})
						layer.close(index);                                            //确定后关闭确认窗口
					})
			  });
			//表单删除E
			 
			  //表单发布B
			  $(document).on("click",".release",function(){
				  var formId=$(this).attr("id");
				  if($(this).attr("disabled")==false){
					  alert(123);
					  return;
				  }
				  layer.confirm("是否发布表单【"+$(this).parents("tr").find("td:eq(1)").text()+"】?",{icon:3},function(index){
					  var load = layer.msg("正在发布表单,请稍后!",{icon:16,shade:0.05,time:38*1000});
					  $.ajax({
							url:'${APP_PATH}/FormPreview/ReleaseForm',
							data:'formId='+formId,
							type:'post',
							success:function(data){
								if(data.code==200){	
									layer.close(load);
									var currentPage='${CurrentPageFaBu}';
									getAllSupplipes(currentPage);	//发布后刷新表格发布状态
									
									window.open("${APP_PATH}/Views/dataSummarize?id="+formId+"&index=1");
								}else{
									layer.alert("发布失败！");
								}							
							  }	
						    })
						      layer.close(index);                                            //确定后关闭确认窗口
					     })
			     })
	          });
	          //表单发布E  	            
</script>
</html>