<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<%@include file="Component/MainCSS.jsp"%>

<head>
<title>Đăng ký</title>
<body>

	<div class="row mt-5">
		<div class="col-md-4 offset-md-4">
			<div class="card">
				<div class="card-body">
					<h3 class="text-center">Đăng kí</h3>
					<form class="login-container row g-3"
						action="taikhoanController?action=dangky" method="post">
						<div class="form-group">
							<label for="username" class="form-label">Tên đăng nhập</label> <input
								type="text" class="form-control" id="username" name="username"
								placeholder="Nhập tài khoản" required>
						</div>
						<div class="form-group">
							<label for="password" class="form-label">Mật khẩu</label> <input
								type="password" class="form-control" id="password"
								name="password" placeholder="Nhập mật khẩu">
						</div>
						<div class="form-group">
							<label for="hoten" class="form-label">Mật khẩu</label> <input
								type="text" class="form-control" id="hoten" name="hoten"
								placeholder="Nhập họ và tên">
						</div>
						<div class="form-group">
							<label for="ngaysinh" class="form-label">Mật khẩu</label> <input
								type="date" class="form-control" id="ngaysinh" name="ngaysinh">
						</div>

						<div class="row g-2 text-center">
							<div class="col d-flex justify-content-end align-items-center ">
								<button type="submit" class="btn btn-primary ">Đăng kí</button>
							</div>


							<div class="col  d-flex justify-content-start align-items-center">
								<button type="reset" class="btn btn-primary ">Reset</button>
							</div>

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
