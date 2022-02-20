<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập hệ thống</title>
</head>
<body>

<div class="prj-bg-lzload" id="prj-lzloading">
		<div class="text-center ">
			<div class="spinner-grow  text-primary" style="width: 5rem; height: 5rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
	</div>
	<section class="vh-100">
		<div class="container-fluid h-custom">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-md-9 col-lg-6 col-xl-5">
					<img src="<c:url value='/assits/login/Image/draw2.png'/>"
						class="img-fluid" alt="Sample image">
				</div>
				<div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
					<c:if test="${not empty message}">
						<div class="alert alert-${alert}">${message}</div>
					</c:if>
					<form action="<c:url value='/login'/>" method="POST" id="login-form-sys"
														onsubmit="lazySubmit(event)">


						<!-- Email input -->
						
						<div class="form-outline mb-4">
							<input type="text" id="form3Example3" name="username"
								class="form-control form-control-lg" placeholder="Username"
								onchange="usernameOnchange()" /> <label class="form-label"
								for="form3Example3">Tên đăng nhập</label>
						</div>

						<!-- Password input -->
						<div class="form-outline mb-3">
							<input type="password" id="form3Example4" name="password"
								class="form-control form-control-lg" placeholder="Password"
								onchange="passOnchange()" /> <label class="form-label"
								for="form3Example4">Mật khẩu</label>
						</div>

						<div class="d-flex justify-content-between align-items-center">
							<!-- Checkbox -->
							<div class="form-check mb-0">
								<input class="form-check-input me-2" type="checkbox" value=""
									id="form2Example3" /> <label class="form-check-label"
									for="form2Example3"> Duy trì đăng nhập </label>
							</div>
							<a href="#" class="text-body">Quên mật khẩu</a>
						</div>

						<div class="text-center text-lg-start mt-4 pt-2">
							<button type="submit" class="btn btn-primary btn-lg"
								style="padding-left: 2.5rem; padding-right: 2.5rem;">Đăng
								nhập</button>
							<p class="small fw-bold mt-2 pt-1 mb-0">
								Chưa có tài khoản <a href="#" class="link-danger">Đăng ký</a>
							</p>
						</div>

					</form>
				</div>
			</div>
		</div>
		<div
			class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5 bg-primary">
			<!-- Copyright -->
			<div class="text-white mb-3 mb-md-0">Copyright © 2021. All
				rights reserved.</div>
			<!-- Copyright -->
		</div>
	</section>
	
	<script>
    var x = document.getElementById('form3Example3');
    var y = document.getElementById('form3Example4');
    function usernameOnchange(){
      if (!x.classList.contains('active')) {
        x.classList.add('active');
      }
    }
    function passOnchange(){
      if (!y.classList.contains('active')) {
        y.classList.add('active');
      }
    }
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