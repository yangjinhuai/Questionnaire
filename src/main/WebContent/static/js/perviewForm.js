// 发布问卷的所有js
//author xt
//
$(document).ready(function(){
	$(".form-group").css({"margin-top":"20px"});
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
//二级下拉菜单end
	
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
});


