<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/Common/ConstantLib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${staff.fullName } | Xem thông tin</title>
</head>
<body>
	<div class="container">
		<div class="main-body">

			<div class="row gutters-sm">
				<div class="col-md-4 mb-3">
					<div class="card">
						<div class="card-body">
							<div class="d-flex flex-column align-items-center text-center">
								<img src="https://bootdey.com/img/Content/avatar/avatar7.png"
									alt="Admin" class="rounded-circle" width="150">
								<div class="mt-3">
									<h4>${staff.fullName }</h4>
									<p class="text-secondary mb-1">${staff.fullName }</p>
									<p class="text-muted font-size-sm">
										${positions.get(staff.position -1 ).name }</p>
									<button class="btn btn-primary">Project</button>
									<button class="btn btn-outline-primary">Message</button>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="col-md-8">
					<div class="card mb-3">
						<div class="card-body">
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">Họ và tên</h6>
								</div>
								<div class="col-sm-9 text-secondary">${staff.fullName }</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">Ngảy sinh</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<fmt:formatDate type="date" value="${staff.dateOfBirth}"
										pattern="dd-MM-yyyy" />
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">Vị trí nhân viên</h6>
								</div>
								<div class="col-sm-9 text-secondary">${positions.get(staff.position -1).name }
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">Ngày bắt đầu làm việc</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<fmt:formatDate type="date" value="${staff.beginWork }"
										pattern="dd-MM-yyyy" />
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">Hình thức nhân viên</h6>
								</div>
								<div class="col-sm-9 text-secondary">${typeSt.get(staff.typeSt-1).name }</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">Tiểu sử</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<br> ${staff.story } <br>
								</div>
							</div>
							<hr>
							
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>