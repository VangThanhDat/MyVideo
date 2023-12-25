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
<div class="page-heading products-heading header-text">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="text-content">
					<h2>My Video</h2>
					<h4>Nơi tìm kiếm niềm vui</h4>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- banner -->

<!-- main -->
<div class="products">
	<div class="container-fluid">
		<form class="row justify-content-center mb-5">
			<div class="col-md-4 offset-3">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Tìm video">
				</div>
			</div>
			<div class="col-3">
				<button type="submit" class="btn btn-primary">Tìm kiếm</button>
			</div>
		</form>

		<div class="container filters"></div>

		<div class="container">
			<div class="row" style="margin: 10px 0 50px 0;">
				<div class="col-md-12">
					<div class="row">
						<c:forEach var="video" items="${videos}">
							<form action="${url}" method="post">
								<div class="card p-leftright col-md-3 mx-3 mb-5"
									style="height: 50px !important;">
									<a href="<c:url value='/detail?v=${video.id}'/>">
										<img class="card-img-top"
										src="https://i3.ytimg.com/vi/${video.id}/maxresdefault.jpg"
										alt="Error" style="border: 1px solid black;">
										<div class="card-body">
											<h5 class="card-title">${video.title}</h5>
										</div>
										<p class="card-footer">
											<i class="fa fa-eye">${video.views}</i>
										</p>
									</a>
								</div>
							</form>
						</c:forEach>
					</div>
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