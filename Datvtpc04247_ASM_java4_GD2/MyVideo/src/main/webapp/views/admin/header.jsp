<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="url" value="/"></c:url>
<header class="background-header">
	<nav class="navbar navbar-expand-lg">
		<div class="container">
			<a class="navbar-brand" href="${url}/home">
				<h2>MyVideo Administrator</h2>
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a
						class="nav-link ${currentPageAdmin == '/home' ? 'active' : ''}"
						href="${url}home">Trang chủ </a></li>
					<li class="nav-item"><a
						class="nav-link ${currentPageAdmin == '/video' ? 'active' : ''}"
						href="${url}admin/user">Quản lý người dùng</a></li>
					<li class="nav-item"><a
						class="nav-link ${currentPageAdmin == '/video' ? 'active' : ''}"
						href="${url}admin/video">Quản lý video</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> tài khoản </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="${url}account/edit-profile">Thông tin</a> <a
								class="dropdown-item" href="${url}account/sign-out">Đăng xuất</a>
						</div></li>
				</ul>
			</div>
		</div>
	</nav>
</header>