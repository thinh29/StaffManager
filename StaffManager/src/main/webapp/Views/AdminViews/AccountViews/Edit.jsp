<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tên tài khoản | Sửa tài khoản | Quản trị viên</title>

</head>
<body>
	<!-- <h1>Dây là trang sửa tài khoản của admin</h1> -->
	<script src="<c:url value='/template/library/jquery/jquery.min.js'/>"></script>
	<div class="row gutters">
		<div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
			<div class="card h-100">
				<div class="card-body">
					<div class="account-settings">
						<div class="user-profile">
							<div class="user-avatar">
								<img src="https://bootdey.com/img/Content/avatar/avatar7.png"
									alt="Maxwell Admin">
							</div>
							<h5 class="fullName">${accountOwnerEdit.staff.fullName}</h5>
							<h6 class="name_accountType" id="name_accountType"
								style="color: grey">${account.typeName}</h6>
						</div>
						<div class="about">
							<h5>Mô tả</h5>
							<p>${staff.story}</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
			<div class="card h-100">
				<div class="card-body">

					<form action="/admin/accounts?type=edit" id="formEdit"
						method="post" onsubmit="lazySubmit(event)">
						<div class="row gutters">

							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								<h6 class="mb-2 text-primary">Thông tin người sở hữu tài
									khoản</h6>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
								<div class="form-group">
									<label for="fullName">Họ và tên đầy đủ</label> <input
										type="text" class="form-control" id="fullName"
										value="${staff.fullName}" readonly>
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
								<div class="form-group">
									<label for="email">Email</label> <input type="email"
										class="form-control" id="email" value="${staff.emailAddress}"
										readonly>
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
								<div class="form-group">
									<label for="phone">Số điện thoại</label> <input type="text"
										class="form-control" id="phone" value="${staff.phone}"
										readonly>
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
								<div class="form-group">
									<label for="dateOfBirth">Ngày sinh</label>
									<fmt:formatDate value="${staff.dateOfBirth}" var="dOB"
										pattern="dd/MM/yyyy" />
									<input type="text" class="form-control" id="dateOfBirth"
										value="${dOB}" readonly>
								</div>
							</div>
						</div>
						<div class="row gutters">
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								<h6 class="mt-3 mb-2 text-primary">Thông tin tài khoản</h6>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
								<div class="form-group">
									<label for="username">Tên tài khoản</label> <input type="text"
										class="form-control" id="username" name="username"
										value="${account.username}" placeholder="Nhập tên tài khoản"
										readonly> <input type="hidden"
										value="${account.password}" name="password" />
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
								<div class="form-group">
									<label for="status">Trạng thái</label> <select id="statusAcc"
										class="form-control" name="statusAcc">
										<c:forEach var="status_item" items="${listStatusAccountEdit}">
											<c:if test="${status_item.id==account.statusAcc}">
												<option value="${status_item.id}" selected="selected">${status_item.name}</option>
											</c:if>
											<c:if test="${status_item.id!=account.statusAcc}">
												<option value="${status_item.id}">${status_item.name}</option>
											</c:if>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
								<div class="form-group">
									<label for="typeName">Loại tài khoản</label>
									<div>
										<select id="typeId" class="form-control" name="typeId">
										<option value="${account.typeId}">${listTypeAccountEdit.get(account.typeId-1).name}</option>
										
										
						
										</select>
									</div>
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
								<div class="form-group">
									<label for="created_date">Ngày tạo</label>
									<fmt:formatDate value="${account.createAt}" var="crAt"
										pattern="dd/MM/yyyy HH:mm" />
									<input type="text" class="form-control" id="createAt"
										value="${crAt}" readonly>
								</div>
							</div>
						</div>

						<div class="form-check">
							<input class="checkResetPassword" type="checkbox"
								value="${account.id}" id="checkbox_${account.id}"
								name="checkResetPassword"> <label
								class="form-check-label" for="flexCheckDefault"> Reset
								mật khẩu </label>
						</div>

						<div class="row gutters">
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								<div class="text-right">
									<a type="button" href="/admin/accounts"
										class="btn btn-secondary">Hủy</a> <input type="hidden"
										value="${account.id}" name="id" />
									<button type="submit" id="submit" name="submit"
										class="btn btn-primary">Thay đổi</button>

									<div class="row mb-3">
										<c:if test="${not empty message}">
											<div class="alert alert-${alert}">${message}</div>
										</c:if>
									</div>
								</div>
							</div>
						</div>

					</form>

				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		var checkedValue = document
				.querySelector('.checkResetPassword:checked').value;
		$('#checkResetPassword').val(checkedValue);
	</script>
</body>
</html>