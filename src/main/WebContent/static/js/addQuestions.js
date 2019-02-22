$(document).ready(function(){
			var updateFlag = false;													//定义是否是发布后编辑
			//描述编辑
			initSample();
			//切换选项卡事件
			function changeSelect(index){
				if(index==1){
					$(".add").css({"background-color":"#2A94DE","color":"white"});
					$(".edit").css({"background-color":"","color":"black"});
					$(".item").css("display","block");
					$(".itemEdit").css("display","none");
				}else if(index==2){
					$(".edit").css({"background-color":"#2A94DE","color":"white"});
					$(".add").css({"background-color":"","color":"black"});
					$(".item").css("display","none");
					$(".itemEdit").css("display","block");
					$(".itemEdit").html("<h4>请点击已添加的字段进行编辑</h4>")
				}
			}
			changeSelect(1);
			
			//全局问题数目控制变量
			var questionCount = 0;
			function getQuestionCount(){
				questionCount = $("#questionnaireName").attr('queCount');
			}
			//$("#questionnaireName").attr('queCount');
			//console.log(questionCount);
			function questionCountAdd(){
				getQuestionCount();
				questionCount++;
				//console.log("当前问题数量:"+questionCount);
				$("#questionnaireName").attr('queCount',questionCount);
			}
			function questionCountDiv(){
				getQuestionCount();
				questionCount--;
				//console.log("当前问题数量:"+questionCount);
				$("#questionnaireName").attr('queCount',questionCount);
			}
			function questionCountAdds(num){
				getQuestionCount();
				questionCount = parseInt(questionCount)+num;
				//console.log("当前问题数量:"+questionCount);
				$("#questionnaireName").attr('queCount',questionCount);
			}
			function questionCountDivs(num){
				getQuestionCount();
				questionCount = parseInt(questionCount)-num;
				//console.log("当前问题数量:"+questionCount);
				$("#questionnaireName").attr('queCount',questionCount);
			}
			
			//获取问题数量 以给问题设置数量
			function getQuestionNum(){
				//清除提示信息
				$(".initTip").remove();
				var num = $("#questionnaireName").attr('queNum');
				return num;
			}
			//获取当前时间的毫秒值作为类为新增的addDiv的标签的id值。
			function getAddDivIdByGetTime(){
				return new Date().getTime();
			}
			
			//增加问题数
			function setQuestionNumAdd(){
				num = parseInt(getQuestionNum());
				return $("#questionnaireName").attr('queNum',num+1);
			}
			//减少问题数
			function setQuestionNumDiv(){
				num = parseInt(getQuestionNum());
				$("#questionnaireName").attr('queNum',num-1);
			}
			//添加字段点击事件
			$(".add").click(function(){
				changeSelect(1);
			});
			
			//编辑字段点击事件
			$(".edit").click(function(){
				changeSelect(2);
			});
			
			//###################################################
			var check = 0;
			//单选索引
			var radioIndex = 0;
			//多选索引
			var checkedIndex = 0;
			//下拉索引 
			var selectIndex = 0;
			//二级下来菜单索引
			var twoSelectIndex = 0;
			
			
			//用来存储多个下拉一级变量
			var selectOnes = new Array();
			
			var selectNum = 0;
			
			// 添加代码事件 点击事件开始
			var commonMove = "<div style='float:right;margin-top:18px;color:#2A94DE;display:none;' class='move'><span class='fa fa-caret-up moveUp' style='font-size:22px;width:22px;text-align：center;'></span><br/><span class='fa fa-caret-down moveDown' style='font-size:22px;width:22px;'></span></div>";
			
			//单行文字点击事件
			$("#oneLineText").click(function(){
				questionCountAdd();
				setQuestionNumAdd();
				var num = getAddDivIdByGetTime();
				var que ="<div class='form-group addDiv'>"+
				"<div style='height:10px;'></div>"+
				"<div class='form-group col-xs-10  question' queType='1' id='t"+num+"'>"+
				"<label for='t"+num+"'>单行文字</label> <span class='must'>*</span>"+
					commonMove+
				    "<input type='text' class='form-control' name ='t"+num+"' placeholder=' '><br>"+
				"</div>"+
				"</div>";
				$("form").append(que);
				screenScrol(num);
			});
			
			//多行文字点击事件
			$("#MulLineText").click(function(){
				questionCountAdd();
				setQuestionNumAdd();
				var num = getAddDivIdByGetTime();
				//alert(data);
				var que ="<div class='form-group addDiv'>"+
				"<div style='height:10px;'></div>"+
				"<div class='form-group col-xs-10   question' queType='2' id='t"+num+"'>"+
				"<label for='t"+num+"'>多行文字</label> <span class='must'>*</span>"+
				commonMove+
				    "<textarea  type='text' class='form-control ' name='t"+num+"' ></textarea><br>"+
				"</div>"+
				"</div>";
				$("form").append(que);
			});
			
			//单项选择题的
			$("#oneSelect").click(function(){
				questionCountAdd();
				setQuestionNumAdd();
				var num = getAddDivIdByGetTime();
				//alert(data);
				var que ="<div class='form-group addDiv'>"+
				"<div style='height:10px;'></div>"+
				"<div class='form-group col-xs-10   question' queType='3' id='t"+num+"' content='项目`项目`项目' other='0' >"+
				"<label for='t"+num+"'>单项选择</label> <span class='must'>*</span></br>"+
				commonMove+
					"<input type='radio' name='t"+num+"' id='c"+ ++check+"'>"+
					"<label id='l_c"+check+"' for='c"+check +"'>项目</label></br>"+
					"<input type='radio' name='t"+num+"' id='c"+ ++check+"'>"+
					"<label id='l_c"+check+"' for='c"+check +"'>项目</label></br>"+
					"<input type='radio' name='t"+num+"' id='c"+ ++check+"'>"+
					"<label id='l_c"+check+"' for='c"+check +"'>项目</label></br>"+
				"</div>"+
				"</div>";
				$("form").append(que);
			})
			
			// 多项选择题 
			$("#MulSelect").click(function(){
				questionCountAdd();
				setQuestionNumAdd();
				var num = getAddDivIdByGetTime();
				//alert(data);
				var que ="<div class='form-group addDiv'>"+
				"<div style='height:10px;'></div>"+
				"<div class='form-group col-xs-10   question' queType='4' id='t"+num+"' content='项目`项目`项目' other='0'>"+
				"<label for='t"+num+"'>多项选择</label> <span class='must'>*</span></br>"+
				commonMove+
					"<input type='checkbox' name='t"+num+"' id='c"+ ++check+"'>"+
					"<label id='l_c"+check+"' for='c"+check +"'>项目</label></br>"+
					"<input type='checkbox' name='t"+num+"' id='c"+ ++check +"'>"+
					"<label id='l_c"+check+"' for='c"+check+"'>项目</label></br>"+
					"<input type='checkbox' name='t"+num+"' id='c"+ ++check +"'> "+
					"<label id='l_c"+check+"' for='c"+check+"'>项目</label></br>"+
				"</div>"+
				"</div>";
				$("form").append(que);
			})
			
			//数字点击事件
			$("#number").click(function(){
				questionCountAdd();
				setQuestionNumAdd();
				var num = getAddDivIdByGetTime();
				//alert(data);
				var que ="<div class='form-group addDiv'>"+
				"<div style='height:10px;'></div>"+
				"<div class='form-group col-xs-10  question' queType='5' id='t"+num+"'>"+
				"<label for='t"+num+"'>数字</label> <span class='must'>*</span>"+
				commonMove+
				    "<input type='number' class='form-control ' name ='t"+num+"' placeholder=' '><br>"+
				"</div>"+
				"</div>";
				$("form").append(que);
				
			})
			
			//日期点击事件
			$("#date").click(function(){
				questionCountAdd();
				setQuestionNumAdd();
				var num = getAddDivIdByGetTime();
				//alert(data);
				var que ="<div class='form-group addDiv'>"+
				"<div style='height:10px;'></div>"+
				"<div class='form-group col-xs-10  question' queType='6' id='t"+num+"'>"+
				"<label for='t"+num+"'>日期</label> <span class='must'>*</span>"+
				commonMove+
				    "<input type='date' class='form-control ' name ='t"+num+"' ><br>"+
				"</div>"+
				"</div>";
				$("form").append(que);
			})
			
			//下拉菜单点击事件
			$("#selectDown").click(function(){
				questionCountAdd();
				setQuestionNumAdd();
				var num = getAddDivIdByGetTime();
				var que ="<div class='form-group addDiv'>"+
				"<div style='height:10px;'></div>"+
				"<div class='form-group col-xs-10  question' queType='7' id='t"+num+"' content='请选择`项目`项目`项目'>"+
				"<label for='t"+num+"'>下拉菜单</label> <span class='must'>*</span>"+
				commonMove+
				    "<br><select> </select><br>"+
				"</div><br>"+
				"</div>";
				$("form").append(que);
			})
			
			//评分点击事件
			$("#score").click(function(){
				questionCountAdd();
				setQuestionNumAdd();
				var num = getAddDivIdByGetTime();
				var que ="<div class='form-group addDiv'>"+
				"<div style='height:10px;'></div>"+
				"<div class='form-group col-xs-10  question' queType='8' id='t"+num+"'>"+
				"<label for='t"+num+"'>评分</label> <span class='must'>*</span>"+
				commonMove+
				    "<input type='text' class='form-control ' name ='t"+num+"' placeholder=' ' ><br>"+
				"</div>"+
				"</div>";
				$("form").append(que);
			})
			
			//手机号码点击事件
			$("#phone").click(function(){
				questionCountAdd();
				setQuestionNumAdd();
				var num = getAddDivIdByGetTime();
				var que ="<div class='form-group addDiv'>"+
				"<div style='height:10px;'></div>"+
				"<div class='form-group col-xs-10 question' queType='9' id='t"+num+"'>"+
				"<label for='t"+num+"'>手机号码</label> <span class='must'>*</span>"+
				commonMove+
				    "<input type='text' class='form-control ' name ='t"+num+"' placeholder=' ' ><br>"+
				"</div>"+
				"</div>";
				$("form").append(que);
			})
			
			//邮箱点击事件
			$("#email").click(function(){
				questionCountAdd();
				setQuestionNumAdd();
				var num = getAddDivIdByGetTime();
				var que ="<div class='form-group addDiv'>"+
				"<div style='height:10px;'></div>"+
				"<div class='form-group col-xs-10  question' queType='10' id='t"+num+"'>"+
				"<label for='t"+num+"'>邮箱</label> <span class='must'>*</span>"+
				commonMove+
				    "<input type='text' class='form-control ' name ='t"+num+"' placeholder=' '><br>"+
				"</div>"+
				"</div>";
				$("form").append(que);
			})
			
			//姓名点击事件
			$("#username").click(function(){
				questionCountAdd();
				setQuestionNumAdd();
				var num = getAddDivIdByGetTime();
				var que ="<div class='form-group addDiv'>"+
				"<div style='height:10px;'></div>"+
				"<div class='form-group col-xs-10  question' queType='11' id='t"+num+"'>"+
				"<label for='t"+num+"'>姓名</label> <span class='must'>*</span>"+
				commonMove+
				    "<input type='text' class='form-control ' name ='t"+num+"' placeholder=' ' ><br>"+
				"</div>"+
				"</div>";
				$("form").append(que);
			})
			
			//通用输入框点击事件
			$("#common").click(function(){
				questionCountAdd();
				setQuestionNumAdd();
				var num = getAddDivIdByGetTime();
				var que ="<div class='form-group addDiv'>"+
				"<div style='height:10px;'></div>"+
				"<div class='form-group col-xs-10  question' queType='12' id='t"+num+"'>"+
				"<label for='t"+num+"'>通用输入框</label> <span class='must'>*</span>"+
				commonMove+
				    "<input type='text' class='form-control ' name ='t"+num+"' placeholder=' '><br>"+
				"</div>"+
				"</div>";
				$("form").append(que);
			})
			
			//两级下拉框点击事件
			$("#twoSelect").click(function(){
				questionCountAdd();
				setQuestionNumAdd();
				var num = getAddDivIdByGetTime();
				var que ="<div class='form-group addDiv'>"+
				"<div style='height:10px;'></div>"+
				"<div class='form-group col-xs-10  question' queType='13' id='t"+num+"' selectNum='"+ selectNum +"' content='请选择#一级1`二级子项1`二级子项2#一级2`二级子项1`二级子项2`二级子项3'>"+
				"<label for='t"+num+"'>两级下拉菜单</label> <span class='must'>*</span>"+
				commonMove+
				"<br><select  class='selectOne' id='selectOne"+ num+"'  name ='t"+num+"'></select>&nbsp;&nbsp;&nbsp;<select name ='t"+num+"' id='selectTwo"+num+"' class='selectTwo'></select><br>"+
				"</div>"+
				"</div>";
				$("form").append(que);
			})
			
			//问卷底部
			$("#queFooter").click(function(){
				questionCountAdd();
				setQuestionNumAdd();
				var num = getAddDivIdByGetTime();
				var que ="<div class='form-group addDiv'>"+
				"<div style='height:10px;'></div>"+
				"<div class='form-group col-xs-10  question' queType='14' id='t"+num+"'>"+
				"<label for='t"+num+"'>未命名</label> <span class='must'>*</span>"+
				    "<textarea type='text' class='form-control ' name='t"+num+"' ></textarea>"+
				"</div>"+
				"</div>";
				$("form").append(que);
			})
			
			//矩阵单选按钮点击事件
			$("#matrixOneSelect").click(function(){
				questionCountAdd();
				questionCountAdd();
				questionCountAdd();
				
				setQuestionNumAdd();
				var num = getAddDivIdByGetTime();
				var que ="<div class='form-group addDiv'>"+
				"<div style='height:10px;'></div>"+
				"<div class='form-group col-xs-10  question' queType='15' id='t"+num+"' content='题目`题目`题目`题目#项目`项目`项目'>"+
				"<label >矩阵单选</label> <span class='must'>*</span>"+
				commonMove+
				    "<table class='table table-bordered table-striped' style='text-align:center;width:100%;'></tabel>" +
				    
				"</div>"+
				"</div>";
				$("form").append(que);
				//动态生成表格
				addMradioTable("t"+num,0,'R')
			})
			
			//矩阵多选按钮点击事件
			$("#matrixMulSelect").click(function(){
				questionCountAdd();
				questionCountAdd();
				questionCountAdd();
				
				setQuestionNumAdd();
				var num = getAddDivIdByGetTime();
				var que ="<div class='form-group addDiv'>"+
				"<div style='height:10px;'></div>"+
				"<div class='form-group col-xs-10  question' queType='16' id='t"+num+"' content='题目`题目`题目`题目#项目`项目`项目'>"+
				"<label >矩阵多选</label> <span class='must'>*</span>"+
				commonMove+
				    "<table class='table table-bordered table-striped' style='text-align:center;width:100%;'></tabel>" +
				    
				"</div>"+
				"</div>";
				$("form").append(que);
				//动态生成表格
				addMradioTable("t"+num,0,'C')
			})
			
			//选择跳转按钮点击事件
			$("#jumpChoose").click(function(){
				questionCountAdd();
				
				setQuestionNumAdd();
				var num = getAddDivIdByGetTime();
				var que ="<div class='form-group addDiv'>"+
				"<div style='height:10px;'></div>"+
				"<div class='form-group col-xs-10   question' queType='3' id='t"+num+"' content='选项一`选项二'  other='0' type='jump'>"+
				"<label for='t"+num+"'>跳转问题</label> <span class='must'>*</span></br>"+
				commonMove+
					"<input type='radio' name='t"+num+"' id='c"+ ++check+"' class='jump' item='0'>"+
					"<label id='l_c"+check+"' for='c"+check +"'  >选项一</label></br>"+
					"<input type='radio' name='t"+num+"' id='c"+ ++check+"' class='jump' item='1'>"+
					"<label id='l_c"+check+"' for='c"+check +"'>选项二</label></br>"+
				"</div>"+
				"</div>";
				$("form").append(que);
			})
			
			
			
			// 添加代码事件 点击事件结束
			//点击问题的点击事件
			$(document).on("click",".question",function(){
				var title = $(this).find("label:eq(0)").text();
				var must = $(this).find("span:eq(0)").text();
				var type = $(this).attr("quetype");
				var tip = " ";
				var mustContent="checked='true'";
				var otherContent="";
				var content = "";
				//判断是否是需要提示字段
				if(type==1||type==5||type==8||type==9||type==10||type==11||type==12){
					//获取提示
					var tip = $(this).find("input:eq(0)").attr("placeholder");
					if(tip!=" "){
						
					}
				}
				if(must!="*"){
					mustContent="";
				}
				
				
				
				//有选项的类型
				if(type==3||type==4||type==7||type==13){
					content = $(this).attr("content");
//					console.log(content);
					//判断是否有其他选项
					if(type==3||type==4){
						var other = $(this).attr("other");
						if(other=='1'){
							otherContent = "checked='true'";
						}else{
							otherContent = "";
						}
					}
				}
				editContent($(this).attr("quetype"),$(this).attr("id"),title,mustContent,tip,content,otherContent);
			});
			
			//根据问题类型和id 来显示编辑内容 问题类型 和问题id
			function editContent(type,id,title,mustContent,tip,content,otherContent){
				l(title);
				var common1 = 
				"<p></p>"+
				"<label for='must'>是否必填</label>"+
				"<input type='checkbox'  id='must' "+mustContent+" >"+
				"<p></p>"+
				"<button class='btn btn-info btn-xs editCopy'><span class='fa fa-clone'></span> 复 制</button>&nbsp;&nbsp"+
				"<button class='btn btn-danger btn-xs editDelete'><span class='fa fa-trash'></span> 移 除</button>"
				
				//切换为编辑状态
				changeSelect(2);
				var question = "";
				if(type==1){ //单行文字
					question=
					"<div class='itemEditHead'><h4>单行文字</h4></div>"+
					"<div class='itemEditContent' questionId="+id+">"+
						"<label>标题</label><br>"+
						"<input type='text' class='itemEditContentInput itemEditContentTitle ' value='"+title+"'>"+
						"<p></p>"+
						"<label>提示</label><br>"+
						"<input type='text' class='itemEditContentInput itemEditContentTip' value='"+tip+"'>"+
						common1+
					"</div>";
					//填充编辑选项
					$(".itemEdit").html(question);
					
				}else if(type==2){
					question=
						"<div class='itemEditHead'><h4>多行文字</h4></div>"+
						"<div class='itemEditContent' questionId="+id+">"+
							"<label>标题</label><br>"+
							"<input type='text' class='itemEditContentInput itemEditContentTitle ' value='"+title+"'>"+
							common1+
						"</div>";
					//填充编辑选项
					$(".itemEdit").html(question);
							
				}else if(type==3){
					//重置索引
					radioIndex=0;
					// 判断是否是跳转字段
					var isJump = $("#"+id).attr('type');
					if(isJump=='jump'){
						question=
							"<div class='itemEditHead'><h4>选择跳转</h4></div>"+
							"<div class='itemEditContent' questionId="+id+">"+
								"<label>标题</label><br>"+
								"<input type='text' class='itemEditContentInput itemEditContentTitle ' value='"+title+"'>"+
								"<p></p>"+
								"<div class='radioDiv'>"+
								
								"</div>"+
								"<p></p>"+
								"<button class='btn btn-primary btn-xs itemOne' data-toggle='tooltip' data-placement='bottom' title='为该选项选中后设置要显示的问题'><span class='fa level-down'></span> 选项一选中跳转到</button><br>"+
								"<p></p>"+
								"<button class='btn btn-primary btn-xs itemTwo' data-toggle='tooltip' data-placement='bottom' title='为该选项选中后设置要显示的问题'><span class='fa level-down'></span> 选项二选中跳转到</button>"+
								"<p></p>"+
								"<button class='btn btn-info btn-xs editCopy'><span class='fa fa-clone'></span> 复 制</button>&nbsp;&nbsp"+
								"<button class='btn btn-danger btn-xs editDelete'><span class='fa fa-trash'></span> 移 除</button>"+
							"</div>";
					}else{
					
					question=
						"<div class='itemEditHead'><h4>单项选择</h4></div>"+
						"<div class='itemEditContent' questionId="+id+">"+
							"<label>标题</label><br>"+
							"<input type='text' class='itemEditContentInput itemEditContentTitle ' value='"+title+"'>"+
							"<p></p>"+
							"<div class='radioDiv'>"+
							
							"</div>"+
							"<p></p>"+
							"<span class='fa fa-plus addRowR' style='margin-left:10px;width:30px;'></span > <span class='fa fa-minus divRowR' style='width:30px;'></span></br>"+
							"<p></p>"+
							"<label for='other'>其他选项</label><input type='checkbox'  id='other' "+otherContent+" otherType='R' >"+
							common1+
						"</div>";
					}
						//填充编辑选项
						$(".itemEdit").html(question);
						radios = content.split("`");
					
					$.each(radios,function(index,item){
						addRadio(item);
					})
					
					
							
				}else if(type==4){
					//重置索引
					checkedIndex=0;
					question=
						"<div class='itemEditHead'><h4>多项选择</h4></div>"+
						"<div class='itemEditContent' questionId="+id+">"+
							"<label>标题</label><br>"+
							"<input type='text' class='itemEditContentInput itemEditContentTitle ' value='"+title+"'>"+
							"<p></p>"+
							"<div class='checkedboxDiv'>"+
							
							"</div>"+
							"<p></p>"+
							"<span class='fa fa-plus addRowC' style='margin-left:10px;width:30px;'></span > <span class='fa fa-minus divRowC' style='width:30px;'></span></br>"+
							"<p></p>"+
							"<label for='other'>其他选项</label><input type='checkbox'  id='other' "+otherContent+" otherType='C'>"+
							common1+
						"</div>";
					//填充编辑选项
					$(".itemEdit").html(question);
					checks = content.split("`");
					
					$.each(checks,function(index,item){
						addChecked(item);
					})
				}else if(type==5){
					question=
						"<div class='itemEditHead'><h4>数 字</h4></div>"+
						"<div class='itemEditContent' questionId="+id+">"+
							"<label>标题</label><br>"+
							"<input type='text' class='itemEditContentInput itemEditContentTitle ' value='"+title+"'>"+
							"<p></p>"+
							"<label>提示</label><br>"+
							"<input type='text' class='itemEditContentInput itemEditContentTip' value="+tip+">"+
							common1+
						"</div>";
					//填充编辑选项
					$(".itemEdit").html(question);
							
				}else if(type==6){
					question=
						"<div class='itemEditHead'><h4>日 期</h4></div>"+
						"<div class='itemEditContent' questionId="+id+">"+
							"<label>标题</label><br>"+
							"<input type='text' class='itemEditContentInput itemEditContentTitle ' value='"+title+"'>"+
							"<p></p>"+
							"<label>提示</label><br>"+
							"<input type='text' class='itemEditContentInput itemEditContentTip' value='"+tip+"'>"+
							common1+
						"</div>";
					//填充编辑选项
					$(".itemEdit").html(question);
							
				}else if(type==7){
					selectIndex = 0;
					question=
						"<div class='itemEditHead'><h4>下拉菜单</h4></div>"+
						"<div class='itemEditContent' questionId="+id+">"+
							"<label>标题</label><br>"+
							"<input type='text' class='itemEditContentInput itemEditContentTitle ' value='"+title+"'>"+
							"<p></p>"+
							"<div class='selectDiv'></div>"+
							"<p></p>"+
							"<span class='fa fa-plus addRowS' style='margin-left:10px;width:30px;'></span > <span class='fa fa-minus divRowS' style='width:30px;'></span></br>"+
							common1+
						"</div>";
					//填充编辑选项
					$(".itemEdit").html(question);
					var selects = content.split("`");
					console.log(selects)
					addSelectItems(id,selects)
					$.each(selects,function(index,item){
						if(index==0) return true;
						addSelect(item);
					})
							
				}else if(type==8){
					question=
						"<div class='itemEditHead'><h4>评分</h4></div>"+
						"<div class='itemEditContent' questionId="+id+">"+
							"<label>标题</label><br>"+
							"<input type='text' class='itemEditContentInput itemEditContentTitle ' value='"+title+"'>"+
							"<p></p>"+
							"<label>提示</label><br>"+
							"<input type='text' class='itemEditContentInput itemEditContentTip' value='"+tip+"'>"+
							common1+
						"</div>";
					//填充编辑选项
					$(".itemEdit").html(question);
							
				}else if(type==9){
					question=
						"<div class='itemEditHead'><h4>手机号码</h4></div>"+
						"<div class='itemEditContent' questionId="+id+">"+
							"<label>标题</label><br>"+
							"<input type='text' class='itemEditContentInput itemEditContentTitle ' value='"+title+"'>"+
							"<p></p>"+
							"<label>提示</label><br>"+
							"<input type='text' class='itemEditContentInput itemEditContentTip' value='"+tip+"'>"+
							common1+
						"</div>";
					//填充编辑选项
					$(".itemEdit").html(question);
							
				}else if(type==10){
					question=
						"<div class='itemEditHead'><h4>邮箱</h4></div>"+
						"<div class='itemEditContent' questionId="+id+">"+
							"<label>标题</label><br>"+
							"<input type='text' class='itemEditContentInput itemEditContentTitle ' value='"+title+"'>"+
							"<p></p>"+
							"<label>提示</label><br>"+
							"<input type='text' class='itemEditContentInput itemEditContentTip' value='"+tip+"'>"+
							common1+
						"</div>";
					//填充编辑选项
					$(".itemEdit").html(question);
							
				}else if(type==11){
					question=
						"<div class='itemEditHead'><h4>姓名</h4></div>"+
						"<div class='itemEditContent' questionId="+id+">"+
							"<label>标题</label><br>"+
							"<input type='text' class='itemEditContentInput itemEditContentTitle ' value='"+title+"'>"+
							"<p></p>"+
							"<label>提示</label><br>"+
							"<input type='text' class='itemEditContentInput itemEditContentTip' value='"+tip+"'>"+
							common1+
						"</div>";
					//填充编辑选项
					$(".itemEdit").html(question);
							
				}else if(type==12){
					question=
						"<div class='itemEditHead'><h4>通用输入框</h4></div>"+
						"<div class='itemEditContent' questionId="+id+">"+
							"<label>标题</label><br>"+
							"<input type='text' class='itemEditContentInput itemEditContentTitle ' value='"+title+"'>"+
							"<p></p>"+
							"<label>提示</label><br>"+
							"<input type='text' class='itemEditContentInput itemEditContentTip' value='"+tip+"'>"+
							common1+
						"</div>";
					//填充编辑选项
					$(".itemEdit").html(question);
							
				}else if(type==13){
					question=
						"<div class='itemEditHead'><h4>两级下拉菜单</h4></div>"+
						"<div class='itemEditContent' questionId="+id+" selectnum="+selectNum++ +">"+
							"<label>标题</label><br>"+
							"<input type='text' class='itemEditContentInput itemEditContentTitle ' value='"+title+"'>"+
							"<p></p>"+
							"<div class='selectTwoDiv'></div>"+
							common1+
						"</div>";
					//填充编辑选项
					$(".itemEdit").html(question);
					
					addSelectTwo(id,content);
							
				}else if(type==14){
					question=
						"<div class='itemEditHead'><h4>问卷底部</h4></div>"+
						"<div class='itemEditContent' questionId="+id+">"+
							"<label>标题</label><br>"+
							"<input type='text' class='itemEditContentInput itemEditContentTitle ' value='"+title+"'>"+
							"<p></p>"+
							"<label>提示</label><br>"+
							"<input type='text' class='itemEditContentInput itemEditContentTip' >"+
							common1+
						"</div>";
					//填充编辑选项
					$(".itemEdit").html(question);
							
				}else if(type==15){
					question=
						"<div class='itemEditHead'><h4>矩阵单选</h4></div>"+
						"<div class='itemEditContent' questionId="+id+">"+
							"<label>标题</label><br>"+
							"<input type='text' class='itemEditContentInput itemEditContentTitle ' value='"+title+"' >"+
							"<p></p>"+
							"<div class='mradioTitleDiv'></div>"+
							"<div class='mradioItemDiv'></div>"+
							common1+
						"</div>";
					//填充编辑选项
					$(".itemEdit").html(question);
//					alert($("#"+id).attr('content'));		
					var contents = $("#"+id).attr('content').split('#');
					var titleStr = contents[0];
					var itemStr = contents[1];
					var titles = titleStr.split('`');
					var items = itemStr.split('`');
					//根据行和列数组长度添加
					addEditMradio(titles,items,'R');
				}else if(type==16){
					question=
						"<div class='itemEditHead'><h4>矩阵多选</h4></div>"+
						"<div class='itemEditContent' questionId="+id+">"+
							"<label>标题</label><br>"+
							"<input type='text' class='itemEditContentInput itemEditContentTitle ' value='"+title+"'>"+
							"<p></p>"+
							"<div class='mradioTitleDiv'></div>"+
							"<div class='mradioItemDiv'></div>"+
							common1+
						"</div>";
					//填充编辑选项
					$(".itemEdit").html(question);
//					alert($("#"+id).attr('content'));		
					var contents = $("#"+id).attr('content').split('#');
					var titleStr = contents[0];
					var itemStr = contents[1];
					var titles = titleStr.split('`');
					var items = itemStr.split('`');
					//根据行和列数组长度添加
					addEditMradio(titles,items,'C');
				}
				
				//判断是否是先发布后编辑的
				if(updateFlag==true){
					$(".editDelete").attr('disabled',"true");
					$(".editCopy").attr('disabled',"true");
				}
			}
			//编辑选项事件结束
					
			//编辑事件 修改问题的名字
			$(document).on('change',".itemEditContentTitle",function(){
				var value = $(this).val();
				var questionID = $(this).parent().attr('questionId');
				$("#"+questionID).parent().find("label:eq(0)").text(value);
			});
			//提示编辑事件
			$(document).on('change',".itemEditContentTip",function(){
				var value = $(this).val();
				var questionID = $(this).parent().attr('questionId');
				$("#"+questionID+" input").attr('placeholder',value);
			});
			
			//必填选择事件
			$(document).on('click',"#must",function(){
				var questionID = $(this).parent().attr('questionId');
				var text = $("#"+questionID).parent().find("span:eq(0)").text();
				if(text=="*"){
					var text = $("#"+questionID).parent().find("span:eq(0)").text("");
					$("#"+questionID).parent().find("span:eq(0)").removeClass("must");
				}else{
					var text = $("#"+questionID).parent().find("span:eq(0)").text("*");
					$("#"+questionID).parent().find("span:eq(0)").addClass("must");
				}
			});
			
			//其他选项选择事件
			$(document).on('click',"#other",function(){
				var questionID = $(this).parent().attr('questionId');
				var other = $("#"+questionID).attr('other');
				var otherType = $(this).attr('otherType');								//获取其他选型类型
				if(otherType=='R'){
					if(other=='0'){
						$("#"+questionID).attr('other','1');
						var name = $("#"+questionID).find("input:last").attr("name").substr(1);
						var id = $("#"+questionID).find("input:last").attr("id").substr(1);
						
						var otherHtml = "<span class='otherSpan'><input type='radio' name='t"+name+"' itemType='other' id='c"+ ++id+"'><label for='c"+id+"' >其他:</label ><input type='text' size='12' id='c"+ ++id+"' name='t"+name+"' style='border:0px;border-bottom:#000000 1px solid;'/></span>"
						$("#"+questionID).append(otherHtml)
					}else{
						$("#"+questionID).attr('other','0');
						$("#"+questionID).find(".otherSpan").remove();
					}
				}else{
					if(other=='0'){
						$("#"+questionID).attr('other','1');
						var name = $("#"+questionID).find("input:last").attr("name").substr(1);
						var id = $("#"+questionID).find("input:last").attr("id").substr(1);
						var otherHtml = "<span class='otherSpan'><input type='checkbox' name='t"+name+"' itemType='other' id='c"+ ++id+"'><label for='c"+id+"'>其他:</label ><input type='text' size='12' id='c"+ ++id+"' name='t"+name+"' style='border:0px;border-bottom:#000000 1px solid;'/></span>"
						$("#"+questionID).append(otherHtml)
					}else{
						$("#"+questionID).attr('other','0');
						$("#"+questionID).find(".otherSpan").remove();
					}
				}
				
				
				
			});
			
			
			//动态创建单选选项的函数
			function addRadio(text){
				$(".radioDiv").append("<input  class='itemEditContentlitleInputR' type='text' index='"+ ++radioIndex+"' value="+text+" />");	
			}
			
			//动态创建多选项的函数
			function addChecked(text){
				$(".checkedboxDiv").append("<input  class='itemEditContentlitleInputC' type='text' index='"+ ++checkedIndex+"' value="+text+" />");				
			}
			
			//动态删除单选选项的函数
			function divRadio(){
				$(".radioDiv input:last").remove();
				radioIndex--;
			}
			
			//动态删除多选选项的函数
			function divChecked(){
				$(".checkedboxDiv input:last").remove();
				checkedIndex--;
			}
			
			//动态增加行下拉
			function addSelect(text){
				$(".selectDiv").append("<input  class='itemEditContentlitleInputS' type='text' index='"+ ++selectIndex+"' value="+text+" '/>");
			}
			
			//动态减少行下拉
			function divSelect(){
				$(".selectDiv input:last").remove();
				selectIndex--;
			}
			
			//动态添加二级菜单 
			function addSelectTwo(id,content){
				if(content==""){
					return;
				}
				var oneDiv = "";
				var selectTwos = content.split("#");
				$.each(selectTwos,function(index,oneItems){
					//不要第0个数据（请选择）
					if(index==0){
						return true;
					}
					
					var twoItems = oneItems.split("`");
					oneDiv = $("<div></div>")
					oneDiv.append("<input class='twoSelect1' value="+twoItems[0]+" /> <span class='fa fa-plus addSelect1' style='margin-left:5px;width:15px;'></span> <span class='fa fa-minus divSelect1' style='maring-left:5px;width:15px;'></span>")
					for(var i =1;i<twoItems.length;i++){
						oneDiv.append("<div><input class='twoselect2' value="+twoItems[i]+"> <span class='fa fa-plus addSelect2' style='margin-left:5px;width:15px;'></span> <span class='fa fa-minus divSelect2' style='maring-left:5px;width:15px;'></span></div>")
					}
					$(".selectTwoDiv").append(oneDiv);
				})
				
			}
			
			//动态添加单选
			function addShowRadio(obj){
				//判断是否有其他选项 有则先移走
				var other = $("#"+obj).attr('other');
				if(other==1){
					
					var otherObj = $("#"+obj).find(".otherSpan");
					var otherHtml = $(otherObj).prop("outerHTML");
					$(otherObj).remove();
					
					var name = $("#"+obj).find("input:last").attr("name");
					//var id = $("#"+obj).find("input:last").attr("id").substr(1);
					var id = new Date().getTime();
					var radio = "<input type='radio' name='"+name+"' id='c"+ ++id +"'> "+
					"<label id='l_c"+id+"' for='c"+id+"'>项目</label></br>";
					$("#"+obj).append(radio);
					$("#"+obj).append(otherHtml);
					//获取所有的项目
					items = $(".itemEditContent[questionid="+obj+"]").find(".radioDiv input")
					var content = "";
					$.each(items,function(index,item){
						content+=$(item).val()+"`";
					})
					if(content!="")
					changeContent(obj,content.substr(0,content.length-1));
					//设置索引自增
					check++;
				}else{
					
					var name = $("#"+obj).find("input:last").attr("name");
					//var id = $("#"+obj).find("input:last").attr("id").substr(1);
					var id = new Date().getTime();
					var radio = "<input type='radio' name='"+name+"' id='c"+ ++id +"'> "+
					"<label id='l_c"+id+"' for='c"+id+"'>项目</label></br>";
					$("#"+obj).append(radio);
					
					//获取所有的项目
					items = $(".itemEditContent[questionid="+obj+"]").find(".radioDiv input")
					var content = "";
					$.each(items,function(index,item){
						content+=$(item).val()+"`";
					})
					if(content!="")
						changeContent(obj,content.substr(0,content.length-1));
					//设置索引自增
					check++;
					
				}
			}
			//动态删除单选
			function divShowRadio(obj){
				var other = $("#"+obj).attr('other');
				if(other==1){
					var otherObj = $("#"+obj).find(".otherSpan");
					var otherHtml = $(otherObj).prop("outerHTML");
					$(otherObj).remove();
					 $("#"+obj).find("input:last").remove();
					 $("#"+obj).find("label:last").remove();
					 $("#"+obj).find("br:last").remove();
					//获取所有的项目
					items = $(".itemEditContent[questionid="+obj+"]").find(".radioDiv input")
					var content = "";
					$.each(items,function(index,item){
						content+=$(item).val()+"`";
					})
					if(content!="")
					changeContent(obj,content.substr(0,content.length-1));
					//设置索引自增
					check--;	
					$("#"+obj).append(otherHtml);
					
				}else{
					 $("#"+obj).find("input:last").remove();
					 $("#"+obj).find("label:last").remove();
					 $("#"+obj).find("br:last").remove();
					//获取所有的项目
					items = $(".itemEditContent[questionid="+obj+"]").find(".radioDiv input")
					var content = "";
					$.each(items,function(index,item){
						content+=$(item).val()+"`";
					})
					if(content!="")
					changeContent(obj,content.substr(0,content.length-1));
					//设置索引自增
					check--;	 
				}
				
			}
			
			//动态添加多选
			function addShowChecked(obj){
				//判断是否能有其他选项字段
				var other = $("#"+obj).attr('other');
				if(other==1){
					var otherObj = $("#"+obj).find(".otherSpan");
					var otherHtml = $(otherObj).prop("outerHTML");
					$(otherObj).remove();
					var name = $("#"+obj).find("input:last").attr("name");
					//var id = $("#"+obj).find("input:last").attr("id").substr(1);
					var id = new Date().getTime();
					var radio = "<input type='checkbox' name='"+name+"' id='c"+id+"'> "+
					"<label id='l_c"+id+"' for='c"+id+"'>项目</label></br>";
					//获取所有的项目
					items = $(".itemEditContent[questionid="+obj+"]").find(".checkedboxDiv input")
					var content = "";
					$.each(items,function(index,item){
						content+=$(item).val()+"`";
					})
					if(content!="")
					changeContent(obj,content.substr(0,content.length-1));
					
					//设置索引自增
					check++;
					$("#"+obj).append(radio);
					$("#"+obj).append(otherHtml)
					
				}else{
					var name = $("#"+obj).find("input:last").attr("name");
					//var id = $("#"+obj).find("input:last").attr("id").substr(1);
					var id = new Date().getTime();
					var radio = "<input type='checkbox' name='"+name+"' id='c"+ ++id+"'> "+
					"<label id='l_c"+id+"' for='c"+id+"'>项目</label></br>";
					//获取所有的项目
					items = $(".itemEditContent[questionid="+obj+"]").find(".checkedboxDiv input")
					var content = "";
					$.each(items,function(index,item){
						content+=$(item).val()+"`";
					})
					if(content!="")
					changeContent(obj,content.substr(0,content.length-1));
					
					//设置索引自增
					check++;
					$("#"+obj).append(radio);
				}
				
			}
			//动态删除多选
			function divShowChecked(obj){
				//判断是否能有其他选项字段
				var other = $("#"+obj).attr('other');
				if(other==1){
					var otherObj = $("#"+obj).find(".otherSpan");
					var otherHtml = $(otherObj).prop("outerHTML");
					$(otherObj).remove();
					 $("#"+obj).find("input:last").remove();
					 $("#"+obj).find("label:last").remove();
					 $("#"+obj).find("br:last").remove();
					//获取所有的项目
					items = $(".itemEditContent[questionid="+obj+"]").find(".checkedboxDiv input")
					var content = "";
					$.each(items,function(index,item){
						content+=$(item).val()+"`";
					})
					if(content!="")
					changeContent(obj,content.substr(0,content.length-1));
					//设置索引自增
					check--;	
					$("#"+obj).append(otherHtml);
				}else{
					 $("#"+obj).find("input:last").remove();
					 $("#"+obj).find("label:last").remove();
					 $("#"+obj).find("br:last").remove();
					//获取所有的项目
					items = $(".itemEditContent[questionid="+obj+"]").find(".checkedboxDiv input")
					var content = "";
					$.each(items,function(index,item){
						content+=$(item).val()+"`";
					})
					if(content!="")
					changeContent(obj,content.substr(0,content.length-1));
					//设置索引自增
					check--;	 
				}
				
			}
			
			//增加行单选
			$(document).on('click',".addRowR",function(){
				addRadio("项目");
				addShowRadio($(this).parent().attr('questionid'));
			})
			//减少行单选
			$(document).on('click','.divRowR',function(){
				var qId = $(this).parent().attr('questionid');
				//子项目不能低于1
				items = $(".itemEditContent[questionid="+qId+"]").find(".radioDiv input");
				if(items.length==1){
					layer.confirm("必须要留有一个项目哦",{btn:["确认"]},function(index){
						layer.close(index);
					})
					return ;
				}
				divRadio();
				divShowRadio(qId);
			});
			
			//增加行多选
			$(document).on('click',".addRowC",function(){
				addChecked("项目");
				addShowChecked($(this).parent().attr('questionid'));
			})
			//减少行多选
			$(document).on('click','.divRowC',function(){
				var qId = $(this).parent().attr('questionid');
				//子项目不能低于2
				items = $(".itemEditContent[questionid="+qId+"]").find(".checkedboxDiv input");
				if(items.length==2){
					layer.confirm("必须要留有两个项目哦",{btn:["确认"]},function(index){
						layer.close(index);
					})
					return ;
				}
				divChecked();
				divShowChecked(qId);
			});
			
			//增加行单下拉S
			$(document).on('click',".addRowS",function(){
				addSelect("项目");
				var qId = $(this).parent().attr('questionid');
				//获取所有的项目
				items = $(".itemEditContent[questionid="+qId+"]").find(".selectDiv input")
				var content = "请选择`";
				addSelectItem(qId,items);
				
				$.each(items,function(index,item){
					content+=$(item).val()+"`";
				})
				if(content!="")
				changeContent(qId,content.substr(0,content.length-1));
			})
			//减少行单下拉
			$(document).on('click','.divRowS',function(){
				var qId = $(this).parent().attr('questionid');
				//获取所有的项目
				items = $(".itemEditContent[questionid="+qId+"]").find(".selectDiv input")
				//至少留一项
				if(items.length==1){
					layer.confirm("必须要留有一个项目哦",{btn:["确认"]},function(index){
						layer.close(index);
					})
					return ;
				}
				divSelect();
				var content = "请选择`";
				items = $(".itemEditContent[questionid="+qId+"]").find(".selectDiv input")
				$.each(items,function(index,item){
					content+=$(item).val()+"`";
				})
				if(content!="")
				changeContent(qId,content.substr(0,content.length-1));
//				addSelectItem(qId,items);
			});
			//动态添加矩阵单选项目
			$(document).on('click','.addMradioT',function(){
				 var queId = $(this).parents(".itemEditContent").attr('questionid');
				 var contents = $("#"+queId).attr('content').split('#');
				 var titlesStr = contents[0];
				 var itemsStr = contents[1];
				 var addTiltleStr = titlesStr+'`题目';
				 $("#"+queId).attr('content',addTiltleStr+'#'+itemsStr);
				 var titles = addTiltleStr.split('`');
				 var items = itemsStr.split('`');
				 addEditMradio(titles,items,'R');
				 addMradioTable(queId,1,'R');
				 
				 questionCountAdd();
					 
			})
			//动态减少矩阵单选项目
			$(document).on('click','.divMradioT',function(){
				var queId = $(this).parents(".itemEditContent").attr('questionid');
				 var contents = $("#"+queId).attr('content').split('#');
				 var titlesStr = contents[0];
				 var itemsStr = contents[1];
				 var titleDivs = titlesStr.split('`');
				 //判断题目不能低于一个
				 if(titleDivs.length==2){
					 layer.confirm("必须要留有一个题目哦",{btn:["确认"]},function(index){
							layer.close(index);
						})
						return ;
				 }
				 var titleDivStr= '';
				 for( var i = 0;i<titleDivs.length-1;i++){
					 titleDivStr += titleDivs[i]+'`';
				 }
				 titleDivStr = titleDivStr.substring(0,titleDivStr.length-1);
				 $("#"+queId).attr('content',titleDivStr+'#'+itemsStr);
				 var titles = titleDivStr.split('`');
				 var items = itemsStr.split('`');
				 addEditMradio(titles,items,'R');
				 addMradioTable(queId,2,'R');
				 
				 questionCountDiv();
			})
			//动态添加矩阵单选项目
			$(document).on('click','.addMradioI',function(){
				var queId = $(this).parents(".itemEditContent").attr('questionid');
				 var contents = $("#"+queId).attr('content').split('#');
				 var titlesStr = contents[0];
				 var itemsStr = contents[1];
				 var additemsStr = itemsStr+'`项目';
				 $("#"+queId).attr('content',titlesStr+'#'+additemsStr);
				 var titles = titlesStr.split('`');
				 var items = additemsStr.split('`');
				 addEditMradio(titles,items,'R');
				 addMradioTable(queId,3,'R')
			})
			//动态减少矩阵单选项目
			$(document).on('click','.divMradioI',function(){
				var queId = $(this).parents(".itemEditContent").attr('questionid');
				 var contents = $("#"+queId).attr('content').split('#');
				 var titlesStr = contents[0];
				 var itemsStr = contents[1];
				 var itemDivs = itemsStr.split('`');
				 //判断题目不能低于一个
				 if(itemDivs.length==1){
					 layer.confirm("必须要留有一个项目哦",{btn:["确认"]},function(index){
							layer.close(index);
						})
						return ;
				 }
				 var itemDivStr= '';
				 for( var i = 0;i<itemDivs.length-1;i++){
					 itemDivStr += itemDivs[i]+'`';
				 }
				 itemDivStr = itemDivStr.substring(0,itemDivStr.length-1);
				 $("#"+queId).attr('content',titlesStr+'#'+itemDivStr);
				 var titles = titlesStr.split('`');
				 var items = itemDivStr.split('`');
				 //动态添加编辑项目
				 addEditMradio(titles,items);
				 addMradioTable(queId,4,'R')
			})
			//================================
			//动态添加矩阵多选题目
			$(document).on('click','.addMcheckboxT',function(){
				 var queId = $(this).parents(".itemEditContent").attr('questionid');
				 var contents = $("#"+queId).attr('content').split('#');
				 var titlesStr = contents[0];
				 var itemsStr = contents[1];
				 var addTiltleStr = titlesStr+'`题目';
				 $("#"+queId).attr('content',addTiltleStr+'#'+itemsStr);
				 var titles = addTiltleStr.split('`');
				 var items = itemsStr.split('`');
				 addEditMradio(titles,items,'C');
				 addMradioTable(queId,1,'C')
				 
				 questionCountAdd();
			})
			//动态减少矩阵多选题目
			$(document).on('click','.divMcheckboxT',function(){
				var queId = $(this).parents(".itemEditContent").attr('questionid');
				 var contents = $("#"+queId).attr('content').split('#');
				 var titlesStr = contents[0];
				 var itemsStr = contents[1];
				 var titleDivs = titlesStr.split('`');
				 //判断题目不能低于一个
				 if(titleDivs.length==2){
					 layer.confirm("必须要留有一个题目哦",{btn:["确认"]},function(index){
							layer.close(index);
						})
						return ;
				 }
				 var titleDivStr= '';
				 for( var i = 0;i<titleDivs.length-1;i++){
					 titleDivStr += titleDivs[i]+'`';
				 }
				 titleDivStr = titleDivStr.substring(0,titleDivStr.length-1);
				 $("#"+queId).attr('content',titleDivStr+'#'+itemsStr);
				 var titles = titleDivStr.split('`');
				 var items = itemsStr.split('`');
				 addEditMradio(titles,items);
				 addMradioTable(queId,2,'C');
				 
				 questionCountDiv();
			})
			//动态添加矩阵多选项目
			$(document).on('click','.addMcheckboxI',function(){
				var queId = $(this).parents(".itemEditContent").attr('questionid');
				 var contents = $("#"+queId).attr('content').split('#');
				 var titlesStr = contents[0];
				 var itemsStr = contents[1];
				 var additemsStr = itemsStr+'`项目';
				 $("#"+queId).attr('content',titlesStr+'#'+additemsStr);
				 var titles = titlesStr.split('`');
				 var items = additemsStr.split('`');
				 addEditMradio(titles,items,'C');
				 addMradioTable(queId,3,'C')
			})
			//动态减少矩阵多选项目
			$(document).on('click','.divMcheckboxI',function(){
				var queId = $(this).parents(".itemEditContent").attr('questionid');
				 var contents = $("#"+queId).attr('content').split('#');
				 var titlesStr = contents[0];
				 var itemsStr = contents[1];
				 var itemDivs = itemsStr.split('`');
				 //判断题目不能低于一个
				 if(itemDivs.length==1){
					 layer.confirm("必须要留有一个项目哦",{btn:["确认"]},function(index){
							layer.close(index);
						})
						return ;
				 }
				 var itemDivStr= '';
				 for( var i = 0;i<itemDivs.length-1;i++){
					 itemDivStr += itemDivs[i]+'`';
				 }
				 itemDivStr = itemDivStr.substring(0,itemDivStr.length-1);
				 $("#"+queId).attr('content',titlesStr+'#'+itemDivStr);
				 var titles = titlesStr.split('`');
				 var items = itemDivStr.split('`');
				 //动态添加编辑项目
				 addEditMradio(titles,items,'C');
				 addMradioTable(queId,4,'C')
			})
			
			/**
			 * 动态增加单选表格
			 */
			function addMradioTable(queId,flag,type){
				var tbObj = $("#"+queId).find(".table");
				var contents = $("#"+queId).attr('content').split('#');
				var titleStr = contents[0];
				var itemStr = contents[1];
				var titles = titleStr.split('`');
				var items = itemStr.split('`');
				var tableItems = [];
				$.each(titles,function(index,tr){
					var trs = [];
					trs.push(tr)
					$.each(items,function(index,td){
						trs.push(td)
					})
					tableItems.push(trs)
				})
				
				addMradio(tbObj,tableItems,flag,type);
			}

			//增加需要完成的事件
			//二级下拉一级增加
			$(document).on("click",".addSelect1",function(){
				console.log($(this).parents(".itemEditContent").attr("questionid"))
				var qId = $(this).parents(".itemEditContent").attr("questionid")
				var addHtml = "<div> <input class='twoSelect1' value='一级'>" +
						"<span class='fa fa-plus addSelect1' style='margin-left:5px;width:15px;'></span>" +
						"<span class='fa fa-minus divSelect1' style='maring-left:5px;width:15px;'></span>"+
						"<div><input class='twoselect2' value='二级子项'> <span class='fa fa-plus addSelect2' style='margin-left:5px;width:15px;'></span> <span class='fa fa-minus divSelect2' style='maring-left:5px;width:15px;'></span></div>"+
						"<div><input class='twoselect2' value='二级子项'> <span class='fa fa-plus addSelect2' style='margin-left:5px;width:15px;'></span> <span class='fa fa-minus divSelect2' style='maring-left:5px;width:15px;'></span></div>"+
						"</div>"
				$(this).parents(".selectTwoDiv").append(addHtml)
				changeSelectData(qId);
			})
			//二级下拉一级减少
			$(document).on("click",".divSelect1",function(){
				var qId = $(this).parents(".itemEditContent").attr("questionid")
				items = $(this).parent().parent().parent().find(".twoSelect1");
				console.log(items.length);
				if(items.length==1){
					layer.confirm("必须要留有一个项目哦",{btn:["确认"]},function(index){
						layer.close(index);
					})
					return ;
				}
				$(this).parent("").remove();
				changeSelectData(qId);
			})
			//二级下拉二级增加
			$(document).on("click",".addSelect2",function(){
				var qId = $(this).parents(".itemEditContent").attr("questionid")
				var addHtml = "<div><input class='twoselect2' value='二级子项'> <span class='fa fa-plus addSelect2' style='margin-left:5px;width:15px;'></span> <span class='fa fa-minus divSelect2' style='maring-left:5px;width:15px;'></span></div>"
				$(this).parent().parent().append(addHtml);
				changeSelectData(qId);
			})
			//二级下拉二级减少
			$(document).on("click",".divSelect2",function(){
				var qId = $(this).parents(".itemEditContent").attr("questionid")
//				var qId = $(this).parent().attr('questionid');
				//子项目不能低于1
				items = $(this).parent().parent().find(".twoselect2");
				console.log(items.length);
				if(items.length==1){
					layer.confirm("必须要留有一个项目哦",{btn:["确认"]},function(index){
						layer.close(index);
					})
					return ;
				}
				
				$(this).parent().remove();
				
				changeSelectData(qId);
			})
			//编辑项目变更数据事件
			$(document).on("change",".twoSelect1",function(){
				var qId = $(this).parents(".itemEditContent").attr("questionid");
				changeSelectData(qId)
			})
			$(document).on("change",".twoselect2",function(){
				var qId = $(this).parents(".itemEditContent").attr("questionid");
				changeSelectData(qId)
			})
			/**
			 * 动态生成矩阵单选
			 */
			function addMradio(obj,items,flag,type){
				if(flag==1){
					$.each(items,function(index,it){
						if(index==0||index==1) return true;
						setQuestionNumDiv();
						console.log('减去'+getQuestionNum())
					})
				}else if(flag==2){
					console.log(items)
					$.each(items,function(index,it){
						
						setQuestionNumDiv();
						console.log('减去'+getQuestionNum())
					})
				}else if(flag==3){
					console.log(items)
					$.each(items,function(index,it){
						if(index==0) return true
						setQuestionNumDiv();
						console.log('减去'+getQuestionNum())
					})
				}else if(flag==4){
					console.log(items)
					$.each(items,function(index,it){
						if(index==0) return true
						setQuestionNumDiv();
						console.log('减去'+getQuestionNum())
					})
				}
				else{
					setQuestionNumDiv();
				}
				
				var tb="";
				$.each(items,function(index1,tr){
					if(index1!=0){
						setQuestionNumAdd();
						var num = getQuestionNum();	
						
					}
					tb+="<tr>"
					
					$.each(tr,function(index,td){
						if(index1==0){
							if(index==0){
								tb+="<td></td>"
							}else{
								tb+="<td>"+td+"</td>"
							}
						}else{
							
							if(index==0){
								tb+="<td>"+td+"</td>"
							}else{
								if(type=='R'){
//									tb+="<td><input type='radio' name='t"+num+"' value='"+td+"'></td>"
									temp = "<td><input type='radio' name='t"+num+"' value='"+td+"'></td>";
									temp = temp.replace("name='t","name='t11");
									tb+=temp;
								}else{
									tb+="<td><input type='checkbox' name='t"+num+"' value='"+td+"'></td>"
								}
								
								//替换列的内容
							}
						}
					})
					tb+="</tr>"
				})
				//清空
				$(obj).empty()
				$(obj).append(tb);
			}
				
			//动态改变单选矩阵的题目和标题内容
			$(document).on('change','.mradioInput',function(){
				var parent = $(this).parents(".itemEditContent");
				var queId = $(this).parents(".itemEditContent").attr('questionid');
				var titlesObj = parent.find(".mradioTitleDiv").find("input[type='text']");
				var itemsObj = parent.find(".mradioItemDiv").find("input[type='text']");
				var titles = "题目`";
				var items = '';
				
				$.each(titlesObj,function(index,obj){
					titles+= $(obj).val()+"`";
				})
				$.each(itemsObj,function(index,obj){
					items+= $(obj).val()+"`";
				})
				var content = titles.substring(0,titles.length-1)+"#"+items.substring(0,items.length-1);
				//更新值
				$("#"+queId).attr('content',content);
				addMradioTable(queId,3,'R');
			})
			//===============================
			//动态改变单选矩阵的题目和标题内容
			$(document).on('change','.mcheckboxInput',function(){
				var parent = $(this).parents(".itemEditContent");
				var queId = $(this).parents(".itemEditContent").attr('questionid');
				var titlesObj = parent.find(".mradioTitleDiv").find("input[type='text']");
				var itemsObj = parent.find(".mradioItemDiv").find("input[type='text']");
				var titles = "题目`";
				var items = '';
				
				$.each(titlesObj,function(index,obj){
					titles+= $(obj).val()+"`";
				})
				$.each(itemsObj,function(index,obj){
					items+= $(obj).val()+"`";
				})
				var content = titles.substring(0,titles.length-1)+"#"+items.substring(0,items.length-1);
				//更新值
				$("#"+queId).attr('content',content);
				addMradioTable(queId,3,'C');
			})
			
				/**
				 * 根据行和列生成编辑的行和列
				 */
				function addEditMradio(titles,items,type){
					tl = "";
					it = "";
					if(type=='R'){
						
						$.each(titles,function(index,title){
							if(index==0) return true;
							tl+="<input type='text' value='"+title+"' class='mradioInput' >"
						})
						tl+="<br><span class='fa fa-plus addMradioT' style='margin-left:10px;width:30px;'></span > <span class='fa fa-minus divMradioT' style='width:30px;'></span></br>";
						//先清空
						$(".mradioTitleDiv").empty();
						$(".mradioTitleDiv").append(tl);
						$.each(items,function(index,item){
							it+="<input type='text' value="+item+" class='mradioInput'>"
						})
						it+="<br><span class='fa fa-plus addMradioI' style='margin-left:10px;width:30px;'></span > <span class='fa fa-minus divMradioI' style='width:30px;'></span></br>";
						//先清空
						$(".mradioItemDiv").empty();
						$(".mradioItemDiv").append(it)
					}else{
						$.each(titles,function(index,title){
							if(index==0) return true;
							tl+="<input type='text' value='"+title+"' class='mcheckboxInput' >"
						})
						tl+="<br><span class='fa fa-plus addMcheckboxT' style='margin-left:10px;width:30px;'></span > <span class='fa fa-minus divMcheckboxT' style='width:30px;'></span></br>";
						//先清空
						$(".mradioTitleDiv").empty();
						$(".mradioTitleDiv").append(tl);
						$.each(items,function(index,item){
							it+="<input type='text' value="+item+" class='mcheckboxInput'>"
						})
						it+="<br><span class='fa fa-plus addMcheckboxI' style='margin-left:10px;width:30px;'></span > <span class='fa fa-minus divMcheckboxI' style='width:30px;'></span></br>";
						//先清空
						$(".mradioItemDiv").empty();
						$(".mradioItemDiv").append(it)
					}
				}
				
				/**
				 * 变更二级下拉菜单数据
				 */
				function changeSelectData(qId){
					var twoSelect1s = $(".selectTwoDiv").find(".twoSelect1");
					var selectContent = "";
					$.each(twoSelect1s,function(index,twoSelect1){
						//获取一级数据
						selectContent+=$(twoSelect1).val();
						twoSelect2s = $(twoSelect1).parent().find(".twoselect2");
						//获取二级数据
						$.each(twoSelect2s,function(index,twoSelect){
							selectContent+="`"+$(twoSelect).val()
						})
						selectContent+="#";
					})
					//设置内容
					$("#"+qId).attr("content","请选择#"+selectContent.substr(0,selectContent.length-1))
					
				}
				
	// 二级下拉菜单start
				//生成关联二级菜单
				//定义 全局的select 数据
				var list;
				$(document).on("click",".selectAddDone",function(){
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
				})
				
				/**
				 * 给一级下拉添加项目事件 根据项目对象
				 * 
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
				/**
				 * 给一级下拉添加项目事件 根据数据
				 * 
				 */
				function addSelectItems(qId,items){
					//清空 选项
					$("#"+qId+" select").empty();
					$.each(items,function(index,item){
						
						$("#"+qId+" select").append("<option value='"+item+"' index="+index+">"+item+"</option>");
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
					console.log(list)
					length = Math.ceil((list.length)/2)
					for(var i = 0;i<length;i++){
						selects = list[length+i];
						var num = i;
						var selectOne =$(".selectOne:eq("+num+")")[0];
						console.log(selectOne)
						selectOne.length = selects.length;
						for(var j =0;j<selects.length;j++){
							console.log(selects[j])
							select2Items.push(selects[j])
							selectOne.options[j].text = selects[j][0];
							selectOne.options[j].setAttribute("index",i+"-"+k)
							selectOne.options[j].value = selects[j][0];
							k++;
						}
						
					}
					console.log(select2Items)
				}
				//对应的1级菜单点击事件
				$(document).on("change",".selectOne",function(){
					console.log($(this).find("option:selected").attr("index"));
					var selectIndex = $(this).find("option:selected").attr("index").split("-");
					var index = parseInt(selectIndex[0]);
					var index2 = selectIndex[1];
					var selectTwo = $(".selectTwo:eq("+index+")")[0];
					console.log(index)
					console.log(selectTwo)
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
				
	// 二级下拉菜单end	
				
				//单选 项目
				$(document).on("change",".itemEditContentlitleInputR",function(){
					var value = $(this).val();
					var questionID = $(this).parent().parent().attr('questionId');
					var index = $(this).attr('index');
					var target = $("#"+questionID).parent().find("label:eq("+index+")");
					$(target).attr("value",value);
					//获取更新内容项目
					var contentIn = $(this).parent().find("input");
					var content="";
					$.each(contentIn,function(index,item){
						content+=$(item).val()+"`";
					})
					changeName(target,value);
					changeContent(questionID,content.substr(0,content.length-1));
				});
				
				//多选项目
				$(document).on("change",".itemEditContentlitleInputC",function(){
					var value = $(this).val();
					var questionID = $(this).parent().parent().attr('questionId');
					var index = $(this).attr('index');
					var target = $("#"+questionID).parent().find("label:eq("+index+")");
					var contentIn = $(this).parent().find("input");
					var content="";
					$.each(contentIn,function(index,item){
						content+=$(item).val()+"`";
					})
					$(target).attr("value",value);
					changeName(target,value);
					changeContent(questionID,content.substr(0,content.length-1));
				});
				
				//下拉选项编辑事件
				$(document).on("change",".itemEditContentlitleInputS",function(){
					var value = $(this).val();
					var questionID = $(this).parent().parent().attr('questionId');
					var index = $(this).attr('index');
					//给下拉菜单添加选项
					itemsObj = $(this).parent().find("input")
					//获取更新内容项目
					var content="请选择`";
					$.each(itemsObj,function(index,item){
						content+=$(item).val()+"`";
					})
					addSelectItem(questionID,itemsObj);
					changeContent(questionID,content.substr(0,content.length-1));				
				});
				
				
				//二级菜单完成添加点击事件
				$(document).on('click','.addTwoSelectData',function(){
					var nums = $(this).parent().parent().attr('questionid').substr(1);
					var selectNum = $(this).parent().parent().attr('selectNum');
					var select = $(".twoSelectData").val().split("#");
					var select_oneMap = new Array();
					var select_twoMap = new Array();
					for(var i =0;i<select.length;i++){
						var item = select[i];
						if(item=='') continue;
						var selects = item.split(">");
						select_oneMap.push(selects[0]);
						select_twoMap.push(selects[1]);
					}
					//处理数据
					// 二级下来菜单数据添加
					var one = new Array();
					for(var i = 0;i<select_twoMap.length;i++){
						var two = new Array();
						var twos = select_twoMap[i].split("、");
						for(var j=0;j<twos.length;j++){
							two.push(twos[j]);
						}
						one.push(two);					
					}
					selectOnes.push(one);
					$('#selectOne'+nums).attr("text",$(".twoSelectData").val());
					var selectOne = $("#selectOne"+nums)[0];
					selectOne.length = select_oneMap.length;
					for(var i =0;i<select_oneMap.length;i++){
						selectOne.options[i].text = select_oneMap[i];
						selectOne.options[i].value = select_oneMap[i];
					}
					
					twoSelectChange(selectOnes[selectNum],0,nums);
					$(document).on("change",".selectOne",function(){
						temp = $(this).attr('id').substr(9);
						twoSelectChange(selectOnes[selectNum],this.selectedIndex,temp)
					})
					
				});
				//twoSelectChange();
				//二级下拉菜单多选按钮点击事件
				function twoSelectChange(data,index,dataId){
					var two = document.getElementById("selectTwo"+dataId);
					one = data;
					two.length = one[index].length;
					for (var i = 0; i < one[index].length; i++)
					{
						two.options[i].text = one[index][i];
						two.options[i].value = one[index][i];
					}
				};
				
				//单选多选 替换内容
				function changeName(target,text){
					$(target).text(text);
				}
				
				//单选 多选 下拉 替换内容
				function changeContent(targetId,content){
					$("#"+targetId).attr("content",content);
					var selects = content.split("`")
					addSelectItems(targetId,selects)
				}
				
				//移除按钮点击事件
				$(document).on("click",".editDelete",function(){
	
					var questionID = $(this).parent().attr('questionId');
					
					var selectType = $("#"+questionID).attr("quetype");
					if(selectType=='13'){
						selectNum--;
						setQuestionNumDiv();
						questionCountDiv();
					}else if(selectType=='15'){
						//删除的是矩阵单选
						tr = $("#"+questionID).attr('content').split('#')[0].split('`');
						$.each(tr,function(index){
							if(index==0){
								return true;
							}
							setQuestionNumDiv();
						})
						var qnum = $("#"+questionID).find("table tr").length-1;
																						//增加问题数量
						questionCountDivs(qnum);
					}else if(selectType=='16'){
						//删除的是矩阵单选
						tr = $("#"+questionID).attr('content').split('#')[0].split('`');
						$.each(tr,function(index){
							if(index==0){
								return true;
							}
							setQuestionNumDiv();
						})
						var qnum = $("#"+questionID).find("table tr").length-1;
																						//增加问题数量
						questionCountDivs(qnum);
					}else if(selectType=='3'){											//判断是否是单项选择 并是跳转问题
						
						questionCountDiv();
						
						var type = $("#"+questionID).attr('type');
						if(!(typeof(type)=='undefined'||type=="")){
							console.log(typeof(type));
							var jump1 = $("#"+questionID).find("input:eq(0)").attr('jumpto1');
							var jump2 = $("#"+questionID).find("input:eq(1)").attr('jumpto2');
							if(typeof(jump2)!='undefined'){
								var jumps = jump2.split('`')
								$.each(jumps,function(index,id){
									$("#"+id).attr("jump",'false')
								})
							}
							if(typeof(jump1)!='undefined'){
								var jumps = jump1.split('`')
								$.each(jumps,function(index,id){
									$("#"+id).attr("jump",'false')
								})
							}
							layer.confirm("该问题是跳转问题，删除后会默认清除跳转规则 ",{btn:["确认"]},function(index){
								
								layer.close(index);
								$("#"+questionID).parent().remove();
								//切换状态
								changeSelect(1);
								tip("字段已经移除")
							})
							return ;
						}
						
					}else{
						setQuestionNumDiv();
						questionCountDiv();
					}
					$("#"+questionID).parent().remove();
					//切换状态
					changeSelect(1);
					tip("字段已经移除");
					
				});
				
				//复制按钮点击事件
				$(document).on("click",".editCopy",function(){
					var questionID = $(this).parent().attr('questionId');
					var selectType = $("#"+questionID).attr("quetype");
					var copyContent = $("#"+questionID).parent().html();
					setQuestionNumAdd();
					var num = getQuestionNum();
					var copyContentReplace = copyContent.replace(new RegExp(questionID,"gm"),"t"+num)
					//如果是单项选项 和多项选择
					if(selectType==3||selectType==4){
						copyContentReplace = copyContentReplace.replace(new RegExp('id="c',"gm"),'id="c1')
						copyContentReplace = copyContentReplace.replace(new RegExp('for="c',"gm"),'for="c1')
					}
					//如果复制的是矩阵单选
					else if(selectType==15){
						tr = $("#"+questionID).attr('content').split('#')[0].split('`');
						$.each(tr,function(index){
							if(index==0||index==1){
								return true;
							}
						var idprev = getQuestionNum()-tr.length;
						idprev = idprev+2;
						setQuestionNumAdd();
						var idafter = getQuestionNum();

						copyContentReplace = copyContentReplace.replace(new RegExp('name="t',"gm"),'name="t1')
						});
						var qnum = $("#"+questionID).find("table tr").length-1;
																								//增加问题数量
						questionCountAdds(qnum);
					}else if(selectType==16){
						tr = $("#"+questionID).attr('content').split('#')[0].split('`');
						$.each(tr,function(index){
							if(index==0||index==1){
								return true;
							}
						var idprev = getQuestionNum()-tr.length;
						idprev = idprev+2;
						setQuestionNumAdd();
						var idafter = getQuestionNum();

						copyContentReplace = copyContentReplace.replace(new RegExp('name="t',"gm"),'name="t1')
						})
						
						var qnum = $("#"+questionID).find("table tr").length-1;
																							   //增加问题数量
						questionCountAdds(qnum);
					}else{
						questionCountAdd();
					}
					var addToHtml = "<div class='form-group addDiv'>"+
					copyContentReplace+'</div>';
					$("form").append(addToHtml);
					
					tip("字段复制完成")
					window.scrollTo(0,document.body.scrollHeight);
					//切换状态
					changeSelect(1);
					   																		  //增加问题数量
					
				});
				//往上移动按钮点击事件
				$(document).on("click",".moveUp",function(){
					var parent = $(this).parents(".addDiv");
					//获取上一个元素id
					prevClass = $(parent).prev().attr("class");
					if(prevClass!="form-group addDiv"){
						tip("已经在最上边了哦")
						return;
					}
					
					var prevHtml = $(parent).prev().html();
					var currentHtml = $(parent).html();
					$(parent).prev().html(currentHtml);
					$(parent).html(prevHtml);
					tip("字段上移完成")
				});
				
				//往上移动按钮点击事件
				$(document).on("click",".moveDown",function(){
					var parent = $(this).parents(".addDiv");
					//获取上一个元素id
					prevClass = $(parent).next().attr("class");
					if(prevClass!="form-group addDiv"){
						tip("已经在最下边了哦")
						return;
					}
																				//判断是否跳转元素
					var type = $(this).parent().parent().attr('type');
					if(typeof(type)!='undefined'){
						layer.alert("该字段是跳转字段，移动位置可能会影响填写跳转");
						return;
					}
					var nextHtml = $(parent).next().html();
					var currentHtml = $(parent).html();
					$(parent).next().html(currentHtml);
					$(parent).html(nextHtml);
					tip("字段下移完成")
				});

				//跳转问题设置跳转点击事件 选项一
				$(document).on("click",'.itemOne',function(){
					var questionID = $(this).parent().attr('questionId');
					var parent = $("#"+questionID).parent();
					var nextAll = $(parent).nextAll();
					if(nextAll.length==0){
						layer.confirm("请先在该问题之后添加要跳转的问题 ",{btn:["确认"]},function(index){
							layer.close(index);
						})
						return ;
					}
					var title = [];
					var ids = [];
					var checks = "";
					var jump2s = '';																	
					var jumpTosStr = $("#"+questionID).find("input:eq(0)").attr('jumpto1');				//获取选项一已经添加跳转的问题
					var jumpTosStr2 = $("#"+questionID).find("input:eq(1)").attr('jumpto2');			//获取选项二已经添加跳转的问题
																										//判断是否有添加选项二的问题
					if(typeof(jumpTosStr2)!="undefined"&&jumpTosStr2!=""){								
						jump2s = jumpTosStr2.split('`');
					}
					if(typeof(jumpTosStr)!="undefined"&&jumpTosStr!=""){
						var jumpTos = jumpTosStr.split('`');
						$.each(nextAll,function(index,que){
							var tl = $(que).find(".question").find("label:eq(0)").text();
							var id = $(que).find(".question").attr('id');
							if(jump2s!=""){
								if(contains(jump2s,id)){
									return true;
								}
							}
							if(contains(jumpTos,id)){
								checks += "<div class='jumpToDiv'><input type='checkbox' checked='true' tid = '"+id+"' id='"+index+"'/><label for='"+index+"'>"+tl+"<label></div>"
							}else{
								checks += "<div class='jumpToDiv'><input type='checkbox' tid = '"+id+"' id='"+index+"'/><label for='"+index+"'>"+tl+"<label></div>"
							}
						})
					}else{																				//当前没有添加过跳转问题
						$.each(nextAll,function(index,que){
							var tl = $(que).find(".question").find("label:eq(0)").text();
							var id = $(que).find(".question").attr('id');
							title.push(tl);
							ids.push(id);
							if(jump2s!=""){
								if(contains(jump2s,id)){
									return true;
								}
							}
							checks += "<div class='jumpToDiv'><input type='checkbox' tid = '"+id+"' id='"+index+"'/><label for='"+index+"'>"+tl+"<label></div>"
						})
					}
																										//如果check为空
					if(checks==""){
						checks ="<label>当前没有可以跳转的问题<label>";
					}
					layer.open({
						  type: 1 //Page层类型
						  ,area: ['500px', '300px']
						  ,title: '请选择 选择该选项 需要跳转到的问题,'
						  ,shade: 0.6 //遮罩透明度
						  ,anim: 1 //0-6的动画形式，-1不开启
						  ,content: '<div style="padding:50px;">'
						  +checks
						  +'</div>'
						  ,btn:['确定','取消']
						  ,btn1:function(index){														//确定按钮点击事件
							  var selected = $(".jumpToDiv").find("input[type=checkbox]:checked");
							  var tids = "";
							  if(selected.length==0){													//如果没有跳转事件
								  $("#"+questionID).find("input:eq(0)").attr('jumpTo1',tids)
								  var selectes = $(".jumpToDiv").find("input[type=checkbox]");
								  $.each(selectes,function(index,input){
									  var tid = $(input).attr('tid');
									  $("#"+tid).attr({'jump':'false'});
								  })
							  }else{
								  $.each(selected,function(index,input){
									  var tid = $(input).attr('tid');
									  if(index==0){
										  tids=tid;
									  }else{
										  tids+="`"+tid;
									  }
									  																	//定义是否跳转
									  $("#"+tid).attr({'jump':'true','jumpObj':questionID});
									  $("#"+questionID).find("input:eq(0)").attr('jumpTo1',tids)
								  })
							  }
							 
							  layer.close(index);
						  }
						}); 
					
				})
				//跳转问题设置跳转点击事件 选项二
				$(document).on("click",'.itemTwo',function(){
					var questionID = $(this).parent().attr('questionId');
					var parent = $("#"+questionID).parent();
					var nextAll = $(parent).nextAll();
					if(nextAll.length==0){
						layer.confirm("请先在该问题之后添加要跳转的问题",{btn:["确认"]},function(index){
							layer.close(index);
						})
						return ;
					}
					var title = [];
					var ids = [];
					var checks = "";
					var jump1s = '';			
					var jumpTosStr = $("#"+questionID).find("input:eq(1)").attr('jumpto2');				//获取选项二已经添加跳转的问题
					var jumpTosStr1 = $("#"+questionID).find("input:eq(0)").attr('jumpto1');			//获取选项一已经添加跳转的问题
					if(typeof(jumpTosStr1)!="undefined"&&jumpTosStr1!=""){
						jump1s = jumpTosStr1.split('`');
					}
					if(typeof(jumpTosStr)!="undefined"&&jumpTosStr!=""){
						var jumpTos = jumpTosStr.split('`');
						$.each(nextAll,function(index,que){
							var tl = $(que).find(".question").find("label:eq(0)").text();
							var id = $(que).find(".question").attr('id');
							title.push(tl);
							ids.push(id);
							if(jump1s!=""){	
								if(contains(jump1s,id)){												//判断是否有已添加跳转的选项一 有则去除
									return true;
								}
							}
							if(contains(jumpTos,id)){
								checks += "<div class='jumpToDiv'><input type='checkbox' checked='true' tid = '"+id+"' id='"+index+"'/><label for='"+index+"'>"+tl+"<label></div>"
							}else{
								checks += "<div class='jumpToDiv'><input type='checkbox' tid = '"+id+"' id='"+index+"'/><label for='"+index+"'>"+tl+"<label></div>"
							}
						})
					}else{
						$.each(nextAll,function(index,que){
							var tl = $(que).find(".question").find("label:eq(0)").text();
							var id = $(que).find(".question").attr('id');
							title.push(tl);
							ids.push(id);
							if(jump1s!=""){	
								if(contains(jump1s,id)){												//判断是否有已添加跳转的选项一 有则去除
									return true;
								}
							}
							checks += "<div class='jumpToDiv'><input type='checkbox' tid = '"+id+"' id='"+index+"'/><label for='"+index+"'>"+tl+"<label></div>"
						})
					}
																										//如果check为空
					if(checks==""){
						checks ="<label>当前没有可以跳转的问题<label>";
					}
					layer.open({
						  type: 1 //Page层类型
						  ,area: ['500px', '300px']
						  ,title: '请选择 选择该选项  需要跳转到的问题'
						  ,shade: 0.6 //遮罩透明度
						  ,anim: 1 //0-6的动画形式，-1不开启
						  ,content: '<div style="padding:50px;">'
						  +checks
						  +'</div>'
						  ,btn:['确定','取消']
						  ,btn1:function(index){
							  var selected = $(".jumpToDiv").find("input[type=checkbox]:checked");
							  var tids = "";
							  if(selected.length==0){													//如果没有跳转事件
								  $("#"+questionID).find("input:eq(1)").attr('jumpTo2',tids)
								  var selectes = $(".jumpToDiv").find("input[type=checkbox]");
								  $.each(selectes,function(index,input){
									  var tid = $(input).attr('tid');
									  $("#"+tid).attr({'jump':'false'});
								  })
							  }else{
								  $.each(selected,function(index,input){
									  var tid = $(input).attr('tid');
									  if(index==0){
										  tids=tid;
									  }else{
										  tids+="`"+tid;
									  }
									  																	//	是否
									  $("#"+tid).attr({'jump':'true','jumpObj':questionID});
									  $("#"+questionID).find("input:eq(1)").attr('jumpTo2',tids)
								  })
							  }
							  layer.close(index);
						  }
						}); 
					
				})
						
				//屏幕下滑高度
				function screenScrol(num){
					$("#t"+num).focus();
				}
						
				//悬浮边框
				$(document).on('mouseover','.addDiv',function(){
					$(this).children(".question").css({"border":"1px dotted #2A94DE",'border-radius':'2px'});
					if(getQuestionNum()!=1){
						$(this).children().children(".move").css({'display':'block'});
					}
				});
				$(document).on('mouseout','.addDiv',function(){
					$(this).children(".question").css({"border":"0"});
					$(this).children().children(".move").css({'display':'none'});
				});
					
		  //body滚动条控制
		   $(document).on('click','#click_r',function(){
		      window.scrollTo(0,document.body.scrollHeight);
		   });
		
		
		//标题提示控制
		$(document).on('mouseover','#questionnaireName',function(){
			var title=document.getElementById("questionnaireName").value;
			if(title=="表 单 名 称")
				document.getElementById("questionnaireName").value="";		
		});
		$(document).on('mouseout','#questionnaireName',function(){
			var title=document.getElementById("questionnaireName").value;
			if(title=="")
				document.getElementById("questionnaireName").value="表 单 名 称";		
		});
		//////////////////////////// 工具函数
		//提示框
		function tip(text){
			text = "<span style='font-size:16px;color:white;font-family:Microsoft YaHei;'>"+text+"</span>"
			//提示框
			var index = layer.msg(text,{
				  offset:'rt',
				  anim:5,
				  area: ['360px'],
				}) 
				layer.style(index, {
				  top: '2px',
				  right:'20px',
				  background:'#FFB800',
				}); 
		}
	
		/**
		 * 提示函数
		 */
		function l(text){
			console.log(text);
		}
		/**
		 * 判断数组涵盖某个元素
		 */
		function contains(arr, obj) {
			var i = arr.length;
			while (i--) {
				if (arr[i] === obj) {
				   return true;
				  }
				}
			return false;
		}
		
		//获取页面url参数值
		function GetQueryString(name)
		{
		     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
		     var r = window.location.search.substr(1).match(reg);
		     if(r!=null)return  decodeURI(r[2]); return null;
		}
		
		//判断是否已经发布
		var publish = GetQueryString("publish");
		if(publish==1){
			updateFlag = true;
			layer.alert("该问卷已经发布过，为不影响问卷收集，当前状态只能更改字段的值，不可以更改题目亦不可增减字段");
			$("#click_r").css("pointer-events","none");
			$(document).on("click","#click_r",function(){
				layer.alert("当前状态,不可以进行字段添加或移除")
			})
			
		}
		//页面离开提示
		function confirm(flag){
			if(!flag){
				
				window.onbeforeunload = function(){
					return "您的问卷没有保存";
				}
			}else{
				window.onbeforeunload = function(){
					return;
				}
			}
		}
		
		//初始设置问卷没有保存
		confirm(false);
		
	})
  
	//ready end
			
			
			
	
	
	

	