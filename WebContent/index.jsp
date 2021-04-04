<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首页</title>
<link rel="stylesheet"
	href="<%=path%>/lib/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<script type="text/javascript" src="<%=path%>/lib/jquery-3.5.1.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/lib/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
	var t = setTimeout(time, 1000);
	function time() {
		clearTimeout(t);
		var dt = new Date();
		var y = dt.getYear() + 1900;
		var mm = dt.getMonth() + 1;
		var d = dt.getDate();
		var weekday = [ "周日", "周一", "周二", "周三", "周四", "周五", "周六" ];
		var day = dt.getDay();
		var h = dt.getHours();
		var m = dt.getMinutes();
		var s = dt.getSeconds();
		if (h < 10)
			h = "0" + h;
		if (m < 10)
			m = "0" + m;
		if (s < 10)
			s = "0" + s;
		document.getElementById("timeShow").innerHTML = y + "-" + mm + "-" + d
				+ " " + h + ":" + m + ":" + s + " " + weekday[day];
		t = setTimeout(time, 1000);
	}
</script>
</head>

<body>
	<div class="container">
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="<%=path%>">图书管理系统</a>
				</div>

				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<div class="navbar-text navbar-right" id="timeShow"></div>
				</div>
			</div>
		</nav>

		<div class="row">
			<div class="col-md-3">
				<div class="list-group">
					<a href="<%=path%>" class="list-group-item active"> 首页 </a> <a
						href="<%=path%>/bookInfoSave" class="list-group-item">添加图书</a> <a
						href="<%=path%>/bookInfoList" class="list-group-item">图书列表</a>
				</div>
			</div>
			<div class="col-md-9">
				<div class="jumbotron">
					<h1>图书管理系统</h1>
					<p>
						<a style="color: black" href="https://github.com/KIJOONGA/bookinfo_manage">by KIJOONGA</a>
					</p>
					<p>
						<a class="btn btn-primary btn-lg" href="<%=path%>/bookInfoList" role="button">管理图书</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>