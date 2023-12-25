<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<c:url var="url" value="/admin/video"></c:url>
<!-- banner -->
<div class="page-heading products-heading header-text">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="text-content">
					<h2>Quản lý video</h2>
					<h4>Chỉnh sửa thông tin video của bạn tại đây</h4>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- banner -->

<!-- main -->
<div class="products">
	<div class="container">
		<div class="container">
			<div class="row justify-content-center">
				<c:url var="url" value="/admin/video"></c:url>
				<div class="container mt-4 mb-4">
					<div class="row d-flex justify-content-center align-items-center">
						<form action="${url}/index" method="post" class="col-md-6">
							<c:choose>
								<c:when test="${status}">
									<div class="mb-3">
										<label class="form-label">Tên tài khoản</label> <input
											type="text" name="id" value="${form.id}" class="form-control"
											readonly required>
									</div>
								</c:when>
								<c:otherwise>
									<div class="mb-3">
										<label class="form-label">Mã video</label> <input type="text"
											name="id" value="${form.id}" class="form-control" required>
									</div>
								</c:otherwise>
							</c:choose>

							<div class="mb-3">
								<label class="form-label">Tiêu đề</label> <input type="text"
									name="title" value="${form.title}" class="form-control"
									required>
							</div>
							<div class="mb-3">
								<label class="form-label">Link hình ảnh</label> <input
									type="text" name="poster" value="${form.poster}"
									class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Lượt xem</label> <input type="text"
									name="views" value="${form.views}" class="form-control"
									required>
							</div>
							<div class="mb-3">
								<label class="form-label">Mô tả</label> <input type="text"
									name="description" value="${form.description}"
									class="form-control" required>
							</div>
							<div class="mb-3">
								<div class="form-check form-check-inline">
									<input class="form-check-input" ${form.active?'checked':""}
										type="radio" name="active" id="inlineRadio1" value="true">
									<label class="form-check-label" for="inlineRadio1">Hoạt
										động</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" ${form.active?"":'checked'}
										type="radio" name="active" id="inlineRadio2" value="false">
									<label class="form-check-label" for="inlineRadio2">Không
										hoạt động</label>
								</div>
							</div>
							<hr>
							<div class="mb-3">
								<c:choose>
									<c:when test="${status}">
										<button class="btn btn-primary" formaction="${url}/create"
											disabled>Create</button>
										<button class="btn btn-success" formaction="${url}/update">Update</button>
										<button class="btn btn-danger" formaction="${url}/delete">Delete</button>
										<button class="btn btn-warning" type="button"
											onclick="window.location.href='${url}/index'">Reset</button>
									</c:when>
									<c:otherwise>
										<button class="btn btn-primary" formaction="${url}/create">Create</button>
										<button class="btn btn-success" formaction="${url}/update"
											disabled>Update</button>
										<button class="btn btn-danger" formaction="${url}/delete"
											disabled>Delete</button>
										<button class="btn btn-warning" type="button"
											onclick="window.location.href='${url}/index'">Reset</button>
									</c:otherwise>
								</c:choose>

							</div>
							<hr>
							<c:if test="${not empty message}">
								<div class="alert alert-info text-center" role="alert">${message}</div>
							</c:if>

							<hr>
							<h1 class="text-center">List User</h1>
						</form>
					</div>
				</div>
				<div class="col-md-12 col-sm-12">
					<table class="table table-bordered table-hover">
						<thead>
							<tr class="table-info">
								<th>Id</th>
								<th>Title</th>
								<th>Poster</th>
								<th>View</th>
								<th>Description</th>
								<th>Status</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${items}">
								<tr>
									<td>${item.id}</td>
									<td>${item.title}</td>
									<td>${item.poster}</td>
									<td>${item.views}</td>
									<td>${item.description}</td>
									<td>${item.active?'Active':'Inactive'}</td>
									<td><button class="btn btn-secondary"
											onclick="window.location.href='${url}/edit/${item.id}'">Edit</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

		</div>
	</div>

</div>
</div>
<!-- main -->
</html>