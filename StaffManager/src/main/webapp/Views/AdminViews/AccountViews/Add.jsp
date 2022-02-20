<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm tài khoản | Quản trị viên</title>
</head>
<body>
	<!-- <h1>Dây là trang thêm tài khoản của admin</h1> -->
	<script src="<c:url value='/template/library/jquery/jquery.min.js'/>"></script>
	
	<div class="prj-bg-lzload" id="prj-lzloading">
		<div class="text-center ">
			<div class="spinner-grow  text-primary" style="width: 5rem; height: 5rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
	</div>
	
	<div class="modal-content">
		<div class="modal-header">
			<h5 class="modal-title font-weight-bold text-primary"
				id="exampleModalLabel">Thêm tài khoản</h5>
		</div>
		<div class="modal-body">

			<form action="/admin/accounts?type=add" id="formSubmitAdd"
				method="post" onsubmit="lazySubmit(event)">
				<div class="form-group">
					<div class="text-left">
						<label for="username">Tên tài khoản</label>
					</div>
					<div>
						<input type="text" class="form-control" id="username"
							name="username" value="" aria-describedby="emailHelp"
							placeholder="Nhập vào username" required="required">
					</div>
					<br>
					<div class="text-left">
						<label for="typeId">Loại tài khoản</label>
					</div>
					<div>
						<select id="typeId" name="typeId" class="form-control" required="required">
							<option value="">Chọn loại tài khoản</option>
							<c:forEach var="type_item" items="${listTypeAccount}">
								<c:if test="${type_item.id<5}">
									<option value="${type_item.id}">${type_item.name}</option>
								</c:if>
							</c:forEach>
						</select>
					</div>
					<br>
					<div class="text-left">
						<label for="staff">Danh sách nhân viên</label>
					</div>
					<div>
						<select id="select" name="idStaff" class="form-control"
							onchange="getval(this);" required="required">
							<option value="">Chọn nhân viên</option>
							<c:forEach var="staff_item" items="${listStaff.listResult}">
								<option value="${staff_item.id}">${staff_item.fullName} - ${listStaffPosition.get(staff_item.position-1).name}</option>
							</c:forEach>
						</select>
					</div>

				</div>
				<!-- <div class="text-right"> -->
				<div class="row mt-3">
				<div class="col-4">
				<div class="messageAdd">
					<c:if test="${not empty message}">
						<div class="alert alert-${alert}">${message}</div>
					</c:if>
				</div>
				</div>
				
				<div class="col-8">
				<div class="text-right">
					<a type="button" class="btn btn-secondary"
						href="/admin/accounts?page=1&maxPageItem=4&sortName=id&sortBy=asc&type=list">Quay
						lại</a> <input type="hidden" value="" id="fullNameStaff" name="fullNameStaff" />
					<button type="submit" class="btn btn-primary" id="btnAddAccount">Thêm</button>
					</div>
					</div>
					</div>
			<!-- 	</div> -->
				
			</form>
		</div>


	</div>
	<script type="text/javascript">
		function getval(sel) {
			var text=$("#select option:selected").text();
			$('#fullNameStaff').val(text);
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