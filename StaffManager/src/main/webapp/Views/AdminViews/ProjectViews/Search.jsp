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
<title>Tìm kiếm dự án | Quản lý nhân viên</title>
</head>
<body>
	<script type="text/javascript"
		src="<c:url value='/template/labrary/ckeditor/ckeditor.js' />"
		charset="UTF-8"></script><!-- 4.0 -->
	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">Tất cả dự án</h1>
		<div class="d-sm-inline-block ">
			<a href="/admin/projects?type=delete"
				class="btn btn-sm btn-secondary shadow-sm"> <i
				class="fas fa-trash fa-sm text-white-50"></i> Thùng rác
			</a> <a href="/admin/projects?type=add"
				class="btn btn-sm btn-primary shadow-sm"> <i
				class="fas fa-arrow-alt-circle-down fa-sm text-white-50"></i> Thêm dự án
			</a>
		</div>
	</div>
	<!-- Content Row -->
	<div class="prj-bg-lzload" id="prj-lzloading">
		<div class="text-center ">
			<div class="spinner-grow  text-primary" style="width: 5rem; height: 5rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
	</div>

	<!-- Content Row -->
	<div class="row">

		<div class="col-12">
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<select class="form-control"
						onchange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
						<option selected="selected"
							value="/admin/projects?type=search&option=done&status=all">Tất
							cả dự án</option>
						<option value="/admin/projects?type=search&option=done&status=finished">Đã
							hoàn thành</option>
						<option
							value="/admin/projects?type=search&option=done&status=unfinished">Chưa
							hoàn thành</option>
					</select>

				</div>
				<div class="card-body">
					<div class="row mt-2">
						<div class="col-6">
							<div class="search-projects">
								<form class="prj-form-search" action="/admin/projects" method="GET">
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

						<div class="col-6 prj-btns-func">
							
						</div>
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
								int currentPage =  (int)request.getAttribute("currentPage");
								int maxPages = (int) request.getAttribute("maxPages");
								if(list != null){
					            for (ProjectModel i : list) {
       			 				%>
								<tr>
									<th><%=  ((currentPage-1) * 20)  + list.indexOf(i) +1  %></th>
									<td><a href="/admin/projects?type=view&id=<%=i.getId()%>">
									<%=i.getName()%>
									</a></td>
									<td><%=i.convertTime(i.getBeginDate(),1)%> <br />
									</td>
									<td>
										<div class="prj-bg-prsbar">
											<div class="prj-prsbar-ps" style="width: <%= i.getProgress() %>%;">
												<span><%= i.getProgress() %>%</span>
											</div>
										</div>
									</td>
									<td><%= i.getDuration() %>h</td>
									<th>
										<div class="prj-btns-func">

											<a href="/admin/projects?type=view&id=<%=i.getId()%>"
												class="prj-btn-func prj-btn-view"><i class="fa fa-eye"
												aria-hidden="true"></i>&nbsp; Xem </a> 
											<a href="/admin/projects?type=add&id=<%=i.getId()%>" class="prj-btn-func prj-btn-add">
												<i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Thêm
											</a>
											<a class="prj-btn-func prj-btn-edit"
												href="/admin/projects?type=edit&id=<%=i.getId()%>"> <i class="fa fa-wrench"
												aria-hidden="true"></i>&nbsp; Sửa
											</a>
											<form action="/admin/projects?type=delete" method="post">
												<input type="hidden" name="id" value="<%=i.getId()%>">
												<button style="border:none" type="submit" class="prj-btn-func prj-btn-delete"><i class="fas fa-trash"
												aria-hidden="true"></i>&nbsp; Xoá</button>
											</form>
										</div>
									</th>
								</tr>
								<%}}
								else {%>
								<tr><th class="text-primary" colspan="6">Không tìm thấy dự án</th></tr>
								<%} %>
							</tbody>
						</table>
					</div>
					<form action="<c:url value='/admin/projects'/>" id="formSubmit"
						method="get">
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
	document.addEventListener("DOMContentLoaded", function() {
		
		$( ".prj-btn-delete" ).click(function( event ) {
			  event.preventDefault();
			  Swal.fire({
				  title: 'Xoá dự án  ?',
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Xoá !'
				}).then((result) => {
				  if (result.isConfirmed) {
					  var x = document.getElementById('prj-lzloading');
						x.classList.add("d-flex");	
						var form = $(this).parent("form");			
						setTimeout(() => {
							form.submit();
							x.classList.remove("d-flex");	
						}, 2000);		
					  
				  }
				})
				
		});
		function pressKeyboard(e, input) {
			if (e.keyCode === 13) { // check enter press
				document.getElementById("prj-skw").submit();
			}
		}
		var totalPages = <%= maxPages %>;
		var currentPage = <%=  currentPage %>;
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
						$('#sortName').val('title');
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

	});
	</script>

</body>
</html>