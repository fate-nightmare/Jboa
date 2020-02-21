<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
<meta charset="utf-8">
<base href="/Jboa/">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no">
<link rel="stylesheet" href="css/login.css">
<title>北大青鸟办公自动化管理系统-登录</title>
<body>
	<div class="img_1">
		<img src="images/login_01.gif">
	</div>
	<div class="img_2">
		<img src="images/login_02.gif">
		<form action="/Jboa/login" method="post" class="formpadd">
			<table>
				<tbody><tr>
					<td>工&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</td>
					<td><input type="text" name="employeeId"></td>
					<td><span class="sp1"></span></td>
				</tr>
				<tr>
					<td>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</td>
					<td><input type="password" name="password"></td>
					<td><span class="sp2"></span></td>
				</tr>
				<tr>
					<td>验证码:</td>
					<td><input type="text" name="verification"></td>
					<td><span class="sp3"></span></td>
				</tr>
				<tr>
					<td colspan="2" style="padding-top: 3px;"><span id="verify"></span>
						<canvas width="100" height="40" id="verifyCanvas" style="display: none;"></canvas> <img id="code_img" src="data:image/png;base64,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"> 
						<input type="image" src="images/login_sub.gif" style="position:relative;top:5px;left:20px;" onclick="yanzhen()"></td>
				</tr>
			</tbody></table>
		</form>
	</div>
	<div class="img_3">
		<img src="images/copyright.gif">
	</div>

<script src="js/jquery-1.12.4.js"></script>
<script>
	  var nums = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
    'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x',
    'y', 'z'];
	var yanzm="";
    drawCode();
    
    // 绘制验证码
    function drawCode() {
        var canvas = document.getElementById("verifyCanvas");  //获取HTML端画布
        var context = canvas.getContext("2d");                 //获取画布2D上下文
        context.fillStyle = "cornflowerblue";                  //画布填充色
        context.fillRect(0, 0, canvas.width, canvas.height);   //清空画布
        context.fillStyle = "white";                           //设置字体颜色
        context.font = "25px Arial";                           //设置字体
        var rand = new Array();
        var x = new Array();
        var y = new Array();
        yanzm="";
        for (var i = 0; i < 5; i++) {
            rand[i] = nums[Math.floor(Math.random() * nums.length)]
            x[i] = i * 16 + 10;
            y[i] = Math.random() * 20 + 20;
            context.fillText(rand[i], x[i], y[i]);
            yanzm+=rand[i];
        }
        //画3条随机线
        for (var i = 0; i < 3; i++) {
            drawline(canvas, context);
        }

        // 画30个随机点
        for (var i = 0; i < 30; i++) {
            drawDot(canvas, context);
        }
        convertCanvasToImage(canvas)
    }
	
    // 随机线
    function drawline(canvas, context) {
        context.moveTo(Math.floor(Math.random() * canvas.width), Math.floor(Math.random() * canvas.height));             //随机线的起点x坐标是画布x坐标0位置，y坐标是画布高度的随机数
        context.lineTo(Math.floor(Math.random() * canvas.width), Math.floor(Math.random() * canvas.height));  //随机线的终点x坐标是画布宽度，y坐标是画布高度的随机数
        context.lineWidth = 0.5;                                                  //随机线宽
        context.strokeStyle = 'rgba(50,50,50,0.3)';                               //随机线描边属性
        context.stroke();                                                         //描边，即起点描到终点
    }
    // 随机点(所谓画点其实就是画1px像素的线，方法不再赘述)
    function drawDot(canvas, context) {
        var px = Math.floor(Math.random() * canvas.width);
        var py = Math.floor(Math.random() * canvas.height);
        context.moveTo(px, py);
        context.lineTo(px + 1, py + 1);
        context.lineWidth = 0.2;
        context.stroke();
    }
    // 绘制图片
    function convertCanvasToImage(canvas) {
        document.getElementById("verifyCanvas").style.display = "none";
        var image = document.getElementById("code_img");
        image.src = canvas.toDataURL("image/png");
        return image;
    }

    // 点击图片刷新
    document.getElementById('code_img').onclick = function () {
        $('#verifyCanvas').remove();
        $('#verify').after('<canvas width="100" height="40" id="verifyCanvas"></canvas>')
        drawCode();
    }
	$(function(){
		
		$(".formpadd").submit(function(){
			var userNumber = $("[name=jobNumber]").val();
			var userPwd = $("[name=password]").val();
			var verification = $("[name=verification]").val();
			
			if(userNumber == ""){
				$(".sp2").text("");
				$(".sp3").text("");
				$(".sp1").css({"font-size":"10px","color":"red"});
				$(".sp1").text("工号不能为空！");
				return false;
			}else if(userPwd == ""){
				$(".sp1").text("");
				$(".sp3").text("");
				$(".sp2").css({"font-size":"10px","color":"red"});
				$(".sp2").text("密码不能为空！");
				return false;
			}else if(verification == ""){
				$(".sp1").text("");
				$(".sp2").text("");
				$(".sp3").css({"font-size":"10px","color":"red"});
				$(".sp3").text("验证码不能为空！");
				return false;
			}else if(verification.toLowerCase()!=yanzm.toLowerCase()){
				$(".sp1").text("");
				$(".sp2").text("");
				$(".sp3").css({"font-size":"10px","color":"red"});
				$(".sp3").text("验证码错误！");
				$('#verifyCanvas').remove();
		        $('#verify').after('<canvas width="100" height="40" id="verifyCanvas"></canvas>')
		        drawCode();
				return false;
			} 
			return true;
		});
	});
</script>

</body>
</html>
