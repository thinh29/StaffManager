<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>

<button class="btn prj-btn-func prj-btn-view" data-toggle="modal"
	data-target="#mode-view-1">
	<i class="fa fa-eye" aria-hidden="true"></i> Xem
</button>
<div class="modal fade" id="mode-view-1" data-backdrop="static"
	data-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-xl">
		<div class="modal-content">
			<div class="modal-header">
				<center>
					<h2 class="modal-title" id="staticBackdropLabel">Dự án 1</h2>
				</center>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
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
							</div>
						</div>
					</div>
					<div class="col-md-8">
						<div class="card mb-3">
							<div class="card-body">
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Tên Project</h6>
									</div>
									<div class="col-sm-9 text-secondary">Dự án 2</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Ngày Bắt Đàu</h6>
									</div>
									<div class="col-sm-9 text-secondary">22/08/2000</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Ngày Release Dự Kiến</h6>
									</div>
									<div class="col-sm-9 text-secondary">22/11/2000</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Ngày Kết Thúc</h6>
									</div>
									<div class="col-sm-9 text-secondary">23/11/2000</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Người Tạo</h6>
									</div>
									<div class="col-sm-9 text-secondary">Mr.Toàn</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Ngày Tạo</h6>
									</div>
									<div class="col-sm-9 text-secondary">10/08/2000</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Ngày Cập Nhật</h6>
									</div>
									<div class="col-sm-9 text-secondary">15/11/2000</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Mô Tả</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<br> <br></br>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-12">
										<a class="btn btn-info " target="__blank" href="#">Edit</a>
									</div>
								</div>
							</div>
						</div>

					</div>
					<br> <br>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="card-header py-3">
							<h6 class="m-0 align-middle font-weight-bold text-primary">Danh
								sách thành viện</h6>
						</div>
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>Stt</th>
										<th>Tên</th>
										<th>Chức Vụ</th>
										<th>Ngày bắt đầu</th>
										<th>Ngày kết thúc</th>
										<th>Người giao</th>
										<th>Tiến độ</th>
										<th>Chi tiết</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>Stt</th>
										<th>Tên</th>
										<th>Chức Vụ</th>
										<th>Ngày bắt đầu</th>
										<th>Ngày kết thúc</th>
										<th>Người giao</th>
										<th>Tiến độ</th>
										<th>Chi tiết</th>
									</tr>
								</tfoot>
								<tbody>
									<tr>
										<th>1</th>
										<td>Hồ Thị B</td>
										<td>Manager</td>
										<td>23/10/2021</td>
										<td>23/11/2021</td>
										<td>Hồ Thị B</td>
										<td>60%</td>
										<th><a href="profile.html">Thông tin</a></th>
									</tr>
									<tr>
										<th>2</th>
										<td>Vũ 2</td>
										<td>Employee</td>
										<td>23/10/2021</td>
										<td>23/11/2021</td>
										<td>Hồ Thị B</td>
										<td>60%</td>
										<th><a href="profile.html">Thông tin</a></th>
									</tr>
									<tr>
										<th>3</th>
										<td>VŨ 3</td>
										<td>Employee</td>
										<td>23/10/2021</td>
										<td>23/11/2021</td>
										<td>Hồ Thị B</td>
										<td>60%</td>
										<th><a href="profile.html">Thông tin</a></th>
									</tr>
									<tr>
										<th>4</th>
										<td>Vũ 4</td>
										<td>Employee</td>
										<td>23/10/2021</td>
										<td>23/11/2021</td>
										<td>Hồ Thị B</td>
										<td>60%</td>
										<th><a href="profile.html">Thông tin</a></th>
									</tr>
									<tr>
										<th>5</th>
										<td>Vũ 5</td>
										<td>Employee</td>
										<td>23/10/2021</td>
										<td>23/11/2021</td>
										<td>Hồ Thị B</td>
										<td>60%</td>
										<th><a href="profile.html">Thông tin</a></th>
									</tr>
									<tr>
										<th>6</th>
										<td>Vũ 6</td>
										<td>Employee</td>
										<td>23/10/2021</td>
										<td>23/11/2021</td>
										<td>Hồ Thị B</td>
										<td>60%</td>
										<th><a href="profile.html">Thông tin</a></th>
									</tr>
									<tr>
										<th>7</th>
										<td>Vũ 7</td>
										<td>Employee</td>
										<td>23/10/2021</td>
										<td>23/11/2021</td>
										<td>Hồ Thị B</td>
										<td>60%</td>
										<th><a href="profile.html">Thông tin</a></th>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">OK</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="<c:url value='/template/staff/chart.js/Chart.min.js'/>"></script>
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
				data : [ 20, 80 ],
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
</script>