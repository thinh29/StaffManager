<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${account.fullName} | Profile</title>

</head>
<body style>
	<!-- <h2>đây là trang admin profile</h2> -->
	<c:if test="${not empty message}">
		<c:if test="${empty alert}">
			<div class="alert alert-info alert-dismissible" role="alert">
										<button type="button" class="close" data-dismiss="alert">×</button>
										<div class="alert-icon">
											<i class="icon-info"></i>
										</div>
										
										<c:if test="${not empty message}">
											<c:if test="${empty alert}">
												<div class="alert-message">
												<span><strong>Thông báo!</strong> ${message}.</span>
											</div>
											</c:if>
										</c:if>
										
									</div>
		</c:if>
		<c:if test="${not empty alert}">
										<div class="alert alert-${alert} alert-dismissible" role="alert">
										<button type="button" class="close" data-dismiss="alert">×</button>
										<div class="alert-icon">
											<i class="icon-info"></i>
										</div>
												<div class="alert-message">
												<span><strong>Thông báo!</strong> ${message}.</span>
												</div>
										</div>
		</c:if>
								
	</c:if>
	<c:if test="${not empty message2}">
		<c:if test="${empty alert}">
			<div class="alert alert-info alert-dismissible" role="alert">
										<button type="button" class="close" data-dismiss="alert">×</button>
										<div class="alert-icon">
											<i class="icon-info"></i>
										</div>
										
										<c:if test="${not empty message2}">
											<c:if test="${empty alert}">
												<div class="alert-message">
												<span><strong>Thông báo!</strong> ${message2}.</span>
											</div>
											</c:if>
										</c:if>
										
									</div>
		</c:if>
		<c:if test="${not empty alert}">
										<div class="alert alert-${alert} alert-dismissible" role="alert">
										<button type="button" class="close" data-dismiss="alert">×</button>
										<div class="alert-icon">
											<i class="icon-info"></i>
										</div>
												<div class="alert-message">
												<span><strong>Thông báo!</strong> ${message2}.</span>
												</div>
										</div>
		</c:if>
								
	</c:if>

	<div class="container">
	
		<div class="row">
			<div class="col-lg-4">
				<div class="profile-card-4 z-depth-3">
					<div class="card">
						<div class="card-body text-center bg-primary rounded-top">
							<div class="user-box">
								<img src="https://w7.pngwing.com/pngs/349/288/png-transparent-teacher-education-student-course-school-avatar-child-face-heroes.png"
									alt="user avatar">
							</div>
							<h5 class="mb-1 text-white">${account.fullName}</h5>
							<div class="profile-label">
								<span class="label label-danger" style="padding: 5px; color:white">Admin</span>
							</div>
						</div>
						<div class="card-body">
							<ul class="list-group shadow-none">
								<li class="list-group-item">
									<div class="list-icon">
										<i class="fa fa-phone-square"></i>
									</div>
									<div class="list-details">
										<span>${staff.phone}</span> <small>Số điện thoại</small>
									</div>
								</li>
								<li class="list-group-item">
									<div class="list-icon">
										<i class="fa fa-envelope"></i>
									</div>
									<div class="list-details">
										<span>${staff.emailAddress}</span> <small>Email</small>
									</div>
								</li>
								<li class="list-group-item">
									<div class="list-icon">
										<i class="fa fa-user"></i>
									</div>
									<div class="list-details">
										<span>${account.username}</span> <small>Tên tài khoản</small>
									</div>
								</li>
							</ul>
							
						</div>
						
					</div>
				</div>
			</div>
			<div class="col-lg-8">
				<div class="card z-depth-3">
					<div class="card-body">
						<ul class="nav nav-pills nav-pills-primary nav-justified">
							<li class="nav-item"><a href="javascript:void();"
								data-target="#profile" data-toggle="pill"
								class="nav-link active show"><i class="icon-user"></i> <span
									class="hidden-xs">Profile</span></a></li>
							<li class="nav-item"><a href="javascript:void();"
								data-target="#edit" data-toggle="pill" class="nav-link"><i
									class="icon-note"></i> <span class="hidden-xs">Edit</span></a></li>
						</ul>
						<div class="tab-content p-3">
							<div class="tab-pane active show" id="profile">
								<h5 class="mb-3" style="font-weight: bold">User Profile</h5>
								<div class="row">
									<div class="col-md-6">
										<h6 style="font-weight: bold">Giới thiệu</h6>
										<p>Nhân viên ${staff.positionName}</p>
										<p>${staff.address}</p>
										<h6 style="font-weight: bold">Mô tả về bản thân</h6>
										<p>${staff.story}.</p>
									</div>
									<div class="col-md-6">
										<h6 style="font-weight: bold">Những dự án đã làm</h6>
										<a href="javascript:void();"
											class="badge badge-dark badge-pill">html5</a> <a
											href="javascript:void();" class="badge badge-dark badge-pill">react</a>
										<a href="javascript:void();"
											class="badge badge-dark badge-pill">codeply</a> <a
											href="javascript:void();" class="badge badge-dark badge-pill">angularjs</a>
										<a href="javascript:void();"
											class="badge badge-dark badge-pill">css3</a> <a
											href="javascript:void();" class="badge badge-dark badge-pill">jquery</a>
										<a href="javascript:void();"
											class="badge badge-dark badge-pill">bootstrap</a> <a
											href="javascript:void();" class="badge badge-dark badge-pill">responsive-design</a>
										<hr>
										<span class="badge badge-primary"><i class="fa fa-user"></i>
											${sizeAccount} Other Accounts</span> <span class="badge badge-success"><i
											class="fa fa-cog"></i> 43 Forks</span> <span
											class="badge badge-danger"><i class="fa fa-eye"></i>
											245 Views</span>
									</div>
									<div class="col-md-12">
										<h5 class="mt-2 mb-3" style="font-weight: bold">
											<span class="fa fa-clock-o ion-clock float-right"></span>
											Hoạt động trong ngày gần đây
										</h5>
										
										<div class="table-wrapper-scroll-y my-custom-scrollbar">
											<table class="table table-hover table-striped">
											<tbody>
											<c:if test="${accountsCreate.size()>0}">
												<c:forEach var="item" items="${accountsCreate}" varStatus="loop">
												<tr>
													<td><strong>Bạn</strong> đã tạo tài khoản
														<strong>`${item.username}`</strong> với loại <strong>${item.typeName}</strong>
														<span class="float-right font-weight-bold">${minutes.get(loop.index)}</span>
													</td>
												</tr>
											</c:forEach>
											<c:forEach var="item" items="${accountsUpdate}" varStatus="loop">
												<tr>
													<td><strong>Bạn</strong> đã chỉnh sửa tài khoản
														<strong>`${item.username}`</strong>
														<span class="float-right font-weight-bold">${minutes2.get(loop.index)}</span>
													</td>
												</tr>
											</c:forEach>
											<c:forEach var="item" items="${accountsDelete}" varStatus="loop">
												<tr>
													<td><strong>Bạn</strong> đã xóa tài khoản
														<strong>`${item.username}`</strong>
														<span class="float-right font-weight-bold">${minutes3.get(loop.index)}</span>
													</td>
												</tr>
											</c:forEach>
											</c:if>
											<c:if test="${accountsCreate.size()==0}">
												<tr><th class="text-primary text-center" colspan="6">Không có hoạt động mới nào</th></tr>
											</c:if>
											
											</tbody>
										</table>
										</div>
										
									</div>
								</div>
								<!--/row-->
							</div>
							<div class="tab-pane" id="edit">
								<form action="/admin/my-profile" method="post" onsubmit="lazyLoading(event)" id="profile-admin-form-edit">
									<div class="form-group row">
										<label class="col-lg-3 col-form-label form-control-label">Full
											name</label>
										<div class="col-lg-9">
											<input class="form-control" type="text" value="${account.fullName}" name="fullName" id="fullName" readonly="readonly">
										</div>
									</div>
								
									
									<div class="form-group row">
										<label class="col-lg-3 col-form-label form-control-label">Thay đổi hình ảnh</label>
										<div class="col-lg-9">
											<input class="form-control" type="file">
										</div>
									</div>
									

									<div class="form-group row">
										<label class="col-lg-3 col-form-label form-control-label">Tên tài khoản</label>
										<div class="col-lg-9">
											<input class="form-control" type="text" value="${account.username}" name="username" id="username" required="required">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-lg-3 col-form-label form-control-label">Mật khẩu</label>
										<div class="col-lg-9">
											<input class="form-control" type="password" name="password" id="password" required="required"
												value="${account.password}">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-lg-3 col-form-label form-control-label">Nhập lại mật khẩu</label>
										<div class="col-lg-9">
											<input class="form-control" type="password" name="password2" id="password2" required="required"
												value="${account.password}">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-lg-3 col-form-label form-control-label"></label>
										<div class="col-lg-9">
											<input type="hidden" value="${account.typeId}" id="typeId" name="typeId" />
											<input type="hidden" value="${account.statusAcc}" id="statusAcc" name="statusAcc" />
											<input type="hidden" value="${account.id}" id="id" name="id" />
											<input type="reset" class="btn btn-secondary" value="Hủy">
											<input type="submit" class="btn btn-primary" value="Lưu thay đổi">
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<script type="text/javascript">
		
	</script>
	
	<script >
	function lazySubmit(e) {
		e.preventDefault();	
		var x = document.getElementById('profile-admin-lzloading');
		x.classList.add("d-flex");	
		var form = document.getElementById("profile-admin-form-edit");	
		setTimeout(() => {
			form.submit();
			x.classList.remove("d-flex");	
		}, 2000);			
	}
	</script>
</body>

</html>