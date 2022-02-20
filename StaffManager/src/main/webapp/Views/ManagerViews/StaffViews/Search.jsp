<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tìm kiếm "${s}" | Quản lý nhân sự</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">

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
			<h4 class="m-0 font-weight-bold text-primary">Tìm kiếm tên:
				"${s}"</h4>
		</div>
		<div class="row">
			<div class="col-md-6">
				<form class="stf-form-search" action="/manager/staffs" method="POST"
					id="stf-skw" onsubmit="lazySubmit(event)">
					<input type="hidden" value="search" id="prj-st" name="type" />
					<!--project search type-->
					<input type="hidden" value="keywork" id="prj-so" name="option" />
					<!--project search option-->
					<input type="text" name="s" class="form-control" id="prj-skw"
						placeholder="Tìm kiếm tên nhân viên..."
						onKeyPress="pressKeyboard(event, this)" required>
					<!--project search keyword-->
					<button type="submit" class="btn stf-search-btn">
						<i class="fas fa-search"></i>
					</button>

				</form>
			</div>
			<div class="col-md-6">
				<div class="text-right" style="margin: 10px;">
					<a href="/manager/staffs?type=add" class="btn btn-primary"> <i
						class="fa fa-plus-square"></i> Thêm
					</a> <a href="/manager/staffs?type=delete" class="btn btn-secondary">
						<i class="fa fa-trash"></i> Thùng rác
					</a>
				</div>
			</div>
		</div>

		<div class="card-body">
			<div class="table-responsive" style="overflow-x: srcoll !important">
				<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-bordered" id="dataTable"
								style="width: 100%; cellspacing: 0;">
								<thead>
									<tr role="row">
										<th>Stt</th>
										<th>Họ Tên</th>
										<th>Ngày Sinh</th>
										<th>Giới Tính</th>
										<th>Vị Trí</th>
										<th>Ngày Tạo</th>
										<th>Tùy Chọn</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>Stt</th>
										<th>Họ Tên</th>
										<th>Ngày Sinh</th>
										<th>Giới Tính</th>
										<th>Vị Trí</th>
										<th>Ngày Tạo</th>
										<th>Tùy Chọn</th>
									</tr>
								</tfoot>
								<tbody>

									<c:forEach var="staff" items="${listStaffs}" varStatus="loop">
										<tr class="odd">
											<td>${(page-1)*20 + loop.index +1}</td>
											<td>${staff.fullName}</td>
											<td>${staff.dateOfBirth}</td>
											<td>${staff.sexName }</td>
											<%-- <td>${positionStaffs.get(staff.sex).name}</td> --%>
											<td>${positionStaffs.get(staff.position - 1).name}</td>
											<td>${staff.createAt}</td>
											<td><a
												href="<c:url value='/manager/staffs?type=view&id=${staff.id }'/> "
												class="btn btn-primary stm-btn-view"> <i
													class="far fa-eye"></i> Xem
											</a> <a class="btn btn-success stm-btn-view"
												href="<c:url value='/manager/staffs?type=edit&id=${staff.id }'/> "><i
													class="fas fa-edit"></i> Sửa</a>
												<button class="btn btn-danger stm-btn-view"
													data-toggle="modal" data-target="#del-staff-${staff.id}">
													<i class="far fa-trash-alt"></i> Xóa
												</button>
												<div class="modal fade" id="del-staff-${staff.id}"
													data-backdrop="static" data-keyboard="false" tabindex="-1"
													aria-labelledby="staticBackdropLabel" aria-hidden="true">
													<div class="modal-dialog modal-dialog-centered modal-sm">
														<div class="modal-content">
															<div class="modal-header">
																<label>Xác nhận xóa ${staff.fullName}</label>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<form
																action="<c:url value='/manager/staffs?type=delete&id=${staff.id}'/>"
																method="POST" onsubmit="lazySubmit(event)"
																id="stm-del-${staff.id }">
																<div class="modal-body">
																	<div class="col-sm-12">
																		<div style="margin: auto; text-align: center;">
																			<b> Xác Nhận Xóa ? </b>
																		</div>
																	</div>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-dismiss="modal">Close</button>
																	<button type="submit" class="btn btn-primary">OK</button>
																</div>
															</form>

														</div>
													</div>
												</div></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<form action="<c:url value='/manager/staffs'/>" id="formSubmit"
				method="POST">
				<ul class="pagination" id="pagination"></ul>
				<input type="hidden" value="" id="page" name="page" /> <input
					type="hidden" value="" id="maxPageItem" name="maxPageItem" /> <input
					type="hidden" value="" id="sortName" name="sortName" /> <input
					type="hidden" value="" id="sortBy" name="sortBy" /> <input
					type="hidden" value="" id="type" name="type" /><input
					type="hidden" value="" id="s" name="s" /><input type="hidden"
					value="" id="option" name="option" />
			</form>
		</div>
	</div>

	<!-- Custom scripts for all pages-->


	<script src="<c:url value='/template/library/jquery/jquery.min.js'/>"></script>
	<!-- Page level plugins -->
	<script
		src="<c:url value = '/template/library/js/jquery.dataTables.min.js'/>"></script>
	<script
		src="<c:url value = '/template/library/js/dataTables.bootstrap4.min.js'/>"></script>
	<script
		src="<c:url value = '/template/library/jquery/jquery.twbsPagination.js' />"></script>
	<script>
		function pressKeyboard(e, input) {
			if (e.keyCode === 13) { // check enter press
				document.getElementById("stf-skw").submit();
			}
		}
		var totalPages = ${totalPage};
		var currentPage = ${page};
		var s = '${s}';
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
						$('#type').val('search');
						$('#option').val('st-act')
						$('#s').val(s);
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
			}, 1000);			
		}
		</script>
</body>
</html>