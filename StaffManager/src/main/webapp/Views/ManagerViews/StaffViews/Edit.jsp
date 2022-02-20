<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sửa | ${staff.fullName} | Quản trị viên</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">

</head>
<body>
	<div class="prj-bg-lzload" id="prj-lzloading">
		<div class="text-center ">
			<div class="spinner-grow  text-primary"
				style="width: 5rem; height: 5rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
	</div>
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
									<h4>@${staff.fullName}</h4>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-8">
					<div class="card mb-3">
						<form
							action="<c:url value='/manager/staffs?type=edit&id=${staff.id }'/>"
							method="POST" onsubmit="lazySubmit(event)" id="edit-staff">
							<div class="card-body">
								<div class="row mb-3">
									<c:if test="${not empty message}">
										<div class="alert alert-${alert}">${message}</div>
									</c:if>
								</div>
								<div class="row mb-3">
									<div class="col-sm-3">
										<h6 class="mb-0">Họ và Tên</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="text" class="form-control"
											value="${staff.fullName }" id="fullName" name="fullName"
											placeholder="Nhập họ và tên..." required="required">
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-sm-3">
										<h6 class="mb-0">Ngày sinh</h6>
									</div>
									<div class="col-sm-9 text-secondary">
									<fmt:formatDate type="date" var="dateOfBirth" value="${staff.dateOfBirth}"
										pattern="yyyy-MM-dd" />
										<input type="date" class="form-control"
											value="${dateOfBirth}" id="dateOfBirth"
											name="dateOfBirth" required="required">
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-sm-3">
										<h6 class="mb-0">Giới tính</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<select id="sex" name="sex" class="form-control">
											<option value="1" ${(staff.sex==1)?"selected":"" }>Nam</option>
											<option value="2" ${(staff.sex==2)?"selected":"" }>Nữ</option>
											<option value="3" ${(staff.sex==3)?"selected":"" }>Khác</option>
										</select>
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-sm-3">
										<h6 class="mb-0">CMND/CCCD</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="text" class="form-control"
											value="${staff.peopleId }" id="peopleId" name="peopleId"
											placeholder="CMND/CCCD" pattern="\d{9,12}">
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-sm-3">
										<h6 class="mb-0">Số điện thoại</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="text" class="form-control"
											value="${staff.phone }" id="phone" name="phone"
											placeholder="0... hoặc +84..." pattern="(\+84|0)\d{9,10}">
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-sm-3">
										<h6 class="mb-0">E-mail:</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="email" class="form-control"
											value="${staff.emailAddress }" id="emailAddress"
											name="emailAddress" required="required"
											placeholder="Nhập địa chỉ e-mail">
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-sm-3">
										<h6 class="mb-0">Địa chỉ</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="text" class="form-control"
											value="${staff.address }" id="address" name="address"
											placeholder="Nhập địa chỉ...">
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-sm-3">
										<h6 class="mb-0">Quê quán</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<select id="hometown" name="hometown" required="required"
											class="form-control">
											<option value="">Chọn quê quán nhân viên</option>
											<c:forEach var="province" items="${provinces }">
												<option value="${province.id }"
													${(staff.hometown==province.id)?"selected":"" }>${province.name}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-sm-3">
										<h6 class="mb-0">Vị Trí</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<select id="position" name="position" required="required"
											class="form-control">
											<option value="">Chọn vị trí nhân viên</option>
											<c:forEach var="posi" items="${positions }">
												<option value="${posi.id }"
													${(staff.position==posi.id)?"selected":"" }>${posi.name}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-sm-3">
										<h6 class="mb-0">Ngày bắt đầu làm việc:</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="date" class="form-control"
											value="${staff.beginWork }" required="required"
											id="beginWork" name="beginWork">
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-sm-3">
										<h6 class="mb-0">Hình nhứ nhân viên:</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<select id="typeSt" name="typeSt" required="required"
											class="form-control">
											<option value="">Chọn hình thức nhân viên</option>
											<c:forEach var="type" items="${typeSt }">
												<option value="${type.id }"
													${(staff.typeSt==type.id)?"selected":"" }>${type.name}</option>
											</c:forEach>
										</select>
									</div>
									
								</div>
								<div class="row mb-3">
									<div class="col-sm-3">
										<h6 class="mb-0">Lương cơ bản:</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="number" class="form-control"
											value="${staff.basicSalary}" required="required" step="1000"
											id="basicSalary" name="basicSalary">
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-sm-3">
										<h6 class="mb-0">Số người phụ thuộc:</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="number" class="form-control"
											value="${staff.dependent}" required="required" step="1"
											id="dependent" name="dependent">
									</div>
								</div>
								<div class="modal-footer">
									<a href="<c:url value='/manager/staffs'/>"
										class="btn btn-secondary" data-dismiss="modal">Close</a> <input
										type="submit" class="btn btn-primary" value="Lưu" />
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
	<script>
		function lazySubmit(e) {
			e.preventDefault();	
			var x = document.getElementById('prj-lzloading');
			x.classList.add("d-flex");	
			var form = document.getElementById(e.target.id);			
			setTimeout(() => {
				form.submit();
				x.classList.remove("d-flex");	
			}, 2000);			
		}
		</script>
</body>
</html>