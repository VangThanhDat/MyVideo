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
					<h2>Về Chúng tôi</h2>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="best-features about-features">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section-heading">
					<h2>Our Background</h2>
				</div>
			</div>
			<div class="col-md-12">
				<div class="">
					<h4>Chúng tôi là ai? &amp; Chúng tôi là gì?</h4>
					<p>
						Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed
						voluptate nihil eum consectetur similique? Consectetur, quod,
						incidunt, harum nisi dolores delectus reprehenderit voluptatem
						perferendis dicta dolorem non blanditiis ex fugiat. <br>
						Lorem ipsum dolor sit amet, consectetur adipisicing elit.Lorem
						ipsum dolor sit amet, consectetur adipisicing elit. Et,
						consequuntur, modi mollitia corporis ipsa voluptate corrupti eum
						ratione ex ea praesentium quibusdam? Aut, in eum facere corrupti
						necessitatibus perspiciatis quis. <br> <br> Lorem ipsum
						dolor sit amet consectetur adipisicing elit. Suscipit quidem
						eveniet quam nihil error sequi. Labore, provident? Ducimus
						repudiandae vel maiores, fuga exercitationem quod nulla omnis, ab
						adipisci corporis veniam. Aspernatur officia incidunt molestiae?
						Repudiandae adipisci quod, pariatur fugit porro veritatis minus
						aperiam quas dolore ipsum ut corrupti commodi natus! Fugiat
						tempora cupiditate distinctio temporibus laboriosam? Repellendus
						autem quibusdam quo?
					</p>
					<h4>Thông tin liên hệ</h4>
					<ul class="social-icons">
						<li><a href="#"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="team-members">
	<div class="container">
		<div class="col-md-12">
			<div class="section-heading">
				<h2>Thành viên tạo nên trang web này</h2>
			</div>
		</div>
		<div class="row justify-content-around">
			<div class="col-md-4">
				<div class="team-member">
					<div class="thumb-container p-5">
						<img src="/style/images/dat.jpg" alt="" width="" height="200px">
						<div class="hover-effect">
							<div class="hover-content">
								<ul class="social-icons">
									<li><a href="#"><i class="fa fa-facebook"></i></a></li>
									<li><a href="#"><i class="fa fa-twitter"></i></a></li>
									<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="down-content">
						<h4>Vạng Thành Đạt</h4>
						<span>Developer</span>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing itaque
							corporis nulla.</p>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>

<div class="services">
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="service-item">
					<div class="icon">
						<i class="fa fa fa-gear"></i>
					</div>
					<div class="down-content">
						<h4>Xem phim online</h4>
						<p>Lorem ipsum dolor sit amet, consectetur an adipisicing
							elit. Itaque, corporis nulla at quia quaerat.</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="service-item">
					<div class="icon">
						<i class="fa fa-gear"></i>
					</div>
					<div class="down-content">
						<h4>Trang giải trí</h4>
						<p>Lorem ipsum dolor sit amet, consectetur an adipisicing
							elit. Itaque, corporis nulla at quia quaerat.</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="service-item">
					<div class="icon">
						<i class="fa fa-gear"></i>
					</div>
					<div class="down-content">
						<h4>Hoàn toàn free</h4>
						<p>Lorem ipsum dolor sit amet, consectetur an adipisicing
							elit. Itaque, corporis nulla at quia quaerat.</p>
					</div>
				</div>
			</div>
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