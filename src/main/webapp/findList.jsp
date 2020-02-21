<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<base href="/Jboa/">
	<link href="css/style.css" rel="stylesheet" type="text/css">
	<link href="js/My97DatePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css">
<link href="http://111.230.175.243:8080/jboa/js/My97DatePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css"></head>
<body>
	<div class="action  divaction">
		<div class="t">报销单列表</div>
		<div class="pages">
			<div class="forms">
				<form id="myForm" name="queryForm" action="" method="get">
					<label>报销单状态</label> <select name="statusId" id="statusId">
						<option value="0">全部</option>
									<option value="1">新创建</option>
									<option value="2">待审批</option>
									<option value="3">审批中</option>
									<option value="4">已审批</option>
									<option value="5">已付款</option>
									<option value="6">已打回</option>
									<option value="7">已存档</option>
					</select> <label for="time">开始时间</label> <input type="text" name="sTime" value="" id="startDate" class="nwinput"> <label for="end-time">结束时间</label> <input type="text" name="eTime" value="" id="endDate" class="nwinput"> <!-- <input
						type="hidden" name="pageNum" value="1"> <input
						type="hidden" name="pageSize" value="2"> --> <input type="button" id="claimVoucher_searchClaimVoucher_action_0" value="查询" class="submit_01">
				</form>
			</div>
			<!--增加报销单 区域 开始-->
			<form id="claimVoucher_searchClaimVoucher_action" name="claimVoucherForm" action="jsp/claim/claimVoucher_searchClaimVoucher.action" method="post">
				<table width="90%" border="0" cellspacing="0" cellpadding="0" class="list items">
					<thead>
						<tr class="even">
							<td>编号</td>
							<td>填报日期</td>
							<td>填报人</td>
							<td>总金额</td>
							<td>状态</td>
							<td>待处理人</td>
							<td width="20%">操作</td>
						</tr>
					</thead>
					<tbody id="box">
						
					</tbody>
					<tfoot><tr>
						<td colspan="7" align="center">
							<div class="page-bar">

								<a href="JavaScript:void(0)" onclick="sy()">首页</a>
								&nbsp;&nbsp;
								
								&nbsp;&nbsp;
								
									<a href="JavaScript:void(0)" onclick="syy()">上一页</a>
									<a href="JavaScript:void(0)" onclick="xyy()">下一页</a>
								
								&nbsp;&nbsp; <a href="JavaScript:void(0)" onclick="wy()">末页</a>
								

								&nbsp;&nbsp; &nbsp;&nbsp;第 1页/共8页&nbsp;&nbsp;共220条记录
							
							</div>
						</td>
					</tr>
				</tfoot></table>
			</form>
			<!--增加报销单 区域 结束-->
		</div>
	</div>

