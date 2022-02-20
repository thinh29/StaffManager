<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>Thêm nhân viên | Quản lý nhân sự</title>
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
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h4 class="m-10 font-weight-bold text-primary">Thêm Nhân Viên</h4>
		</div>

		<div class="card-body">
			<div class="table-responsive" style="overflow-x: srcoll !important">
				<div class="card mb-3">
					<form action="<c:url value='/manager/staffs?type=add'/>"
						method="POST" onsubmit="lazySubmit(event)" id="add">
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
									<input type="text" class="form-control" value="" id="fullName"
										name="fullName" placeholder="Nhập họ và tên..."
										required="required">
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">Ngày sinh</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<input type="date" class="form-control" value=""
										id="dateOfBirth" name="dateOfBirth" required="required">
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">Giới tính</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<select id="sex" name="sex" class="form-control">
										<option value="1" selected="selected">Nam</option>
										<option value="2">Nữ</option>
										<option value="3">Khác</option>
									</select>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">CMND/CCCD</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<input type="text" class="form-control" value="" id="peopleId"
										name="peopleId" placeholder="CMND/CCCD" pattern="\d{9,12}"
										required="required">
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">Số điện thoại</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<input type="text" class="form-control" value="" id="phone"
										name="phone" placeholder="0... hoặc +84..."
										pattern="(\+84|0)\d{9,10}">
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">E-mail:</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<input type="email" class="form-control" value=""
										id="emailAddress" name="emailAddress" required="required"
										placeholder="Nhập địa chỉ e-mail">
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">Địa chỉ</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<input type="text" class="form-control" value="" id="address"
										name="address" placeholder="Nhập địa chỉ...">
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
											<option value="${province.id }">${province.name}</option>
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
											<option value="${posi.id }">${posi.name}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">Ngày bắt đầu làm việc:</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<input type="date" class="form-control" value=""
										required="required" id="beginWork" name="beginWork">
								</div>
							</div>
							<hr>
							<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">Lương cơ bản:</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<input type="number" class="form-control" value="0"
										required="required" id="basicSalary" name="basicSalary">
								</div>
							</div>
							<hr>
							<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">Người Phụ thuộc:</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<input type="number" class="form-control" value="0"
										required="required" id="dependent" name="dependent">
								</div>
							</div>
							<hr>
							<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">Hình thức nhân viên:</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<select id="typeSt" name="typeSt" required="required"
										class="form-control" onchange="chooseTypeStaff()">
										<option value="">Chọn hình thức nhân viên</option>
										<c:forEach var="type" items="${typeSt }">
											<option value="${type.id }">${type.name}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<hr>
							<h4 class="m-10 font-weight-bold text-primary">Tài khoản mặc
								định</h4>

							<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">Tên đăng nhập</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<input type="text" class="form-control" value="" id="username"
										name="username" required="required"
										placeholder="Tên đăng nhập">
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">Mật khẩu</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									<input type="text" class="form-control"
										value="Sẽ được gửi về e-mail cá nhân" readonly="readonly">
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">Loại tài khoản</h6>
								</div>
								<div class="col-sm-9 text-secondary">
									 <select id="typeId" name="typeId" required="required"
										class="form-control">
										<option value="">Chọn loại tài khoản</option>
										<%-- <c:forEach var="type" items="${types }">
											<option value="${type.id }">${type.name}</option>
										</c:forEach> --%>
										<option value="${types.id }" selected>${types.name }</option>
									</select>
									<%-- <input type="text" class="form-control" id="typeId" name="typeId"
										value="${types.name }" readonly="readonly"> --%>
								</div>
							</div>
							<div class="modal-footer">
								<a href="<c:url value='/manager/staffs'/>"
									class="btn btn-secondary" data-dismiss="modal">Close</a>
								<button type="submit" class="btn btn-primary">OK</button>
							</div>
						</div>
					</form>
				</div>

			</div>

		</div>
	</div>

	<!-- Custom scripts for all pages-->
	<script src="<c:url value='/template/library/jquery/jquery.min.js'/>"></script>
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
		function chooseTypeStaff(){
			console.log($('#typeSt').val());
			if($('#typeSt').val()==2){
				$('#dependent').val(0);
				$('#dependent').prop( "disabled", true );
			}else{
				$('#dependent').prop( "disabled", false );
			}
		}
		</script>

</body>
</html>