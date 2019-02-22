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

  <script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/js/layer.js"></script>
<title>Insert title here</title>
<style type="text/css">
 #showDiv{
 height: 290px;
 overflow-y: auto;
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
		<div style="border-left:2px solid #0098CD;padding-left:6px;width:100%;"><h4>管理员管理</h4></div>
		<div style="border-top: 1px solid #D9DFE4;margin-bottom:30px;"></div>
			<div style="border: 1px solid #D9DFE4;margin-top:10px;padding-top:20px;padding-right:5px;padding-left:5px;border-radius:2px;" id="showDiv">

			</div>
			<div><button class="btn btn-sm btn-info margin-top16 margin-left100" id="btnadd"><span class="glyphicon glyphicon-plus-sign"></span> 添 加</button></div>
	</div>
<!-- 添加员工的 弹出框 -->
		<div class="modal fade" tabindex="-1" role="dialog" id="admin_add_modal">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">添加管理员</h4>
		      </div>
		      <div class="modal-body">
		        	<form class="form-horizontal" id="form_add_admin">
						  <div class="form-group">
						    <label for="username" class="col-sm-2 control-label">用户名</label>
						    <div class="col-sm-10">
						      <input type="email" class="form-control" style="width: 80%;" name="username" id="username" placeholder="登录名">
						      <span  class="help-block"></span>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="password" class="col-sm-2 control-label">密 码</label>
						    <div class="col-sm-10">
						      <input type="password" class="form-control" style="width: 80%;" name ="password" id="password" placeholder="密 码">
						      <span  class="help-block"></span>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="repassword" class="col-sm-2 control-label">确认密 码</label>
						    <div class="col-sm-10">
						      <input type="password" class="form-control" style="width: 80%;" name ="repassword" id="repassword" placeholder="确认密码">
						      <span  class="help-block"></span>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="phone" class="col-sm-2 control-label">联系电话</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" style="width: 80%;" name ="phone" id="phone" placeholder="联系电话">
						      <span  class="help-block"></span>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputEmail" class="col-sm-2 control-label">管理角色</label>
						    <div class="col-sm-4">
						      <select class="form-control" name="type">
								 <option value="2">普通管理员</option>
							  </select>
						    </div>
						  </div>
					</form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-info btn-sm" id="admin_save"  > 保  存 </button>
		        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal" id="admin_close"> 关  闭 </button>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
	 </div><!-- /.modal -->
