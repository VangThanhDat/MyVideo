<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<link rel="shortcut icon" href="../views/style/images/play-alt.svg"
	type="image/x-icon">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Bootstrap core CSS -->
<link href="../views/bootstrap4-3/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">

<!-- Style CSS Files -->
<link rel="stylesheet" href="../views/style/css/fontawesome.css"
	type="text/css">
<link rel="stylesheet" href="../views/style/css/style.css"
	type="text/css">
<link rel="stylesheet" href="../views/style/css/owl.css" type="text/css">
<c:url var="root" value="/"></c:url>
<c:url var="url" value="/account"></c:url>
<!-- banner -->
<div class="page-heading products-heading header-text">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="text-content">
					<h2>Thông tin tài khoản</h2>
					<h4>Chỉnh sửa thông tin tài khoản của bạn tại đây</h4>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- banner -->

<!-- main -->
<div class="products">
	<div class="container">
		<div class="row justify-content-center">
			<h5>Trang thông tin</h5>
			<div class="container">
				<div class="row d-flex justify-content-center align-items-center"
					style="min-height: 100vh">
					<form action="${url}/account" method="POST" class="col-md-6">
						<h1 class="col-md-12 text-center mb-3">Cập nhật thông tin tài
							khoản</h1>
						<c:if test="${not empty message}">
							<div class="alert alert-info text-center" role="alert">${message}</div>
						</c:if>

						<div class="mb-3">
							<label class="form-label">Tên tài khoản</label> <input
								type="text" name="id" class="form-control" value="${user.id}"
								readonly required>
						</div>
						<div class="mb-3">
							<label class="form-label">Mật khẩu</label> <input type="password"
								name="password" class="form-control" value="${user.password}"
								required>
						</div>
						<div class="mb-3">
							<label class="form-label">Họ tên đầy đủ</label> <input
								type="text" name="fullname" class="form-control"
								value="${user.fullname}" required>
						</div>
						<div class="mb-3">
							<label class="form-label">Email</label> <input type="text"
								name="email" class="form-control" value="${user.email}" required>
						</div>

						<div class="mb-3">
							<button class="btn btn-primary col-md-12"
								formaction="${url}/edit-profile">Save</button>
							<div class="col-md-12 text-center mt-2">
								<a href="${root}home" style="text-decoration: none">Quay lại
									trang chủ</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- main -->

<!-- Bootstrap core JavaScript -->
<script src="../views/bootstrap4-3/jquery/jquery.min.js"></script>
<script src="../views/bootstrap4-3/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Style Scripts -->
<script src="../views/style/js/custom.js"></script>
<script src="../views/style/js/owl.js"></script>
<script src="../views/style/js/slick.js"></script>
<script src="../views/style/js/isotope.js"></script>
<script src="../views/style/js/accordions.js"></script>

<script type="text/Javascript">
	cleared[0] = cleared[1] = cleared[2] = 0;
	function clearField(t) {
		if (!cleared[t.id]) {
			cleared[t.id] = 1;
			t.value = '';
			t.style.color = '#fff';
		}
	}
</script>
</html>