<%@page import="com.StaffManager.Model.AccountModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.StaffManager.Model.ProjectModel"%>
<%@page import="com.StaffManager.Model.AccountModel"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm dự án | Quản lý dự án</title>
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
	<div class="modal-dialog modal-dialog-centered modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<div>
					<h2 class="modal-title">Thêm dự án</h2>
				</div>
			</div>
			<div class="modal-body">
			<form action="/admin/projects?type=add" method="post" id="prj-form-add" onsubmit="lazySubmit(event)">
				<div class="row">
					<div class="col-12">
						<div class="card mb-3">
							<div class="card-body">
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Tên dự án</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="text" name="name" class="form-control" required placeholder="Nhập tên dự án" id="projectname">
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Quản lý dự án </h6>
									</div>
									<div class="col-sm-9 text-secondary">
								<select name="manager" class="custom-select  form-control form-control-sm" required>
								<option value=''>Choose ..</option>
								<%
					            ArrayList<AccountModel> list = (ArrayList) request.getAttribute("listManager");
								if (list != null){
					            for (AccountModel i : list) {
       			 				%>
									<option value="<%= i.getId() %>"><%= i.getFullName() %> - <%= i.getPositionName() %></option>
								<%}}else{%>	
									<option>Chưa có quản lý</option>
								<%}%>									   
										</select>
									</div>
								</div>
								<hr>
								
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Trạng thái</h6>
									</div>
									<div class="col-sm-9 text-secondary">Vừa tạo</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Ngày bắt đầu</h6>
									</div>
									<div class="col-sm-9 text-secondary d-flex">
									<% Date now = new Date(); 
									 	SimpleDateFormat s1 = new SimpleDateFormat ("yyyy-MM-dd");
									 	SimpleDateFormat s2 = new SimpleDateFormat ("HH:mm");
									 	SimpleDateFormat s3 = new SimpleDateFormat ("yyyy-MM-dd HH:mm");
									 	SimpleDateFormat s4 = new SimpleDateFormat ("dd/MM/yyyy");
									 	
									%>
									<input class="form-control w-50 mr-2" type="date" value="<%= s1.format(now) %>" id="begin-Date" onchange="getBeginDate()"> 
									<input class="form-control w-25" type="time" value="<%= s2.format(now) %>" id="begin-Time" onchange="getBeginDate()">
									<input type="hidden" id="beginDate"
												value="<%= s3.format(now) %>:00" name="beginDate">
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Dự kiến kết thúc</h6>
									</div>
									<div class="col-sm-9 text-secondary d-flex">
										<input class="form-control w-50 mr-2" type="date" value="<%= s1.format(now) %>" id="ex-Date" onchange="getExDate()">
										<input class="form-control w-25" type="time" value="<%= s2.format(now) %>" id="ex-Time" onchange="getExDate()">
										<input type="hidden" id="expectedDate" value="<%= s3.format(now) %>:00" name="expectedDate">	
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Thời hạn </h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<input type="number"  class="form-control" name="duration" required placeholder="Thời hạn (giờ)" step="1" id="duration">
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Ngày Kết Thúc</h6>
									</div>
									<div class="col-sm-9 text-secondary">---</div>
								</div>
								<hr>
								<% AccountModel  account = (AccountModel) request.getAttribute("account") ; %>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Người Tạo</h6>
									</div>
									<div class="col-sm-9 text-secondary"><%= account.getFullName() %></div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Ngày Tạo</h6>
									</div>
									<div class="col-sm-9 text-secondary"><%= s4.format(now) %></div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Mô Tả</h6>
									</div>
									<div class="col-12 mt-2">
										<textarea id="prj-desc" name="description" style='width:100%'></textarea>
									</div>
								</div>
								

							</div>

						</div>

					</div>
					<br> <br>
				</div>
			
				
				<div class="modal-footer">
					<a href="/admin/projects" type="button" class="btn btn-secondary">Về
						lại</a>
					<input type="submit" value="Lưu" class="btn btn-primary"/>
				</div>
			</form>
			</div>
		</div>
	</div>
	<script>
	document.addEventListener("DOMContentLoaded", function() {
		tinymce.init({
		  selector: 'textarea#prj-desc',
		  height: 500,
		  menubar: false,
		  plugins: [
		    'advlist autolink lists link image charmap print preview anchor',
		    'searchreplace visualblocks code fullscreen',
		    'insertdatetime media table paste code help wordcount'
		  ],
		  toolbar: 'undo redo | formatselect | ' +
		  'bold italic backcolor | alignleft aligncenter ' +
		  'alignright alignjustify | bullist numlist outdent indent | ' +
		  'removeformat | help',
		  content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:16px }'
		});

	});
	
	function subTime(a,b){
		var time_a = new Date(a.replace(/-/g,'/'));
		var time_b = new Date(b.replace(/-/g,'/'));
		
		var duration = time_a - time_b ;

		duration = parseInt(((((duration/1000)/60)/60)/24))*8;
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
		
		var ExDate = document.getElementById("expectedDate").value ;
		var duration = subTime(ExDate,final_time);
		if(duration>0) document.getElementById("duration").value = duration;
		else document.getElementById("duration").value = 0;
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
		
		var BeginDate = document.getElementById("beginDate").value ;
		var duration = subTime(final_time,BeginDate);
		
		if(duration>0) document.getElementById("duration").value = duration;
		else document.getElementById("duration").value = 0;
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
		var form = document.getElementById("prj-form-add");		
		var BeginDate = document.getElementById("beginDate").value ;
		var ExDate = document.getElementById("expectedDate").value ;		
		var duration = subTime(ExDate ,BeginDate);
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