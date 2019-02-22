// 发布问卷的所有js
//author xt
$(document).ready(function(){
	//屏幕宽度大于700px以电脑版样式显示
	adaptiveDisplay();
	function adaptiveDisplay(){
      var w = $(window).width();
      if( w >= 700 ){
       $('#mbg').css({"margin-top":"50px","margin-bottom":"50px"});
      }else{
       $('#mbg').css({"margin-top":"0px","margin-bottom":"0px"});
      }
	}
    
   	 $(window).resize(function() {
    	adaptiveDisplay();
	 });
 
  $(".mobileQhone .form-group").css("width","100%");
  $(".form-group").css({"margin-top":"10px"});
  $(".must").css({"position":"absolute","top": "-15px","left":"15px"});
 
  var labels=$(".form-group").find("label");
  $(labels[0]).css("max-width","96%");
  for(var i=1;i<labels.length;i++){
    $(labels[i]).css("max-width","92%");
  }

	// 二级下拉菜单start
	//生成关联二级菜单
	//定义 全局的select 数据
	var list;
	function loadSelectTwo(){
		var selectQueNums = $(".question[quetype='13']");
		
		//初始化数组
		list = new Array(selectQueNums.length);
		
		$.each(selectQueNums,function(index,selectQue){
			var select1 = new Array(); 
			var selectContent = $(selectQue).attr("content");
			var selectOneNum = selectContent.split("#");
			//遍历每一项数据
			$.each(selectOneNum,function(index,selectOnes){
				var select2 = new Array();
				//遍历每个子项目
				var selectOne = selectOnes.split("`");
				for(var i = 0;i<selectOne.length;i++){
					select2.push(selectOne[i])
				}
				select1.push(select2);
			})
			list.push(select1);
		})
		createSelect(list)
	}
	loadSelectTwo();
	/**
	 * 给一级下拉添加项目事件
	 * 
	 */
	function addSelectItem(qId,items){
		//清空 选项
		$("#"+qId+" select").empty();
		$.each(items,function(index,item){
			var value = $(item).val();
			$("#"+qId+" select").append("<option value='"+value+"' index="+index+">"+value+"</option>");
		});
			
	}
	
	var select2Items;
	/**
	 * 生成下拉菜单项
	 */
	function createSelect(list){
		//2级选项
		select2Items= new Array();
		var k =0;
		if(list.length==2){
			//就一个下拉
		}
		length = Math.ceil((list.length)/2)
		for(var i = 0;i<length;i++){
			selects = list[length+i];
			var num = i;
			var selectOne =$(".selectOne:eq("+num+")")[0];
			selectOne.length = selects.length;
			for(var j =0;j<selects.length;j++){
				select2Items.push(selects[j])
				selectOne.options[j].text = selects[j][0];
				selectOne.options[j].setAttribute("index",i+"-"+k)
				selectOne.options[j].value = selects[j][0];
				k++;
			}
			
		}
	}
	//对应的1级菜单点击事件
	$(document).on("change",".selectOne",function(){
		var selectIndex = $(this).find("option:selected").attr("index").split("-");
		var index = parseInt(selectIndex[0]);
		var index2 = selectIndex[1];
		var selectTwo = $(".selectTwo:eq("+index+")")[0];
		selectTwo.length= select2Items[index2].length;
		for(var i = 0;i<select2Items[index2].length;i++){
			if(i==0){
				selectTwo.options[i].text = "请选择";
				selectTwo.options[i].value = "请选择";
				continue;
			}
			selectTwo.options[i].text = select2Items[index2][i];
			selectTwo.options[i].value = select2Items[index2][i];
		}
		
	})
	
//二级下拉菜单end	
	
	var phoneLegal=true;
    var emailLegal=true;
	var nameLegal=true;
    var numberLegal=true;
   
    
	//检测输入的合法性B
	IsLegal();
	function  IsLegal()
	{    
		  var addDiv=document.getElementsByClassName("addDiv");//获取所有类名为addDiv的div
		    for(var i=0;i<addDiv.length;i++)
		    {
		    		var divNode=addDiv[i].childNodes[1];             //获取addDiv的第二个孩子节点，即含有属性quetype的节点
			    	var quetype=$(divNode).attr("quetype");
			    	switch(quetype)
			    	{
			    	  case '9':quetypeNine(divNode);break;
			    	  case '10':quetypeTen(divNode);break;
			    	  case '11':quetypeEleven(divNode);break;	    	
			    	  default:break;
			    	}			    				  	
		    }
			
		    //问题类型9 手机
			function quetypeNine(divNode)
			{   
				var input=$(divNode).children("input");
				var span=$(divNode).children("span")[0];
				var must=$(span).text();
				$(span).css("color","#FF0000");

				var nam=$(input).attr("name");
				var reg = "^1[3|4|5|8][0-9]\\d{8}$";
		        var re = new RegExp(reg);
		        
		         $(input).change(function(){
		        	 var val=$(input).val();
		        	 if(val!=""){
		        		 if(!re.test(val)){ 	        		 
							  $(span).text("号码格式有误！"); 
							  input.focus();	
							  phoneLegal=false;
							  return false;
							}
							else
							{   if(must!="")
								  $(span).text("*");
                                else
                                  $(span).text("");
								 phoneLegal=true;
								return true;
							}
		        	 }
		        	 else{
		        		 $(span).text("号码不能为空！");
		        		 return false;
		        	 }		       		 		        	  		        	
		        });
			}
			 //问题类型10 邮箱
			function quetypeTen(divNode)
			{   
				var input=$(divNode).children("input");
				var span=$(divNode).children("span")[0];
				var must=$(span).text();
                $(span).css("color","#FF0000");
				var nam=$(input).attr("name");
				var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/; 
		        var re = new RegExp(reg);
                 
		        $(input).change(function(){
		        	 var val=$(input).val();
		        	 if(val!=""){
		        		 if(!re.test(val)){ 	        		 
							  $(span).text("邮箱格式有误！"); 
							  input.focus();
							  emailLegal=false;
							  return false;
							}
							else
							{  
							    if(must!="")
								  $(span).text("*");
                                else
                                  $(span).text("");					   
								 emailLegal=true;
								return true;
							}
		        	 }
		        	 else{
		        		 $(span).text("邮箱不能为空！");
		        		 return false;
		        	 }		        		 		        	  		        	
		        });
			}
			//问题类型11 姓名
			function quetypeEleven(divNode)
			{
				var input=$(divNode).children("input");
				var span=$(divNode).children("span")[0];
				var must=$(span).text();
				$(span).css("color","#FF0000");
				var nam=$(input).attr("name");
				var reg =/^([\u4e00-\u9fa5]){2,7}$/; 
		        var re = new RegExp(reg);
                 
		        $(input).change(function(){
		        	 var val=$(input).val();
		        	 if(val!=""){
		        		 if(!re.test(val)){ 	        		 
							  $(span).text("姓名格式有误！"); 
							  input.focus();
							  nameLegal=false;
							  return false;
							}
							else
							{   
								 if(must!="")
								  $(span).text("*");
                                else
                                  $(span).text("");
								 nameLegal=true;
								return true;
							}
		        	 }
		        	 else{
		        		 $(span).text("姓名不能为空！");
		        		 return false;
		        	 }	        		 		        	  		        	
		        });
			} 
	}

	
	//检测输入的合法性E
 

	//提交事件begin
	$(".submit").click(function(){
		var agree=true;                                     //如果agree==false则提交不会成功
		var addDiv=document.getElementsByClassName("addDiv");//获取所有类名为addDiv的div
	    for(var i=0;i<addDiv.length;i++)
	    {
	    	var divNode=addDiv[i].childNodes[1];             //获取addDiv的第二个孩子节点，即含有属性quetype的节点
	    	var quetype=$(divNode).attr("quetype");
	    	switch(quetype)
	    	{
	    	  case '1':quetypeOne(divNode);break;
	    	  case '2':quetypeTwo(divNode);break;
	    	  case '3':quetypeThree(divNode);break;
	    	  case '4':quetypeFour(divNode);break;
	    	  case '5':quetypeFive(divNode);break;
	    	  case '6':quetypeSix(divNode);break;
	    	  case '7':quetypeSeven(divNode);break;
	    	  case '8':quetypeEight(divNode);break;
	    	  case '9':quetypeNine(divNode);break;
	    	  case '10':quetypeTen(divNode);break;
	    	  case '11':quetypeEleven(divNode);break;
	    	  case '12':quetypeTwelve(divNode);break;
	    	  case '13':quetypeThirteen(divNode);break;
	    	  case '14':quetypeFourteen(divNode);break;
			  case '15':quetypefiveteen(divNode);break;
			  case '16':quetypesixteen(divNode);break;
	    	  default:break;
	    	}	
	    }
	 //问题类型1 单行文字
	function quetypeOne(divNode)
	{  
		var display=$(divNode).css('display');

        if(display!="none"){
		  var input=$(divNode).children("input");
		  var span=$(divNode).children("span")[0];
          var must=$(span).text();
		 if(must!=""){
		   $(span).css("color","#FF0000");
		   var val=$(input).val();
		   if(val=="")
		   {		
			  agree=false;
			  $(span).text("内容不能为空！");
		   }		
		   else{	
		      $(span).text("*");
		   }
		 }	
		}
		
	} 
	 //问题类型2 多行文字
	function quetypeTwo(divNode)
	{
	  var display=$(divNode).css('display');

      if(display!="none"){
	     var textarea=$(divNode).children("textarea");
		var span=$(divNode).children("span")[0];
		var must=$(span).text();
		if(must!=""){
		    $(span).css("color","#FF0000");
		  var val=$(textarea).val();
		  if(val==""){			
			agree=false;
			$(span).text("内容不能为空！");
		   }	
		  else{
		      $(span).text("*");
		   }
		}	
	  }
		
	}
	 //问题类型3 单选
	function quetypeThree(divNode)
	{   var flag=false;
	    var Flag=0;
		var input=$(divNode).children("input");
        var display=$(divNode).css('display');

        if(display!="none"){
			
		    for(var i=0;i<input.length;i++){
			    if(input[i].checked==true){
				   flag=true;               //[其它]选项之外的选项有选中
			     }        
		    }
             var spn=$(divNode).children("span")[1];
		       if(spn!=null){
			    var spo=$(spn).children("input")[0]; 		 
			    if($(spo).prop('checked')){
                   var val=$(spn).children("input")[1];
			       if($(val).val()==""){
			           Flag=1;      //其它项选中但未填写内容  
			       }else{
                       Flag=2;      //其它项选中并填写了内容
				   }	  
		        }
		      }

		    var span=$(divNode).children("span")[0];
            var must=$(span).text();
			if(must!=""){
               $(span).css("color","#FF0000");
		       if(Flag==1){
			       agree=false;
			       $(span).text("您已选中【其它】选项，内容不能为空！");
		       }
		       else if(flag==false&&( Flag==0)){
		           agree=false;
			       $(span).text("必须选中一项！");
		       }
		       else{
			      $(span).text("*");
			   }
			 
			}
	    }
	}
	 //问题类型4 多选
   function quetypeFour(divNode)
   {     var Flag=true;
		 var display=$(divNode).css('display');
		 
	              if(display!="none"){
                            var count=0;
		                    var input=$(divNode).children("input");
                            for(var i=0;i<input.length;i++)
			                {
				               if(input[i].checked==true){
					              count++;
				                }        
			                }
							var spn=$(divNode).children("span")[1];
		                    if(spn!=null){
			                    var spo=$(spn).children("input")[0]; 		 
			                    if($(spo).prop('checked')){
									count++;
                                   var val=$(spn).children("input")[1];
			                       if($(val).val()==""){
			                                Flag=false;    //其它项选中但未填写内容
			                       } 		      	  
		                        }
		                    }

                       var span=$(divNode).children("span")[0];
                       var must=$(span).text();
			           if(must!=""){
			                    $(span).css("color","#FF0000");                        
		                        if(Flag==false){
			                       agree=false;
			                       $(span).text("您已选中【其它】选项，内容不能为空！");
		                        }
		                        else if(count<2){
		                            agree=false;
			                        $(span).text("至少选中两项！");
		                        }
		                        else{
					               $(span).text("*");
					            }
			           }
            
	            }
	  
			
    }
	 //问题类型5 数字
	function quetypeFive(divNode)
	{   
	  var display=$(divNode).css('display');

      if(display!="none"){
	       var input=$(divNode).children("input");
		var span=$(divNode).children("span")[0];
		var must=$(span).text();

		if(must!=""){
		    $(span).css("color","#FF0000");
		var val=$(input).val();
		if(val=="")
		{		
			agree=false;
			$(span).text("请填写数字！");
		}	
		else
		    $(span).text("*");
	   }	
	  }
		
    }
	 //问题类型6 日期
	function quetypeSix(divNode)
	{   
	   var display=$(divNode).css('display');

      if(display!="none"){
	        var input=$(divNode).children("input");
		var span=$(divNode).children("span")[0];
		var must=$(span).text();

		if(must!=""){
		   $(span).css("color","#FF0000");
		var val=$(input).val();
		if(val=="")
		{		
			agree=false;
			$(span).text("请填写日期！");
		}
			
		else{
		     $(span).text("*");
		}
	   }  
	  }
		  	
	}
	 //问题类型7下拉
	function quetypeSeven(divNode)
	{   
	   var display=$(divNode).css('display');

      if(display!="none"){
	        var count=0;
		      var select=$(divNode).children("select");
		      var optsFirst=$(select[0]).children();
		      for(var i=1;i<optsFirst.length;i++){
		         if(optsFirst[i].selected == true)
			 	   count++;
		     }

			 
			   var span=$(divNode).children("span")[0];
			   var must=$(span).text();

			   if(must!=""){
			        $(span).css("color","#FF0000");
			      if(count<1){
				    agree=false;
				    $(span).text("此题为必选！");
			      }	
			      else{
			         $(span).text("*");
			      }
			   }
	  }			
	}
	 //问题类型8 评分
	function quetypeEight(divNode)
	{   
	   var display=$(divNode).css('display');

      if(display!="none"){
	      var input=$(divNode).children("input");
		var span=$(divNode).children("span")[0];
		var must=$(span).text();

		if(must!=""){
		     $(span).css("color","#FF0000");
		     var val=$(input).val();
		    if(val=="")
		    {		
			   agree=false;
			   $(span).text("请评分！");
		    }
			
		    else{
		      $(span).text("*");
		    }
		 }
	  }	
	}
	 //问题类型9 手机
	function quetypeNine(divNode)
	{   
	  var display=$(divNode).css('display');

      if(display!="none"){
	      var input=$(divNode).children("input");
		var span=$(divNode).children("span")[0];
		var must=$(span).text();
		if(must!=""){
		     $(span).css("color","#FF0000");
		    var val=$(input).val();
		    if(val==""||phoneLegal==false)
		    {		
			    agree=false;
			    if(val=="")
			    $(span).text("请填写你的手机号！");
                else
			    $(span).text("号码格式有误！");
		    }
		    else if(phoneLegal==true){
		        $(span).text("*");
		    }
		}
	  }		
	}
	 //问题类型10 邮箱
	function quetypeTen(divNode)
	{  
	  var display=$(divNode).css('display');

      if(display!="none"){
	       var input=$(divNode).children("input");
		var span=$(divNode).children("span")[0];
		var must=$(span).text();

		if(must!=""){
		    $(span).css("color","#FF0000");
		    var val=$(input).val();
		    if(val==""||emailLegal==false)
		    {		
			    agree=false;
			    if(val=="")
			       $(span).text("请填写你的邮箱！");
			    else
                  $(span).text("邮箱格式有误！");
		    }
		    else if(emailLegal==true){
		        $(span).text("*");
		    }
		}
	  
	  }		
	}
	//问题类型11 姓名
	function quetypeEleven(divNode)
	{
	  var display=$(divNode).css('display');

      if(display!="none"){
	  
	         var input=$(divNode).children("input");
		var span=$(divNode).children("span")[0];
		var must=$(span).text();

		if(must!=""){
		   $(span).css("color","#FF0000");
		   var val=$(input).val();
		   if(val==""||nameLegal==false)
		   {		
			   agree=false;
			   if(val=="")
			      $(span).text("请填写你的姓名！");
			   else
                  $(span).text("姓名格式有误！");
		   }	
	    	else if(nameLegal==true){
		      $(span).text("*");
		   }
		}
	  }		
	}
	//问题类型12 通用输入
	function quetypeTwelve(divNode)
	{
		var display=$(divNode).css('display');

      if(display!="none"){
	         var input=$(divNode).children("input");
		var span=$(divNode).children("span")[0];
		var must=$(span).text();

		if(must!=""){
		   $(span).css("color","#FF0000");
		   var val=$(input).val();
		   if(val=="")
		   {		
			   agree=false;
			   $(span).text("内容不能为空！");
		   }	
		   else{
		      $(span).text("*");
		   }
		}
	  } 		
	}
	 //问题类型13 两级下拉
	function quetypeThirteen(divNode)
	{  
		var display=$(divNode).css('display');

      if(display!="none"){
	            var count=0;
		 var select=$(divNode).children("select");
		 var optsFirst=$(select[0]).children();
		 var optsSecond=$(select[1]).children();

		 for(var i=1;i<optsFirst.length;i++){
			 
		    if(optsFirst[i].selected == true)
				count++;
		 }
		 for(var i=1;i<optsSecond.length;i++){
		    if(optsSecond[i].selected == true)
				count++;
		 }

			var span=$(divNode).children("span")[0];
			var must=$(span).text();
			if(must!=""){
			   $(span).css("color","#FF0000");
			   if(count<2){
				  agree=false;
				  $(span).text("此题为必选！");
			   }	
			   else{
			      $(span).text("*");
			  }
		   }
	  }		
	}
	 //问题类型14  问卷底部
	function quetypeFourteen(divNode)
	{

		var display=$(divNode).css('display');

      if(display!="none"){
	         var textarea=$(divNode).children("textarea");
		var span=$(divNode).children("span")[0];
		var must=$(span).text();

		if(must!=""){
		     $(span).css("color","#FF0000");
		    var val=$(textarea).val();
		    if(val==""){			
			   agree=false;
			   $(span).text("内容不能为空！");
		    }	
		    else{
		      $(span).text("*");
		    }
		}
      
	  }
		
	}
	 //问题类型15  矩阵单选
	function quetypefiveteen(divNode)
	{
		var display=$(divNode).css('display');

      if(display!="none"){
	             var tr=$(divNode).children("table").children("tbody").children("tr");
	   var span=$(divNode).children("span")[0];
	   var must=$(span).text();
	   if(must!=""){
	      $(span).css("color","#FF0000");
	   var trCount=0;
	   for(var i=1;i<tr.length;i++){
		  var td=$(tr[i]).children();
		 
		  var tdCount=0;
		  for(var j=1;j<td.length;j++){ 
              if($(td[j]).children("input")[0].checked==true){
				  tdCount++;
			  }
		  }
          trCount=trCount+tdCount;
	   }
	   if(trCount<tr.length-1){
          agree=false;
		  $(span).text("每行必须选一个！");
	   }else{
            $(span).text("*");
	   }
	 }	
	  }
       
  }
	//问题类型16  矩阵多选
	function quetypesixteen(divNode)
	{        
		var display=$(divNode).css('display');

      if(display!="none"){
	         var tr=$(divNode).children("table").children("tbody").children("tr");
	   var span=$(divNode).children("span")[0];
	   var must=$(span).text();

	   if(must!=""){
	       $(span).css("color","#FF0000");
       var tdCount=0;                          //记录第i行的第j列选中的按钮数

	   for(var i=1;i<tr.length;i++){         //遍历每一行
		  var td=$(tr[i]).children();        //找到第i行的每一列
		 
		   tdCount=0;                    
		  for(var j=1;j<td.length;j++){      //遍历第i行的第j列
              if($(td[j]).children("input")[0].checked==true){
				  tdCount++;                 //如果第i行第j列有选中tdCount自加
			  }
		  }
	
		  if(tdCount<2){          //第i行选中的按钮总数小于2
	          agree=false;                       
			  $(span).text("每行至少选两个！");//添加提示文字
			  i=td.length;        //结束循环
		   }else{
	              $(span).text("*");                 //清除提示文字
		   }
	   }	
	   }
	  
	  }                                     //找表格中每行的节点
       
        
	}

	//如果agree==false则返回，提交不执行
	 if(agree==false){
		 layer.alert("填写有误，请检查！");
		 return;
	 }
	 //执行提交
	
		var questionnaireId = $("#questionnaireId").attr('questionnaireid');		//获取问题的id
		var questionNum = 0;														//定义问题个数变量
	 	var questions = $(".question");
	 	var data = "";																//定义提交数据变量
	 	
	 	var index=0;
	 	$.each(questions,function(ind,question){
	 		var type = $(question).attr('quetype');									//获取问题类型

	 		if(type==15||type==16){
	 			var trs = $(question).find("table tr");
	 			questionNum+=trs.length-1;
	 		}else{
	 			questionNum+=1;
	 		}
	 		
			que="";
			var anwser="";
																					//通用输入框
			if(type==1||type==5||type==8||type==9||type==10||type==11||type==12){
				que=$(this).find("label:eq(0)").text();
				anwser=$(this).find(" input").val();
																					//多行文字
			}else if(type==2){
				que=$(this).find("label:eq(0)").text();
				anwser=$(this).find("textarea").val();
																					//单选选择
			}else if(type==3){
				que=$(this).find("label:eq(0)").text();
				id = $(this).attr("id");
				var inputs = $(this).find("input[name='"+id+"']");
				for(var i=0;i<inputs.length;i++)
				{
					   if(inputs[i].checked)
					   {	if($(inputs[i]).attr('itemtype')=="other"){
						 		var item = $(inputs[i]).next("label").text();
								var other=$(inputs[i]).next("label").next("input").val();
								anwser=item+other;
								
							}else{
								 anwser=$(inputs[i]).next("label").text();
							}
					   }
				}
																					//多项选择	
			}else if(type==4){
				que=$(this).find("label:eq(0)").text();
				id = $(this).attr("id");
				var inputs = $(this).find("input[name='"+id+"']");
				for(var i=0;i<inputs.length;i++)
				{
					   if(inputs[i].checked)
					   {	if($(inputs[i]).attr('itemtype')=="other"){
								var item = $(inputs[i]).next("label").text();
								var other=$(inputs[i]).next("label").next("input").val();
								anwser+=item+other+";";
							}else{
								
								anwser+=$(inputs[i]).next("label").text()+";";
							}
					   }
					
				}
			}else if(type==6){
				que=$(this).find("label:eq(0)").text();
				anwser=$(this).find("input").val();
																					//下拉菜单
			}else if(type==7){
				que=$(this).find("label:eq(0)").text();
				anwser=$(this).find("select").val();
																					//二级下拉菜单
			}else if(type==13){
				que=$(this).find("label:eq(0)").text();
				anwser=$(this).find("select:eq(0)").val()+";"+$(this).find("select:eq(1)").val();
			}else if(type==15){														//矩阵单选
				var trs = $(this).find("table tr");
				var temp="";
				$.each(trs,function(index2,tr){
				 		if(index2==0) return true;
				 		var que = $(tr).find("td:eq(0)").text();
				 		var anwser = $(tr).find("input:checked").val();
				 		temp+="a"+index+"="+que+"`"+anwser+"&";
				 		index++;
			 		})
			 	data+=temp;
				return true;
			 		
			}else if(type==16){														//矩阵多选
				var trs = $(this).find("table tr");
				var temp="";
				$.each(trs,function(index2,tr){
				 		if(index2==0) return true;
				 		var que = $(tr).find("td:eq(0)").text();
				 	
				 		var inputs = $(tr).find("input:checked");
				 		var anwser="";
						for(var i=0;i<inputs.length;i++)
						{
							anwser+=$(inputs[i]).val()+";";
						}
				 		temp+="a"+index+"="+que+"`"+anwser+"&";
				 		index++;
			 		})
			 	data+=temp;
				return true;
			}
			if(anwser===""){
				anwser="null";
			}
			data+="a"+index+"="+que+"`"+anwser+"&";
			index++;
	 	})
	 	data = "questionnaireId="+questionnaireId+"&questionNum="+questionNum+"&"+data;
//		return;
		subData(data);																//执行提交
	})
	function subData(data){
		//console.log(data);
		var load = layer.msg("正在提交,请稍后!",{icon:16,shade:0.06,time:38*1000});					//提示
		$.ajax({
			url:'/Questionnaire/Form/submitForm',
			type:"post",
			data:data,
			success:function(result){
				window.location.replace("/Questionnaire/submitOk.jsp");
				//return;
			},
			error:function(){
				lay.alert("系统出错，请联系管理员");
			}
		
		})
	}
	
//字段跳转的跳转规则 Begin
	
	var jumpObj = $(".question[jump='true']");
	$.each(jumpObj,function(index,obj){
		$(obj).css('display','none');
	})
	//选项点击事件
	$(document).on('click','.jump',function(){
		if($(this).attr('item')==0){
																//选项一  展现选型一
			var jumpToOneStr = $(this).attr('jumpto1');
			if(jumpToOneStr!=""&&typeof(jumpToOneStr)!="undefined"){
				var jumpToOnes = jumpToOneStr.split('`');
				$.each(jumpToOnes,function(index,id){
					$("#"+id).css('display','block')
				})
			}
																//隐藏选项二的项目
			var jumpTwoStr = $(this).parent().find("input:eq(1)").attr('jumpto2');
			if(typeof(jumpTwoStr)!="undefined"&&jumpTwoStr!=""){
				var jumpToTwos = jumpTwoStr.split('`');
				$.each(jumpToTwos,function(index,id){
					$("#"+id).css('display','none')
				})
			}
		}else{
																//选项二  展现选项二
			var jumpToTwos = $(this).attr('jumpto2');
			if(typeof(jumpToTwos)!="undefined"&&jumpToTwos!=""){
				var jumpToTwos = jumpToTwos.split('`');
				$.each(jumpToTwos,function(index,id){
					$("#"+id).css('display','block')
				})
			}
																//隐藏选项一的项目
			var jumpOneStr = $(this).parent().find("input:eq(0)").attr('jumpto1');
			if(typeof(jumpOneStr)!="undefined"&&jumpOneStr!=""){
				
				var jumpToOnes = jumpOneStr.split('`');
				$.each(jumpToOnes,function(index,id){
					$("#"+id).css('display','none')
				})
			}
		}
		
	})
	//字段跳转的跳转规则 End
	function l(text){
		console.log(text);
	}
});


