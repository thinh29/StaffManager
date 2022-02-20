<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông báo | Quản trị viên</title>
</head>
<body>
	<!-- Page Heading -->
	<div class="prj-bg-lzload" id="prj-lzloading">
		<div class="text-center ">
			<div class="spinner-grow  text-primary" style="width: 5rem; height: 5rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
	</div>
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">Danh sách thông báo</h1>
		<div class="d-sm-inline-block ">
			<a href="/admin/notifications?type=delete"
				class="btn btn-sm btn-secondary shadow-sm"> <i
				class="fas fa-trash fa-sm text-white-50"></i> Thùng rác
			</a> <a href="/admin/notifications?type=add"
				class="btn btn-sm btn-primary shadow-sm"> <i
				class="fas fa-arrow-alt-circle-down fa-sm text-white-50"></i> Thêm
				thông báo
			</a>


		</div>
	</div>
	<!-- Content Row -->

	<!-- Content Row -->
	<div class="row">

		<div class="col-12">
			<div class="card  mb-4">
				<div class="card-body">

					<div class="table-responsive">
						<table class="table table-bordered table-hover" id="dataTable" style ="width:100%; cellspacing:0;"
							>
							<thead class="text-center ">
								<tr>
									<th class="align-middle">STT</th>
									<th class="align-middle">Tiêu đề thông báo</th>
									<th class="align-middle">Nội Dung</th>
									<th class="align-middle">Ngày thông báo</th>
									<th class="align-middle"></th>
								</tr>
							</thead>
							<tfoot class="text-center">
								<tr>
									<th class="align-middle">STT</th>
									<th class="align-middle">Tiêu đề thông báo</th>
									<th class="align-middle">Nội Dung</th>
									<th class="align-middle">Ngày thông báo</th>
									<th class="align-middle"></th>
								</tr>
							</tfoot>
							
							<tbody class="text-center"> 
							<c:forEach var="notifications" items="${listNoti}" varStatus="loop">
								<tr>
									<td>${(page-1)*10 + loop.index +1}</td>
									<td class="font-weight-bold text-center"><a
										href="/admin/notifications?type=view&id=${notifications.id }">${notifications.title} </a> <span
										class="badge badge-pill badge-${listLevel.get(notifications.level-1).background} float-right">${listLevel.get(notifications.level-1).name}</span>
									</td>
									<td>
									<c:set var = "content" value = "${fn:substring(notifications.content, 0, 50)}" />
									${content }
									</td>
									<td>
									 <fmt:formatDate value="${notifications.createAt}" var="crAt"
																pattern="dd/MM/yyyy HH:mm" />
									${crAt}</td>
									<td>
										<div class="dropdown show">
											<a class="btn btn-primary btn-sm shadow-sm dropdown-toggle"
												href="#" role="button" id="t-action" data-toggle="dropdown"
												aria-haspopup="true" aria-expanded="false"> Xử lý </a>

											<div class="dropdown-menu" aria-labelledby="t-action">
												<a class="dropdown-item"
													href="/admin/notifications?type=view&id=${notifications.id}">Xem</a> <a
													class="dropdown-item"
													href="/admin/notifications?type=edit&id=${notifications.id}">Chỉnh sửa</a> 
													<button class="dropdown-item " 
													data-toggle="modal" data-target="#del-staff-${notifications.id}"
													>Xoá</button>
											</div>
										</div>
										<div class="modal fade" id="del-staff-${notifications.id}"
													data-backdrop="static" data-keyboard="false" tabindex="-1"
													aria-labelledby="staticBackdropLabel" aria-hidden="true">
													<div class="modal-dialog modal-dialog-centered modal-sm">
														<div class="modal-content">
															<div class="modal-header">
																<label>Xóa thông báo <Strong>${notifications.title }</Strong></label>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<form
																action="<c:url value='/admin/notifications?type=delete&id=${notifications.id}'/>"
																method="POST" onsubmit="lazySubmit(event)"
																id="stm-del-${notifications.id }">
																<div class="modal-body">
																	<div class="col-sm-12">
																		<div style="margin: auto; text-align: center;">
																			<b> Xác nhận xóa? </b>
																		</div>
																	</div>
																	<br />
																	
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-dismiss="modal">Close</button>
																	<button type="submit" class="btn btn-danger">Xóa</button>
																</div>
															</form>
														</div>
													</div>
												</div>
									</td>
									<!-- <td class="d-none">
									<form action="/admin/notifications" id="noti-form-delete" method="post">
				                    	<input type="hidden" name="type" value="del">
				                    	<input type="hidden" name="id" value="1">
				                    </form>
				                    </td> -->
								</tr>
								
							
							</c:forEach>
							</tbody>
						</table>
						
					</div>
					
							<form action="<c:url value='/admin/notifications'/>" id="formSubmit"
				method="POST">
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
		
		document.addEventListener("DOMContentLoaded", function() {
			var totalPages = ${totalPage};
			var currentPage = ${page};
			var limit = 10;
			$(function() {
				window.pagObj = $('#pagination').twbsPagination({
					totalPages : totalPages,
					visiblePages : 10,
					startPage : currentPage,
					onPageClick : function(event, page) {
						if (currentPage != page) {
							$('#maxPageItem').val(limit);
							$('#page').val(page);
							$('#sortName').val('title');
							$('#sortBy').val('desc');
							$('#type').val('list-view');
							$('#formSubmit').submit();
						}
					}
				});
			}(jQuery));
			
			$(".noti-delete").click(function(){
    			Swal.fire({
    				  title: 'Xoá thông báo ?',
    				  icon: 'warning',
    				  showCancelButton: true,
    				  confirmButtonColor: '#3085d6',
    				  cancelButtonColor: '#d33',
    				  confirmButtonText: 'Xoá !'
    				}).then((result) => {
    				  if (result.isConfirmed) {
    					  lazySubmit(event);
    				  }
    				})
    			});

		});
	</script>
</body>
</html>