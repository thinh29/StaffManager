<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>Quản lý tài khoản | Staff Manager</title>
</head>
<body>

	<div class="container">
		<div class="main-body">

			<div class="row gutters-sm">
				<div class="col-md-4 mb-3">
					<div class="card mb-3">
						<div class="card-body">
							<div class="d-flex flex-column align-items-center text-center">
								<img src="https://bootdey.com/img/Content/avatar/avatar7.png"
									alt="Admin" class="rounded-circle" width="150">
								<div class="mt-3">
									<h4>${account.fullName}</h4>
									<p class="text-secondary mb-1">@${account.username }</p>
									<p class="text-muted font-size-sm">
										${positions.get(staff.position -1 ).name }</p>
									
								</div>
							</div>
						</div>
					</div>
					<div class="card mb-3">
						<div class="card-body">
							<div class="row">
								<div class="col-sm-4">
									<h6 class="mb-0">Email</h6>
								</div>
								<div class="col-sm-8 text-secondary">${staff.emailAddress }</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-4">
									<h6 class="mb-0">Phone</h6>
								</div>
								<div class="col-sm-8 text-secondary">
									${staff.phone}
								</div>
							</div>
							<hr>

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
								<div class="col-sm-12 text-secondary">
									${staff.story } <br>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-12">
									<a class="btn btn-info" class="btn btn-primary" data-toggle="modal" data-target="#changePassword" href="javascript:void(0);">Đổi mật khẩu</a>
								</div>
							</div>
						</div>
					</div>


					
				</div>
			</div>

		</div>
	</div>
	<div class="modal fade" id="changePassword" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">Đổi mật khẩu</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form method="post" action="/manager/my-profile">
			  <div class="form-group">
			    <label>Mật khẩu</label>
			    <input type="password" class="form-control" id="password" name="password" placeholder="Mật khẩu">
			  </div>
			  <div class="form-group">
			    <label>Xác nhận mật khẩu</label>
			    <input type="password" class="form-control" id="confirmpassword" name="confirmpassword" placeholder="Xác nhận mật khẩu">
			  </div>
			   <div class="form-group">
			  	<span id='message'></span>
			  	</div>
			  	<div class="form-group">
			    <input type="submit" class="btn btn-primary save" disabled="disabled" value="Save"></button>
	        	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			  </div>
			  	
			</form>
	      </div>
	    
	    </div>
	  </div>
	</div>
	<script>
	window.addEventListener("load", function(){
		$('#password, #confirmpassword').on('keyup', function () {
			  if (($('#password').val() == $('#confirmpassword').val()) && ($('#password').val() != '') ) {
				  $(".save").prop('disabled', false);
					$('#message').html('* Hợp lệ').css('color', 'green');  
			  } else {
				  $(".save").prop('disabled', true);
				  $('#message').html('*Chưa hợp lệ').css('color', 'red');
			  }
			  	
		});
	});
	
	</script>
</body>
</html>