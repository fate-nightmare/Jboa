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
	<body>
	<div class="action  divaction">
		<div class="t">审核报销单</div>
		<div class="pages">
			<!--增加报销单 区域 开始-->
			<table width="90%" border="0" cellspacing="0" cellpadding="0" class="addform-base">
				<caption>基本信息</caption>
				<tbody>
					<tr>
						<td>编&nbsp;&nbsp;号：<span name="id"></span></td>
						<td>填&nbsp;写&nbsp;人：<span name="name"></span></td>
						<td>部&nbsp;&nbsp;门：<span name="bm"></span></td>
						<td>职&nbsp;&nbsp;位：<span name="zw"></span></td>
					</tr>
					<tr>
						<td>总金额：<span name="zje"></span></td>
						<td>填报时间：<span name="time"></span></td>
						<td>状态：<span name="zt"></span></td>
						<td>待处理人：<span name="dname"></span></td>
					</tr>
					<tr>
						<td colspan="4"><p>-------------------------------------------------------------------------------</p></td>
					</tr>
				</tbody>
			</table>
			<p>&nbsp;</p>
			<table width="90%" border="0" cellspacing="0" cellpadding="0" class="addform-base">
				<thead>
					<tr>
						<td>项目说明</td>
						<td>项目金额</td>
						<td>票据截图</td>
					</tr>
				</thead>
				<tbody id="box1">
					
				</tbody>
			</table>
			<p>&nbsp;</p>
			<p>-------------------------------------------------------------------------------</p>

			<table style="margin: 15px 0;" width="90%" border="0" cellspacing="0" cellpadding="0" class="addform-base">
				<thead id="thead">
					
				</thead>
				<tbody id="box">
					

				</tbody>
			</table>
			<form id="checkResult_checkClaimVoucher_action" name="checkResultForm" action="../jboa/page/updateStatus" method="post">
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
							<td colspan="3" class="submit">
								
									
									
									
										<!-- <input type="button" name="button" id="button" value="审批通过" class="submit_01" onclick="checkClaimVoucher('通过')"> --> 
										<input type="hidden" name="reimburseId" value="291" id="claimId"> 
										<input type="hidden" name="resultId" value="" id="result">
										<!-- <input type="button" name="button" id="button" value="打回" class="submit_01" onclick="checkClaimVoucher('打回')">
										<input type="button" name="button" id="button" value="审批拒绝" class="submit_01" onclick="checkClaimVoucher('拒绝')">  -->
									
								
								
								
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			<p>&nbsp;</p>

			<p>&nbsp;</p>
			<p>
				<input type="button" value="返回" onclick="window.history.go(-1)" class="submit_01">
			</p>
			<!--增加报销单 区域 结束-->
		</div>
	</div>



