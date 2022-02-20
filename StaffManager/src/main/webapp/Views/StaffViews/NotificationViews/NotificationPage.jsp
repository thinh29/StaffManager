<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>Thông báo ${sizeNotificationUnseen==0?'':'('}${sizeNotificationUnseen==0?'':sizeNotificationUnseen}${sizeNotificationUnseen==0?'':')'} | Quản lý nhân viên</title>
</head>
<body>

	<script src="<c:url value='/template/library/jquery/jquery.min.js'/>"></script>
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">Tất cả thông báo</h1>
	</div>

		<div class="col-12">
			<div class="card shadow mb-4">

				<div class="row">
				<div class="card-body">
				<div class="row">
					<div class="col-4">
						<div class="search-projects">
							<form class="prj-form-search"
								action="<c:url value='/notifications'/>" method="post">
								<input type="hidden" value="search" id="account-st" name="type" />
								<input type="text" name="keyword" class="form-control"
									id="titleSearch"
									placeholder="Tìm kiếm theo tiêu đề thông báo..."
									onKeyPress="pressKeyboard(event, this)" required>
								<button id="btn-search" type="submit" class="btn prj-search-btn">
									<i class="fas fa-search"></i>
								</button>

							</form>
						</div>
					</div>
					
					<div class="col-8">
					<div class="text-right">
					<div class="btn-group">
  						<button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    					Lọc
  						</button>
  						<form action="<c:url value='/notifications?type=search'/>" method="post">
  						<div class="dropdown-menu">
    						<button class="dropdown-item" type="submit" name="action" value="unseen">Chưa xem</button>
   	 						<button class="dropdown-item" type="submit" name="action" value="seen">Đã xem</button>
    					<div class="dropdown-divider"></div>
    					<button class="dropdown-item" type="submit" name="action" value="">Xem tất cả</button>
  						</div>
  						</form>
  						
						</div>
					</div>
					
					</div>
				</div>
					
					

					<div class="row mb-3">
						<c:if test="${not empty message}">
							<div class="alert alert-${alert}">${message}</div>
						</c:if>
					</div>

					<div class="table-responsive" style="overflow-x: srcoll !important">
						<table class="table table-bordered" id="dataTable">
							<thead>
								<tr>
									<th class="prj-tb-stt-col">#</th>
									<th class="prj-tb-name-col">Tiêu đề</th>
									<th class="prj-tb-date-col">Ngày thông báo</th>
									<th class="prj-tb-date-col">Trạng thái xem</th>
									<th class="prj-tb-date-col">Thao tác</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th class="prj-tb-stt-col">#</th>
									<th class="prj-tb-name-col">Tiêu đề</th>
									<th class="prj-tb-date-col">Ngày thông báo</th>
									<th class="prj-tb-date-col">Trạng thái xem</th>
									<th class="prj-tb-date-col">Thao tác</th>
								</tr>
							</tfoot>
							<tbody class="text-center">
								<c:forEach var="item" items="${notification.listResult}"
									varStatus="loop">
									<tr>
										<th>${(page-1)*5 + loop.index +1}</th>
										<td class="font-weight-bold text-left"><a
											href="/notifications?type=view&id=${item.id}">${item.title}</a>
											<span class="badge badge-pill badge-${item.backgroundName} float-right">${item.levelName}</span>
											</td>
										<td>
										<fmt:formatDate value="${item.createAt }" pattern="dd-MM-yyyy HH:mm"/>
										</td>
					
										<td>
										<c:if test="${seen.get(loop.index)==0}">
										<i class="fas fa-times" style="color:red" aria-hidden="true"></i>
										</c:if>
										<c:if test="${seen.get(loop.index)!=0}">
										<i class="fas fa-check-circle" style="color:green" aria-hidden="true"></i>
										</c:if>
										</td>
										<th>
											<button class="prj-btn-func prj-btn-delete"
														data-toggle="modal" data-target="#ntf-delete-${item.id}">
														<i class="fa fa-times" aria-hidden="true"></i>&nbsp; Xóa
													</button>

											<div class="modal fade" id="ntf-delete-${item.id}"
												data-backdrop="static" data-keyboard="false" tabindex="-1"
												aria-labelledby="staticBackdropLabel" aria-hidden="true">
												<div class="modal-dialog modal-dialog-centered modal-xl">
													<div class="modal-content">
														<div class="modal-header">
															<h2 class="modal-title" id="staticBackdropLabel">Xóa
																thông báo</h2>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<form action="/notifications?type=delete&id=${item.id}"
															method="post" id="prf-form-add-${item.id}"
															onsubmit="lazySubmit(event)">
															<div class="modal-body">
																<h2 class="modal-title">Tiêu đề: ${item.title}</h2>
																<div class="row">
																	<div class="col-lg-3"></div>
																	<div class="col-lg-6">
																		<label>Bạn có muốn xóa thông báo này không ?</label>
																	</div>
																	<div class="col-lg-3"></div>
																</div>
																<br /> <br />

																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-dismiss="modal">Close</button>

																	<button type="submit"
																		class="prj-btn-func prj-btn-delete">
																		<i class="fa fa-floppy-o" aria-hidden="true"></i> Xóa
																	</button>
																</div>
															</div>
														</form>
													</div>
												</div>
											</div>
										</th>
									</tr>

								</c:forEach>


							</tbody>
						</table>
					</div>
					<form action="<c:url value='/notifications'/>" id="formSubmit"
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
					document.getElementById("titleSearch").submit();
				}
			}
		});

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

	</script>
</body>
</html>