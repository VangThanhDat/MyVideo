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
<div class="page-heading products-heading header-text"
	style="background-color: white;">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="text-content"></div>
			</div>
		</div>
	</div>
</div>
<div class="watch"
	style="z-index: 99999; margin-top: -100px !important; min-height: 500px !important;">
	<div class="container">
		<div class="row">
			<article class="col-md-9">
				<div class="row col-md-12">
					<iframe width="100%" style="height: 500px !important;"
						src="https://www.youtube.com/embed/${video.id}" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
						allowfullscreen></iframe>
				</div>

				<div class="row">
					<div class="col-md-12">
						<div class="card1 mt-3" style="border: 1px snow solid !important;">
							<div class="card-body1">
								<h5 class="card-title1">${video.title}</h5>
								<p class="card-text">${video.description}</p>
								<form method="post" class="row mt-4" action="${url }">
									<p class="col-md-4">
										<i class="fa fa-eye"></i> &nbsp;&nbsp; ${video.views}
									</p>
									<div class="p-3 offset-3">
										<button class="btn btn-primary m-auto">Thích</button>
										<button class="btn btn-primary m-auto">Chia sẽ</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</article>

			<aside class="col-md-3">
				<c:forEach var="video" items="${videos}">
					<div class="card1 mb-3">
						<a href="${url}detail?v=${video.id}"> <img
							src="${video.poster}"
							class="card-img-top" width="100%" alt="">
							<div class="card-body p-3">
								<h5 class="card-title">${video.title}</h5>
							</div>
						</a>
						<div class="card-footer">
							<p>
								<i class="fa fa-eye"></i>${video.views}
							</p>
						</div>
					</div>
				</c:forEach>

			</aside>
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