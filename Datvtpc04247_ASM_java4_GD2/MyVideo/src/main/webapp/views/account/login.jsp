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

<c:url var="url" value="/"></c:url>

<!-- banner -->
<div class="page-heading products-heading header-text">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="text-content">
					<h2>Đăng nhập</h2>
					<h4>Chào mừng bạn đã quay lại</h4>
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
			<form action="${url}account" method="POST" class="col-md-6 p-5"
				style="border: 1px solid rgba(133, 129, 129, 0.51); border-radius: 5%;">
				<c:if test="${not empty message}">
					<div class="alert alert-info text-center" role="alert">${message}</div>
				</c:if>
				<div class="form-group">
					<label><strong>Tài khoản:</strong></label> <input type="text"
						class="form-control" placeholder="Nhập tài khoản ở đây"
						name="id" required value="${username}">
				</div>
				<div class="form-group">
					<label><Strong>Mật khẩu:</Strong></label> <input type="password"
						class="form-control" placeholder="Nhập mật khẩu ở đây"
						name="password" required value="${password}">
				</div>
				<div class="form-group form-check">
					<input type="checkbox" class="form-check-input" id="exampleCheck1"
						name="remember"> <label class="form-check-label"
						for="exampleCheck1">Ghi nhớ đăng nhập</label>
				</div>
				<div class="form-group mt-3">
					<a href="${url}account/forgotpass">Quên mật khẩu!</a>
				</div>
				<hr class="my-5">
				<div class="row justify-content-around">
					<div class="form-group">
						<button type="submit" class="btn btn-success"
							formaction="${url}account/login">Đăng nhập</button>
						<a href="${url}account/register" class="btn btn-info">Đăng ký</a>
					</div>
				</div>
			</form>
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