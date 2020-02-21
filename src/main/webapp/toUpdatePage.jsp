<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<base href="/Jboa/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>北大青鸟办公自动化管理系统</title>
<style type="text/css">
	.preview {
	    display: inline-block;
	    width: 40px;
	    height: 40px;
	    position: relative;
	    background-image: url("images/abcc.png");
	    background-repeat: no-repeat;
	    background-size: cover;
	}
	
	.file {
	    width: 40px;
	    height: 40px;
	    opacity: 0;
	    position: absolute;
	    left: 0;
	    top: 0;
	    cursor: pointer;
	    z-index: 5;
	}
</style>
<link href="css/style.css" rel="stylesheet" type="text/css">


</head>
<body>
	<div class="action  divaction">
		<div class="t">报销单更新</div>
		<div class="pages">
			<form id="claimVoucher_updateClaimVoucher_action" name="claimForm" enctype="multipart/form-data" action="" method="post">
				<input type="hidden" name="reimburseId" value="254">
				<input type="hidden" name="statusId" value="1" id="status">
				<input type="hidden" id="rowNumber" name="rowNumber" value="0">
				<input type="hidden" id="claimId" name="claimVoucher.id" value="133">
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
							<td>总金额： <input type="text" name="totalCount" value="" readonly="readonly" id="totalAccount"></td>
							<td>填报时间：<span name="time"></span></td>
							<td>状态：<span name="zt"></span></td>
							<td>待处理人：<span name="dname"></span></td>
						</tr>
						<tr>
							<td colspan="4"><p>-------------------------------------------------------------------------------</p></td>
						</tr>
					</tbody>
				</table>
				<table id="myTable" width="90%" border="0" cellspacing="0" cellpadding="0" class="addform-base">
					<thead>
						<tr>
							<td width="30%">项目说明</td>
							<td width="30%">项目金额</td>
							<td width="30%">票据截图</td>
							<td width="10%">操作</td>
						</tr>
					</thead>
					<tbody id="box1">
						
					</tbody>
				</table>
				
				<table id="detailTable" width="90%" border="0" cellspacing="0" cellpadding="0" class="addform-base">
					<tbody>
						<tr>
							<td width="30%">
								<input type="text" id="item">
							</td>
							<td width="30%">
								<input type="text" name="claimVoucherDetail.account" id="account">
							</td>
							<td width="30%">
								<div class="preview">
							        <input type="file" name="imgFile" accept="image/*" class="file" value="">
							    </div>
							</td>
							<td width="10%">
								<img src="images/add.gif" width="16" height="16" id="AddRow">
							</td>
						</tr>
					</tbody>
				</table>
				<table>
					<tbody>
						<tr>
							<td>*事由：</td>
							<td colspan="3">
							<textarea name="event" cols="66" rows="5" id="event"></textarea>
							</td>
						</tr>
						<tr align="center" colspan="4">
							<td>&nbsp;</td>
							<td>
							
								<input type="button" id="1" name="1" value="保存" onclick="submitClaimVoucher('保存')" class="submit_01"> 
							
							<input type="button" id="2" name="2" value="提交" class="submit_01" onclick="submitClaimVoucher('提交')"> 
							<input type="button" value="返回" onclick="window.history.go(-1)" class="submit_01">
							</td>
						</tr>
					</tbody>
				</table>
			</form>

		</div>
	</div>




