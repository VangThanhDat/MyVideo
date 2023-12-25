<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="url" value="/"></c:url>

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

<header class="background-header">
	<nav class="navbar navbar-expand-lg">
		<div class="container">
			<a class="navbar-brand" href="${url}home">
				<h2>MyVideo</h2>
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a
						class="nav-link ${currentPage == '/home' ? 'active' : ''}"
						href="${url }home">Trang chủ <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a
						class="nav-link ${currentPage == '/about' ? 'active' : ''}"
						href="${url }about">Giới thiệu</a></li>
					<li class="nav-item"><a
						class="nav-link ${currentPage == '/contact' ? 'active' : ''}"
						href="${url }contact">Liên hệ</a></li>
					<c:if test="${not empty sessionScope.user}">
						<li class="nav-item"><a
							class="nav-link ${currentPage == '/favorite' ? 'active' : ''}"
							href="${url }favorite">Yêu thích</a></li>
					</c:if>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">${fullname}</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<c:if test="${empty sessionScope.user}">
								<li><a class="dropdown-item" href="${url}account/login">Đăng
										nhập</a></li>
								<li><a class="dropdown-item" href="${url}account/register">Đăng
										ký</a></li>
								<li><a class="dropdown-item"
									href="${url}account/forgotpass">Quên mật khẩu</a></li>
							</c:if>
							<c:if test="${not empty sessionScope.user}">
								<li><a class="dropdown-item"
									href="${url}account/edit-profile">Thông tin tài khoản</a></li>
								<c:if test="${sessionScope.user.admin}">
									<li><a class="dropdown-item" href="${url}admin/home">Trang
											quản trị</a></li>
								</c:if>
								<li><a class="dropdown-item" href="${url}account/sign-out">Đăng
										xuất</a></li>
							</c:if>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
</header>

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