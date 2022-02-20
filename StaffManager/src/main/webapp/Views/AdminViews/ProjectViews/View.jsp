<%@page import="com.StaffManager.Model.AccountModel"%>
<%@page import="com.StaffManager.Model.HistoryProjectModel"%>
<%@page import="com.StaffManager.Model.ProjectModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.StaffManager.Model.PositionProjectModel"%>
<%@page import="com.StaffManager.Model.JoinProjectModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%  ProjectModel project = (ProjectModel) request.getAttribute("project") ; %>
<title><%=project.getName()%> | Quản lý dự án</title>

<body>
</head>
<style>
.swal-wide{height:auto;}
.swal2-input{width:300px;}
</style>
<div class="prj-bg-lzload" id="prj-lzloading">
		<div class="text-center ">
			<div class="spinner-grow  text-primary" style="width: 5rem; height: 5rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
	</div>
	<div class="modal-dialog modal-dialog-centered modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<div>
					<h2 class="modal-title"><%=project.getName()%></h2>
				</div>
				<% Boolean del = (Boolean) request.getAttribute("del");  %>			
				<% if(!del){ %>
				<a href="javascript:void(0);" class="prj-btn-func prj-btn-add add-user">
					<i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Thêm người vào dự án
				</a>
				<%} %>
			</div>
			<div class="modal-body">
				<%if(del){ %>
				<div class="alert alert-danger" role="alert">
				Dự án đã bị <b>Xoá</b> .Vui lòng phục hồi nếu tiếp tục dự án</br>
				</div>
				<%} %>
				<div class="row">
					<div class="col-xl-4 col-lg-5">
						<div class="card shadow mb-4">
							<!-- Card Header - Dropdown -->
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">Tiến Dộ</h6>
							</div>
							<!-- Card Body -->
							<div class="card-body">
								<div class="chart-pie pt-4">
									<canvas id="myPieChart"></canvas>
								</div>
							</div>
							
						</div>
						<div class="card shadow mb-4">
							<!-- Card Header - Dropdown -->
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">Thành viên tham gia</h6>
							</div>
							<!-- Card Body -->
							<div class="card-body p-1 m-2">
								<div class="form-group">
								    <select multiple class="form-control member " style="height:140px;overflow:auto">
								      <% 
								      ArrayList<JoinProjectModel>  listMember = (ArrayList) request.getAttribute("listMember") ; 
								      ArrayList<Long> value = new ArrayList<Long>();
								      %>
								      <% for(JoinProjectModel i : listMember) {%>
											<option value="<%= i.getId() %>" data-account="<%= i.getAccountId() %>"><%= i.getAccountName() %> - <%= i.getPositionName()%></option>
									  <%
									  value.add(i.getAccountId());
								      } %>

								    </select>
								  </div>
							</div>
							
						</div>
						
					</div>
					<div class="col-md-8">
						<div class="card mb-3">
							<div class="card-body">
							<% if(project.getParentId() != 0 ) {%>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Tên dự án cha</h6>
									</div>
									<div class="col-sm-9 text-secondary">
									<%  ProjectModel projectParent = (ProjectModel) request.getAttribute("projectParent") ; %>									
										<%= projectParent.getName() %>
									</div>
								</div>
								<hr>
							<% } %>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Người quản lý</h6>
									</div>
									<div class="col-sm-9 text-secondary"><%= request.getAttribute("managerName") %></div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Người đang thực hiện</h6>
									</div>
									<div class="col-sm-9 text-secondary"><%= request.getAttribute("accountName") %></div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Trạng thái</h6>
									</div>
									<div class="col-sm-9 text-secondary"><%= request.getAttribute("status") %></div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Ngày bắt đầu</h6>
									</div>
									<div class="col-sm-9 text-secondary"><%= project.convertTime(project.getBeginDate(),2) %></div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Dự kiến kết thúc</h6>
									</div>
									<div class="col-sm-9 text-secondary"><%= project.convertTime(project.getExpectedDate(),2) %></div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Ngày Kết Thúc</h6>
									</div>
									<div class="col-sm-9 text-secondary">
									<% if(project.getFinishDate() == null ) {%>
									---
									<% } else { %>
										<%= project.convertTime( project.getFinishDate(),2 ) %>
									<% }%>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Người Tạo</h6>
									</div>
									<div class="col-sm-9 text-secondary"><%= request.getAttribute("createByName")  %></div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Ngày Tạo</h6>
									</div>
									<div class="col-sm-9 text-secondary"><%= project.convertTime( project.getCreateAt(),2 ) %></div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Mô Tả</h6>
									</div>
									<div class="col-sm-9 text-secondary">
									<% if(project.getDescription() == null ) {%>
									---
									<% } else { %>
										<%= project.getDescription() %>
									<% }%>
									</div>
										
										<br> <br></br>
									</div>
								</div>
								<hr>
								<% if((project.getParentId() == 0) && !del ) {%>
								<a href="/admin/projects?type=add&id=<%= project.getId() %>"
									class="prj-btn-func prj-btn-add"> <i class="fa fa-plus"
									aria-hidden="true"></i>&nbsp; Thêm dự án con
								</a>
								<hr>
								<%}%>
							</div>

						</div>

					</div>
					<br> <br>
				</div>
				<%
				ArrayList<ProjectModel> list = (ArrayList) request.getAttribute("child_project");	
       			%>
       			<% if( (list != null) && (!del) ) { %>
				<div class="row">
					<div class="col-md-12">
						<div class="card-header py-3 d-flex">
							<h6 class="m-0 align-middle font-weight-bold text-primary">Danh
								sách dự án con</h6>
							<div class="ml-auto m-0 align-middle font-weight-bold">
							<a href="#" class="text-danger" data-toggle="modal" data-target="#recycleProject">Thùng rác</a>
							</div>
						</div>
						<div class="table-responsive">
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
					            for (ProjectModel i : list) {
       			 				%>
									<tr>
										<th><%= list.indexOf(i) +1 %></th>
										<td><a href="/admin/projects?type=view&id=<%=i.getId()%>"><%=i.getName()%></a></td>
										<td style="width:150px"><%=i.convertTime(i.getBeginDate(),1)%>
										</td>
										<td>
											<div class="prj-bg-prsbar">
												<div class="prj-prsbar-ps" style="width: <%= i.getProgress() %>%;">
													<span><%= i.getProgress() %>%</span>
												</div>
											</div>
										</td>
										<td><%= i.getDuration()%>h</td>
										<th>
											<div class="prj-btns-func">

												<a href="/admin/projects?type=view&id=<%=i.getId()%>"
													class="prj-btn-func prj-btn-view"><i class="fa fa-eye"
													aria-hidden="true"></i>&nbsp; Xem </a> 
												<a class="prj-btn-func prj-btn-edit"
													href="/admin/projects?type=edit&id=<%=i.getId()%>"> <i
													class="fa fa-wrench" aria-hidden="true"></i>&nbsp; Sửa
												</a>
												<form action="/admin/projects?type=delete" method="post">
												<input type="hidden" name="id" value="<%=i.getId()%>">
												<button style="border:none" type="submit" class="prj-btn-func prj-btn-delete"><i class="fas fa-trash"
												aria-hidden="true"></i>&nbsp; Xoá</button>
											</form>
											</div>
										</th>
									</tr>
								<%}%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<%}%>
				<% HistoryProjectModel history = (HistoryProjectModel) request.getAttribute("history"); %>
				<% if( history != null ) {  %>
				<div class="row">
					<div class="col-md-12">
						<div class="card-header py-3">
							<h6 class="m-0 align-middle font-weight-bold text-primary">Lịch
								sử thay đổi</h6>
						</div>
						<div class="table-responsive m-3">
							<div class="prj-hst-change">
								<label class="prj-lb-hst text-uppercase font-weight-bold text-success"><%= history.getTitle() %></label>
								<hr>
								<p>
									<b>Ngày cập nhật :  </b><%=  history.getCreateAt()  %> 
								</p>
								<hr>
								<p>
									<b>Người cập nhật : </b><%= request.getAttribute("updateName") %>
								</p>
								
								<hr>
								<div class="prj-hst-content">
									<label class="prj-lb-content font-weight-bold">Nội dung : </label>
									<% if(!history.getAssignFrom().equals(history.getAssignTo())){ %>
									<p>
										( Chuyển giao từ : <%= request.getAttribute("assignFrom") %>  đến <%= request.getAttribute("assignTo") %> )
									</p>
									<%}%>
									<% if(!history.getStatusFrom().equals(history.getStatusTo())){ %>
									<p>
										( Trạng thái từ : <%= request.getAttribute("oldStatus") %>   sang <%= request.getAttribute("newStatus") %>  )
									</p>
									<%}%>
									<div><%= history.getContent() %></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<% } %>
				<div class="modal-footer d-flex">
				<% if(!del){ %>
				<div class="mr-auto m-0 align-middle font-weight-bold">
							<a href="#" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#recycleProject"><i class="fas fa-trash" aria-hidden="true"></i> Thùng rác</a>
				</div>
				<%}%>
				<%if(project.getRoot() == project.getId()){ %>
					<a href="/admin/projects" type="button" class="btn btn-secondary">Về lại</a> 
				<%}else{%>
					<a href="/admin/projects?type=view&id=<%= project.getParentId() %>" type="button" class="btn btn-secondary">Về lại</a>
				<%} %>
				<% if(!del){ %>	
					<a href="/admin/projects?type=edit&id=<%=project.getId()%>" type="button"
						class="btn btn-primary">Sửa</a>
				<%}%>
				</div>
			</div>
		</div>
