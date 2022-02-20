<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<%@page import="com.StaffManager.Model.ProjectModel"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>Danh sách dự án được nhận | Quản lý nhân viên</title>
</head>
<body>
	<script type="text/javascript"
		src="<c:url value='/template/staff/ckeditor/ckeditor.js' />"
		charset="UTF-8"></script>
	<!-- 4.0 -->
	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">Dự án đang làm</h1>
	</div>
	<!-- Content Row -->
	<div class="prj-bg-lzload" id="prj-lzloading">
		<div class="text-center ">
			<div class="spinner-grow  text-primary"
				style="width: 5rem; height: 5rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
	</div>

	<!-- Content Row -->
	<div class="row">

		<div class="col-12">
			<div class="card shadow mb-4">

				<div class="card-body">
					<div class="row mt-2">
						<div class="col-6">
							<div class="search-projects">
								<form class="prj-form-search" action="/projects" method="GET">
									<input type="hidden" value="search" id="prj-st" name="type" />
									<!--project search type-->
									<input type="hidden" value="keywork" id="prj-so" name="option" />
									<!--project search option-->
									<input type="text" name="keyword" class="form-control"
										id="prj-skw" placeholder="Tìm kiếm tên dự án..."
										onKeyPress="pressKeyboard(event, this)" required>
									<!--project search keyword-->
									<button type="submit" class="btn prj-search-btn">
										<i class="fas fa-search"></i>
									</button>

								</form>

							</div>
						</div>

						<div class="col-6 prj-btns-func"></div>
					</div>
					<hr>
					<div class="table-responsive" style="overflow-x: srcoll !important">
						<table class="table table-bordered" id="dataTable">
							<thead>
								<tr>
									<th class="prj-tb-stt-col">#</th>
									<th class="prj-tb-name-col">Tên dự án</th>
									<th class="prj-tb-date-col">Bắt đầu</th>
									<th class="prj-tb-done-col">Hoàn thành</th>
									<th class="prj-tb-date-col">Thời hạn</th>
									<th class="prj-tb-detail-col">Chi tiết</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th class="prj-tb-stt-col">#</th>
									<th class="prj-tb-name-col">Tên dự án</th>
									<th class="prj-tb-date-col">Bắt đầu</th>
									<th class="prj-tb-done-col">Hoàn thành</th>
									<th class="prj-tb-date-col">Thời hạn</th>
									<th class="prj-tb-detail-col">Chi tiết</th>
								</tr>
							</tfoot>
							<tbody>
								<%
								ArrayList<ProjectModel> list = (ArrayList) request.getAttribute("list");
								int currentPage = (int) request.getAttribute("currentPage");
								int maxPages = (int) request.getAttribute("maxPages");
								if (list != null) {
									for (ProjectModel i : list) {
								%>
								<tr>
									<th><%=  ((currentPage-1) * 20)  + list.indexOf(i) +1  %></th>
									<td><a   <% if(i.getRoot() != i.getId()){ %> class="text-danger" <%}%> href="/projects?type=view&id=<%=i.getId()%>">
									<%=i.getName()%>
									</a></td>
									<td><%=i.convertTime(i.getBeginDate(), 1)%> <br /></td>
									<td>
										<div class="prj-bg-prsbar">
											<div class="prj-prsbar-ps"
												style="width: <%=i.getProgress()%>%;">
												<span><%=i.getProgress()%>%</span>
											</div>
										</div>
									</td>
									<td><%=i.getDuration()%>h</td>
									<th>
										<div class="prj-btns-func">

											<a href="/projects?type=view&id=<%=i.getId()%>"
												class="prj-btn-func prj-btn-view"><i class="fa fa-eye"
												aria-hidden="true"></i>&nbsp; Xem </a> <a
												href="/projects?type=add&id=<%=i.getId()%>"
												class="prj-btn-func prj-btn-add"> <i class="fa fa-plus"
												aria-hidden="true"></i>&nbsp; Thêm
											</a> <a class="prj-btn-func prj-btn-edit"
												href="/projects?type=edit&id=<%=i.getId()%>"> <i
												class="fa fa-wrench" aria-hidden="true"></i>&nbsp; Sửa
											</a>
										</div>
									</th>
								</tr>
								<%
								}
								} else {
								%>
								<tr>
									<th class="text-primary" colspan="6">Không có dự án mới</th>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
					<form action="<c:url value='/projects'/>" id="formSubmit"
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
		<div class="card-header col-12">
			<a href="/projects?type=view">Xem tất cả dự án</a>

		</div>
	</div>
	<div class="modal fade" id="prj-add-child-1" data-backdrop="static"
		data-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title" id="staticBackdropLabel">Dự án 2</h2>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="/projects" method="post" id="prf-form-add-1"
					onsubmit="lazySubmit(event)">
					<div class="modal-body">
						<h2 class="modal-title">Thêm dự án con</h2>
						<div class="row">
							<div class="col-lg-3"></div>
							<div class="col-lg-6">
								<input type="hidden" name="type" value="add" /> <label
									for="prj-name-child-1">Tên dự án: </label> <input
									id="prj-name-child-1" class="form-control" type="text"
									name="name" value="" required="required"
									placeholder="Nhập tên dự án con..." /> <label
									for="prj-stdate-child-1">Ngày bắt dầu: </label> <input
									id="prj-stdate-child-1" class="form-control" type="date"
									name="beginDate" value="" required="required"
									placeholder="Ngày bắt đầu" /> <label
									for="prj-time-exit-child-1">Thời hạn(giờ):</label> <input
									id="prj-time-exit-child-1" class="form-control" type="number"
									name="duration" value="" required="required"
									placeholder="Thời hạn" step="0.5"> <label
									for="prj-dsc-child-1">Mô tả</label>
								<textarea class="form-control ckeditor" rows="10" cols=""
									id="prj-dsc-child-1" name="description" required="required"
									lang="vi"></textarea>
							</div>
							<div class="col-lg-3"></div>
						</div>
						<br /> <br />

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="submit" class="prj-btn-func prj-btn-add">
								<i class="fa fa-floppy-o" aria-hidden="true"></i> Lưu
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script
		src="<c:url value='/template/library/jquery/jquery.twbsPagination.js' />"></script>

	<script>
		function pressKeyboard(e, input) {
			if (e.keyCode === 13) { // check enter press
				document.getElementById("prj-skw").submit();
			}
		}
		var totalPages = <%=maxPages%>;
		var currentPage = <%=currentPage%>;
		var limit = 20;
		$(function() {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages : totalPages,
				visiblePages : 5 ,
				startPage : currentPage,
				onPageClick : function(event, page) {
					if (currentPage != page) {
						$('#maxPageItem').val(limit);
						$('#page').val(page);
						$('#sortName').val('root');
						$('#sortBy').val('desc');
						$('#type').val('list');
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