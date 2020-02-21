<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tbody>
			<tr>
				<td>时间</td>
			</tr>
		</tbody>
	</table>
	<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
	<script>
	
	var date = new Date();

	var year = date.getFullYear();

	var month = date.getMonth()+1;
	var day = date.getDate();
	var hour = date.getHours();
	var minute = date.getMinutes();
	var second = date.getSeconds();
	alert(year+"-"+month+"-"+day+"-"+hour+":"+minute+":"+second);
	
	
	</script>
</body>
</html>