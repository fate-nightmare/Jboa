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
</head>
<body>
	<div class="action  divaction">
		<div class="t">查看请假</div>
		<div class="pages">
			<!--增加报销单 区域 开始-->
			<table width="90%" border="0" cellspacing="0" cellpadding="0" class="addform-base">
				<caption>基本信息</caption>
				<tbody>
					<tr>
						<td width="36%" >姓名：<span name="name"></span></td>
						<td width="64%">部门：<span name="bm"></span></td>
					</tr>
					<tr>
						<td>开始时间：<span  name="ks"></span></td>
						<td>结束时间：<span  name="js"></span></td>
					</tr>
					<tr>
						<td>请假天数：<span name="ts"></span></td>
						<td>请假事由：<span name="sy"></span></td>
					</tr>
					<tr>
						<td>审批状态：<span name="zt"></span></td>
						<td></td>
					</tr>
				</tbody>
			</table>
			<p>
				-------------------------------------------------------------------------------
			</p>
			<table width="90%" border="0" cellspacing="0" cellpadding="0" class="addform-base" style="margin: 20px 0;">
				<thead>
					<tr>
				 		<td>审查人</td>
				 		<td>审查意见</td>
				 		<td>审查时间</td>
				 		<td>审查结果</td>
				 	</tr>
				</thead>
				<tbody id="box">
				 	
				</tbody>
					<!--表单提交行-->
					<tfoot>
						<tr>
							<td colspan="4" class="submit">
								<input type="button" value="返回" onclick="window.history.go(-1)" class="submit_01">
							</td>
						</tr>
				</tfoot>
			</table>
			<!--增加报销单 区域 结束-->
		</div>
	</div>


</body>
<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script>
	var leaveId = window.sessionStorage.getItem("leaveId");
	console.info(leaveId);

	/* 查看请假审查详情 */
	$.ajax("/Jboa/api/leaveList/details/"+leaveId,{
		type: "get",
		dataType: "json",
		contentType: "application/json",
		success:function(res){
			console.info(res);
			$.each(res,function(i,obj){
				var tr = $(`<tr>
				 		<td>${"${obj.nextDealManName}"}</td>
				 		<td>${"${obj.checkComment}"}</td>
				 		<td>${"${obj.checkTime}"}</td>
				 		<td>${"${obj.resultName}"}</td>
				 	</tr>`);
			 	$("#box").append(tr);
				})
		}
	});

	/* 查看请假基本详情 */
	$.ajax("/Jboa/api/leaveList/detail/"+leaveId,{
		type: "get",
		dataType: "json",
		contentType: "application/json",
		success:function(res){
			console.info(res);
			$("[name=name]").append(res.employeeName);
			$("[name=bm]").append(res.departmentName);
			$("[name=ks]").append(res.startTime);
			$("[name=js]").append(res.endTime);
			$("[name=ts]").append(res.totalCount);
			$("[name=sy]").append(res.event);
			$("[name=zt]").append(res.statusName);
			
		}
	});


</script>
</html>