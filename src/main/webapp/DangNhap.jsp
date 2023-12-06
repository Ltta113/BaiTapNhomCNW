<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<%@include file="Component/MainCSS.jsp"%>
<head>
<title>Đăng nhập</title>

</head>

<body>

	<div class="row mt-5">
		<div class="col-md-4 offset-md-4">
			<div class="card">
				<div class="card-body">
					<h3 class="text-center">Đăng nhập</h3>
					<form class="login-container row g-3"
						action="taikhoanController?action=dangnhap" method="post">
						<div class="form-group">
							<label for="username" class="form-label">Tên đăng nhập</label> <input
								type="text" class="form-control" id="username" name="username"
								placeholder="Nhập tài khoản" required>
						</div>
						<div class="form-group">
							<label for="password" class="form-label">Mật khẩu</label> <input
								type="password" class="form-control" id="password" name="password"
								placeholder="Nhập mật khẩu">
						</div>
						<div class="text-center">
							<button type="submit" class="btn btn-primary">Sign in</button>
							<br> <a href="DangKy.jsp">Đăng kí tài khoản</a>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>


	<p>
		<a href="javascript:history.back()">Back</a>
	</p>
</body>

</html>
