<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<base href="/Jboa/">
<link href="css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script><link href="http://111.230.175.243:8080/jboa/js/My97DatePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css">
<link href="http://localhost:8080/jboa/js/My97DatePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css">
<script>
	$(function(){
		 //日期选择控件
	 	$("#startDate").click(function(){
			WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'endDate\')}',isShowClear:true, readOnly:true });
		});
		$("#endDate").click(function(){
			WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'startDate\')}',isShowClear:true, readOnly:true });
		});
	});
</script>
</head>
<body>
	<div class="action  divaction">
		<div class="t">请假列表</div>
		<div class="pages">
			<div class="forms">
				<form id="leave_searchLeave_action" name="queryForm" action="../jboa/leave/findList" method="get">
					<label for="time">开始时间</label> <input type="text" name="sTime" value="" id="startDate" class="nwinput">
					 <label for="end-time">结束时间</label> <input type="text" name="eTime" value="" id="endDate" class="nwinput" readonly=""> 
					 <input type="hidden" name="pageNo" value="1"> <input type="hidden" name="pageSize" value="5"> 
					<input onclick="Time()" type="button" id="leave_searchLeave_action_0" value="查询" class="submit_01">

				</form>
			</div>
			<!--增加报销单 区域 开始-->
			<table width="90%" border="0" cellspacing="0" cellpadding="0" class="list items">
				<thead>
					<tr class="even">
						<td>编号</td>
						<td>名称</td>
						<td>发起时间</td>
						<td>审批时间</td>
						<td>审批意见</td>
						<td>待处理人</td>
						<td>审批状态</td>
						<td>操作</td>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
				<tfoot>
					<tr>
						<td colspan="7" align="center">
							<div class="page-bar">

								<a href="JavaScript:void(0)" onclick="sy()">首页</a>
								&nbsp;&nbsp;
									<a href="JavaScript:void(0)" onclick="syy()">上一页</a>
								&nbsp;&nbsp;
								
									<a href="JavaScript:void(0)" onclick="xyy()">下一页</a>
								
								&nbsp;&nbsp; <a href="JavaScript:void(0)" onclick="wy()">末页</a>							
								&nbsp;&nbsp; &nbsp;&nbsp;第 1页/共3页&nbsp;&nbsp;共21条记录
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
			<!--请假 区域 结束-->
		</div>
	</div>

