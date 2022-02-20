<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${staff.fullName}|Quảnlýnhân sự</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">

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
									<h4>${staff.fullName}</h4>
									<p class="text-secondary mb-1">${position.name }</p>
									<p class="text-muted font-size-sm">E-mail:
										${staff.emailAddress }</p>
									<a
										href="<c:url value='/manager/staffs?type=edit&id=${staff.id }'/>"
										class="btn btn-danger">Sửa thông tin</a> <a
										href="<c:url value='/manager/salary?type=view&id=${staff.id }'/>"
										class="btn btn-outline-primary">Xem bảng lương</a>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="col-md-8">
					<div class="card mb-3">
						<div class="card-body">

							<div class="row">
								<div class="col-sm-6">
									<c:if test="${staff.deleted == 1 }">
										<div class="alert alert-danger">Nhân viên đã bị xóa.</div>
									</c:if>
								</div>
								<div class="col-sm-6 text-right" style="margin: 10px 0;">
									<a
										href="<c:url value='/manager/staffs${staff.deleted == 1?"?type=delete":"" }'/>"
										class="btn btn-secondary"><i class="fa fa-backward"
										aria-hidden="true"></i> Trở lại</a>
								</div>
							</div>
							<hr>


							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">Họ và tên:</h6>
								</div>
								<div class="col-sm-9 text-secondary">${staff.fullName }</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">Ngày sinh:</h6>
								</div>
								<div class="col-sm-9 text-secondary">${staff.dateOfBirth}</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">CMND/CCCD:</h6>
								</div>
								<div class="col-sm-9 text-secondary">${staff.peopleId}</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">Quê quán:</h6>
								</div>
								<div class="col-sm-9 text-secondary">${hometown.name}</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">Địa chỉ:</h6>
								</div>
								<div class="col-sm-9 text-secondary">${staff.address}</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">Mobile:</h6>
								</div>
								<div class="col-sm-9 text-secondary">${staff.phone }</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">Vị trí nhân viên:</h6>
								</div>
								<div class="col-sm-9 text-secondary">${position.name }</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">Ngày ký hợp đồng:</h6>
								</div>
								<div class="col-sm-9 text-secondary">${staff.beginWork }</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">Lương cơ bản:</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<fmt:setLocale value="vi_VN" />
									<fmt:formatNumber value="${staff.basicSalary }" type="currency" />
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">Hình thức nhân viên:</h6>
								</div>
								<div class="col-sm-9 text-secondary">${typeSt.get(staff.typeSt-1).name}</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">Số người phụ thuộc:</h6>
								</div>
								<div class="col-sm-9 text-secondary">${staff.dependent}</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">Tạo bởi:</h6>
								</div>
								<div class="col-sm-9 text-secondary">${createAcc.fullName }</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">Tạo lúc:</h6>
								</div>
								<div class="col-sm-9 text-secondary">${staff.createAt }</div>
							</div>
							<hr>
							<c:if test="${updateAcc != null}">
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Cập nhật lần cuối:</h6>
									</div>
									<div class="col-sm-9 text-secondary">${staff.updateAt }</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Cập nhật bởi:</h6>
									</div>
									<div class="col-sm-9 text-secondary">${updateAcc.fullName }</div>
								</div>
								<hr>
							</c:if>
							<c:if test="${staff.deleted == 1}">
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Ngày hết hạn hợp đồng:</h6>
									</div>
									<div class="col-sm-9 text-secondary">${staff.finishWork }</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Xóa lúc:</h6>
									</div>
									<div class="col-sm-9 text-secondary">${staff.deleteAt }</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Xóa bởi:</h6>
									</div>
									<div class="col-sm-9 text-secondary">${deleteAcc.fullName }</div>
								</div>
								<hr>
							</c:if>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">Tiểu sử</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<br>
									<p>${staff.story }</p>
									<br>
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