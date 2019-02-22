<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%pageContext.setAttribute("APP_PATH",request.getContextPath());
    pageContext.setAttribute("anwserId",request.getSession().getAttribute("anwserId")); 
    pageContext.setAttribute("quesDate",request.getSession().getAttribute("quesDate"));
    pageContext.setAttribute("HOST",request.getSession().getAttribute("host"));
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/common.css">
<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/dataSummarize.css">

<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/bootstrap.min.css">
<link type="text/css" href="${APP_PATH}/static/css/font-awesome.min.css">

<script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/js/layer.js"></script>
<style type="text/css">
body {
	background-color: #F0F4F5;
}

th {
	padding: 0 3px 0 3px;
}
</style>
</head>
<body>
	<!-- 导航B -->
	<div class="nav">
		<div class="formName">
			<h3 id="h3">
				<p id="formTitle"></p>
			</h3>
		</div>
		<div class="formAddress">
			<span class="">发布表单</span> 
			<input name="" id="text" value="" class="copy-target" type="text"> 
			<a class="copy_address" data-toggle="tooltip" data-placement="top" title="网址复制"></a> 
			<a class="QRcode" id="downCode"  data-toggle="popover" data-placement="bottom"  title="点击图标下载" data-content=""></a> 
			<a class="directopen" target="_blank" href="" data-toggle="tooltip" data-placement="top" title="直接打开"> <i class="gd-icon-publish"></i></a>
		</div>
	</div>
	<!-- 导航E -->

	<!-- 内容B -->
	<div class="content">
		<!-- 顶部B -->
		<div class="top">
			<div class="t_left fl">
				<span class="totaldata"><a>0</a></span> <span>表单总数据</span>
			</div>
			<div class="t_right fr">
				<ul>
					<li>
						<p class="fl">表单创建时间</p>
						<p class="fr " id="quesDate">${quesDate}</p>
					</li>
					<li>
						<p class="fl">填写者权限</p>
						<p class="fr">
							<a class="click_pop" data-toggle="tooltip" data-placement="right" title="修改填写者权限">所有人可填</a>
						</p>
					</li>
					<li>
						<p class="fl">表单开启/停止</p>
						<p class="fr">
							<span id="radio_hint">已开启，正在收集</span><i id="radio"></i>
						</p>
					</li>
					<li>
						<p class="fl" >提交完成提示文字</p>
						<p class="fr" data-toggle="tooltip" data-placement="right" title="修改提交完成提示内容">
							<a class="click_msg_pop" id="tipMsg">Ok,提交完成</a>
						</p>
					</li>
				</ul>
			</div>
		</div>
		<!-- 顶部E -->

		<!-- 中部B -->
		<div class="middle">
			<table id="showTable">
			    <thead style="display: block;">

				</thead>
				<tbody style="height: 335px;overflow-y: scroll;display: block;">

				</tbody>
			</table>
		</div>
		<!-- 中部E -->

		<!-- 底部B -->
		<div class="bottom">
			<a class="copy" id="excel">生成excel表格</a>
		</div>
		<!--底部E-->
	</div>
	<!-- 内容E -->

	<!--遮罩层B-->
	<div class="bgPop"></div>
	<!--遮罩层E-->

	<!--填写权限弹出框B-->
	<div class="jdt-pop">
		<div class="pop-top">
			<h5>填写权限</h5>
		</div>
		<div class="pop-content">
			<label><input name="jurisdicte" type="radio" index="1"
				value="所有人可填" />所有人可填 </label> <label><input name="jurisdicte"
				type="radio" index="2" value="学号+姓名认证" />学号+姓名认证 </label> <label><input
				name="jurisdicte" type="radio" index="3" value="身份证+姓名认证" />身份证+姓名认证
			</label> <label><input name="jurisdicte" type="radio" index="4"
				value="身份证+学号+姓名认证" />身份证+学号+姓名认证</label>
		</div>
		<div class="pop-foot">
			<input type="button" value="关闭" class="pop-cancel pop-close">
			<input type="button" value="确定" class="pop-ok" id="save">
		</div>
	</div>
	<!--填写权限弹出框E-->
	
	
