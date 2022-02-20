<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tài khoản đã xóa | Quản trị viên</title>


</head>
<body>
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
						<h6 class="m-0 align-middle font-weight-bold text-primary">Thùng
							rác tài khoản</h6>

						<div class="row mb-3">
							<c:if test="${not empty message}">
								<div class="alert alert-${alert}">${message}</div>
							</c:if>
						</div>
					</div>
					<div class="card-body">



						<div class="table-responsive">
							<div id="dataTable_wrapper"
								class="dataTables_wrapper dt-bootstrap4 no-footer">

								<div class="row">
									<div class="col-sm-12">
										<table class="table table-bordered dataTable no-footer"
											id="dataTable" style="width: 100%; cellspacing: 0;"
											role="grid" aria-describedby="dataTable_info"
											style="width: 100%;">
											<thead>
												<tr role="row">
													<th class="sorting sorting_asc" tabindex="0"
														aria-controls="dataTable" rowspan="1" colspan="1"
														aria-sort="ascending"
														aria-label="ID: activate to sort column descending"
														style="width: 17px;">#</th>
													<th class="sorting" tabindex="0" aria-controls="dataTable"
														rowspan="1" colspan="1"
														aria-label="Tên tài khoản: activate to sort column ascending"
														style="width: 27px;">Tên tài khoản</th>
													<th class="sorting" tabindex="0" aria-controls="dataTable"
														rowspan="1" colspan="1"
														aria-label="Họ tên: activate to sort column ascending"
														style="width: 45px;">Họ tên</th>
													<th class="sorting" tabindex="0" aria-controls="dataTable"
														rowspan="1" colspan="1"
														aria-label="Ngày xóa: activate to sort column ascending"
														style="width: 68px;">Ngày xóa</th>

													<th class="sorting" tabindex="0" aria-controls="dataTable"
														rowspan="1" colspan="1"
														aria-label="Phục hồi: activate to sort column ascending"
														style="width: 37px;">Phục hồi</th>
													<th class="sorting" tabindex="0" aria-controls="dataTable"
														rowspan="1" colspan="1"
														aria-label="Chi tiết: activate to sort column ascending"
														style="width: 26px;">Chi tiết</th>
												</tr>
											</thead>

											<tbody>
												<c:forEach var="item" items="${account.listResult}"
													varStatus="loop">
													<tr class="odd">
														<th class="sorting_1">${(page-1)*20 + loop.index +1}</th>
														<td>${item.username}</td>
														<td>${item.fullName}</td>
														<td>
														<fmt:formatDate value="${item.deleteAt}"
																pattern="dd/MM/yyyy HH:mm" />
														<td>
															<form id="${item.id}"
																action="<c:url value='/admin/accounts?type=restore&id=${item.id}'/>"
																method="post" onsubmit="lazySubmit(event)">

																<a href="javascript:void(0)" class="xetduyet"
																	id="${item.id}">Phục hồi</a>
															</form>
														</td>
														<th><a href="/admin/accounts?type=view&id=${item.id}">Xem
																chi tiết</a></th>
													</tr>
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
						<ul class="pagination_delete" id="pagination_delete"></ul>
						<input type="hidden" value="" id="page" name="page" /> <input
							type="hidden" value="" id="maxPageItem" name="maxPageItem" /> <input
							type="hidden" value="" id="sortName" name="sortName" /> <input
							type="hidden" value="" id="sortBy" name="sortBy" /> <input
							type="hidden" value="" id="type" name="type" />
					</form>
				</div>

			</div>

		</div>


		<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

		<script
			src="<c:url value='/template/library/jquery/jquery.twbsPagination.js' />"></script>

	</div>
	<script type="text/javascript">
	
	$('.xetduyet').click(function(event){
        Swal.fire({
        title: 'Phục hồi tài khoản này ?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes'
        }).then((result) => {
        if (result.isConfirmed) {
        	$("#"+event.target.id).submit();
        }
    })
    });
	
	
	var totalPages = ${totalPage};
	var currentPage = ${page};
	var limit = 20;
	$(function() {
		window.pagObj = $('#pagination_delete').twbsPagination({
			totalPages : totalPages,
			visiblePages : 10,
			startPage : currentPage,
			onPageClick : function(event, page) {
				if (currentPage != page) {
					$('#maxPageItem').val(limit);
					$('#page').val(page);
					$('#sortName').val('id');
					$('#sortBy').val('desc');
					$('#type').val('delete');
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
	
	</script>

</body>
</html>