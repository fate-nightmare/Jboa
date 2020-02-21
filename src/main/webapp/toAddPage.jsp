<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<base href="/Jboa/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>北大青鸟办公自动化管理系统</title>
<link href="css/style.css" rel="stylesheet" type="text/css">

<link href="http://localhost:8080/jboa/js/My97DatePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css">
<style type="text/css">
	body{background: color:#fff;}
</style>

</head>
<body>
	<div class="action  divaction">
		<div class="t">请假</div>
		<div class="pages">
			<form action="" method="post" id="leaveForm">
				<!--增加请假单 区域 开始-->
				<table width="90%" border="0" cellspacing="0" cellpadding="0" class="addform-base">
					<caption>基本信息</caption>
					<tbody>
						<tr>
							<td width="36%">姓名：${login.employeeName }</td>
							<td width="64%">部门：${login.departmentName }</td>
						</tr>
						<tr>
							<td>开始时间：<input type="date" name="startTime" value="" id="startDate" class="nwinput"></td>
							<td>结束时间：<input type="date" name="endTime" value="" id="endDate" class="nwinput"></td>
						</tr>
						<tr>
							<td>请假天数：
								<input type="hidden" name="totalCount" value="1">
								<span id="totalCount">1</span>
							</td>
						</tr>
						<tr>
							<td colspan="2"><span style="position: relative; top: -30px;">请假事由：</span>
								<textarea id="textarea" name="event" rows="5" cols="45"></textarea></td>
	
						</tr>
	
						<!--表单提交行-->
						<tr>
							<td colspan="4" class="submit">
								<input type="button" value="提交" onclick="toSubmit()" class="submit_01">
								<input type="button" value="返回" onclick="window.history.go(-1)" class="submit_01">
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>


<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script>
	/* 请假 */
	function toSubmit(){
		var event = $("#textarea").val();
		if(event == ""){
			alert("请输入请假事由");
			return;
		}
	
		var leave = {};
		leave["typeId"] = 1;
		leave["createMan"] = ${login.employeeId};
		leave["departmentId"] = ${login.departmentId};
		leave["createTime"] = time;
		leave["startTime"] = $("[name=startTime]").val();
		leave["endTime"] = $("[name=endTime]").val();
		leave["nextDealMan"] = 1004;
		leave["event"] = $("[name=event]").val();
		leave["totalCount"] = $("[name=totalCount]").val();
		leave["statusId"] = 2;
		console.info(leave);

		$.ajax("/Jboa/api/leaveList/add",{
			type: "post",
			dataType: "json",
			contentType: "application/json",
			data: JSON.stringify(leave),
			success:function(res){
				if(res.code == "200" && res.msg == "ok"){
						alert("提交成功");
						leave = {}
						location.href="leavefindList.jsp";
					} else{
						alert("提交失败");
						}
			}
		});
		
	}
	
	//获取当前系统时间
	var date = new Date();

	var year = date.getFullYear();

	var month = date.getMonth()+1;
	var day = date.getDate();
	var hour = date.getHours();
	var minute = date.getMinutes();
	var second = date.getSeconds();
	var time = year+"-"+month+"-"+day+"-"+hour+":"+minute+":"+second;
		 
	$(function(){
		$("#startDate").change(function(){
			var sDate = $(this).val();
			var eDate = $("#endDate").val();
			sDate = new Date(sDate.replace(/-/g, "/"));
			if(sDate<new Date()){
				alert("请假日期不正确！");
				$(this).val("");
				return;
			}
			if(eDate != ""){
				eDate = new Date(eDate.replace(/-/g, "/"));
				var days = eDate.getTime() - sDate.getTime();
				var time = parseInt(days / (1000 * 60 * 60 * 24));
				if(time <= 0){
					alert("请选择正确的日期");
					$(this).val("");
					return false;
				}else{
					$("#totalCount").text(time).val(time);
					$("[name='totalCount']").val(time);
				}
			}
		});
		$("#endDate").change(function(){
			var sDate = $("#startDate").val();
			var eDate = $(this).val();
			if(sDate != ""){
				sDate = new Date(sDate.replace(/-/g, "/"));
				eDate = new Date(eDate.replace(/-/g, "/"));
				var days = eDate.getTime() - sDate.getTime();
				var time = parseInt(days / (1000 * 60 * 60 * 24));
				if(time <= 0){
					alert("请选择正确的日期");
					$(this).val("");
					return false;
				}else{
					$("#totalCount").text(time);
					$("[name='totalCount']").val(time);
				}
			}
		});
	});

	
</script>
</body>
</html>