<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
	var reimburseId = window.sessionStorage.getItem("reimburseId");
	var mainId = window.sessionStorage.getItem("reimburseId");
	//获取职位ID
	var positionId = ${login.positionId}
	console.info("职位ID"+positionId);

	var tg = `<input type="button" name="button" id="button" value="审批通过" class="submit_01" onclick="checkClaimVoucher('通过')">`;
	var dh = `<input type="button" name="button" id="button" value="打回" class="submit_01" onclick="checkClaimVoucher('打回')">`;
	var jj = `<input type="button" name="button" id="button" value="审批拒绝" class="submit_01" onclick="checkClaimVoucher('拒绝')">`;

	if(positionId == 1){
			$(".submit").append(tg);
			$(".submit").append(dh);
			$(".submit").append(jj);
		} else if(positionId == 3){
				$(".submit").append(tg);
				$(".submit").append(dh);
			} else if(positionId == 5){
					$(".submit").append(tg);
				}

	function checkClaimVoucher(checkResult){
   		if(!confirm('确定'+checkResult+'报单吗')) return;
   		if(checkResult == "通过"){
			if(positionId == 1){
				var jg = $("[name=checkComment]").val();
	   	   		
				var approval = {};
				approval["bizId"] = reimburseId;
				approval["typeId"] = 2;
				approval["checkTime"] = time;
				approval["checkMan"] = ${login.employeeId};
				console.info("审查人编号："+${login.employeeId});
				approval["checkResult"] = 1;
				approval["checkComment"] = jg;
				console.info(approval);

				/* 点击审批通过新增审批 */
				$.ajax("/Jboa/api/reimburse/addByApproval",{
					type: "post",
					dataType: "json",
					contentType: "application/json",
					data: JSON.stringify(approval),
					success:function(res){
						if(res.code == "200" && res.msg == "ok"){
							alert("审批完成");
							approval = {};
							location.href="findList.jsp";
							} else{
								alert("审批失败");
								}
					}
				});

				var reimburse = {};
				reimburse["reimburseId"] = reimburseId;
				reimburse["statusId"] = 3;
				reimburse["nextDealMan"] = 1001;

				/* 点击审批通过修改报销表 */
				$.ajax("/Jboa/api/reimburse/updateByReimburse",{
					type: "put",
					dataType: "json",
					contentType: "application/json",
					data: JSON.stringify(reimburse),
					success:function(res){
						if(res.code == "200" && res.msg == "ok"){
							console.info("成功修改请假表");
							} else{
								console.info("修改请假表失败");
								}
					}
				});
				} else if(positionId == 3){
					var jg = $("[name=checkComment]").val();
		   	   		
					var approval = {};
					approval["bizId"] = reimburseId;
					approval["typeId"] = 2;
					approval["checkTime"] = time;
					approval["checkMan"] = ${login.employeeId};
					console.info("审查人编号："+${login.employeeId});
					approval["checkResult"] = 1;
					approval["checkComment"] = jg;
					console.info(approval);

					/* 点击审批通过新增审批 */
					$.ajax("/Jboa/api/reimburse/addByApproval",{
						type: "post",
						dataType: "json",
						contentType: "application/json",
						data: JSON.stringify(approval),
						success:function(res){
							if(res.code == "200" && res.msg == "ok"){
								alert("审批完成");
								approval = {};
								location.href="findList.jsp";
								} else{
									alert("审批失败");
									}
						}
					});

					var reimburse = {};
					reimburse["reimburseId"] = reimburseId;
					reimburse["statusId"] = 4;
					reimburse["nextDealMan"] = 1002;

					/* 点击审批通过修改报销表 */
					$.ajax("/Jboa/api/reimburse/updateByReimburse",{
						type: "put",
						dataType: "json",
						contentType: "application/json",
						data: JSON.stringify(reimburse),
						success:function(res){
							if(res.code == "200" && res.msg == "ok"){
								console.info("成功修改请假表");
								} else{
									console.info("修改请假表失败");
									}
						}
					});
					} else if(positionId == 5){
						var jg = $("[name=checkComment]").val();
			   	   		
						var approval = {};
						approval["bizId"] = reimburseId;
						approval["typeId"] = 2;
						approval["checkTime"] = time;
						approval["checkMan"] = ${login.employeeId};
						console.info("审查人编号："+${login.employeeId});
						approval["checkResult"] = 1;
						approval["checkComment"] = jg;
						console.info(approval);

						/* 点击审批通过新增审批 */
						$.ajax("/Jboa/api/reimburse/addByApproval",{
							type: "post",
							dataType: "json",
							contentType: "application/json",
							data: JSON.stringify(approval),
							success:function(res){
								if(res.code == "200" && res.msg == "ok"){
									alert("审批完成");
									approval = {};
									location.href="findList.jsp";
									} else{
										alert("审批失败");
										}
							}
						});

						var reimburse = {};
						reimburse["reimburseId"] = reimburseId;
						reimburse["statusId"] = 5;
						reimburse["nextDealMan"] = 0;

						/* 点击审批通过修改报销表 */
						$.ajax("/Jboa/api/reimburse/updateByReimburse",{
							type: "put",
							dataType: "json",
							contentType: "application/json",
							data: JSON.stringify(reimburse),
							success:function(res){
								if(res.code == "200" && res.msg == "ok"){
									console.info("成功修改请假表");
									} else{
										console.info("修改请假表失败");
										}
							}
						});
						}
   		}else if(checkResult == "拒绝"){
			var jg = $("[name=checkComment]").val();
   	   		
			var approval = {};
			approval["bizId"] = reimburseId;
			approval["typeId"] = 2;
			approval["checkTime"] = time;
			approval["checkMan"] = ${login.employeeId};
			console.info("审查人编号："+${login.employeeId});
			approval["checkResult"] = 2;
			approval["checkComment"] = jg;
			console.info(approval);

			/* 点击审批通过新增审批 */
			$.ajax("/Jboa/api/reimburse/addByApproval",{
				type: "post",
				dataType: "json",
				contentType: "application/json",
				data: JSON.stringify(approval),
				success:function(res){
					if(res.code == "200" && res.msg == "ok"){
						alert("审批完成");
						approval = {};
						location.href="findList.jsp";
						} else{
							alert("审批失败");
							}
				}
			});

			var reimburse = {};
			reimburse["reimburseId"] = reimburseId;
			reimburse["statusId"] = 4;
			reimburse["nextDealMan"] = 0;

			/* 点击审批通过修改报销表 */
			$.ajax("/Jboa/api/reimburse/updateByReimburse",{
				type: "put",
				dataType: "json",
				contentType: "application/json",
				data: JSON.stringify(reimburse),
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
			approval["bizId"] = reimburseId;
			approval["typeId"] = 2;
			approval["checkTime"] = time;
			approval["checkMan"] = ${login.employeeId};
			console.info("审查人编号："+${login.employeeId});
			approval["checkResult"] = 3;
			approval["checkComment"] = jg;
			console.info(approval);

			/* 点击审批通过新增审批 */
			$.ajax("/Jboa/api/reimburse/addByApproval",{
				type: "post",
				dataType: "json",
				contentType: "application/json",
				data: JSON.stringify(approval),
				success:function(res){
					if(res.code == "200" && res.msg == "ok"){
						alert("审批完成");
						approval = {};
						location.href="findList.jsp";
						} else{
							alert("审批失败");
							}
				}
			});

			var reimburse = {};
			reimburse["reimburseId"] = reimburseId;
			reimburse["statusId"] = 6;
			reimburse["nextDealMan"] = 0;

			/* 点击审批通过修改报销表 */
			$.ajax("/Jboa/api/reimburse/updateByReimburse",{
				type: "put",
				dataType: "json",
				contentType: "application/json",
				data: JSON.stringify(reimburse),
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
	
	base64Data=new Array();
	//选择预览图片
	$("#imgFile").on(
			"change",
			function(e) {
				var fr = new FileReader();//读取文件
				var file = this.files[0];//选择第一个文件
				var _temp = file.name.match(/\.jpg|\.png|\.gif|\.bmp/i);
				if (!_temp) {
					this.value = "";
					alert("目前只支持jpg,png,bmp,gif格式图片文件");
					return false;
				} else if (file.size > (1024 * 1024)) {
					this.value = "";
					alert("目前只支持小于1M大小图片文件");
					return false;
				}
				fr.readAsDataURL(file);//读取文件
				//操作文件事件
				fr.onload = function() {
					base64Data[0] = this.result;//获得base编码字符串格式
					$("#preShow").attr("src", base64Data[0]);//显示图片
				};
			});

	/* 查看审查详情 */
	$.ajax("/Jboa/api/reimburse/queryByCheck/"+reimburseId,{
		type: "get",
		dataType: "json",
		contentType: "application/json",
		success:function(res){
			console.info(res);
			$.each(res,function(i,obj){
				console.info(obj.nextDealMans);
				console.info(obj.resultName);
				var tr = $(`<tr>
				 		<td>${"${obj.nextDealMans}"}</td>
				 		<td>${"${obj.checkComment}"}</td>
				 		<td>${"${obj.checkTime}"}</td>
				 		<td>${"${obj.resultName}"}</td>
				 	</tr>`);
			 	$("#box").append(tr);
				})
				var $thead = $(`<tr>
						<td width="15%">审查人</td>
						<td width="40%">审查意见</td>
						<td width="30%">审查时间</td>
						<td width="15%">审查结果</td>
					</tr>`);
			$("#thead").append($thead);
		}
	});

	/* 详细信息 */
	$.ajax("/Jboa/api/reimburse/queryByBasics/"+mainId,{
		type:"get",
		dataType:"json",
		contentType:"application/json",
		success:function(res){
			$.each(res,function(i,obj){
				var $tr = $(`<tr>
								<td>
								<span>${"${obj.desc}"}</span>
							</td>
							<td>
								<span>${"${obj.subTotal}"}</span>
							</td>
							<td><img class="img'"+i+"'" src=""></td>
						</tr>`);
				$("#box1").append($tr);
				base64Data[i] = obj.pictureName;
				$(".img"+i).attr("src",base64Data[i]);
				})
		}
	});

	/* 基本详情 */
	$.ajax("/Jboa/api/reimburse/queryByBasic/"+reimburseId,{
		type:"get",
		dataType:"json",
		contentType:"application/json",
		success:function(res){
			console.info(res);
			$("[name=id]").append(res.reimburseId);
			$("[name=name]").append(res.createMans);
			$("[name=bm]").append(res.departmentName);
			$("[name=zw]").append(res.positionName);
			$("[name=price]").append(res.totalCount);
			$("[name=time]").append(res.createTime);
			$("[name=zt]").append(res.statusName);
			$("[name=dname]").append(res.nextDealMans);
		}
	});
   	
</script>
</body>
</html>