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



<div class="page-heading products-heading header-text">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="text-content">
					<h2>Đăng ký</h2>
					<h4>Chào mừng bạn đến với website</h4>
				</div>
			</div>
		</div>
	</div>
</div>



<c:url var="url" value="/account"></c:url>
<!-- main -->
<div class="products">
	<div class="container">
		<div class="row justify-content-center">

			<form action="${url}/account" method="POST" class="col-md-6 p-5"
				style="border: 1px solid rgba(133, 129, 129, 0.51); border-radius: 5%;">
				<div class="form-group">
					<label><strong>Tên đăng nhập:</strong></label> <input type="text"
						class="form-control" name="id" required>
				</div>
				<div class="form-group">
					<label><Strong>Mật khẩu:</Strong></label> <input type="password"
						class="form-control" name="password" required>
				</div>
				<div class="form-group">
					<label><Strong>Email:</Strong></label> <input type="email"
						class="form-control" required name="email">
				</div>
				<div class="form-group">
					<label><Strong>Họ tên người dùng:</Strong></label> <input
						type="text" class="form-control" name="fullname" required>
				</div>
				<div class="form-group mt-3">
					<label>Đã có tài khoản?</label><a href="${url}/login"> Đăng
						nhâp</a>
				</div>
				<hr class="my-5">
				<div class="row justify-content-around">
					<div class="form-group">
						<button type="submit" class="btn btn-primary" formaction="${url}/register">Đăng ký</button>
					</div>
				</div>

			</form>
		</div>
	</div>

</div>

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