<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
	var reimburseId = window.sessionStorage.getItem("reimburseId");
	var mainId = window.sessionStorage.getItem("reimburseId");

	var sss = $("[name=subTotal]").val();
	console.info(sss);

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

	/* 删除 */
	$(document).on("click","[name=deletes]",function(){
		if(confirm('确定要删除吗？') == true){
			var id = $("[name=deletes]").attr("data-c");
			
				/* $.ajax("/Jboa/api/reimburse/deleteByCompile/"+id,{
					type: "delete",
					dataType:"json",
					contentType:"application/json",
					success:function(res){
						if(res.code == "200" && res.msg == "ok"){
								console.info("删除成功");
							} else{
								console.info("删除失败");
								}
					}
				}); */
				/* $(this).parents("tr").remove(); */
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
							<td>
								<a href="JavaScript:void(0)" data-c="${"${obj.id}"}" name="deletes"> 
									<img src="images/delete.gif" title="删除" width="16" height="16">
								</a>
							</td>
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
			$("[name=totalCount]").val(res.totalCount);
			$("[name=time]").append(time);
			$("[name=zt]").append(res.statusName);
			$("[name=dname]").append(res.nextDealMans);
			$("[name=event]").val(res.event);
		}
	});

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
		//表单提交校验

		//$("#myTable tr").eq(0).hide();	
		$("form[name='claimForm']").submit(function(){
			//判断是否加入了问题 
			if($("#rowNumber").val()<1){
				//$.messager.defaults={ok:"确定"};$.messager.alert("提示信息",$("#rowNumber").val());
				$("#notice").text("* 添加报销单的明细，至少一条 ！");
				return false;
			}	
			$("#notice").text("*");
			for(var s=0;s<$("#rowNumber").val();s++){
				$("#account"+s).next(".notice").text("*");
				$("#desc"+s).next(".notice").text("*");
				if(isEmpty($("#account"+s).val())){
					$("#account"+s).next(".notice").text("* 金额不能为空  ！");
					return false;
				}		
				if(isEmpty($("#desc"+s).val())){
					$("#desc"+s).next(".notice").text("* 金额不能为空  ！");
					return false;
				}		
							
			}
			$(".buttons").hide();
			return true;
		});	
		$("#AddRow").click(function(){	
			var totalAccount = $("#totalAccount").val();
			var tr=$("#myTable tr").eq(0).clone();
			++i;
			var j=i-1;
			var item = $("#item").val();
			var account = $("#account").val();
			var imgEle = $(this).parent().prev().children()[0];
			var imgClone = $(imgEle).clone();
			totalAccount=parseFloat(totalAccount)+parseFloat(account);
			var desc = $("#item").val();
			
			var files = $(".file");//[0].files[0];
			var file = files.get(files.length-1).files[0];
			if(!file){
				alert("请选择文件");
				i--;
				return;
			}
			if(item == ""){
				alert("请输入项目说明");
				i--;
				return false;
			}
			if(account == ""){
				alert("请输入项目金额");
				i--;
				return false;
			}else{
				if(isNaN(account)){
					alert("请输入正确的数字");
					i--;
					return false;
				}else{
					if(account<=0){
						alert("请输入正确的数字");
						i--;
						return false;
					}
				}
			}
			
			tr.find("td").get(0).innerHTML="<input type='hidden' name='detailsId' value='0'> <input type='hidden' name='opr' value='add' > <input type='hidden' name='shixiang' value='"+desc+"'>"+desc;
			tr.find("td").get(1).innerHTML="<input  name='subTotal' id=account"+j+"  type=hidden value="+account+" />"+account;
			var td2 = tr.find("td").get(2);
			$(td2).html("").append(imgClone);
			tr.find("td").get(3).innerHTML="<img src=images/delete.gif width=16 height=16 id=DelRow"+j+" onclick=delRow("+j+") />";
			tr.show();
			tr.appendTo("#myTable");
			//传递一共添加多少问题 
			rowNumber=i;
			$("#item").attr("value","");
			$("#account").attr("value","");
			$(imgEle.children[0]).attr("value","");
			$(imgEle).css("background-image","url('images/abcc.png')");
			$("#totalAccount").attr("value",totalAccount);
	
		});	
		
	});
	var i=parseInt(1);
	
	var rowNumber=parseInt(1);
	
	function delRow(id,obj){	
		if(!confirm("确定要删除这条记录吗？")) return;
		var totalCount = $("#totalAccount").val();
		var count = $(obj).parent().prev().prev().children()[0].value;
		totalCount = parseInt(totalCount)-parseInt(count);
		$("#totalAccount").val(totalCount);
		$(obj).parent().parent().remove();
		
	}
	function submitClaimVoucher(action){
	  		if(!confirm("确定"+action+"报销单吗")) return;
	  		if (action == '保存'){
	  			var reimburseId = window.sessionStorage.getItem("reimburseId1");
	  			console.info("当前报销编号："+reimburseId);
	  			var tbreimburse = {};
	  			 tbreimburse["reimburseId"] = reimburseId;
	  			 tbreimburse["totalCount"] = $("[name=totalCount]").val();
	  			 tbreimburse["createTime"] = time;
	  			 tbreimburse["event"] = $("[name=event]").val();
	  			 console.info(tbreimburse);
	  			
	  			/* 修改 */
	  		 	$.ajax("/Jboa/api/reimburse/updateBySave",{
		  			type : "put",
  					dataType : "json",
  					contentType : "application/json",
  					data: JSON.stringify(tbreimburse),
  					success:function(res){
  						if(res.code == "200" && res.msg == "ok"){
  							console.info("保存成功");
  							} else{
  								alert("保存失败");
  								}
  					}
  				});

	  			var xbbx = {};
	  			xbbx["mainId"] = reimburseId;
	  			xbbx["subTotal"] = $("[name=subTotal]").val();
	  			xbbx["desc"] = $("[name=shixiang]").val();
	  			xbbx["pictureName"] = newUrl;
	  			xbbx["picturePath"] = 0;
	  			console.info(xbbx);

  				/* 新增 */
	  			$.ajax("/Jboa/api/reimburse/insertByNewProject",{
		  			type : "post",
  					dataType : "json",
  					contentType : "application/json",
  					data: JSON.stringify(xbbx),
  					success:function(res){
  						if(res.code == "200" && res.msg == "ok"){
  							console.info("新增成功");
  							} else{
  								alert("新增失败");
  								}
  					}
  				});
	  			location.href="findList.jsp";
	  		}else{
		  		/* 提交 */
	  			/* var tbreimburse = {};
	  			 tbreimburse["reimburseId"] = 
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
	  				}); */
	  		}
	  		
	   		
	 }
	
	function fullGoodsPic(){
    	var goodsPic =$(".preview");
  		
    };
</script>

<script type="text/javascript">
    var preview = $(".preview");
    var eleFile = $(".file");
    var count = 0;
    var newUrl;
    eleFile.change(function(){
        var file = this.files[0];
        // 确认选择的文件是图片
        for(var i=0;i<eleFile.length;i++) {
            if (eleFile[i] == this) {
            	if($("[name='opr']")[i] != undefined){
            		$("[name='opr']")[i].value="upd";
            	}
                count = i;
                if (file.type.indexOf("image") == 0) {
                    var reader = new FileReader();
                    reader.readAsDataURL(file);
                    reader.onload = function (e) {
                        // 图片base64化
                        newUrl = this.result;
                        preview[count].style.backgroundImage = "url("+newUrl+")";
                    };
                }
            }
        }
    });
    fullGoodsPic();
</script>
</body>
</html>