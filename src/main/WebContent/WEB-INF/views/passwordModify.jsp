<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%pageContext.setAttribute("APP_PATH",request.getContextPath());
  pageContext.setAttribute("AdminType",request.getSession().getAttribute("userType"));
%>
<%pageContext.setAttribute("Userid",request.getSession().getAttribute("userid"));
  pageContext.setAttribute("Username",request.getSession().getAttribute("username"));
  pageContext.setAttribute("Password",request.getSession().getAttribute("password"));
%>
               
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/common.css">
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/bootstrap.min.css">
  <script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
  <script type="text/javascript" src="${APP_PATH}/static/js/layer.js"></script>
<title>Insert title here</title>
<style type="text/css">
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
		<div style="border-left:2px solid #0098CD;padding-left:6px;width:100%;"><h4>账户修改</h4></div>
		<div style="border-top: 1px solid #D9DFE4;margin-bottom:30px;"></div>
			<div style="border: 1px solid #D9DFE4;margin-top:10px;padding-top:20px;padding-right:5px;padding-left:5px;border-radius:2px;" id="showDiv">
			
			
			<table id="showTable" class="table ">
			    <thead>
			      <tr align="center">
			      	<th width="15%"><strong>编号</strong></th>
			        <th width="25%"><strong>用户名</strong></th>
			        <th width="25%"><strong>密码</strong></th>			       
			        <th width="25%"><strong>操作</strong></th>
			      </tr>
			    </thead>
			    <tbody>
			       <tr align="centers">
			       	  <td>1</td>
			          <td><input style="width: 50%;margin: 0 auto;" type="text" id="input_usename" class="form-control input-sm" value="${Username}"></td>
			          <td><input style="width: 50%;margin: 0 auto;" type="text" id="input_passwd" class="form-control input-sm" value="${Password}"></td>	         
			          <td><button class="btn btn-info btn-sm edit" id="modify">
			                 <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 修改
			              </button>&nbsp;
			          </td>
			    </table>         
		</div>
	</div>
</body>
<script type="text/javascript">
//修改按钮点击事件
$(document).on('click','#modify',function()
{       var load = layer.msg("正在修改,请稍后!",{icon:16,shade:0.05,time:38*1000});
		$.ajax({
			url:'${APP_PATH}/Admin/modifyOne',//传到控制器controller
			data:{'userid':"${userid}",'username':$("#input_usename").val(),'password':$("#input_passwd").val()},
			type:'post',
			success:function(data)
			{
				if(data.code==200)   
				  {
					layer.close(load);
					$('#hellow', window.parent.document).text($("#input_usename").val());
					layer.alert("修改成功!");
					
				  }
				else
				  {
					layer.alert("修改失败!");
				  }							
			}
		})
})
  
</script>
</html>