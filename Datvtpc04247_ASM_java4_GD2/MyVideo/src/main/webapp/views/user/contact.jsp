<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<h2>Liên hệ</h2>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="find-us">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section-heading">
					<h2>Địa chỉ map</h2>
				</div>
			</div>
			<div class="col-md-8">
				<div id="map">
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d6560.905763382032!2d105.75920392734903!3d9.983188335067544!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2s!4v1689983451476!5m2!1sen!2s"
						width="100%" height="330px" frameborder="0" style="border: 0"
						allowfullscreen></iframe>
				</div>
			</div>
			<div class="col-md-4">
				<div class="left-content">
					<h4>Địa điểm của chúng tôi</h4>
					<p>
						Lorem ipsum dolor sit amet, consectetur adipisic elit. Sed
						voluptate nihil eumester consectetur similiqu consectetur.<br>
						<br>Lorem ipsum dolor sit amet, consectetur adipisic elit.
						Et, consequuntur, modi mollitia corporis ipsa voluptate corrupti.
					</p>
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

<div class="send-message">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section-heading">
					<h2>Nhắn tin liên hệ</h2>
				</div>
			</div>
			<div class="col-md-8">
				<div class="contact-form">
					<form id="contact">
						<div class="row">
							<div class="col-lg-12 col-md-12 col-sm-12">
								<fieldset>
									<input type="text" class="form-control" placeholder="Họ tên">
								</fieldset>
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12">
								<fieldset>
									<input type="text" class="form-control"
										placeholder="Địa chỉ mail">
								</fieldset>
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12">
								<fieldset>
									<input type="text" class="form-control" placeholder="Tiêu đề">
								</fieldset>
							</div>
							<div class="col-lg-12">
								<fieldset>
									<textarea rows="6" class="form-control"
										placeholder="Nội dung tin nhắn"></textarea>
								</fieldset>
							</div>
							<div class="col-lg-12">
								<fieldset>
									<button type="submit" class="filled-button">Gửi mail</button>
								</fieldset>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="col-md-4">
				<ul class="accordion">
					<li><a>Accordion Title One</a>
						<div class="content">
							<p>
								Lorem ipsum dolor sit amet, consectetur adipisic elit. Sed
								voluptate nihil eumester consectetur similiqu consectetur.<br>
								<br>Lorem ipsum dolor sit amet, consectetur adipisic elit.
								Et, consequuntur, modi mollitia corporis ipsa voluptate corrupti
								elite.
							</p>
						</div></li>
					<li><a>Second Title Here</a>
						<div class="content">
							<p>
								Lorem ipsum dolor sit amet, consectetur adipisic elit. Sed
								voluptate nihil eumester consectetur similiqu consectetur.<br>
								<br>Lorem ipsum dolor sit amet, consectetur adipisic elit.
								Et, consequuntur, modi mollitia corporis ipsa voluptate corrupti
								elite.
							</p>
						</div></li>
					<li><a>Accordion Title Three</a>
						<div class="content">
							<p>
								Lorem ipsum dolor sit amet, consectetur adipisic elit. Sed
								voluptate nihil eumester consectetur similiqu consectetur.<br>
								<br>Lorem ipsum dolor sit amet, consectetur adipisic elit.
								Et, consequuntur, modi mollitia corporis ipsa voluptate corrupti
								elite.
							</p>
						</div></li>
					<li><a>Fourth Accordion Title</a>
						<div class="content">
							<p>
								Lorem ipsum dolor sit amet, consectetur adipisic elit. Sed
								voluptate nihil eumester consectetur similiqu consectetur.<br>
								<br>Lorem ipsum dolor sit amet, consectetur adipisic elit.
								Et, consequuntur, modi mollitia corporis ipsa voluptate corrupti
								elite.
							</p>
						</div></li>
				</ul>
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