<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
<script>
	//获取用户ID
	var employeeId = window.sessionStorage.getItem("employeeId");
	console.info("用户ID"+employeeId);
	//获取部门ID
	var departmentId = ${login.departmentId}
	console.info("部门ID"+departmentId);
	//获取职位ID
	var positionId = ${login.positionId}
	console.info("职位ID"+positionId);

	/* 编辑 */
	$(document).on("click","[name=updates]",function(){
			window.sessionStorage.setItem("reimburseId1",$(this).attr("data-c"));
			location.href="toUpdatePage.jsp";
	});

	/* 提交 */
	$(document).on("click","[name=submits]",function(){
		 if(confirm("确定要提交么？(提交后无法修改)'") == true){
			 if($("#zjg").text() < 5000){
				 var tbreimburse = {};
				 tbreimburse["reimburseId"] = $(this).attr("data-c");
				 tbreimburse["statusId"] = 2;
				 tbreimburse["nextDealMan"] = 1004;
				 console.info(tbreimburse);
				 
				$.ajax("/Jboa/api/reimburse/updateBySubmit",{
					 	type : "put",
						dataType : "json",
						contentType : "application/json",
						data: JSON.stringify(tbreimburse),
						success:function(res){
							if(res.code == "200" && res.msg == "ok"){
									alert("已提交");
								} else{
									alert("提交失败");
									}
						}
					});
					location.href="findList.jsp";
				 } else{
					 var tbreimburse = {};
					 tbreimburse["reimburseId"] = $(this).attr("data-c");
					 tbreimburse["statusId"] = 2;
					 tbreimburse["nextDealMan"] = 1000;
					 console.info(tbreimburse);
					 
					$.ajax("/Jboa/api/reimburse/updateBySubmit",{
						 	type : "put",
							dataType : "json",
							contentType : "application/json",
							data: JSON.stringify(tbreimburse),
							success:function(res){
								if(res.code == "200" && res.msg == "ok"){
										alert("已提交");
									} else{
										alert("提交失败");
										}
							}
						});
						location.href="findList.jsp";
					 }
			 }
	});

	/* 查看详情 */
	$(document).on("click","[name=queryBygetDetails]",function(){
			var reimburseId = $(this).attr("data-c");
			window.sessionStorage.setItem("reimburseId",reimburseId);
			location.href="getDetails.jsp";
		});

	/* 部门经理审批报销 */
	$(document).on("click", "[name=bxid]", function(){
		var reimburseId = $(this).attr("data-c");
		window.sessionStorage.setItem("reimburseId",reimburseId);
		location.href="toSCheckPage.jsp";
	});

	var pageInfo;

	function Page(pageNum,pageSize){
		if(positionId == 2){
			/* 根据用户查询报销单列表 */
			$.ajax("/Jboa/api/reimburse/queryByRList/"+positionId+"/"+employeeId+"/"+pageNum+"/"+pageSize,{
				type : "get",
				dataType : "json",
				contentType : "application/json",
				success:function(res){
					pageInfo = res;
					console.info("res"+res);
					$("tbody").empty();
					$.each(res.list,function(i,obj){
						if(obj.statusName == "新创建"){
							var $tr = $(`<tr>
											<td><a href="javascript:void(0)">${"${obj.reimburseId}"}</a></td>
											<td>
											${"${obj.createTime}"}
											</td>
											<td>${"${obj.createMans}"}</td>
											<td id='zjg'>${"${obj.totalCount}"}</td>
											<td>${"${obj.statusName}"}</td>
											<td>${"${obj.nextDealMans}"}</td>
											<td>
												
													<a href="JavaScript:void(0)" data-c="${"${obj.reimburseId}"}" name="submits">
														<img src="images/save.gif" title="提交" width="16" height="16">
													</a>
													<a href="JavaScript:void(0)" data-c="${"${obj.reimburseId}"}" name="updates">
														<img src="images/edit.gif" title="编辑" width="16" height="16">
													</a> 
													<a onclick="return confirm('确定要删除吗？')" href="JavaScript:void(0)"> 
														<img src="images/delete.gif" title="删除" width="16" height="16">
													</a>
												
												
												<a target="rightFrame" href="JavaScript:void(0)" data-c="${"${obj.reimburseId}"}" name="queryBygetDetails"> 
													<img src="images/search.gif" title="查看详情" width="16" height="15">
												</a> 
												
											</td>
										</tr>`);
							$("tbody").append($tr);
							} else if(obj.statusName == "已打回"){
								var $tr = $(`<tr>
												<td><a href="javascript:void(0)">${"${obj.reimburseId}"}</a></td>
												<td>
												${"${obj.createTime}"}
												</td>
												<td>${"${obj.createMans}"}</td>
												<td>${"${obj.totalCount}"}</td>
												<td>${"${obj.statusName}"}</td>
												<td>${"${obj.nextDealMans}"}</td>
												<td>
													
													<a href="JavaScript:void(0)">
														<img src="images/edit.gif" title="编辑" width="16" height="16">
													</a> 
													<a target="rightFrame" href="JavaScript:void(0)" data-c="${"${obj.reimburseId}"}" name="queryBygetDetails"> 
														<img src="images/search.gif" title="查看详情" width="16" height="15">
													</a> 
													
												</td>
											</tr>`);
								$("tbody").append($tr);
								} else{
									var $tr = $(`<tr>
													<td><a href="javascript:void(0)">${"${obj.reimburseId}"}</a></td>
													<td>
													${"${obj.createTime}"}
													</td>
													<td>${"${obj.createMans}"}</td>
													<td>${"${obj.totalCount}"}</td>
													<td>${"${obj.statusName}"}</td>
													<td>${"${obj.nextDealMans}"}</td>
													<td>
														
														<a target="rightFrame" href="JavaScript:void(0)" data-c="${"${obj.reimburseId}"}" name="queryBygetDetails">
															<img src="images/search.gif" title="查看详情" width="16" height="15">
														</a> 
														
													</td>
												</tr>`);
									$("tbody").append($tr);
									}
						})
				}
			});
			} else if(positionId == 1){
				/* 经理 */
				$.ajax("/Jboa/api/reimburse/queryByDepartmentManager/"+departmentId+"/"+positionId+"/"+employeeId+"/"+pageNum+"/"+pageSize,{
					type : "get",
					dataType : "json",
					contentType : "application/json",
					success:function(res){
						pageInfo = res;
						console.info("res"+res);
						$("tbody").empty();
						$.each(res.list,function(i,obj){
							if(obj.createMans != employeeId && obj.statusName != "新创建"){
								if(obj.statusName == "新创建"){
									var $tr = $(`<tr>
													<td><a href="javascript:void(0)">${"${obj.reimburseId}"}</a></td>
													<td>
													${"${obj.createTime}"}
													</td>
													<td>${"${obj.createMans}"}</td>
													<td>${"${obj.totalCount}"}</td>
													<td>${"${obj.statusName}"}</td>
													<td>${"${obj.nextDealMans}"}</td>
													<td>
														
															<a href="JavaScript:void(0)" onclick="return confirm('确定要提交么？(提交后无法修改)')">
																<img src="images/save.gif" title="提交" width="16" height="16">
															</a>
															<a href="JavaScript:void(0)">
																<img src="images/edit.gif" title="编辑" width="16" height="16">
															</a> 
															<a onclick="return confirm('确定要删除吗？')" href="JavaScript:void(0)"> 
																<img src="images/delete.gif" title="删除" width="16" height="16">
															</a>
														
														
														<a target="rightFrame" href="JavaScript:void(0)" data-c="${"${obj.reimburseId}"}" name="queryBygetDetails"> 
															<img src="images/search.gif" title="查看详情" width="16" height="15">
														</a> 
														
													</td>
												</tr>`);
									$("tbody").append($tr);
									} else if(obj.statusName == "待审批"){
										var $tr = $(`<tr>
												<td><a href="javascript:void(0)">${"${obj.reimburseId}"}</a></td>
												<td>
												${"${obj.createTime}"}
												</td>
												<td>${"${obj.createMans}"}</td>
												<td>${"${obj.totalCount}"}</td>
												<td>${"${obj.statusName}"}</td>
												<td>${"${obj.nextDealMans}"}</td>
												<td>
													<a href="JavaScript:void(0)" data-c="${"${obj.reimburseId}"}" name="bxid">
														<img src="images/sub.gif" width="16" height="16">
													</a>
													<a target="rightFrame" href="JavaScript:void(0)" data-c="${"${obj.reimburseId}"}" name="queryBygetDetails"> 
														<img src="images/search.gif" title="查看详情" width="16" height="15">
													</a> 
													
												</td>
											</tr>`);
								$("tbody").append($tr);
										} else if(obj.statusName == "已打回"){
										var $tr = $(`<tr>
														<td><a href="javascript:void(0)">${"${obj.reimburseId}"}</a></td>
														<td>
														${"${obj.createTime}"}
														</td>
														<td>${"${obj.createMans}"}</td>
														<td>${"${obj.totalCount}"}</td>
														<td>${"${obj.statusName}"}</td>
														<td>${"${obj.nextDealMans}"}</td>
														<td>
															
															<a href="JavaScript:void(0)">
																<img src="images/edit.gif" title="编辑" width="16" height="16">
															</a> 
															<a target="rightFrame" href="JavaScript:void(0)" data-c="${"${obj.reimburseId}"}" name="queryBygetDetails"> 
																<img src="images/search.gif" title="查看详情" width="16" height="15">
															</a> 
															
														</td>
													</tr>`);
										$("tbody").append($tr);
										} else{
											var $tr = $(`<tr>
															<td><a href="javascript:void(0)">${"${obj.reimburseId}"}</a></td>
															<td>
															${"${obj.createTime}"}
															</td>
															<td>${"${obj.createMans}"}</td>
															<td>${"${obj.totalCount}"}</td>
															<td>${"${obj.statusName}"}</td>
															<td>${"${obj.nextDealMans}"}</td>
															<td>
																
																<a target="rightFrame" href="JavaScript:void(0)" data-c="${"${obj.reimburseId}"}" name="queryBygetDetails">
																	<img src="images/search.gif" title="查看详情" width="16" height="15">
																</a> 
																
															</td>
														</tr>`);
											$("tbody").append($tr);
											}
								}
							})
					}
				});
				} else if(positionId == 3){
					/* 财务 */
					$.ajax("/Jboa/api/reimburse/queryByTwo/"+pageNum+"/"+pageSize,{
						type : "get",
						dataType : "json",
						contentType : "application/json",
						success:function(res){
							pageInfo = res;
							console.info("res"+res);
							$("tbody").empty();
							$.each(res.list,function(i,obj){
								if(obj.createMans != employeeId && obj.statusName != "新创建" || obj.statusName == "待审批"){
									if(obj.statusName == "新创建"){
										var $tr = $(`<tr>
														<td><a href="javascript:void(0)">${"${obj.reimburseId}"}</a></td>
														<td>
														${"${obj.createTime}"}
														</td>
														<td>${"${obj.createMans}"}</td>
														<td>${"${obj.totalCount}"}</td>
														<td>${"${obj.statusName}"}</td>
														<td>${"${obj.nextDealMans}"}</td>
														<td>
															
																<a href="JavaScript:void(0)" onclick="return confirm('确定要提交么？(提交后无法修改)')">
																	<img src="images/save.gif" title="提交" width="16" height="16">
																</a>
																<a href="JavaScript:void(0)">
																	<img src="images/edit.gif" title="编辑" width="16" height="16">
																</a> 
																<a onclick="return confirm('确定要删除吗？')" href="JavaScript:void(0)"> 
																	<img src="images/delete.gif" title="删除" width="16" height="16">
																</a>
															
															
															<a target="rightFrame" href="JavaScript:void(0)" data-c="${"${obj.reimburseId}"}" name="queryBygetDetails"> 
																<img src="images/search.gif" title="查看详情" width="16" height="15">
															</a> 
															
														</td>
													</tr>`);
										$("tbody").append($tr);
										} else if(obj.statusName == "审批中"){
											var $tr = $(`<tr>
													<td><a href="javascript:void(0)">${"${obj.reimburseId}"}</a></td>
													<td>
													${"${obj.createTime}"}
													</td>
													<td>${"${obj.createMans}"}</td>
													<td>${"${obj.totalCount}"}</td>
													<td>${"${obj.statusName}"}</td>
													<td>${"${obj.nextDealMans}"}</td>
													<td>
														
														<a href="JavaScript:void(0)" data-c="${"${obj.reimburseId}"}" name="bxid">
															<img src="images/sub.gif" width="16" height="16">
														</a>
														<a target="rightFrame" href="JavaScript:void(0)" data-c="${"${obj.reimburseId}"}" name="queryBygetDetails"> 
															<img src="images/search.gif" title="查看详情" width="16" height="15">
														</a> 
														
													</td>
												</tr>`);
									$("tbody").append($tr);
											} else if(obj.statusName == "已打回"){
											var $tr = $(`<tr>
															<td><a href="javascript:void(0)">${"${obj.reimburseId}"}</a></td>
															<td>
															${"${obj.createTime}"}
															</td>
															<td>${"${obj.createMans}"}</td>
															<td>${"${obj.totalCount}"}</td>
															<td>${"${obj.statusName}"}</td>
															<td>${"${obj.nextDealMans}"}</td>
															<td>
																
																<a href="JavaScript:void(0)">
																	<img src="images/edit.gif" title="编辑" width="16" height="16">
																</a> 
																<a target="rightFrame" href="JavaScript:void(0)" data-c="${"${obj.reimburseId}"}" name="queryBygetDetails"> 
																	<img src="images/search.gif" title="查看详情" width="16" height="15">
																</a> 
																
															</td>
														</tr>`);
											$("tbody").append($tr);
											} else{
												var $tr = $(`<tr>
																<td><a href="javascript:void(0)">${"${obj.reimburseId}"}</a></td>
																<td>
																${"${obj.createTime}"}
																</td>
																<td>${"${obj.createMans}"}</td>
																<td>${"${obj.totalCount}"}</td>
																<td>${"${obj.statusName}"}</td>
																<td>${"${obj.nextDealMans}"}</td>
																<td>
																	
																	<a target="rightFrame" href="JavaScript:void(0)" data-c="${"${obj.reimburseId}"}" name="queryBygetDetails">
																		<img src="images/search.gif" title="查看详情" width="16" height="15">
																	</a> 
																	
																</td>
															</tr>`);
												$("tbody").append($tr);
												}
									}
								})
						}
					});
					} else if(positionId == 5){
						/* 出纳 */
						$.ajax("/Jboa/api/reimburse/queryByTwo/"+pageNum+"/"+pageSize,{
							type : "get",
							dataType : "json",
							contentType : "application/json",
							success:function(res){
								pageInfo = res;
								console.info("res"+res);
								$("tbody").empty();
								$.each(res.list,function(i,obj){
									if(obj.createMans != employeeId && obj.statusName != "新创建" || obj.statusName == "待审批" || obj.statusName == "审批中"){
										if(obj.statusName == "新创建"){
											var $tr = $(`<tr>
															<td><a href="javascript:void(0)">${"${obj.reimburseId}"}</a></td>
															<td>
															${"${obj.createTime}"}
															</td>
															<td>${"${obj.createMans}"}</td>
															<td>${"${obj.totalCount}"}</td>
															<td>${"${obj.statusName}"}</td>
															<td>${"${obj.nextDealMans}"}</td>
															<td>
																
																	<a href="JavaScript:void(0)" onclick="return confirm('确定要提交么？(提交后无法修改)')">
																		<img src="images/save.gif" title="提交" width="16" height="16">
																	</a>
																	<a href="JavaScript:void(0)">
																		<img src="images/edit.gif" title="编辑" width="16" height="16">
																	</a> 
																	<a onclick="return confirm('确定要删除吗？')" href="JavaScript:void(0)"> 
																		<img src="images/delete.gif" title="删除" width="16" height="16">
																	</a>
																
																
																<a target="rightFrame" href="JavaScript:void(0)" data-c="${"${obj.reimburseId}"}" name="queryBygetDetails"> 
																	<img src="images/search.gif" title="查看详情" width="16" height="15">
																</a> 
																
															</td>
														</tr>`);
											$("tbody").append($tr);
											} else if(obj.statusName == "已审批"){
												var $tr = $(`<tr>
														<td><a href="javascript:void(0)">${"${obj.reimburseId}"}</a></td>
														<td>
														${"${obj.createTime}"}
														</td>
														<td>${"${obj.createMans}"}</td>
														<td>${"${obj.totalCount}"}</td>
														<td>${"${obj.statusName}"}</td>
														<td>${"${obj.nextDealMans}"}</td>
														<td>
															
															<a href="JavaScript:void(0)" data-c="${"${obj.reimburseId}"}" name="bxid">
																<img src="images/sub.gif" width="16" height="16">
															</a>
															<a target="rightFrame" href="JavaScript:void(0)" data-c="${"${obj.reimburseId}"}" name="queryBygetDetails"> 
																<img src="images/search.gif" title="查看详情" width="16" height="15">
															</a> 
															
														</td>
													</tr>`);
										$("tbody").append($tr);
												} else if(obj.statusName == "已打回"){
												var $tr = $(`<tr>
																<td><a href="javascript:void(0)">${"${obj.reimburseId}"}</a></td>
																<td>
																${"${obj.createTime}"}
																</td>
																<td>${"${obj.createMans}"}</td>
																<td>${"${obj.totalCount}"}</td>
																<td>${"${obj.statusName}"}</td>
																<td>${"${obj.nextDealMans}"}</td>
																<td>
																	
																	<a href="JavaScript:void(0)">
																		<img src="images/edit.gif" title="编辑" width="16" height="16">
																	</a> 
																	<a target="rightFrame" href="JavaScript:void(0)" data-c="${"${obj.reimburseId}"}" name="queryBygetDetails"> 
																		<img src="images/search.gif" title="查看详情" width="16" height="15">
																	</a> 
																	
																</td>
															</tr>`);
												$("tbody").append($tr);
												} else{
													var $tr = $(`<tr>
																	<td><a href="javascript:void(0)">${"${obj.reimburseId}"}</a></td>
																	<td>
																	${"${obj.createTime}"}
																	</td>
																	<td>${"${obj.createMans}"}</td>
																	<td>${"${obj.totalCount}"}</td>
																	<td>${"${obj.statusName}"}</td>
																	<td>${"${obj.nextDealMans}"}</td>
																	<td>
																		
																		<a target="rightFrame" href="JavaScript:void(0)" data-c="${"${obj.reimburseId}"}" name="queryBygetDetails">
																			<img src="images/search.gif" title="查看详情" width="16" height="15">
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
	
	Page(1,3);


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
</body>
</html>