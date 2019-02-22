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
 
  <script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/js/layer.js"></script>
  <style type="text/css">
  body{
   background-color:#fff;
  }
   .showData{
   		color:#337AB7;-moz-user-select: none;-webkit-user-select: none;-ms-user-select: none;-khtml-user-select: none;user-select: none;cursor:default;
   }
   #showDiv{
   height:290px;
   }
   .form-control{
   width: 80%;
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
		<div style="border-left:2px solid #0098CD;padding-left:6px;width:100%;"><h4>验证数据</h4></div>
		<div style="border-top: 1px solid #D9DFE4;margin-bottom:10px;"></div>
		
		<!-- 表格区域B -->
		<div style="border: 1px solid #D9DFE4;margin-top:10px;padding-top:20px;padding-right:5px;padding-left:5px;border-radius:2px;" id="showDiv">			
			<table id="showTable" class="table table-hover">
			    <thead>
			      <tr align="center">
			        <th width="10%"><strong>序号</strong></th>
			        <th width="25%"><strong>学号</strong></th>			       
			        <th width="25%"><strong>身份证</strong></th>
			        <th width="15%"><strong>姓名</strong></th>			       
			        <th width="20%"><strong>操 作</strong></th>
			      </tr>
			    </thead>
			    <tbody>
			    </tbody>  
			</table>  	     
		 </div>
		 <!-- 表格区域E -->
		 
		 <!-- 批量操作按钮B -->
		 <div style="width:50%;height:60px;margin-top:10px;">			
			<button class="btn btn-sm btn-info btnOneAdd"><span class="glyphicon glyphicon-hdd"></span> 单个添加 </button>&nbsp;&nbsp;&nbsp;
			<button class="btn btn-sm btn-info btnAdd"><span class="glyphicon glyphicon-hdd"></span> 批量添加 </button>&nbsp;&nbsp;&nbsp;
			<button class="btn btn-sm btn-danger btnDelete"><span class="glyphicon glyphicon-trash"></span> 批量删除 </button>
		 </div> 
		 <!-- 批量操作按钮E --> 
			
		 <!-- 分页信息 -->
		 <div class="col-md-4 margin-top10 margin-left" id="page_info"></div>
		 <!-- 分页导航 -->
		 <div class="col-md-4" id="page_nav" style="display:none;width:500px"></div>
    </div>	
    
    <!-- 添加认证数据的 弹出框B -->
		<div class="modal fade" tabindex="-1" role="dialog" id="confirm_add_modal">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
		        <h4 class="modal-title">添加身份数据</h4>
		      </div>
		      <div class="modal-body">
		        	<form class="form-horizontal" id="form_add_confirm">
						  <div class="form-group">
						    <label for="stuNumber" class="col-sm-2 control-label" >学号</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control stuNumber"  name="stuNumber" placeholder="学号" maxlength="12">
						      <span  class="help-block"></span>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="stuCard" class="col-sm-2 control-label">身份证</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control stuCard" name ="stuCard" placeholder="身份证号" maxlength="18">
						      <span  class="help-block"></span>
						    </div>
						  </div>						 
						  <div class="form-group">
						    <label for="stuName" class="col-sm-2 control-label">姓名</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control stuName" name ="stuName" placeholder="姓名" maxlength="4">
						      <span  class="help-block"></span>
						    </div>
						  </div>					  
					</form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal"> 关  闭 </button>
		        <button type="button" class="btn btn-info btn-sm" id="confirm_save"  > 保  存 </button>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		  
	 </div>
     <!-- 添加认证数据的 弹出框B -->
     
     <!-- 编辑认证数据的 弹出框B -->
		<div class="modal fade" tabindex="-1" role="dialog" id="confirm_modefiy_modal">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
		        <h4 class="modal-title">编辑身份数据</h4>
		      </div>
		      <div class="modal-body">
		        	<form class="form-horizontal" id="form_modefiy_confirm">
		        	      <div class="form-group" style="display: none;">
						    <label for="stuId" class="col-sm-2 control-label">序号</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control stuId"  name="stuId" placeholder="">
						      <span  class="help-block"></span>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="stuNumber" class="col-sm-2 control-label">学号</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control stuNumber"  name="stuNumber" placeholder="" maxlength="12">
						      <span  class="help-block"></span>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="stuCard" class="col-sm-2 control-label">身份证</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control stuCard" name ="stuCard" placeholder="" maxlength="18">
						      <span  class="help-block"></span>
						    </div>
						  </div>						 
						  <div class="form-group">
						    <label for="stuName" class="col-sm-2 control-label">姓名</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control stuName" name ="stuName" placeholder="" maxlength="4">
						      <span  class="help-block"></span>
						    </div>
						  </div>					  
					</form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal"> 关  闭 </button>
		        <button type="button" class="btn btn-info btn-sm" id="edit_save"  > 保  存 </button>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		  
	 </div>
     <!-- 编辑认证数据的 弹出框B --> 
</body>
<script type="text/javascript">
//修改按钮点击事件
	  $(document).ready(function(){
		  getAllSupplipes(1);
		   //填充数据B
			function getAllSupplipes(pn){
				$("#showTable tbody").empty();
				var load = layer.msg("正在加载数据,请稍后!",{icon:16,shade:0.05,time:38*1000});
				$.ajax({
					url:'${APP_PATH}/Confirm/getForms',
					type:'get',
					data:'pn='+pn,
					success:function(data){
						layer.close(load)
						if(data.code==200){
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
								var numberTd = $("<td></td>").append(item.idx);
								var cardTd = $("<td></td>").append(item.idcard);
								var nameTd = $("<td></td>").append(item.name);																
								var buttonTd = $("<td><button class='btn btn-info  btn-xs edit' id='"+item.id+"'><span class='glyphicon glyphicon-edit' aria-hidden='true'></span>编辑</button>&nbsp;&nbsp;<button class='btn btn-danger btn-xs delete' id='"+item.id+"'><span class='glyphicon glyphicon-trash' aria-hidden='true'></span> 删 除</button></td>");
								var idTd = $("<td></td>").append(item.id).css("display","none");
								
								tr
								.append(indexTd)
								.append(numberTd)								
								.append(cardTd)
								.append(nameTd)
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
			// 填充数据E
			
			//分页信息B
			function makePageInfo(data){
				//清空文档
				$("#page_info").empty();
				var pageInfo = $("<span></span>").append("当前第"+data.extend.form.pageNum+"页 , 共"+data.extend.form.pages+"页 , 总共"+data.extend.form.total+"条记录");
				pageInfo.appendTo("#page_info");
				currentPage = data.extend.form.pageNum;
				total = data.extend.form.total;	
			}
			//分页信息E
			
			//导航信息 B
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
			//导航信息 E
			
			 //显示最后一页B
			   function showLastForm(){
				   var pn=1;
				   $.ajax({
					    url:'${APP_PATH}/Confirm/getForms',
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
		     
		 //点击删除B
		  $(document).on('click','.delete',function(){
			  var formId=$(this).attr("id");

			  layer.confirm("是否删除数据【"+$(this).parents("tr").find("td:eq(1)").text()+"】?",{icon:3},function(index){
				  var load = layer.msg("正在删除数据,请稍后!",{icon:16,shade:0.05,time:38*1000});
				  $.ajax({
						url:'${APP_PATH}/Confirm/deleteOneData',
						data:'id='+formId,
						type:'post',
						success:function(data){
							if(data.code==200){	
								layer.close(load);
								 getAllSupplipes(currentPage);
							}else{
								layer.alert("删除失败，请检查!");
							}							
						}						
					})
					layer.close(index);
				})
			});
		  //点击删除E
		  
		  //点击添加B
			 $(document).on('click','.btnOneAdd',function(){	
				 $("#confirm_add_modal .stuName").val("");
				 $('#confirm_add_modal').modal({"backdrop":"static"});
			 });
		     
			    //保存按钮点击事件B
				$("#confirm_save").click(function(){
					var stuNumber=$("#confirm_add_modal .stuNumber").val();
					var stuCard=$("#confirm_add_modal .stuCard").val();
					var stuName=$("#confirm_add_modal .stuName").val();
					if(stuNumber==""){					
						$("#confirm_add_modal .stuNumber").attr("placeholder","学号不能为空!").focus();
						return;
					}else if(stuCard==""){
						$("#confirm_add_modal .stuCard").attr("placeholder","身份证号不能为空!").focus();
						return;
					}else if(stuName==""){
						$("#confirm_add_modal .stuName").attr("placeholder","姓名不能为空!").focus();
						return;
					}
					if(!isNum(stuNumber)){
						layer.alert("学号格式不对");
						return;
					}
					if(!idCardVildate(stuCard)){
						layer.alert("身份证格式不对");
						return;
					}
					var load = layer.msg("正在保存数据,请稍后!",{icon:16,shade:0.05,time:38*1000});
					$.ajax({
						url:'${APP_PATH}/Confirm/saveOneData',
						data:{'number':stuNumber,'card':stuCard,'name':stuName},
						type:'post',
						success:function(data){
							console.log(data);
							if(data.code==200){
								layer.close(load);
								$("#confirm_add_modal").modal("hide");								
								layer.confirm('保存成功！', {
									  btn: ['确定'] //按钮
									}, function(){
										layer.closeAll('dialog');
										showLastForm();											
									});
							}else{
								layer.alert("添加失败，可能是输入的学号已经存在！");
							}							
						}					
					})
				});
			   //保存按钮点击事件B
			   
	//点击添加E
		  
	//点击编辑B
	    var currentIndex;
		$(document).on('click','.edit',function(){	
			currentIndex=this;
			$('#confirm_modefiy_modal').modal({"backdrop":"static"});
			$("#confirm_modefiy_modal .stuId").val($(this).parents("tr").find("td:eq(5)").text());
			$("#confirm_modefiy_modal .stuNumber").val($(this).parents("tr").find("td:eq(1)").text());
			$("#confirm_modefiy_modal .stuCard").val($(this).parents("tr").find("td:eq(2)").text());
			$("#confirm_modefiy_modal .stuName").val($(this).parents("tr").find("td:eq(3)").text());
			
		});	
		//编辑保存按钮点击事件B
		$("#edit_save").click(function(){
			var stuId=$("#confirm_modefiy_modal .stuId").val();
			var stuNumber=$("#confirm_modefiy_modal .stuNumber").val();
			var stuCard=$("#confirm_modefiy_modal .stuCard").val();
			var stuName=$("#confirm_modefiy_modal .stuName").val();
			if(stuNumber==""){					
				$("#confirm_modefiy_modal .stuNumber").attr("placeholder","学号不能为空!").focus();
				return;
			}else if(stuCard==""){
				$("#confirm_modefiy_modal .stuCard").attr("placeholder","身份证号不能为空!").focus();
				return;
			}else if(stuName==""){
				$("#confirm_modefiy_modal .stuName").attr("placeholder","姓名不能为空!").focus();
				return;
			}
			if(!isNum(stuNumber)){
				layer.alert("学号格式不对");
				return;
			}
			if(!idCardVildate(stuCard)){
				layer.alert("身份证格式不对");
				return;
			}
			var load = layer.msg("正在保存数据,请稍后!",{icon:16,shade:0.05,time:38*1000});
			$.ajax({
				url:'${APP_PATH}/Confirm/editSaveData',
				data:{'id':stuId,'number':stuNumber,'card':stuCard,'name':stuName},
				type:'post',
				success:function(data){
					if(data.code==200){
						layer.close(load);
						$("#confirm_modefiy_modal").modal("hide");
						$(currentIndex).parents("tr").find("td:eq(1)").text(stuNumber);
						$(currentIndex).parents("tr").find("td:eq(2)").text(stuCard);
						$(currentIndex).parents("tr").find("td:eq(3)").text(stuName);
						layer.alert("保存成功!");
					}else{
						layer.alert("添加失败，请检查");
					}							
				}					
			})
		});
	   //编辑保存按钮点击事件E
	//点击编辑E
			
///////////////////////////////////////////////////////////// //////////////////////////////// 
			var upFileLayer="";
			$(".btnAdd").click(function(index){
				layer.confirm('是否已有数据模板？如第一次使用请先下载', {icon:3,
					  btn: ['有了直接上传','没有现在下载'] //按钮
					}, function(index){
						upFileLayer = layer.open({
							  type: 1,
							  skin: 'layui-layer-rim', //加上边框
							  area: ['420px', '240px'], //宽高
							  content: " <div style='padding:20px;'><form id='upFile'><input type='file' name='file'/><form></br><button class='btn  btn-sm btn-primary  btnSubmit  ' ><span class='glyphicon glyphicon-open'></sapn>上传</button> &nbsp;&nbsp;&nbsp;<br><br><br><button class='btn  btn-sm btn-default  layui-layer-close layui-layer-close1' style='margin-left:260px'>取 消</button></div> "
							});
						layer.close(index);
					}, function(){
						layer.confirm("下载填写完成后，再次点击添加数据上传即可,注：不可更改模板",{icon:0,btn:['好的']},function(index){
							layer.close(index);
							window.open("${APP_PATH}/Views/downloadEmptyExcel")
						})
					});
			})
		  
			$(".btnDelete").click(function(){
				layer.confirm('一旦删除，可能需要重新导入!是否删除,且所有权限填写认证的问卷都无法认证',{icon:3,btn:['确定','取消']},function(){
					
					$.ajax({
						url:'${APP_PATH}/Confirm/deleteDatas',
						type:'post',
						success:function(data){
							if(data.code==200){
								layer.alert("数据删除成功",{icon:1});							
								checkData();
							}
						},
						error:function(data){
							layer.alert("很抱歉服务器错误",{icon:2});
						}
					})
				},function(index){
					layer.close(index);	
				})	
			})
			
			$(document).on('click',".btnSubmit",function(){
				//实现数据上传
				if($("input[name='file']").val()==""){
					alert("没有选择文件");
					return;
				}else{
					layer.close(upFileLayer);
					var load = layer.msg("正在上传,请稍后!",{icon:16,shade:0.06,time:38*1000});					//提示
					$.ajax({
					url:'${APP_PATH}/Data/uploadFile',
					data:new FormData($("#upFile")[0]),
					async:false,
					contentType:false,//必须有
		            processData:false,//必须有 
					type:'post',
					success:function(data){
							layer.close(load);
						if(data.code==200){
							alert("上传完成")
							checkData();
						}else if(data.code==100){
							 alert("上传文件格式不符合");
							}
						},
						error:function(data){
							lalert("上传出错 可能文件过大")
						}
					});
				}
				
				
			});
			checkData();
			//判断是否有数据
			function checkData(){
				
			$.ajax({
				url:'${APP_PATH}/Confirm/checkData',
				type:'post',
				success:function(data){
					if(data.code==200){
						$(".showData").text("身份证学号");
					}else{
						$(".showData").text("当前没有数据");
					}
				}
			})
			}
			// 是否是12位数据			
			function isNum(numValue){ 
				 var numPattern=/^\d{12}$/; //数字的正则表达式 
				 result=numPattern.test(numValue); 
				 return result; 
			} 
			
			/** 
			 * 检验18位身份证号码（15位号码可以只检测生日是否正确即可，自行解决） 
			 * 
			 * @param idCardValue 
			 *   18位身份证号 
			 * @returns 匹配返回true 不匹配返回false 
			 */
			function idCardVildate(cid) { 
				var arrExp = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 ];// 加权因子 
				var arrValid = [ 1, 0, "X", 9, 8, 7, 6, 5, 4, 3, 2 ];// 校验码 
				var reg = /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/; 
				if (reg.test(cid)) { 
				var sum = 0, idx; 
				for (var i = 0; i < cid.length - 1; i++) { 
				// 对前17位数字与权值乘积求和 
				sum += parseInt(cid.substr(i, 1), 10) * arrExp[i]; 
				} 
				// 计算模（固定算法） 
				idx = sum % 11; 
				// 检验第18为是否与校验码相等 
				return arrValid[idx] == cid.substr(17, 1).toUpperCase(); 
				} else { 
				return false; 
				} 
			} 
			
		})
</script>
</html>