</body>
<script>
	//获取用户ID
	var employeeId = window.sessionStorage.getItem("employeeId");
	console.info("用户ID"+employeeId);
	//获取部门ID
	window.sessionStorage.setItem("departmentId", ${login.departmentId});
	var departmentId = window.sessionStorage.getItem("departmentId");
	console.info("部门ID"+departmentId);
	//获取职位ID
	window.sessionStorage.setItem("positionId", ${login.positionId});
	var positionId = window.sessionStorage.getItem("positionId");
	console.info("职位ID"+positionId);


	function Time(){
		PageByTime(1,3);
		}

	
	/* 时间区间查询 */
	function PageByTime(pageNum,pageSize){
		var startTime = $("[name=sTime]").val();
		var endTime = $("[name=eTime]").val();
		$.ajax("/Jboa/api/leaveList/queryByTime/"+startTime+"/"+endTime+"/"+pageNum+"/"+pageSize,{
			type: "get",
			dataType: "json",
			contentType: "application/json",
			success:function(res){
				pageInfo = res;
				$("tbody").empty();
				$.each(res.list,function(i,obj){
					var $tr = $(`<tr>
							<td><a href="javascript:void(0)">${"${obj.leaveId}"}</a></td>
							<td>${"${obj.createManName}"}请假${"${obj.totalCount}"}天</td>
							<td>${"${obj.createTime}"}</td>
							<td>${"${obj.checkTime}"}</td>
							<td>${"${obj.checkComment}"}</td>
							<td><a href="javascript:void(0)" name="ids" data-cs="${"${obj.nextDealMan}"}">${"${obj.nextDealManName}"}</a></td>
							<td>${"${obj.statusName}"}</td>
							<td>
								<a href="JavaScript:void(0)" data-c="${"${obj.leaveId}"}" name='id'>
									<img src="images/search.gif" width="16" height="15">
								</a>
								
							</td>
						</tr>`);
					$("tbody").append($tr);
					})
			}
		});
		
		}

	var pageInfo;

	function Page(pageNum,pageSize){
		if(positionId != 1 && positionId != 4){
			//根据用户查询请假列表
			$.ajax("/Jboa/api/leaveList/"+positionId+"/"+employeeId+"/"+pageNum+"/"+pageSize,{
				type : "get",
				dataType : "json",
				contentType : "application/json",
				success:function(res){
					pageInfo = res;
					console.info(res);
					$("tbody").empty();
					$.each(res.list,function(i,obj){
						var $tr = $(`<tr>
								<td><a href="javascript:void(0)">${"${obj.leaveId}"}</a></td>
								<td>${"${obj.createManName}"}请假${"${obj.totalCount}"}天</td>
								<td>${"${obj.createTime}"}</td>
								<td>${"${obj.checkTime}"}</td>
								<td>${"${obj.checkComment}"}</td>
								<td><a href="javascript:void(0)" name="ids" data-cs="${"${obj.nextDealManName}"}">${"${obj.nextDealManName}"}</a></td>
								<td>${"${obj.statusName}"}</td>
								<td>
									<a href="JavaScript:void(0)" data-c="${"${obj.leaveId}"}" name='id'>
										<img src="images/search.gif" width="16" height="15">
									</a>
									
								</td>
							</tr>`);
						$("tbody").append($tr);
						})
				}
			});
			} else if(positionId == 1){
				//根据用户查询请假列表
				$.ajax("/Jboa/api/leaveList/queryByManager/"+departmentId+"/"+positionId+"/"+employeeId+"/"+pageNum+"/"+pageSize,{
					type : "get",
					dataType : "json",
					contentType : "application/json",
					success:function(res){
						pageInfo = res;
						console.info("部门经理");
						console.info(res);
						$("tbody").empty();
						$.each(res.list,function(i,obj){
							if(obj.statusName != "待审批"){
								var $tr = $(`<tr>
										<td><a href="javascript:void(0)">${"${obj.leaveId}"}</a></td>
										<td>${"${obj.createManName}"}请假${"${obj.totalCount}"}天</td>
										<td>${"${obj.createTime}"}</td>
										<td>${"${obj.checkTime}"}</td>
										<td>${"${obj.checkComment}"}</td>
										<td><a href="javascript:void(0)" name="ids" data-cs="${"${obj.nextDealMan}"}">${"${obj.nextDealManName}"}</a></td>
										<td>${"${obj.statusName}"}</td>
										<td>
											<a href="JavaScript:void(0)" data-c="${"${obj.leaveId}"}" name='id'>
												<img src="images/search.gif" width="16" height="15">
											</a>
										</td>
									</tr>`);
								$("tbody").append($tr);
								} else{
									var $tr = $(`<tr>
											<td><a href="javascript:void(0)">${"${obj.leaveId}"}</a></td>
											<td>${"${obj.createManName}"}请假${"${obj.totalCount}"}天</td>
											<td>${"${obj.createTime}"}</td>
											<td>${"${obj.checkTime}"}</td>
											<td>${"${obj.checkComment}"}</td>
											<td><a href="javascript:void(0)" name="ids" data-cs="${"${obj.nextDealMan}"}">${"${obj.nextDealManName}"}</a></td>
											<td>${"${obj.statusName}"}</td>
											<td>
												<a href="JavaScript:void(0)" data-c="${"${obj.leaveId}"}" name='id'>
													<img src="images/search.gif" width="16" height="15">
												</a>
												<a href="JavaScript:void(0)" data-c="${"${obj.leaveId}"}" name='examine'>
													<img src="images/sub.gif" width="16" height="15">
												</a>
											</td>
										</tr>`);
									$("tbody").append($tr);
									}

							})
					}
				});
				} else if(positionId == 4){
					//根据用户查询请假列表
					$.ajax("/Jboa/api/leaveList/queryByPersonnel/"+departmentId+"/"+positionId+"/"+employeeId+"/"+pageNum+"/"+pageSize,{
						type : "get",
						dataType : "json",
						contentType : "application/json",
						success:function(res){
							pageInfo = res;
							console.info("人事");
							console.info(res);
							$("tbody").empty();
							$.each(res.list,function(i,obj){
								if(obj.statusName != "待审批"){
									if(obj.statusName != "已存档" && obj.statusName != "已打回"){
										var $tr = $(`<tr>
												<td><a href="javascript:void(0)">${"${obj.leaveId}"}</a></td>
												<td>${"${obj.createManName}"}请假${"${obj.totalCount}"}天</td>
												<td>${"${obj.createTime}"}</td>
												<td>${"${obj.checkTime}"}</td>
												<td>${"${obj.checkComment}"}</td>
												<td><a href="javascript:void(0)" name="ids" data-cs="${"${obj.nextDealMan}"}">${"${obj.nextDealManName}"}</a></td>
												<td>${"${obj.statusName}"}</td>
												<td>
													<a href="JavaScript:void(0)" data-c="${"${obj.leaveId}"}" name='id'>
														<img src="images/search.gif" width="16" height="15">
													</a>
													<a href="JavaScript:void(0)" data-c="${"${obj.leaveId}"}" name='examine'>
														<img src="images/sub.gif" width="16" height="15">
													</a>
												</td>
											</tr>`);
										$("tbody").append($tr);
										} else{
											var $tr = $(`<tr>
													<td><a href="javascript:void(0)">${"${obj.leaveId}"}</a></td>
													<td>${"${obj.createManName}"}请假${"${obj.totalCount}"}天</td>
													<td>${"${obj.createTime}"}</td>
													<td>${"${obj.checkTime}"}</td>
													<td>${"${obj.checkComment}"}</td>
													<td><a href="javascript:void(0)" name="ids" data-cs="${"${obj.nextDealMan}"}">${"${obj.nextDealManName}"}</a></td>
													<td>${"${obj.statusName}"}</td>
													<td>
														<a href="JavaScript:void(0)" data-c="${"${obj.leaveId}"}" name='id'>
															<img src="images/search.gif" width="16" height="15">
														</a>
													</td>
												</tr>`);
											$("tbody").append($tr);
											}
									
									}
								
								})
						}
					});
					}
		
		
		
		}

	/* 首页 */
	function sy(){
		Page(pageInfo.firstPage,pageInfo.pageSize)
		}

	/* 上一页 */
	function syy(){
		if(pageInfo.hasPreviousPage){
				Page(pageInfo.prePage,pageInfo.pageSize)
			} else{
				alert("已到首页");
				}
		}

	/* 下一页 */
	function xyy(){
		if(pageInfo.hasNextPage){
				Page(pageInfo.nextPage,pageInfo.pageSize)
			} else{
				alert("已到最后一页");
				}
		}

	/* 尾页 */
	function wy(){
		Page(pageInfo.lastPage,pageInfo.pageSize)
		}

$(function(){
	var employeeId = window.sessionStorage.getItem("employeeId");
	
	$(document).on("click", "[name=ids]", function(){
		var id = $(this).attr("data-cs");
		console.info(id);
	});
	

	/* 查看请假详情基本信息 */
	$(document).on("click", "[name=id]", function(){
		var id = $(this).attr("data-c");
		window.sessionStorage.setItem("leaveId",id);
		location.href="getDetail.jsp";
	});

	/* 审批操作 */
	$(document).on("click", "[name=examine]", function(){
		var id = $(this).attr("data-c");
		window.sessionStorage.setItem("leaveId",id);
		if(positionId == 1){
			location.href="toCheckPage.jsp";
			} else if(positionId == 4){
				location.href="toCheckPages.jsp";
				}
		
	});

	Page(1,3);
	
});

</script>
</html>