<%if(!del){ %>
<div class="modal" tabindex="-1" role="dialog" id="recycleProject">
  <div class="modal-dialog modal-xl"  role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Thùng rác dự án con</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="overflow:auto;height:500px;" >
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
							
							<tbody>
							<%
					            ArrayList<ProjectModel> list1 = (ArrayList) request.getAttribute("child_project_recycle");
								if(list1 != null){
					            for (ProjectModel i : list1) {
       			 			%>
								<tr>
									<th><%= list1.indexOf(i) +1 %></th>
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
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<%} %>
	<script type="text/javascript"
		src="<c:url value='/template/library/chart.js/Chart.min.js'/>"></script>
	<script>
		Chart.defaults.global.defaultFontFamily = 'Nunito',
				'-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
		Chart.defaults.global.defaultFontColor = '#858796';

		// Pie Chart Example
		var ctx = document.getElementById("myPieChart");
		var myPieChart = new Chart(ctx, {
			type : 'doughnut',
			data : {
				labels : [ "Chưa Hoàn Thành", "Đã Hoàn Thành" ],
				datasets : [ {
					data : [ <%= 100 - project.getProgress() %>, <%= project.getProgress() %> ],
					backgroundColor : [ '#DCDCDC', '#1cc88a' ],
					hoverBackgroundColor : [ '#2e59d9', '#17a673' ],
					hoverBorderColor : "rgba(234, 236, 244, 1)",
				} ],
			},
			options : {
				maintainAspectRatio : false,
				tooltips : {
					backgroundColor : "rgb(255,255,255)",
					bodyFontColor : "#858796",
					borderColor : '#dddfeb',
					borderWidth : 1,
					xPadding : 15,
					yPadding : 15,
					displayColors : false,
					caretPadding : 10,

				},
				legend : {
					display : true
				},
				cutoutPercentage : 80,
			},
		});
		<% 
		ArrayList<PositionProjectModel>  projectP = (ArrayList) request.getAttribute("positionProject") ; 
		ArrayList<AccountModel>  listStaff = (ArrayList) request.getAttribute("listStaff") ;
		%>
		<%if(!del){ %>
		document.addEventListener("DOMContentLoaded", function() {		
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
		
		$('.member option').dblclick(function() {
			Swal.fire({
				  title: 'Bạn có muốn xoá thành viên dưới khỏi dự án?',
				  text: this.text,
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes, delete it!'
				}).then((result) => {
				  if (result.isConfirmed) {
					  	if(parseInt(this.getAttribute("data-account")) == <%= project.getAccountId() %>) {
					  		Swal.fire('Người xoá đang thực hiện dự án!','Vui lòng chuyển giao công việc cho người khác','error');
					  	}
					  	else {
					 	$.post('/admin/projects', {type:'delete-member',id:this.value}, function(resp,status){ 
					  	}).done(function() {
						  	Swal.fire('Đã xoá!','Bạn đã xoá thành viên ','success').then(() => {									
						 		window.location.replace(location.href);
							});	
					    }).fail(function() {
					   	 	Swal.fire('Lỗi!','Xoá không thành công','error');
						});
					  	}
				    
				  }
			})
		});
		$( ".add-user" ).click(function( event ) {
			const { value: formValues } =  Swal.fire({
				  title: 'Thêm thành viên',
				  html:
					'<div>' +
					
					'<select name="user" class="swal2-input">' +
					'<option value=""> Chọn thành viên </option>' +
					<% for(AccountModel i : listStaff) {
					if(!value.contains(i.getId()) ){ 
					%>
					'<option value="<%= i.getId() %>"><%= i.getFullName() %> - <%= i.getPositionName()%></option>' +
					<%}}%>
					'</select>' +
					'<br>' + 
					'<select name="position" class="swal2-input">' +
					'<option value=""> Chọn vị trí </option>' +
					<% for(PositionProjectModel i : projectP) {%>
					'<option value="<%= i.getId() %>"><%= i.getName() %></option>' +
					<%}%>
					'</select>' +
				    '</div>',
				  
				  focusConfirm: false,
				  customClass: 'swal-wide',
				  preConfirm: () => {
					var i = $('select[name=user] option').filter(':selected').val() ; 
					var j = $('select[name=position] option').filter(':selected').val();
					var k = <%= project.getRoot()%> ; 
				    return [
				    	i,
				    	j,
				    	k
				      
				    ]
				  }
				}).then((result) => {
					  if (result.isConfirmed) {
						 	var i = result.value[0];
						 	var j = result.value[1];
						 	var k = result.value[2];
						 	if(result.value[0]=="" || result.value[1]==""  ){
						  		Swal.fire({
								      title: 'Lỗi!',
								      icon: 'error',
								      text: 'Vui lòng nhập tất cả các ô'
								      
								})
						  	}
						  	else{
						  	$.post('/admin/projects', {type:'add-member',aid:i, root:k, position:j}, function(resp,status){ 
						  		
						  	}).done(function() {
						  		Swal.fire({
						  			
								      title: 'Hoàn thành!',
								      icon: 'success',
								      text: 'Thêm thành công'								      
								}).then(() => {									
							 		window.location.replace(location.href);
								});	
						    }).fail(function() {
						    	Swal.fire({
								      title: 'Lỗi!',
								      icon: 'error',
								      text: 'Thêm không thành công'
								})
						    });
						  		
						  	}
						    
						  }
						})

				
		});
		});
		<%}%>
	</script>
</body>
</html>