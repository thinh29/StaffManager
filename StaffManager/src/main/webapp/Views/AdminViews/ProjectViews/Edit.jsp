<%@page import="com.StaffManager.Model.StatusProjectModel"%>
<%@page import="com.StaffManager.Model.ProjectModel"%>
<%@page import="com.StaffManager.Model.HistoryProjectModel"%>
<%@page import="com.StaffManager.Model.JoinProjectModel"%>
<%@page import="com.StaffManager.Model.AccountModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%  ProjectModel project = (ProjectModel) request.getAttribute("project") ; %>
<title><%= project.getName() %> | Sửa dự án | Quản lý nhân viên</title>
</head>
<body>
	<script type="text/javascript"
		src="<c:url value='/template/library/ckeditor/ckeditor.js' />"
		charset="UTF-8"></script>
	<div class="prj-bg-lzload" id="prj-lzloading">
		<div class="text-center ">
			<div class="spinner-grow  text-primary"
				style="width: 5rem; height: 5rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
	</div>
	<div class="modal-dialog modal-dialog-centered modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<div>
					<h2 class="modal-title"><%= project.getName() %></h2>
				</div>
			</div>
			<form action="/admin/projects?type=edit&id=<%= project.getId() %>" method="post" id="prj-form-edit"
				onsubmit="lazySubmit(event)">
				

				<div class="modal-body">
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
									<label>Hoàn thành <select name="progress"
										class="custom-select custom-select-sm form-control form-control-sm">
											<% for (int i=0; i<=100 ;i+=10){
											if(i == (int)project.getProgress() ){
											%>
												<option value="<%= i %>" selected="selected"><%= i %>%</option>
											<%}else{ %>
											<option value="<%= i %>"><%= i %>%</option>
											<%}
											}%>
									</select>
									</label>
								</div>
							</div>
						</div>
						<div class="col-md-8">
							<div class="card mb-3">
								<div class="card-body">
									<div class="row">
										<div class="col-sm-3">
											<h6 class="mb-0">Tên dự án</h6>
										</div>
										<div class="col-sm-9 text-secondary">
											<input type="text" class="form-control" value="<%= project.getName() %>" id="projectname" name="name">
										</div>
									</div>
									<hr>
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
									<div class="col-sm-9 text-secondary">
									<div class="form-group">
								    <select class="form-control" name="manager">
								    	<option value="">Choose ..</option>
								      <% 
								      ArrayList<JoinProjectModel>  listMember = (ArrayList) request.getAttribute("listMember") ; 
								      ArrayList<Long> value = new ArrayList<Long>();
								      %>
								      <% for(JoinProjectModel i : listMember) {%>
								      		<% if ((i.getRootId() != project.getId()) || (i.getPosition().equals(1L)) ){%>
											<option value="<%= i.getAccountId() %>" <% if(i.getAccountId() == project.getManager() ){ %>selected<%}%> ><%= i.getAccountName() %> - <%= i.getPositionName()%></option>
									 		<%}%>
									  <%}%>

								    </select>
								  </div>
								  </div>
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
										<div class="col-sm-9 text-secondary">									 
											<% ArrayList<StatusProjectModel> status = (ArrayList) request.getAttribute("status"); %>
											<select name="status"
												class="custom-select custom-select-sm form-control form-control-sm">
												<% for (StatusProjectModel i : status) {%>
													<% if( i.getId() == project.getStatus() ){ %>
														<option value="<%= i.getId()%>" selected><%= i.getName()%></option>
													<% }else { %>
														<option value="<%= i.getId()%>"><%= i.getName()%></option>
													<% } %>
												<%}%>
											</select>
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-3">
											<h6 class="mb-0">Bắt đầu</h6>
										</div>
										<div class="col-sm-9 text-secondary">
											<input type="date" value="<%= project.convertTime(project.getBeginDate(), 3) %>" id="begin-Date"
												onchange="getBeginDate()" readonly> <input type="time"
												value="<%= project.convertTime(project.getBeginDate(), 4) %>" id="begin-Time" onchange="getBeginDate()" readonly>
											<input type="hidden" id="beginDate"
												value="<%= project.convertTime(project.getBeginDate(), 3) %> <%= project.convertTime(project.getBeginDate(), 4)%>:00.000000000" name="beginDate">
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-3">
											<h6 class="mb-0">Dự kiến kết thúc</h6>
										</div>
										<div class="col-sm-9 text-secondary">
											<input type="date" value="<%= project.convertTime(project.getExpectedDate(), 3) %>" id="ex-Date"
												onchange="getExDate()" readonly> 
											<input type="time" value="<%= project.convertTime(project.getExpectedDate(), 4) %>"
												id="ex-Time" onchange="getExDate()" readonly> 
											<input type="hidden" id="expectedDate"
												value="<%= project.convertTime(project.getExpectedDate(), 3) %> <%= project.convertTime(project.getExpectedDate(), 4)%>:00.000000000" name="expectedDate">
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-3">
											<h6 class="mb-0">Kết thúc</h6>
										</div>
										<div class="col-sm-9 text-secondary">
											<input type="date" value="<%= project.convertTime(project.getExpectedDate(), 3) %>" id="finish-Date"
												onchange="getFinishDate()"> <input type="time"
												value="<%= project.convertTime(project.getExpectedDate(), 4) %>" id="finish-Time" onchange="getFinishDate()">
											<input type="hidden" id="finishDate"
												value="<%= project.convertTime(project.getExpectedDate(), 3) %> <%= project.convertTime(project.getExpectedDate(), 4)%>:00.000000000" name="finishDate">
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
										<div class="col-12 text-secondary">
											<br>
											<textarea class="form-control ckeditor" rows="10" cols=""
							id="prj-dsc-child-1" name="description" lang="vi"><%= project.getDescription() %></textarea>
											</br>
										</div>
									</div>
									<hr>

								</div>

							</div>

						</div>
						<br> <br>
					</div>
					
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
									<b>Ngày cập nhật :  </b><%=  history.getCreateAt()  %>  </span>
								</p>
								<hr>
								<p>
									<b>Người cập nhật : </b><%= request.getAttribute("updateName") %>  </span>
								</p>
								<hr>
								<div class="prj-hst-content">
									<label class="prj-lb-content font-weight-bold">Nội dung : </label>
									<p><%= history.getContent() %></p>
								</div>
								<hr>
							</div>
						</div>
					</div>
				</div>
				<% } %>
					<hr />
					<div class="row">
						<div class="col-12 py-3">
							<div class="card-header py-3">
								<h6 class="m-0 align-middle font-weight-bold text-primary">Chi chú</h6>
							</div>
						</div>
						<div class="col-12">
							<div class="row">
								<div class="col-sm-3">
									<h6>Tiêu đề chỉnh sửa</h6>
								</div>
								<div class="col-sm-9">
									<input type="text" class="form-control custom-select-sm" name="editTitle"  placeholder="Tiêu đề chỉnh sửa" id="editTitle">
								</div>
							</div>
							<hr>
							
						</div>
						<div class="col-12">
							<div class="row">
								<div class="col-sm-3">
									<h6>Chuyển giao đến</h6>
								</div>
								<div class="col-sm-6">
								<input type="hidden" name="editAssignFrom" value="<%= project.getAccountId() %>"></input>
									<select name="editAssignTo" class="custom-select custom-select-sm form-control form-control-sm">
    									<option value='<%= project.getAccountId() %>'>Choose ..</option>
    									<%
					            ArrayList<JoinProjectModel> list1 = (ArrayList) request.getAttribute("listAssignTo");
								if (list1 != null){
					            for (JoinProjectModel i : list1) {
       			 				%>       			 					
									<option value="<%= i.getAccountId() %>" ><%= i.getAccountName() %> - <%= i.getPositionName() %></option>
								<%}}%>	
									</select>
								</div>
								<hr>
							</div>
							<hr>
						</div>							
						<div class='col-12'>
						<label for="prj-dsc-child-1">Nội dung: </label><br>
						<textarea class="form-control ckeditor" rows="10" cols=""
							id="prj-dsc-child-1" name="editNote" lang="vi"></textarea>
						<br> <br>
						</div>
					</div>
					<div class="modal-footer">
						<a href="/admin/projects?type=view&id=<%= project.getRoot() %>" type="button" class="btn btn-secondary">Hủy</a>
						<button type="submit" class="btn btn-primary">Lưu lại</button>
					</div>
				</div>
			</form>
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
		function subTime(a,b){
			var time_a = new Date(a.replace(/-/g,'/'));
			var time_b = new Date(b.replace(/-/g,'/'));
			
			var duration = time_a - time_b ;

			duration = parseInt(((duration/1000)/60)/60);
			return duration;
		}
		
		function getBeginDate() {
			var date = document.getElementById("begin-Date").value;
			var time = document.getElementById("begin-Time").value;
			if (date === "") {
				date = "0000-00-00";
			}
			if (time === "") {
				time = "00:00"
			}
			;
			;
			var final_time = date + " " + time + ":00.000000000";
			document.getElementById("beginDate").value = final_time;

		}
		function getExDate() {
			var date = document.getElementById("ex-Date").value;
			var time = document.getElementById("ex-Time").value;
			if (date === "") {
				date = "0000-00-00";
			}
			if (time === "") {
				time = "00:00"
			}
			;
			var final_time = date + " " + time + ":00.000000000";
			document.getElementById("expectedDate").value = final_time;
			
		}
		function getFinishDate() {
			var date = document.getElementById("finish-Date").value;
			var time = document.getElementById("finish-Time").value;
			if (date === "") {
				date = "0000-00-00";
			}
			if (time === "") {
				time = "00:00"
			}
			;
			var final_time = date + " " + time + ":00.000000000";
			document.getElementById("finishDate").value = final_time;

		}
		function lazySubmit(e) {
			e.preventDefault();			
			var form = document.getElementById("prj-form-edit");		
			var BeginDate = document.getElementById("beginDate").value ;
			var ExDate = document.getElementById("expectedDate").value ;
			var FinishDate = document.getElementById("finishDate").value ;
			var duration = subTime(FinishDate, BeginDate);
			if(duration<=0){
				Swal.fire({
					  icon: 'error',
					  title: 'Oops...',
					  text: 'Thời gian không hợp lệ!',
					})
			}else{
				var x = document.getElementById('prj-lzloading');
				x.classList.add("d-flex");	
				setTimeout(() => {
					form.submit();
					x.classList.remove("d-flex");	
				}, 2000);
			}
		}
	</script>
</body>
</html>