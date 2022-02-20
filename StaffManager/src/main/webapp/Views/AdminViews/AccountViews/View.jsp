<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tên tài khoản | Xem tài khoản | Quản trị viên</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<!-- <h1>Dây là trang xem tài khoản của admin</h1> -->

	<div class="text-right">
	<a style="margin-bottom:10px" type="button" href="${account.deleted==0?'/admin/accounts' : '/admin/accounts?type=delete'}" class="btn btn-secondary">
	 <i class="fas fa-backward"></i> <b>Quay lại</b></a>
	</div>

	<div class="row gutters-sm">
		<div class="col-md-4 mb-3">
			<div class="card">
				<div class="card-body">
					<div class="d-flex flex-column align-items-center text-center">
						<img src="https://bootdey.com/img/Content/avatar/avatar7.png"
							alt="Admin" class="rounded-circle" width="150">
						<div class="mt-3">
							<h4>${staff.fullName}</h4>
							<p class="text-secondary mb-1"
								style="background: black; border-radius: 5px; width: 80px; margin-left: auto; margin-right: auto; padding: 5px">${account.typeName}</p>

						</div>
					</div>
				</div>
			</div>
			<div class="card mt-3">
				<ul class="list-group list-group-flush">
					<li
						class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
						<h6 class="mb-0 fas fa-id-card"> Mã tài khoản</h6> <span
						class="text-secondary">${account.id}</span>
					</li>
					<li
						class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
						<h6 class="mb-0 fas fa-id-badge"> Tên tài khoản</h6> <span
						class="text-secondary">${account.username}</span>
					</li>
					<li
						class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
						<h6 class="mb-0 fas fa-chalkboard-teacher"> Trạng thái</h6> <span
						class="text-secondary">${account.statusName}</span>
					</li>
					<li
						class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
						<h6 class="mb-0 fas fa-file-prescription"> Mô tả</h6> <span
						class="text-secondary">${staff.story}</span>
					</li>

				</ul>
			</div>
		</div>
		<div class="col-md-8">
			<div class="card mb-3">
				<div class="card-body">
					<div class="row">
						<div class="col-sm-3">
							<h6 class="mb-0 fas fa-id-badge"> Họ và tên đầy đủ</h6>
						</div>
						<div class="col-sm-9 text-secondary">${staff.fullName}</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-3">
							<h6 class="mb-0 fas fa-envelope-square"> Email</h6>
						</div>
						<div class="col-sm-9 text-secondary">${staff.emailAddress}</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-3">
							<h6 class="mb-0 fas fa-phone-square"> Số điện thoại</h6>
						</div>
						<div class="col-sm-9 text-secondary">${staff.phone}</div>
					</div>

					<hr>
					<div class="row">
						<div class="col-sm-3">
							<h6 class="mb-0 fas fa-table"> Ngày sinh</h6>
						</div>
						<div class="col-sm-9 text-secondary">
						<fmt:formatDate value="${staff.dateOfBirth}"
																pattern="dd/MM/yyyy" />
						</div>
					</div>

				</div>
			</div>


			<div class="card mb-3">

				<div class="card-body">
					<h6 class="d-flex align-items-center mb-3">
						<i class="fas fa-list-ul"> Thông tin khác</i>
					</h6>
					<div>
						<small>Được tạo bởi: ${account.createByName}</small><br> <small>Ngày
							tạo:
							${account.createAt.getDate()}-${account.createAt.getMonth()+1}-${account.createAt.getYear()+1900}</small><br>
						<small>Được tạo vào lúc: ${account.createAt.getHours()} giờ
							${account.createAt.getMinutes()} phút
							${account.createAt.getSeconds()} giây</small>
					</div>
					<hr>

					<div>
						<c:if test="${not empty account.updateByName}">
							<small>Được cập nhật bởi: ${account.updateByName}</small>
							<br>
							<small>Ngày cập nhật:
								${account.updateAt.getDate()}-${account.updateAt.getMonth()+1}-${account.updateAt.getYear()+1900}</small>
							<br>
							<small>Được cập nhật vào lúc: ${account.updateAt.getHours()} giờ
								${account.updateAt.getMinutes()} phút
								${account.updateAt.getSeconds()} giây</small>
						</c:if>
						<c:if test="${empty account.updateByName}">
							<small>Tài khoản này chưa được cập nhật trước đó</small>
						</c:if>

					</div>
					<hr>

					<div>
						<c:if test="${not empty account.deleteByName}">
							<small>Được xóa gần đây bởi: ${account.deleteByName}</small>
							<br>
							<small>Ngày xóa gần đây:
								${account.deleteAt.getDate()}-${account.deleteAt.getMonth()+1}-${account.deleteAt.getYear()+1900}</small>
							<br>
							<small>Được xóa vào lúc: ${account.deleteAt.getHours()} giờ
								${account.deleteAt.getMinutes()} phút
								${account.deleteAt.getSeconds()} giây</small>
						</c:if>
						<c:if test="${empty account.deleteByName}">
							<small>Tài khoản này chưa được xóa trước đó</small>
						</c:if>
					</div>
					
					<div class="row mb-3" style="margin-left:2px; margin-top:10px">
						<c:if test="${not empty message}">
							<div class="alert alert-${alert}">${message}</div>
						</c:if>
					</div>

				</div>

			</div>
			
			
		</div>
	</div>


	<script type="text/javascript">
		
	</script>
</body>
</html>