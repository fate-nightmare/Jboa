<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<base href="/Jboa/">
<link href="css/style.css" rel="stylesheet" type="text/css">


</head>
<body>
	<div class="action  divaction" style="padding-bottom: 0px;">
		<div class="t">月度统计详情</div>
		<div class="pages">
			<form id="claimVoucherStatistics_createDetailExcel_action" name="queryForm" method="get" action="../jboa/statistics/monthExcel">
				<label for="time">年份:</label> 2019 <label for="end-time">月份:</label>
				1 <input type="hidden" name="year" value="2019" id="claimVoucherStatistics_createDetailExcel_action_year">
				<input type="hidden" name="selectMonth" value="1" id="claimVoucherStatistics_createDetailExcel_action_selectMonth">
				<input type="hidden" name="departmentId" value="1" id="claimVoucherStatistics_createDetailExcel_action_departmentId">
				<input type="submit" id="claimVoucherStatistics_createDetailExcel_action_0" value="导出报表" class="submit_01">

			</form>

			<table width="90%" border="0" cellspacing="0" cellpadding="0" class="list items">
				<thead>
					<tr class="even">
						<td>编号</td>
						
						<td>报销总额</td>
						<td>年份</td>
						<td>月份</td>
						<td>部门</td>
					</tr>
				</thead>
				<tbody>
					
						<tr>
							<td>1</td>
							
							<td>￥43.0</td>
							<td>2019年</td>
							<td>1月</td>
							<td>财务部</td>
						</tr>
					
						<tr>
							<td>2</td>
							
							<td>￥454.0</td>
							<td>2019年</td>
							<td>1月</td>
							<td>人事部</td>
						</tr>
					
						<tr>
							<td>3</td>
							
							<td>￥7055.0</td>
							<td>2019年</td>
							<td>1月</td>
							<td>研发部</td>
						</tr>
					
					<tr>
						<td></td>
						<td bgcolor="yellow">总计</td>
						<td bgcolor="yellow">￥7552.0</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- <span style="display: none;"><iframe id="downloadIframe" src=""
				style="width: 0px; height: 0px;"></iframe></span>
		增加报销单 区域 结束 -->
	</div>
	<div id="echartsDom" style="width: 702px; background: rgb(255, 255, 255); clear: both; padding-top: 20px; padding-left: 40px; height: 400px; -webkit-tap-highlight-color: transparent; user-select: none; position: relative;" _echarts_instance_="ec_1577500585810"><div style="position: relative; overflow: hidden; width: 702px; height: 400px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;"><canvas data-zr-dom-id="zr_0" width="702" height="400" style="position: absolute; left: 0px; top: 0px; width: 702px; height: 400px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas></div><div style="position: absolute; display: none; border-style: solid; white-space: nowrap; z-index: 9999999; transition: left 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s, top 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s; background-color: rgba(50, 50, 50, 0.7); border-width: 0px; border-color: rgb(51, 51, 51); border-radius: 4px; color: rgb(255, 255, 255); font: 14px/21px &quot;Microsoft YaHei&quot;; padding: 5px; left: 521px; top: 94px;">报销金额<br><span style="display:inline-block;margin-right:5px;border-radius:10px;width:10px;height:10px;background-color:#c23531;"></span>王健林: 43</div></div>
	<div style="width:542px;background:#fff;padding-left: 200px;">
		<input type="button" class="submit_01" value="查看柱状图" onclick="initEcharts('bar')">
		<input type="button" class="submit_01" value="查看饼图" onclick="initEcharts('pie')">
		<input type="button" class="submit_01" value="查看曲线图" onclick="initEcharts('line')">
	</div>

<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/echarts.js" charset="UTF-8"></script>
<script type="text/javascript">


	$(function(){
		initEcharts('pie');
	});
	
	function initEcharts(type){
		var data = [{"money":43.0,"name":"王健林"},{"money":454.0,"name":"王岐山"},{"money":7055.0,"name":"郭忠意"}];
		var xAxis = new Array();
		var legend = new Array(); 
		for(var i=0;i<data.length;i++){
			xAxis[i] = data[i].name;
			legend[i] = data[i].money;
		}
		var year = 2019;
		var month = 1;
		var departmentName = '财务部';
		var option = null;
		if(type=='bar'){
			option = {
			    title: {
			    	text: year+'年'+month+'月'+departmentName+'月度报销统计图'
			    },
			    tooltip: {},
			    legend: {
			        data:['报销金额']
			    },
			    xAxis: {
			        data: xAxis
			    },
			    yAxis: {},
			    series: [{
			        name: '报销金额',
			        type: 'bar',
			        barWidth : 30,
			        data: legend
			    }]
			};
		}else if(type=="pie"){
			option = {
			    title: {
			    	 text: year+'年'+month+'月'+departmentName+'月度报销统计图'
			    },
			    tooltip: {},
			    series: [{
			        name: '报销金额',
			        type: 'pie',
			        radius:'60%',
			        label : {
			        	normal : {
			        		formatter: '{b}: ({d}%)',
			        		textStyle : {
				        		fontWeight : 'normal',
				        		fontSize : 15
			        		}
			        	}
			        }
			    }],
			    dataset:{
			    	source:data
			    }
			};
		}else{
			option = {
			    title: {
			    	text: year+'年'+month+'月'+departmentName+'月度报销统计图'
			    },
			    tooltip: {},
			    legend: {
			        data:['报销金额']
			    },
			    xAxis: {
			        data: xAxis
			    },
			    yAxis: {},
			    series: [{
			        name: '报销金额',
			        type: 'line',
			        barWidth : 30,
			        data: legend
			    }]
			};
		}
		var dom = document.getElementById('echartsDom');
		$("#echartsDom").height('400px');
		var myChart = echarts.init(dom);
		if (myChart != null && myChart != "" && myChart != undefined) {//关键
	        myChart.dispose();
	    }
		var myChart = echarts.init(dom);
		myChart.setOption(option);
	}
	
</script>
</body>
</html>