</body>
<script type="text/javascript">
		$(document).ready(function(){
			var table = $("<table id='showTable' class='table table-hover'></table>");
			if("${AdminType}"==1)
			   var th= $("<tr align='center' ><th width='10%'><strong>编号</strong></th><th width='17%'><strong>用户名</strong></th><th width='17%'><strong>密码</strong></th><th width='20%'><strong>联系电话</strong></th><th width='17%'><strong>管理类型</strong></th><th width='20%'><strong>操作</strong></th></tr>");
			else
			   var th= $("<tr align='center' ><th width='10%'><strong>编号</strong></th><th width='20%'><strong>用户名</strong></th><th width='20%'><strong>联系电话</strong></th><th width='20%'><strong>管理类型</strong></th><th width='20%'><strong>操作</strong></th></tr>");
			var thead = $("<thead></thead>");
			var tbody = $("<tbody></tbody>")
			th.appendTo(thead);
			thead.appendTo(table);
			tbody.appendTo(table);
			table.appendTo("#showDiv");
			
			getData();
			function getData(){
				var load = layer.msg("正在加载数据,请稍后!",{icon:16,shade:0.05,time:38*1000});
				$.ajax({
					url:'${APP_PATH}/Admin/getAdmins',
					success:function(result){
						if(result.code==200){
							layer.close(load);
							$("#showTable tbody").empty();
							var data = result.extend.data;
							var i=1;
							$.each(data,function(index,item){
								var tr = $("<tr align='centers'></tr>");
								var idTd = $("<td></td>").append(item.id).css("display","none");
								var indexTd = $("<td></td>").append(i++);
								var nameTd = $("<td></td>").append(item.username);
								var pwsdTd= $("<td></td>").append(item.password);
								var phoneTd = $("<td></td>").append(item.phone);
								var type="";
								if(item.type==1){
									type="超级管理员"
								}else if(item.type==0){
									type="禁止登陆";
								}else{
									type="普通管理员";
								}
								
								var typeTd = $("<td></td>").append(type);
								//<button class='btn btn-info btn-xs edit' id='"+item.id+"'><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span> 编辑 </button>&nbsp;
								var buttonTd = $("<td><button class='btn btn-danger btn-xs delete' id='"+item.id+"'><span class='glyphicon glyphicon-trash' aria-hidden='true'></span> 删除</button></td>")
								tr.append(indexTd)
								.append(nameTd);
								if("${AdminType}"==1)
									tr.append(pwsdTd);
								tr.append(phoneTd)
								.append(typeTd)
								.append(buttonTd)
								.append(idTd);
								tr.appendTo("#showTable tbody");
							})
						}else{
						}
					}
				})
			}
			
			//删除按钮点击事件
			$(document).on('click','.delete',function(){
				if(!getLevel()){
					layer.alert("您非超级管理员，没有操作权限");
					return;
				}
				var id = $(this).parents("tr").find("td:eq(6)").text();
				var Admintype = $(this).parents("tr").find("td:eq(3)").text();
				if(Admintype=="超级管理员"){
					layer.alert("您不能删除自己！");
					return;
				}

				layer.confirm("是否删除用户【"+$(this).parents("tr").find("td:eq(1)").text()+"】?",{icon:3},function(index){
					var load = layer.msg("正在删除数据,请稍后!",{icon:16,shade:0.05,time:38*1000});
					$.ajax({
						url:'${APP_PATH}/Admin/deleteadmin',
						data:'id='+id,
						type:'post',
						success:function(data){
							console.log(data);
							if(data.code==200){
								layer.close(load);
								layer.alert("操作完成");
								getData();	
							}else{
								layer.alert("操作失败，请检查");
							}							
						}					
					})
				})
			})
			
			//添加按钮点击事件
			$("#btnadd").click(function(){
				if(!getLevel()){
					layer.alert("您非超级管理员，没有操作权限");
					return;
				}
				$('#admin_add_modal').modal({"backdrop":"static"});
			})
			
			//判断当前用户是否有删除权限
		  function getLevel(){
				if("${AdminType}"==1){
					return true;
				}
				return false;
			}
			
			//添加管理员保存按钮点击事件
			$("#admin_save").click(function(){
				var  username = $("#username").val();
				var  phone = $("#phone").val();
				var  password = $("#password").val();
				var  repassword = $("#repassword").val();
				if(username==""||phone==""||password==""||repassword==""){
					layer.alert("内容不为空");
					return;
				}
				var reg = "^1[3|4|5|8][0-9]\\d{8}$";
		        var re = new RegExp(reg);
		        if(!re.test(phone)){
		        	layer.alert("号码格式有误");
					return;
		        }
				if(password!=repassword){
					layer.alert("两次密码输入不一致");
					return;
				}
				var load = layer.msg("正在保存数据,请稍后!",{icon:16,shade:0.05,time:38*1000});
				$.ajax({
					url:'${APP_PATH}/Admin/addAdmin',
					data:$("#form_add_admin").serialize(),
					type:'post',
					success:function(data){
						console.log(data);
						if(data.code==200){
							layer.close(load);
							layer.alert("添加完成");
							$("#admin_add_modal").modal("hide");
							$("#username").val("");
							$("#phone").val("");
							$("#password").val("");
							$("#repassword").val("");
							getData();
						}else{
							layer.alert("添加失败，请检查,可能是该用户名已存在");
						}							
					}				
				})
			})
			
			//关闭按钮点击事件
			$("#admin_close").click(function(){
				$("#username").val("");
				$("#phone").val("");
				$("#password").val("");
				$("#repassword").val("");
			})
		});		
</script>
</html>