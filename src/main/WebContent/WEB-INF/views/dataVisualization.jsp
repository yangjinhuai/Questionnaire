<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%pageContext.setAttribute("APP_PATH",request.getContextPath());
  pageContext.setAttribute("USER",request.getSession().getAttribute("username"));
  pageContext.setAttribute("LASTLogoTime",request.getSession().getAttribute("lastLogoTime"));
  pageContext.setAttribute("LASTLogoIp",request.getSession().getAttribute("lastLogoIp"));
  pageContext.setAttribute("AdminType",request.getSession().getAttribute("userType"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/common.css">
  
  <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/bootstrap.min.css">
   <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/dataVisualization.css">
   <script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
   <script type="text/javascript" src="${APP_PATH}/static/js/echarts.common.min.js"></script>
   <script type="text/javascript" src="${APP_PATH}/static/js/waypoints.min.js"></script>
   <script type="text/javascript" src="${APP_PATH}/static/js/jquery.countup.js"></script>
<title>数据分析</title>
<style type="text/css">
  .iframecontent
{
	height: 260px;
	width: 89%;
	margin: 20px 34px 50px 80px;
	border-radius: 10px;
	min-width: 500px;
	min-height: 200px;
}
.maincol
{
    height: 90px;
	width: 47%;
	border-radius:10px;
	margin:5px 22px 0px 0px;
	padding:15px 15px;
	background-color: #E8F2FE;
}
.maincol a
{
   text-decoration: none;
}
.row{
   margin-top: 20px;
}
#chart{
	margin: 10px 2px 10px 20px;
	width: 89%;
	height:380px;
	min-width: 500px;
	
}
</style>
</head>
<body>
   <!-- 图片部分B -->
   <div class="row">
        <div class="col-md-3 bg1 anwserNum"><p class="counter">66</p></div>
        <div class="col-md-3 bg2 anwserNum"><p class="counter">66</p></div>
        <div class="col-md-3 bg3"><a href="${APP_PATH}/Views/dataAnalysis;" target="main"></a></div>
        <div class="col-md-3 bg4" id="bg4"><a href="${APP_PATH}/Views/adminManage;" target="main"></a></div>
   </div>
   <!-- 图片部分E-->
   <!-- 可视化部分 -->
   <div id="chart"></div>
   <!-- 系统信息B -->
   <div class="iframecontent">
            <div class="maincol maincol-right left">       
                <dl>
                    <dt>登录信息</dt>
                    <dd>
                        <ul>
                            <li>上次登录时间:${LASTLogoTime}</li>
                            <li>上次登录IP:${LASTLogoIp}</li>
                        </ul>
                    </dd>
                </dl>            
           </div>
           
            <div class="maincol maincol-left left">        
                <dl>
                    <dt>系统信息</dt>
                    <dd>
                        <ul>
                            <li>程序版本：V1.0 [2017.11.10]</li>                  
                            <li>服务器软件：Apache/2.4.10</li>
                        </ul>
                    </dd>
                </dl>
                
            </div>
            
            
            <div class="maincol maincol-right left">       
                <dl>
                    <dt>版权信息</dt>
                    <dd>
                        <ul>
                            <li>版权所有：贵州民族大学</li>
                            <li>学校网站：www.gzmu.edu.cn</li>
                        </ul>
                    </dd>
                </dl>            
           </div>
           <div class="maincol maincol-right left">       
                <dl>
                    <dt>更新消息</dt>
                    <dd>
                        <ul>
                            <li>当前版本：V1.0 [2017.11.10]</li>
                            <li>最新版本：V1.0 [2017.11.10]</li>
                        </ul>
                    </dd>
                </dl>            
           </div>
            
     </div>
    <!-- 系统信息E -->
</body>
<script type="text/javascript">
$(document).ready(function(){
	//普通用户不可见系统管理图标B
	var adtp='${AdminType}';
	if(adtp==2){
		$("#bg4").remove();
		$(".row .col-md-3").css("width","23%");
	}

	//普通用户不可见系统管理图标E
});														//滚动之前的数据
		var ct=[];
		var ld=[];
		var dn="";
		var cd=[];
		$.ajax({
			url:'${APP_PATH}/Data/getSubmitCountData',
			type:'post',
			success:function(data){
				var counts = data.extend.count;
				if(counts.length==0)return;
				$.each(counts,function(index,item){
					
					ct.push(item.date);
					cd.push(item.num);
				})
				dn = ct[0]+"~"+ct[ct.length-1]+" 提交量";
				if(dn!=""){
					ld.push(dn);
				}
				chart();
				
			},
			error:function(data){
				chart();
			}
		})
		
		$('.counter').countUp({
		    'delay': 10,
		    'time': 2000
		});
															//获取收集到的问卷数
		$.ajax({
			url:'${APP_PATH}/Data/getRelesedAnswerNum',
			type:'post',
			success:function(data){
				var anwserNum = data.extend.anwserNum.list;
				var num = 0;
				$.each(anwserNum,function(index,item){
					num+=item.answerNum;
				})
				
				
				$(".anwserNum p").text(num);
				$('.counter').countUp({
				    'delay': 10,
				    'time': 600
				});
				$(".anwserNum p").text(num);
			}
		})
		
		function chart(){
			
			var chartDataTime = ct.length==0?["2017-12-21", "2017-12-22", "2017-12-23", "2017-12-24", "2017-12-25", "2017-12-26", "2017-12-27", "2017-12-28", "2017-12-29", "2017-12-30", "2017-12-31", "2018-01-01"]:ct;
			if(dn==""){
				var dataName = '2017-12-21~2018-1-1 提交量';
			}else{
				var dataName = dn;
			}
			ld.push(dataName)
			var legendData = ld;
			var charData = cd.length==0?[3, 5, 11, 18, 48, 69, 261, 46, 55, 18, 10, 0]:cd;
			var colors = ['#5793f3', '#d14a61', '#675bba'];
			option = {
			    color: colors,
			    tooltip: {
			        trigger: 'none',
			        axisPointer: {
			            type: 'cross'
			        }
			    },
			    legend: {
			        data:legendData
			    },
			    grid: {
			        top: 38,
			        bottom: 28
			    },
			    xAxis: [
			        {
			            type: 'category',
			            axisTick: {
			                alignWithLabel: true
			            },
			            axisLine: {
			                onZero: false,
			                lineStyle: {
			                    color: colors[1]
			                }
			            },
			            axisPointer: {
			                label: {
			                    formatter: function (params) {
			                        return '提交量 ' + params.value
			                            + (params.seriesData.length ? '：' + params.seriesData[0].data : '');
			                    }
			                }
			            },
			            data: chartDataTime
			        }
			    ],
			    yAxis: [
			        {
			            type: 'value'
			        }
			    ],
			    series: [
			        {
			            name:dataName,
			            type:'line',
			            smooth: true,
			            data: charData
			        }
			    ]
			};
			var myChart = echarts.init(document.getElementById('chart'));
			myChart.setOption(option);														
		}
</script>
</html>