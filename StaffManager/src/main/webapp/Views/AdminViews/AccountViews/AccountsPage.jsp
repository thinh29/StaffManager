<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<!DOCTYPE html>
<html>
<head>

<title>Danh sách tài khoản | Quản trị viên</title>

</head>
<body id="page-top">
	<script src="<c:url value='/template/library/jquery/jquery.min.js'/>"></script>

	<div class="prj-bg-lzload" id="prj-lzloading">
		<div class="text-center ">
			<div class="spinner-grow  text-primary"
				style="width: 5rem; height: 5rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
	</div>

	<div class="container-fluid">

		<div class="row">

			<div class="col-12">
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 align-middle font-weight-bold text-primary">Danh
							sách tài khoản</h6>

						<div class="row mt-3">
							<div class="col-4">
								<div class="search-projects">
									<form class="prj-form-search"
										action="<c:url value='/admin/accounts'/>" method="post">
										<input type="hidden" value="search" id="account-st"
											name="type" /> <input type="hidden" value="st-act"
											id="prj-so" name="option" /> <input type="text"
											name="keyword" class="form-control" id="usernameSearch"
											placeholder="Tìm kiếm tài khoản theo tên nhân viên..."
											onKeyPress="pressKeyboard(event, this)" required>
										<button id="btn-search" type="submit"
											class="btn prj-search-btn">
											<i class="fas fa-search"></i>
										</button>

									</form>
								</div>
							</div>

							<div class="col-8 prj-btns-func">
								<a type="button" style="margin-right: 10px;" id="submit"
									class="btn btn-primary" href="/admin/accounts?type=add"> <i
									class="fa fa-plus-square"></i> <b>Thêm</b>
								</a> <a type="button" class="btn btn-secondary"
									href="/admin/accounts?type=delete"><i class="fa fa-trash">
										Thùng rác</i></a>
							</div>
						</div>


					</div>
					<div class="card-body">
						<div class="row mb-3">
							<c:if test="${not empty message}">
								<div class="alert alert-${alert}">${message}</div>
							</c:if>
						</div>

						<div class="table-responsive">
							<div id="dataTable_wrapper"
								class="dataTables_wrapper dt-bootstrap4">

								<div class="row">
									<div class="col-sm-12">
										<table class="table table-bordered dataTable" id="dataTable"
											style="width: 100%; cellspacing: 0;" role="grid"
											aria-describedby="dataTable_info" style="width: 100%;">
											<thead>
												<tr role="row">
													<th class="sorting sorting_asc" tabindex="0"
														aria-controls="dataTable" rowspan="1" colspan="1"
														aria-sort="ascending"
														aria-label="ID: activate to sort column descending"
														style="width: 3%;">#</th>
													<th class="sorting" tabindex="0" aria-controls="dataTable"
														rowspan="1" colspan="1"
														aria-label="Username: activate to sort column ascending"
														style="width: 15%;">Tên tài khoản</th>
													<th class="sorting" tabindex="0" aria-controls="dataTable"
														rowspan="1" colspan="1"
														aria-label="Account_type: activate to sort column ascending"
														style="width: 5%;">Loại</th>
													<th class="sorting" tabindex="0" aria-controls="dataTable"
														rowspan="1" colspan="1"
														aria-label="Ngày tạo: activate to sort column ascending"
														style="width: 15%;">Ngày tạo</th>
													<th class="sorting" tabindex="0" aria-controls="dataTable"
														rowspan="1" colspan="1"
														aria-label="Người tạo: activate to sort column ascending"
														style="width: 18%;">Họ tên</th>
													<th class="sorting" tabindex="0" aria-controls="dataTable"
														rowspan="1" colspan="1"
														aria-label="Trạng thái: activate to sort column ascending"
														style="width: 15%;">Trạng thái</th>
													<th class="sorting" tabindex="0" aria-controls="dataTable"
														rowspan="1" colspan="1"
														aria-label=": activate to sort column ascending"
														style="width: 30%;"></th>
												</tr>
											</thead>


											<tbody>

												<c:forEach var="item" items="${account.listResult}"
													varStatus="loop">
													<tr class="odd">
														<th class="sorting_1">${(page-1)*20 + loop.index +1}</th>
														<td>${item.username}</td>
														<td>${item.typeName}</td>
														<td><fmt:formatDate value="${item.createAt}"
																pattern="dd/MM/yyyy HH:mm" /></td>
														<td>${item.fullName}</td>
														<td>${item.statusName}</td>
														<th><a type="button" class="btn btn-dark"
															href="/admin/accounts?type=view&id=${item.id}"><i
																class="fas fa-eye"> Xem</i></a> <a type="button"
															class="btn btn-success"
															href="/admin/accounts?type=edit&id=${item.id}"><i
																class="fas fa-user-edit"> Sửa</i></a> <!-- data-href="truyền id muốn xóa" -->
															<a href="#" data-href="" data-toggle="modal"
															data-target="#confirm-delete-${item.id}" type="button"
															class="btn btn-danger"><i class="fas fa-backspace">
																	Xóa</i></a></th>
													</tr>
													<div class="modal fade" id="confirm-delete-${item.id}"
														tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
														aria-hidden="true">

														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header" style="font-weight: bold">Thông
																	báo</div>

																<form id="${item.id}"
																	action="<c:url value='/admin/accounts?type=delete&id=${item.id}'/>"
																	method="post" onsubmit="lazySubmit(event)">

																	<div class="modal-body fas fa-exclamation-triangle">
																		Bạn có muốn xóa tài khoản này không?</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-default"
																			data-dismiss="modal">Hủy</button>
																		<button type="submit" id="btnDelete"
																			class="btn btn-danger btn-ok">Xóa</button>
																	</div>
																</form>
															</div>
														</div>
													</div>
													<!-- -------------- -->
												</c:forEach>




											</tbody>
										</table>
									</div>
								</div>

							</div>
						</div>
					</div>
					<form action="<c:url value='/admin/accounts'/>" id="formSubmit"
						method="post">
						<ul class="pagination" id="pagination"></ul>
						<input type="hidden" value="" id="page" name="page" /> <input
							type="hidden" value="" id="maxPageItem" name="maxPageItem" /> <input
							type="hidden" value="" id="sortName" name="sortName" /> <input
							type="hidden" value="" id="sortBy" name="sortBy" /> <input
							type="hidden" value="" id="type" name="type" />
					</form>
				</div>

			</div>

		</div>


	</div>
	<script
		src="<c:url value='/template/library/jquery/jquery.twbsPagination.js' />"></script>

	<script type="text/javascript">
	
	document.addEventListener("DOMContentLoaded", function() {
		function pressKeyboard(e, input) {
			if (e.keyCode === 13) { 
				document.getElementById("usernameSearch").submit();
			}
		}
		
		var totalPages = ${totalPage};
		var currentPage = ${page};
		var limit = 20;

		$(function() {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages : totalPages,
				visiblePages : 10,
				startPage : currentPage,
				onPageClick : function(event, page) {
					if (currentPage != page) {
						$('#maxPageItem').val(limit);
						$('#page').val(page);
						$('#sortName').val('id');
						$('#sortBy').val('desc');
						$('#type').val('list-view');
						$('#formSubmit').submit();
					}
				}
			});
		}(jQuery));
		
		
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
	});
	
	</script>

</body>
</html>