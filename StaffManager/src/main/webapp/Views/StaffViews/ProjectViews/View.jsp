<%@page import="com.StaffManager.Model.HistoryProjectModel"%>
<%@page import="com.StaffManager.Model.ProjectModel"%>
<%@page import="com.StaffManager.Model.JoinProjectModel"%>
<%@page import="com.StaffManager.Model.AccountModel"%>
<%@page import="com.StaffManager.Model.PositionProjectModel"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%  ProjectModel project = (ProjectModel) request.getAttribute("project") ; %>
<title><%=project.getName()%>  | Quản lý dự án</title>
</head>
<body>
<style>
.swal-wide{height:auto;}
.swal2-input{width:300px;}
</style>
	<%  JoinProjectModel accountPosition = (JoinProjectModel) request.getAttribute("accountPosition") ; %>
	<div class="modal-dialog modal-dialog-centered modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<div>
					<h2 class="modal-title"><%=project.getName()%></h2>
				</div>
				<% if( (accountPosition != null) && (accountPosition.getPosition().equals(2L))  ){ %>
				<a href="javascript:void(0);" class="prj-btn-func prj-btn-add add-user">
					<i class="fa fa-plus" aria-hidden="true"></i>&nbsp; Thêm người vào dự án
				</a>
				<%} %>
			</div>
			<div class="modal-body">
			<% if( (accountPosition != null) ){ %>
			<div class="alert alert-info" role="alert">Bạn đang là người <b><%= accountPosition.getPositionName() %></b> của dự án này
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
								    <select multiple class="form-control member" style="height:140px;overflow:auto">
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
								<% if(project.getParentId() == 0 ) {%>
								<a href="/projects?type=add&id=<%= project.getId() %>"
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
       			<% if(list != null) { %>
				<div class="row">
					<div class="col-md-12">
						<div class="card-header py-3">
							<h6 class="m-0 align-middle font-weight-bold text-primary">Danh
								sách dự án con</h6>
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
										<td><a href="/projects?type=view&id=<%=i.getId()%>"><%=i.getName()%></a></td>
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

												<a href="/projects?type=view&id=<%=i.getId()%>"
													class="prj-btn-func prj-btn-view"><i class="fa fa-eye"
													aria-hidden="true"></i>&nbsp; Xem </a> <a
													class="prj-btn-func prj-btn-edit"
													href="/projects?type=edit&id=<%=i.getId()%>"> <i
													class="fa fa-wrench" aria-hidden="true"></i>&nbsp; Sửa
												</a>
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
									<b>Ngày cập nhật :  </b>
									<fmt:formatDate value="<%=  history.getCreateAt()  %>" pattern="dd-MM-yyyy HH:mm"/>
									 
								</p>
								<hr>
								<p>
									<b>Người cập nhật : </b><%= request.getAttribute("updateName") %>
								</p>
								
								<hr>
								<div class="prj-hst-content">
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
				<div class="modal-footer">
				<%if(project.getRoot() == project.getId()){ %>
					<a href="/projects" type="button" class="btn btn-secondary">Về lại</a> 
				<%}else{%>
					<a href="/projects?type=view&id=<%= project.getParentId() %>" type="button" class="btn btn-secondary">Về lại</a>
				<%} %>	
				<a href="/projects?type=edit&id=<%=project.getId()%>" type="button"
						class="btn btn-primary">Sửa</a>
				</div>
			</div>
		</div>



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
		<% if( (accountPosition != null) && (accountPosition.getPosition().equals(2L))  ){ %>
		<% 
		ArrayList<PositionProjectModel>  projectP = (ArrayList) request.getAttribute("positionProject") ; 
		ArrayList<AccountModel>  listStaff = (ArrayList) request.getAttribute("listStaff") ;
		%>
		
		document.addEventListener("DOMContentLoaded", function() {
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
		<% }%>
		
	</script>
</body>
</html>