</body>

<script>
//悬浮提示B
$(document).on("mouseover","#text",function(){
	   $(this).attr("title",$(this).val()); 
});
//悬浮提示E

//下载二维码B
$(document).on("click","#downCode",function(){
	   var form = $("<form action='${APP_PATH}/Views/downCode' method='post' style='display:none'></from>");
	   $(document.body).append(form);
	   form.submit();
});
//下载二维码E

	$(document).ready(function(){
		
		 //悬浮提示
		$(function () { $("[data-toggle='tooltip']").tooltip(); });
		var index = 0;
		//填写权限弹出框B
		
	     $('.click_pop').click(function () {
	    	 $('body').css("overflow","hidden");
	         $('.bgPop,.jdt-pop').show();
	            
	        });
	     $('.jdt-pop .pop-close').click(function () {
	    	 $('body').css("overflow","scroll");
	         $('.bgPop,.jdt-pop').hide(); 

	        });
	   //填写权限弹出框E
	   
	   //点击提示文字
	   $(".click_msg_pop").click(function(){
		   var tip = $(this).text();
		   layer.open({
			   type: 1 //Page层类型
			   ,area: ['500px', '300px']
			   ,title: '请修改提示文字'
			   ,shade: 0.6 //遮罩透明度
			   ,anim: 5 
			   ,content: '<div style="padding:50px;">'+
			   "<label></label><input type='text' value='"+tip+"' class='form-control tip' maxlength='20' />"+
				'</div>'
			   ,btn:["确定","取消"]
			   ,btn1:function(index){
				   var newTip = $('.tip').val();
				   if(tip==newTip){																//如果内容没有做修改
					   layer.close(index);
					   return;
				   }
				   var load = layer.msg("请稍后",{icon:16,shade:0.01,time:30*1000});
				   $.ajax({
					   url:'${APP_PATH}/Data/setTipMsg',
					   data:'tipMsg='+newTip,
					   type:'Post',
					   success:function(data){
						   if(data.code==200){
							   layer.alert("修改完成");
							   $("#tipMsg").text(newTip);
							   layer.close(index);
						   }else{
							   layer.alert("修改失败，请联系管理员");
							   layer.close(index);
						   }
					   },
					   error:function(data){
						   layer.alert("修改失败，请联系管理员");
						   layer.close(index);
					   }
				   })
			   }
			 });    
			   
	   })
	   
	   	if(getQueryString("index")!=1){
	   																								//提示内容
		   	var load = layer.msg("正在加载数据,请稍后!",{icon:16,shade:0.01,time:30*1000});
		}
	   
		//根据id 获取答案
    	$.ajax({
    		url:'${APP_PATH}/Data/getQuestionAnswerById?id=${anwserId}',
    		type:"post",
    		success:function(data){
    			layer.close(load)
    			if(data.code==200){
    				//console.log(data);
    				var queNum = data.extend.queNum;
    				var queData = data.extend.questionAnwser;
    				var queName = data.extend.queName;
    				var address = data.extend.address;
    				var colleStatu = data.extend.colleStatu;
    				var confirmType = data.extend.confirmType;
    				var quesDate = data.extend.quesDate;
    				var tipMsg =data.extend.tipMsg;
    				
    				//设置提示文字内容
    				$("#tipMsg").text(tipMsg)
    				
    				// 设置表单时间
    				$("#quesDate").text(quesDate);
    				
    				
    				var allData = queData.length/queNum;
    				//显示表单收集状态
    				collect(colleStatu);
    				
    				//设置填写者权限
    				confirmTypeSet(confirmType);
    				
    				if(queData.length!=0){
    					var th = $("<tr></tr>");
        				var thTd = "<th>序 号</th>";
        				//console.log(queNum);
        				//console.log(queData);
        				for(var i =0;i<queNum;i++){
        					//console.log(i);
        					thTd+="<th>"+queData[i].queName+"</th>";       			
        				}
        				th.append(thTd);
        				var tb="";
        				
        				for(var i = 0;i<allData;i++){
        					var tr ="<tr>";
        					var td = "<td>"+parseInt(i+1)+"</td>";
        					for(var j = 0;j<queNum;j++){
        						td+="<td>"+queData[i*queNum+j].anwser+"</td>"
        					}
        					tr+=td+"</tr>";
        					tb+=tr;
        				}
        				//填充表单总数据
        				$(".totaldata a").empty();
        				dataAppend(".totaldata a",allData);
        				
        				//填充表头数据
        				dataAppend($("#showTable thead"),th);
        				
        				//填充表数据
        				dataAppend($("#showTable tbody"),tb);
        				
        				//设置表格宽度B
        				var ths=$("thead").find("tr:eq(0)").find("th");
        				var tds=$("tbody").find("tr:eq(0)").find("td"); 
        				for(var i=0;i<tds.length;i++){   					
        					if(parseInt($(tds[i]).css("width"))>parseInt($(ths[i]).css("width")))
        						 $(ths[i]).css({"max-width":$(tds[i]).css("width"),"min-width":$(tds[i]).css("width")});
        					else
        						 $(tds[i]).css({"max-width":$(ths[i]).css("width"),"min-width":$(ths[i]).css("width")});				 
        				}
        				//设置表格宽度E
    				}
    				
    				
    				//填充表单名称
    				dataAppend($(".formName p "),queName);
    				
    				
    				//填充发布地址
    				$(".copy-target").val("http://${HOST}${APP_PATH}/fabu/"+address+".html");
    				$(".directopen").attr("href","http://${HOST}${APP_PATH}/fabu/"+address+".html");
    				 $('[data-toggle="popover"]').popover({
    					  trigger : 'hover',//鼠标以上时触发弹出提示框
    				      html:true,//开启html 为true的话，data-content里就能放html代码了
    				      content:"<img style=' width:85px;height:80px;padding-left:0px;margin-top:0px;'src='/Questionnaire/Views/qrImage?url="+$(".copy-target").val()+"''>"
    				  })
    				
    			}else{
    				layer.confirm('该问卷已可能已经删除', {
    					  btn: ['确定',] //按钮
    					}, function(){
    						window.close();
    					});
    			}
    		}
    		
    		
    	})	
    
    	//保存设置
	        $(".jdt-pop #save").click(function(){
	        	$('body').css("overflow","scroll");
	        	$('.bgPop,.jdt-pop').hide();
	        	 var val=$('input:radio[name="jurisdicte"]:checked').val();
	        	 var index =$('input:radio[name="jurisdicte"]:checked').attr("index");
	        	
	        	 $.ajax({
	        		 url:'${APP_PATH}/Confirm/setConfirmType',
	        		 type:'post',
	        		 data:"confirmType="+index+"&anwserId=${anwserId}",
	        		 success:function(data){
	        			 if(data.code==300){
	        				 confirmTypeSet2(1);
	        				 layer.alert("系统中没有可以进行验证的数据，请先在【系统管理->身份验证】中上传数据",{icon:2});
	        				 
	        			 }else if(data.code==200){
	        				 
	        		    	 $('.click_pop').text(val);
	        		    	 
	        			 }
	        		 }
	        	 })
	        })
    	
    var flag=true;
	$(document).on('click','#radio',function(){	
		var type="关闭";
		if(flag==false){
			type="开启";
		}
		layer.confirm("是否"+type+"问卷数据收集",{icon:3,btn:["确定","取消"]},function(index){
			
			collectStatu(flag);
			layer.close(index);
		},function(index){
			layer.close(index);
		})
	});   
    	
	 //设置填写者权限选择状态
	 function confirmTypeSet(index){
		$("input:radio[index="+index+"]").attr("checked",true);
		var val=$('input:radio[name="jurisdicte"]:checked').val();
   	 	$('.click_pop').text(val);
		
	 }
	 
	 function confirmTypeSet2(index){
		 	$("input:radio").attr("checked",false);
			$("input:radio[index=1]").attr("checked",true);
			var val=$('input:radio[name="jurisdicte"]:checked').val();
	   	 	$('.click_pop').text(val);
			
		 }
	
    	//显示表单状态
    	function collect(statu){
			if(statu=="1"){
				collectStatu(false);
				flag=true;
			}else if(statu=="0"){
				collectStatu(true);
				flag=false;
			}
		}
    		 
		// 控制表单状态
		function collectStatu(flags){
			 if(flags==true){		  
				  $("#radio").css({"background-color":"#ffffff","border":"1px solid #A6A6A6"});
				  $("#radio_hint").text("已关闭，停止收集");
				  flag=false;
				  isCollection(false);
			  }
			  else{
				  $("#radio").css({"background-color":"#44DB5E","border":"1px solid #44DB5E"});
				  $("#radio_hint").text("已开启，正在收集");
				  flag=true;
				  isCollection(true);
			  }          
		}
	
    	//数据填充
    	function dataAppend(target,data){
			$(target).append(data);
		}
    	
    	$(document).on('click','.copy_address',function(){
    	    	if($("#text").val()!="")
    	    	{
    	    		document.getElementById("text").select();
    	            document.execCommand("copy",false,null);   
    	            layer.msg("复制成功!",{time: 500,offset: ['100px', '900px']});
    	    	}
    	    	else
    	    	{
    	    		layer.msg("内容为空!",{time: 500,offset: ['100px', '900px']});
    	    	}
    		});   
	})
	
	      //是否开启收集
	      function isCollection(flag){
    		   var collection = ""; 
	    	   if(flag==true){
	    		   //开启收集
	    		   collection = "yes";
	    	   }else if(flag==false){
	    		   //关闭收集
	    		   collection = "no";
	    	   }
	    	   $.ajax({
	    		   url:'${APP_PATH}/Data/collection',
	    		   data:"collection="+collection+"&anwserId=${anwserId}",
	    		   type:"post",
	    		   success:function(data){
	    			   
	    		   }
	    	   })
	    	   
	      }
	
	//生成EXCEL表
    	/*$("#excel").click(function(){ 		
    		   var table=document.getElementById("showTable");
    		   var string="";
    		  
    		   traversal(table);  		 
    		   string=string.substring(1, string.length);
    		   
    		   function traversal(node)
    		   {
    			   //对node的处理
    			   if(node && node.nodeType === 1)
    			   {
    				  if(node.tagName=="TR")  
        			      string=string+"#";
    				  if((node.tagName=="TH")||(node.tagName=="TD")){
    					  string=string+node.innerText+"`";
    				  }  
    			          
    			   }
    			   var i = 0, childNodes = node.childNodes,item;
    			   for(; i < childNodes.length ; i++)
    			   {
    			     item = childNodes[i];
    			     if(item.nodeType === 1)
    			     { 			       
    			       traversal(item);//递归先序遍历子节点
    			     }
    			   }
    		  }
    		  
    		   var formName=$(".formName").text();
			   var form = $("<form action='${APP_PATH}/Views/simpleExcelWrite' method='post' style='display:none'></from>");
			   $("<input name='data' value='"+string+"'>").appendTo(form);
			   $("<input name='formName' value='"+formName+"'>").appendTo(form);
			   $(document.body).append(form);
			   form.submit();
    	})  
    	*/
    	
    	$("#excel").click(function(){ 		
		   var queId=${anwserId};
		   var formName=$(".formName").text();
		   var form = $("<form action='${APP_PATH}/Views/simpleExcelWrite' method='post' style='display:none'></from>");
		   $("<input name='queId' value='"+queId+"'>").appendTo(form);
		   $("<input name='formName' value='"+formName+"'>").appendTo(form);
		   $(document.body).append(form);
		   form.submit();
	})  
	
	
    	//获取url值的信息
	    function getQueryString(name){
		     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
		     var r = window.location.search.substr(1).match(reg);
		     if(r!=null)return  decodeURI(r[2]); return null;
		}
		if(getQueryString("index")==1){
			layer.alert("问卷已经发布完成,您可以先设置填写权限以及收集状态和提交完成显示文字，然后复制问卷地址分享给填写者,",{icon:1})
		}
</script>
</html>