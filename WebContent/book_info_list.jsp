<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书列表</title>
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
	
	function del(action) {
		document.form.action = action;
		$("#SmallModal").modal("show");
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
						<span class="sr-only"></span> <span
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
						href="<%=path%>/bookInfoSave" class="list-group-item">添加图书</a> <a
						href="<%=path%>/bookInfoList" class="list-group-item active">图书列表</a>
				</div>
			</div>
			<div class="col-md-9">
				<form name="form" method="post"> 
					<table class="table">
						<thead>
							<tr>
								<th>序号</th>
								<th>ISBN号码</th>
								<th>书名</th>
								<th>作者</th>
								<th>价格</th>
								<th>图书类型编号</th>
								<th>出版社</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${bookInfoList }" var="entity"
								varStatus="status">
								<tr>
									<td>${entity.id }</td>
									<!--status.index + 1-->
									<td>${entity.bookISBN }</td>
									<td>${entity.bookName }</td>
									<td>${entity.author }</td>
									<td>${entity.price }</td>
									<td>${entity.typeId }</td>
									<td>${entity.publisher }</td>
									<td><a href="<%=path %>/bookInfoUpdate?id=${entity.id }">更新</a>
										<a style="color: black">┆</a>
										<a style="color: red" id="delete" onclick="del('<%=path %>/bookInfoDelete?id=${entity.id }')">删除</a>
										<div class="modal fade bs-example-modal-sm" tabindex="-1"
										role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="SmallModal">
											<div class="modal-dialog modal-sm" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
														<h4 class="modal-title" id="myModalLabel">确认框</h4>
													</div>
													<div class="modal-body">您确认要删除此信息?</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default"
															data-dismiss="modal">放弃</button>
														<button type="submit" class="btn btn-primary">确认</button>
													</div>
												</div>
											</div>
										</div>
									</td>
								</tr>
							</c:forEach>	
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
