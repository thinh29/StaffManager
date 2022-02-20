<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<%@page import="com.StaffManager.Model.ProjectModel"%>
<%@page import="com.StaffManager.Model.AccountModel"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>Tất cả dự án | Quản lý nhân viên</title>
</head>
<body>
	<script type="text/javascript"
		src="<c:url value='/template/library/ckeditor/ckeditor.js' />"
		charset="UTF-8"></script><!-- 4.0 -->
	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">Thùng rác dự án</h1>
		<div class="d-sm-inline-block ">
			<a href="/admin/projects"
				class="btn btn-sm btn-primary shadow-sm"> <i
				class="fas fa-arrow-alt-circle-down fa-sm text-white-50"></i> Tất cả dự án
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

				<div class="card-body">
					<div class="row mt-2">
						<div class="col-6">
							<div class="search-projects">
								<form class="prj-form-search" action="/admin/projects" method="GET">
									<input type="hidden" value="search-trash" id="prj-st" name="type" />
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
								
											<form action="/admin/projects?type=restore" method="post">
												<input type="hidden" name="id" value="<%=i.getId()%>">
												<button style="border:none" type="submit" class="prj-btn-func prj-btn-edit recycle-project">
												<i class="fa fa-redo" aria-hidden="true"></i>&nbsp; Phục hồi
												</button>
											</form>
										</div>
									
									</th>
								</tr>
								<%}}
								else {%>
								<tr><th class="text-primary" colspan="6">Thùng rác rỗng</th></tr>
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
		<div class="card-header col-12">
			<a href="/admin/projects">Xem tất cả dự án</a>

		</div>
	</div>
	
	<script>
	document.addEventListener("DOMContentLoaded", function() {
		function pressKeyboard(e, input) {
			if (e.keyCode === 13) { // check enter press
				document.getElementById("prj-skw").submit();
			}
		}
		var totalPages = <%= maxPages %>;;
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
		
		$( ".recycle-project" ).click(function( event ) {
			  event.preventDefault();
			  Swal.fire({
				  title: 'Phục hồi dự án  ?',
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Phục hồi !'
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

	});
	</script>

</body>
</html>