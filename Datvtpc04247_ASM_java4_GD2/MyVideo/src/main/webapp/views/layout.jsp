<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Đây là trang xem video online">
<meta name="author" content="Datvtpc04247">
<link rel="shortcut icon" href="views/style/images/play-alt.svg"
	type="image/x-icon" >
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">
<title>MyVideo</title>

<!-- Bootstrap core CSS -->
<link href="views/bootstrap4-3/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">

<!-- Style CSS Files -->
<link rel="stylesheet" href="views/style/css/fontawesome.css" type="text/css">
<link rel="stylesheet" href="views/style/css/style.css" type="text/css">
<link rel="stylesheet" href="views/style/css/owl.css" type="text/css">
<c:url var="url" value="/"></c:url>
</head>
<body>
	<jsp:include page="${mainView}"></jsp:include>

	<!-- Bootstrap core JavaScript -->
	<script src="views/bootstrap4-3/jquery/jquery.min.js"></script>
	<script src="views/bootstrap4-3/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Style Scripts -->
	<script src="views/style/js/custom.js"></script>
	<script src="views/style/js/owl.js"></script>
	<script src="views/style/js/slick.js"></script>
	<script src="views/style/js/isotope.js"></script>
	<script src="views/style/js/accordions.js"></script>

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

</body>
</html>