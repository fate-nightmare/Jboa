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
<style>
	.img{width:40px;height:40px;cursor:pointer;}
	.weight{font-weight: bold;}
</style>
</head>
<body>
	<form id="myForm" name="myForm" method="post">
		<div class="action  divaction">
			<div class="t">查看报销单</div>
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
							<td>总金额：<span name="price"></span></td>
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

				<table style="margin-top: 15px;" width="90%" border="0" cellspacing="0" cellpadding="0" class="addform-base">
					<thead>
						
							<tr>
								<td width="15%">审查人</td>
								<td width="40%">审查意见</td>
								<td width="30%">审查时间</td>
								<td width="15%">审查结果</td>
							</tr>
						
					</thead>
					<tbody id="box">
						
							<!-- <tr>
								<td>
									<span>王健林</span>
								</td>
								<td>
									<span></span>
								</td>
								<td>
									<span>2019-12-11 17:24:49</span>
								</td>
								<td>
									<span class="weight">通过</span>
								</td>
							</tr> -->
						

					</tbody>

				</table>
				<p>&nbsp;</p>

				<p>&nbsp;</p>
				<p>
					<input type="button" value="返回" onclick="window.history.go(-1)" class="submit_01">
				</p>
				<!--增加报销单 区域 结束-->
			</div>
		</div>
	</form>

</body>
<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script>
	var reimburseId = window.sessionStorage.getItem("reimburseId");
	var mainId = window.sessionStorage.getItem("reimburseId");

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
</html>