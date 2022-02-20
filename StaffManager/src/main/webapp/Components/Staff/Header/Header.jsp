<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Common/ConstantLib.jsp"%>
<c:url var ="APIurl" value="/api-staff"/>
<!-- Topbar -->
<nav
	class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

	<!-- Sidebar Toggle (Topbar) -->
	<button id="sidebarToggleTop"
		class="btn btn-link d-md-none rounded-circle mr-3">
		<i class="fa fa-bars"></i>
	</button>

	<!-- Topbar Search -->
	<form
		class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
		<div class="input-group">
			<input type="text" class="form-control bg-light border-0 small"
				placeholder="Search for..." aria-label="Search"
				aria-describedby="basic-addon2">
			<div class="input-group-append">
				<button class="btn btn-primary" type="button">
					<i class="fas fa-search fa-sm"></i>
				</button>
			</div>
		</div>
	</form>

	<!-- Topbar Navbar -->
	<ul class="navbar-nav ml-auto">

		<!-- Nav Item - Search Dropdown (Visible Only XS) -->
		<li class="nav-item dropdown no-arrow d-sm-none"><a
			class="nav-link dropdown-toggle" href="#" id="searchDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
		</a> <!-- Dropdown - Messages -->
			<div
				class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
				aria-labelledby="searchDropdown">
				<form class="form-inline mr-auto w-100 navbar-search">
					<div class="input-group">
						<input type="text" class="form-control bg-light border-0 small"
							placeholder="Search for..." aria-label="Search"
							aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-primary" type="button">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</div>
				</form>
			</div></li>

			
		<!-- Nav Item - Alerts -->
		<li class="nav-item dropdown no-arrow mx-1">
		
		<a class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts -->
				<span id ="soluongthongbao" class="badge badge-danger badge-counter"></span>
		</a> <!-- Dropdown - Alerts -->
			<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
				aria-labelledby="alertsDropdown">
				<h6 class="dropdown-header">Alerts Center</h6>
				
				<div id="hienthithongbao">
				
				</div>
				
				<a class="dropdown-item text-center small text-gray-500"
					href="/notifications">Xem tất cả thông báo trước đó</a>
			</div>
		</li>

		<!-- Nav Item - Messages -->

		<div class="topbar-divider d-none d-sm-block"></div>

		<!-- Nav Item - User Information -->
		<li class="nav-item dropdown no-arrow"><a
			class="nav-link dropdown-toggle" href="#" id="userDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <span
				class="mr-2 d-none d-lg-inline text-gray-600 xsmall"><%=request.getSession().getAttribute("fullName_5")%></span>
				<img class="img-profile rounded-circle"
				src="<c:url value='assits/admin/img/undraw_profile.svg'/>">
		</a> <!-- Dropdown - User Information -->
			<div
				class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
				aria-labelledby="userDropdown">
				<a class="dropdown-item" href="/accounts"> <i
					class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
				</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item"
					href="<c:url value='logout?action=logout&accept=accept_5'/>"> <i
					class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
					Logout
				</a>
			</div></li>

	</ul>

</nav>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	 var data={};
	 var id=<%=request.getSession().getAttribute("id_5")%>;
	 data["id"]=id;
	$.ajax({
		url: '${APIurl}',
		type: 'POST',
		contentType: 'application/json',
		data: JSON.stringify(data),
		dataType: 'json',
		success: function(result1){
			console.log(result1);
		},
		error: function(error1){
			console.log(error1);
			$.ajax({
				url: '${APIurl}',
				type: 'GET',
				success: function(result2){
					console.log(result2);
					var splitted = result2.split("|");
					var row = document.getElementById('hienthithongbao');
					row.innerHTML += splitted[1];
					$('#soluongthongbao').text(splitted[0]);
				},
				error: function(error2){
					console.log(error2);
				}
			});
		}
	});
	
	
});

</script>
<!-- End of Topbar -->