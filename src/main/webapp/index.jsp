<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="Component/MainCSS.jsp"%>
</head>
<body>
	<div class="row">
		<div class="col-md-4 offset-md-4">
			<div class="card">
				<div class="card-body">
					<form class="row g-3">
						<div class>
							<label for="inputAddress" class="form-label">Address</label> <input
								type="text" class="form-control" id="inputAddress"
								placeholder="1234 Main St">
						</div>
						<div class>
							<label for="inputAddress2" class="form-label">Address 2</label> <input
								type="text" class="form-control" id="inputAddress2"
								placeholder="Apartment, studio, or floor">
						</div>
						<div class="text-center">
							<button type="submit" class="btn btn-primary">Sign in</button><br>
							<a href = "DangKy.jsp">Đăng kí tài khoản</a>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>