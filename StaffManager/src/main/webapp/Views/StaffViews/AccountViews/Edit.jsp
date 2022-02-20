<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cài đặt tài khoản | Quản lý nhân viên</title>
</head>
<body>
	<script type="text/javascript"
		src="<c:url value='/template/library/ckeditor/ckeditor.js' />"
		charset="UTF-8"></script>
	<div class="prj-bg-lzload" id="prj-lzloading">
		<div class="text-center ">
			<div class="spinner-grow  text-primary"
				style="width: 5rem; height: 5rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
	</div>
	<div class="tab-pane">
		<form action="/accounts" method="post" onsubmit="lazyLoading(event)"
			id="acc-form-edit">
			<input type="hidden" name="type" value="edit"> <input
				type="hidden" name="id" value="${staff.id }">
			<div class="form-group row">
				<label class="col-lg-3 col-form-label form-control-label"
					for="get-full-name">Họ và tên</label>
				<div class="col-lg-9">
					<input class="form-control" type="text" id="get-full-name"
						value="${staff.fullName }" name="fullName" readonly="readonly">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-lg-3 col-form-label form-control-label"
					for="get-full-name">Ngày sinh</label>
				<div class="col-lg-9">
					<fmt:formatDate type="date" value="${staff.dateOfBirth }"
						var="dateOfBirth" pattern="dd-MM-yyyy" />
					<input class="form-control" type="text" value="${dateOfBirth }"
						name="" readonly="readonly" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-lg-3 col-form-label form-control-label"
					for="get-email">Email</label>
				<div class="col-lg-9">
					<input class="form-control" type="email"
						value="${staff.emailAddress }" readonly="readonly">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-lg-3 col-form-label form-control-label">Địa
					chỉ</label>
				<div class="col-lg-9">
					<input class="form-control" type="text" value="${staff.address }"
						id="address" name="address" placeholder="Đường,...,Quận"
						required="required">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-lg-3 col-form-label form-control-label">Số
					điện thoại</label>
				<div class="col-lg-9">
					<input type="text" class="form-control" value="${staff.phone }"
						id="phone" name="phone" placeholder="0... hoặc +84..."
						pattern="(\+84|0)\d{9,10}">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-lg-3 col-form-label form-control-label">Tiểu
					sử</label>
				<div class="col-lg-9">
					<textarea class="form-control ckeditor" rows="10" cols=""
						id="prj-dsc-child-1" name="story" lang="vi">${staff.story}</textarea>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-lg-3 col-form-label form-control-label"></label>
				<div class="col-lg-9">
					<a href="/accounts" class="btn btn-secondary">Hủy</a> <input
						type="submit" class="btn btn-primary" value="Lưu thay đổi">
					
				</div>
			</div>
		</form>
		<button type="button" class="btn btn-success" data-toggle="modal"
			data-target="#change-password">Thay đổi mật khẩu</button>
		<div class="modal fade" id="change-password" data-backdrop="static"
			data-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<label>Thay đổi mật khẩu của tài khoản: <Strong>@${account.username }</Strong></label>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<form action="<c:url value='/accounts?type=change-password&id=${account.id}'/>" method="POST"
						onsubmit="lazySubmit(event)" id="stm-del-${staff.id }">
						<div class="modal-body">
							<div class="col-sm-12">
								<div style="margin: auto; text-align: center;">
									<b> Xác nhận thay đổi mật khẩu? </b>
								</div>
							</div>
							<br />
							<div class="col-sm-12">
								<div class="form-group row">
									<label class="col-form-label form-control-label">Mật
										khẩu</label>
									<div class="">
										<input class="form-control" type="password" value=""
											id="password" name="password" onchange="handlePassword(event)">
									</div>
								</div>
								<div class="form-group row">
									<label class=" col-form-label form-control-label">Nhập
										lại mật khẩu</label>
									<div class="">
										<input class="form-control" type="password" value=""
											id="rePassword" onchange="handleRePassword(event)">
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-danger" id="submit-pw"
								disabled="disabled">Thay đổi</button>
						</div>
					</form>
				</div>
			</div>
		</div>

	</div>
	<script
		src="<c:url value='/template/staff/jquery/jquery.twbsPagination.js' />"></script>
	
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
	function handlePassword(e) {
	
		if($('#rePassword').val()=== e.target.value){
			$("#submit-pw").prop('disabled', false);
		}else{
			$("#submit-pw").prop('disabled', true);
		} 
	}
	function handleRePassword(e){
		
		if($('#password').val() === e.target.value){
			$("#submit-pw").prop('disabled', false);
		}else{
			$("#submit-pw").prop('disabled', true);
		}
	}
	</script>
</body>
</html>