<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加图书</title>
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
						<div class="navbar-text navbar-right" id="timeShow" align="center"></div>
					</div>
				</div>
			</nav>
	
			<div class="row">
				<div class="col-md-3">
					<div class="list-group">
						<a href="<%=path%>" class="list-group-item"> 首页 </a> <a
							href="<%=path%>/bookInfoSave" class="list-group-item active">添加图书</a>
						<a href="<%=path%>/bookInfoList" class="list-group-item">图书列表</a>
					</div>
				</div>
				
				<div class="col-md-9">
					<form action="<%=path%>/bookInfoSave" method="post">
						<div class="form-group">
							<label>序号</label> <input type="number" name="id"
								class="form-control" placeholder="请输入序号">
						</div>
						<div class="form-group">
							<label>ISBN号码</label> <input type="text" name="bookISBN"
								class="form-control" placeholder="请输入图书的ISBN号码">
						</div>
						<div class="form-group">
							<label>书名</label> <input type="text" name="bookName"
								class="form-control" placeholder="请输入书名">
						</div>
						<div class="form-group">
							<label>作者</label> <input type="text" name="author"
								class="form-control" placeholder="请输入作者姓名">
						</div>
						<div class="form-group">
							<label>价格</label> <input type="text" name="price"
								class="form-control" placeholder="请输入价格">
						</div>
						<div class="form-group">
							<label>图书类型编号</label> <input type="number" name="typeId"
								class="form-control" placeholder="请输入图书类型编号">
						</div>
						<div class="form-group">
							<label>出版社</label> <input type="text" name="publisher"
								class="form-control" placeholder="请输入出版社">
						</div>
						
						<p align="center">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target=".bs-example-modal-sm">保存</button>
							<button type="reset" class="btn btn-danger">重置</button>
						</p>
						
						<div class="modal fade bs-example-modal-sm" tabindex="-1"
								role="dialog" aria-labelledby="mySmallModalLabel">
								<div class="modal-dialog modal-sm" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<h4 class="modal-title" id="myModalLabel">确认框</h4>
										</div>
										<div class="modal-body">您确认要保存此信息?</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">放弃</button>
											<button type="submit" class="btn btn-primary">确认</button>
										</div>
									</div>
								</div>
							</div>	
					</form>
				</div>
			</div>
		</div>
	</body>
</html>