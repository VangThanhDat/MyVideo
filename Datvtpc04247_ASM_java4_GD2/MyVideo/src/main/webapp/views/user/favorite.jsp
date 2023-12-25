<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<c:url var="url" value="/"></c:url>
<div class="page-heading products-heading header-text">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="text-content">
					<h2>Video đã thích</h2>
					<h4>Nơi tìm lại niềm vui</h4>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="products">
	<div class="container">
		<div class="row" style="margin: 10px 0 50px 0;">
			<div class="col-md-12">
				<div class="row">
					<c:if test="${videos == null}">
						<h1>Không tìm thấy video nào được thích</h1>
					</c:if>
					<c:forEach var="video" items="${videos}">


						<div class="card p-leftright col-md-3 mx-3 mb-5"
							style="height: 50px !important;">
							<a href="<c:url value='/detail?v=${video.id}'/>"> <img class="card-img-top"
								src="https://i3.ytimg.com/vi/${video.id }/maxresdefault.jpg"
								alt="Error" style="border: 1px solid black;">
								<div class="card-body">
									<h5 class="card-title">${video.title}</h5>
								</div>
								<p class="card-footer">
									<i class="fa fa-eye">${video.views}</i>
								</p>
							</a>
						</div>

					</c:forEach>

				</div>
			</div>
		</div>
	</div>

</div>
</html>