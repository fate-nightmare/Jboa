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
		<div class="t">审批请假</div>
		<div class="pages">
			<!--增加报销单 区域 开始-->
			<table width="90%" border="0" cellspacing="0" cellpadding="0" class="addform-base">
				<caption>基本信息</caption>
				<tbody>
					<tr>
						<td width="36%">姓名：<span name="name"></span></td>
						<td width="64%">部门：<span name="bm"></span></td>
					</tr>
					<tr>
						<td>开始时间：<span name="ks"></span></td>
						<td>结束时间：<span name="js"></span></td>
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
					
				</thead>
				<tbody>
					
				</tbody>	
			</table>
			
			<form id="leave_checkLeave_action" name="leaveForm" action="" method="post"><!-- ../jboa/leave/checkLeave -->
				<table width="90%" border="0" cellspacing="0" cellpadding="0" class="addform-base">
					<tbody>
						<tr>
							<td>审批意见：</td>
						</tr>
						<tr>
							<td><textarea name="checkComment" id="textarea" cols="45" rows="5"></textarea></td>
						</tr>
						<!--表单提交行-->
						<tr>
							<td colspan="4" class="submit">
								
									
									
										<input type="button" name="button" id="button" value="审批通过" class="submit_01" onclick="checkLeave('同意')"> 
										<input type="button" name="button" id="button" value="审批拒绝" class="submit_01" onclick="checkLeave('拒绝')">
									
								
								<input type="hidden" name="leaveId" value="163" id="leaveId"> 
								<input type="hidden" name="statusId" value="" id="status">
							</td>
						</tr>
						<tr>
							<td>
								<p>&nbsp;
								</p>
								<p>
									<input type="button" value="返回" onclick="window.history.go(-1)" class="submit_01">
								</p>	
							</td>
						</tr>

					</tbody>
				</table>
			</form>




			<!--增加报销单 区域 结束-->
		</div>
	</div>

<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
	/* 请假编号 */
	var leaveId = window.sessionStorage.getItem("leaveId");
	console.info(leaveId);

	/* 点击审批通过 */
	function checkLeave(status){
   		if(!confirm('确定'+status+'请假吗')) return;
   		if(status != "拒绝"){
   	   		var jg = $("[name=checkComment]").val();
   	   		
			var approval = {};
			approval["bizId"] = leaveId;
			approval["typeId"] = 1;
			approval["checkTime"] = time;
			approval["checkMan"] = ${login.employeeId};
			console.info("审查人编号："+${login.employeeId});
			approval["checkResult"] = 1;
			approval["checkComment"] = jg;
			console.info(approval);

			/* 点击审批通过新增审批 */
			$.ajax("/Jboa/api/leaveList/addByApproval",{
				type: "post",
				dataType: "json",
				contentType: "application/json",
				data: JSON.stringify(approval),
				success:function(res){
					if(res.code == "200" && res.msg == "ok"){
						alert("审批完成");
						approval = {};
						location.href="leavefindList.jsp";
						} else{
							alert("审批失败");
							}
				}
			});

			var LeaveList = {};
			LeaveList["leaveId"] = leaveId;
			LeaveList["statusId"] = 4;
			LeaveList["nextDealMan"] = 1017;

			/* 点击审批通过修改请假表 */
			$.ajax("/Jboa/api/leaveList/updateByLeaveList",{
				type: "put",
				dataType: "json",
				contentType: "application/json",
				data: JSON.stringify(LeaveList),
				success:function(res){
					if(res.code == "200" && res.msg == "ok"){
						console.info("成功修改请假表");
						} else{
							console.info("修改请假表失败");
							}
				}
			});
			
			

   			
   		}else{
			var jg = $("[name=checkComment]").val();
   	   		
			var approval = {};
			approval["bizId"] = leaveId;
			approval["typeId"] = 1;
			approval["checkTime"] = time;
			approval["checkMan"] = ${login.employeeId};
			console.info("审查人编号："+${login.employeeId});
			approval["checkResult"] = 2;
			approval["checkComment"] = jg;
			console.info(approval);

			/* 点击拒绝审批新增审批 */
			$.ajax("/Jboa/api/leaveList/addByApproval",{
				type: "post",
				dataType: "json",
				contentType: "application/json",
				data: JSON.stringify(approval),
				success:function(res){
					if(res.code == "200" && res.msg == "ok"){
						alert("审批已拒绝");
						approval = {};
						location.href="leavefindList.jsp";
						} else{
							alert("审批拒绝失败");
							}
				}
			});

			var LeaveList = {};
			LeaveList["leaveId"] = leaveId;
			LeaveList["statusId"] = 6;
			LeaveList["nextDealMan"] = 0;

			/* 点击拒绝审批修改请假表 */
			$.ajax("/Jboa/api/leaveList/updateByLeaveList",{
				type: "put",
				dataType: "json",
				contentType: "application/json",
				data: JSON.stringify(LeaveList),
				success:function(res){
					if(res.code == "200" && res.msg == "ok"){
						console.info("成功修改请假表");
						} else{
							console.info("修改请假表失败");
							}
				}
			});

   			
   		}
   		
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

	/* 查看请假基本详情 */
	$.ajax("/Jboa/api/leaveList/detail/"+leaveId,{
		type: "get",
		data: "json",
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
</body>
</html>