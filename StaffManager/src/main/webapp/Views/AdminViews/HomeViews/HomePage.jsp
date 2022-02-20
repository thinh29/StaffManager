<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<!DOCTYPE html>
<html>
<head>


</head>
<body>

	<div class="container-fluid">


		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<a href="" style="font-size: 30px" class="typewrite"
				data-period="2000"
				data-type='[ "Xin chào, ${account.fullName}.", "Chúc bạn một ngày tốt lành.", "Hãy hoàn thành công việc thật tốt nhé!" ]'>
				<span class="wrap"></span>
			</a>

		</div>


		<div class="row">


			<div class="col-xl-4 col-md-6 mb-4">
				<div class="card border-left-primary shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div
									class="text-xs font-weight-bold text-primary text-uppercase mb-1">
									Tài khoản</div>
								<div class="h5 mb-0 font-weight-bold text-gray-800">${sizeAccount}</div>
							</div>
							<div class="col-auto">
								<i class="fas fa-users fa-2x text-gray-300"></i>
							</div>
						</div>
					</div>
				</div>
			</div>



			<div class="col-xl-4 col-md-6 mb-4">
				<div class="card border-left-info shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div
									class="text-xs font-weight-bold text-info text-uppercase mb-1">Dự
									án</div>
								<div class="row no-gutters align-items-center">
									<div class="col-auto">
										<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${sizeProject}</div>
									</div>
								</div>
							</div>
							<div class="col-auto">
								<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
							</div>
						</div>
					</div>
				</div>
			</div>


			<div class="col-xl-4 col-md-6 mb-4">
				<div class="card border-left-warning shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div
									class="text-xs font-weight-bold text-warning text-uppercase mb-1">
									Thông báo</div>
								<div class="h5 mb-0 font-weight-bold text-gray-800">${sizeNotification}</div>
							</div>
							<div class="col-auto">
								<i class="fas fa-bell fa-2x text-gray-300"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>



		<div class="row">


			<div class="col-xl-8 col-lg-7">
				<div class="card shadow mb-4">

					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary"
							style="font-size: 20px">Tài khoản mới</h6>
						<div class="dropdown no-arrow">
							<a class="dropdown-toggle" href="#" role="button"
								id="dropdownMenuLink" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <i
								class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
							</a>
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
								aria-labelledby="dropdownMenuLink">
								<div class="dropdown-header">Chức năng:</div>
								<a class="dropdown-item" href="/admin/accounts">Xem tất cả</a>
							</div>
						</div>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div class="row">
							<div class="col-6">
								<label>Tài khoản mới tạo</label>
								<div class="chart-area">
									<div class="chartjs-size-monitor">
										
									</div>
									<div class="white_card card_height_100 mb_30">

										<div class="white_card_body ">
											<c:forEach var="item" items="${accountNew}">
												<div
													class="single_user_pil d-flex align-items-center justify-content-between"
													style="background: #F5F5DC; border-radius: 10px; margin-top: 10px">
													<div class="user_pils_thumb d-flex align-items-center">
														<div class="thumb_34 mr_15 mt-0">
															<img class="img-fluid radius_50"
																src="https://firebasestorage.googleapis.com/v0/b/luu-hinh-voi-firebase.appspot.com/o/user.png?alt=media&token=33176e5c-3c62-46b2-93af-cab0b7b0cae2"
																alt="">
														</div>
														<span
															class="f_s_14 f_w_400 text_color_11 font-weight-bold"
															style="color: blue">${item.username}</span>
													</div>
													<div class="user_info">${typeAcc.get(item.typeId-1).name}</div>
													<div class="action_btns d-flex">
														<a href="/admin/accounts?type=view&id=${item.id}"
															class="action_btn mr_10"> <i class="far fa-eye"></i>
														</a>

													</div>
												</div>
											</c:forEach>

										</div>
									</div>
								</div>

							</div>
							<div class="col-6"><label>Tài khoản chưa xác nhận</label>
								<div class="chart-area">
									<div class="chartjs-size-monitor">
										
									</div>
									<div class="white_card card_height_100 mb_30">

										<div class="white_card_body " style="overflow-y: scroll; height:263px;">
											<c:forEach var="item" items="${accountsNotActive}">
												<div
													class="single_user_pil d-flex align-items-center justify-content-between"
													style="background: #F5F5DC; border-radius: 10px; margin-top: 10px">
													<div class="user_pils_thumb d-flex align-items-center">
														<div class="thumb_34 mr_15 mt-0">
															<img class="img-fluid radius_50"
																src="https://firebasestorage.googleapis.com/v0/b/luu-hinh-voi-firebase.appspot.com/o/user.png?alt=media&token=33176e5c-3c62-46b2-93af-cab0b7b0cae2"
																alt="">
														</div>
														<span
															class="f_s_14 f_w_400 text_color_11 font-weight-bold"
															style="color: blue">${item.username}</span>
													</div>
													<div class="user_info">${typeAcc.get(item.typeId-1).name}</div>
													<div class="action_btns d-flex">
														<a href="/admin/accounts?type=view&id=${item.id}"
															class="action_btn mr_10"> <i class="far fa-eye"></i>
														</a>

													</div>
												</div>
											</c:forEach>

										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>

			<!-- Pie Chart -->
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">Thống kê các
							loại tài khoản</h6>

					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div class="chart-pie pt-4 pb-2">
							<div class="chartjs-size-monitor">
								<div class="chartjs-size-monitor-expand">
									<div class=""></div>
								</div>
								<div class="chartjs-size-monitor-shrink">
									<div class=""></div>
								</div>
							</div>
							<!-- ---------------- -->

							<canvas id="myChartTypeAcc"
								style="height: 100%; width: 100%; max-width: 600px"></canvas>


							<!-- ------------------------ -->
						</div>
						<div class="mt-4 text-center small">
							<span class="mr-2"> <i class="fas fa-circle text-danger"></i>
								Admin
							</span> <span class="mr-2"> <i class="fas fa-circle text-success"></i>
								CEO
							</span> <span class="mr-2"> <i class="fas fa-circle text-info"></i>
								Manager
							</span> <span class="mr-2"> <i class="fas fa-circle text-primary"></i>
								Leader
							</span> <span class="mr-2"> <i
								class="fas fa-circle text-secondary"></i> Normal
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="row">


			<div class="col-lg-6 mb-4">


				<div class="card shadow mb-4">
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">Các dự án</h6>
						<div class="dropdown no-arrow">
							<a class="dropdown-toggle" href="#" role="button"
								id="dropdownMenuLink" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <i
								class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
							</a>
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
								aria-labelledby="dropdownMenuLink">
								<div class="dropdown-header">Chức năng:</div>
								<a class="dropdown-item" href="/admin/projects">Xem tất cả</a>
							</div>
						</div>
					</div>
					<div class="card-body">
						<c:forEach var="itemProject" items="${projects}" varStatus="loop">
							<h4 class="small font-weight-bold">
								${itemProject.name} <span class="float-right">${itemProject.progress==100?'Đã xong! - ':''}${itemProject.progress}%</span>
							</h4>
							<div class="progress mb-4">
								<div
									class="progress-bar bg-${itemProject.progress==100?'success':(loop.index % 2==0?'danger':'warning')}"
									role="progressbar" style="width: ${itemProject.progress}%"
									aria-valuenow="${itemProject.progress}" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
						</c:forEach>


					</div>
				</div>
				<div class="">
					<div class="card shadow mb-4" style="">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">Staff Manager</h6>
						</div>
						<div class="card-body">
							<div id="banner">
								<div id="cloud-scroll"></div>
							</div>
						</div>
					</div>

				</div>


			</div>


			<div class="col-lg-6 mb-4">


				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">Thống kê trạng
							thái dự án</h6>
					</div>
					<div class="card-body">
						<canvas id="myChartProject" style="width: 100%; max-width: 600px"></canvas>
					</div>
				</div>


				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">Thời tiết hôm
							nay thế nào ?</h6>
					</div>
					<div class="card-body">

						<c:if test="${time.getHours()<12}">
							<div class="card--weather snow-day">
								<div class="bg--illustration">
									<div class="moutains">
										<div class="background-mountain"></div>
										<div class="foreground-mountain"></div>
									</div>

								</div>
								<div class="weather--indicator snow-indicator">26º</div>
							</div>
							<p>
								<a href="" style="font-size: 20px; color: #1ec9ed"
									class="typewrite" data-period="2000"
									data-type='[ "Chào buổi sáng, hãy tích cực nào !"]'> <span
									class="wrap"></span>
								</a>
							</p>

						</c:if>
						<c:if test="${time.getHours()>=12 && time.getHours()<18}">
							<div class="card--weather sunny-day">
								<div class="bg--illustration">
									<div class="sun"></div>
								</div>
								<div class="weather--indicator sun-indicator">36º</div>
							</div>
							<p>
								<a href="" style="font-size: 20px; color: #ffa333"
									class="typewrite" data-period="2000"
									data-type='[ "Đã trưa rồi, hãy làm một giấc ngủ trưa để lấy lại sức khỏe nào !"]'>
									<span class="wrap"></span>
								</a>
							</p>
						</c:if>
						<c:if test="${time.getHours()>=18}">
							<div class="card--weather moon-night">
								<div class="bg--illustration">
									<div class="moon"></div>
								</div>
								<div class="weather--indicator moon-indicator">25º</div>
							</div>
							<p>
								<a href="" style="font-size: 20px; color: #2f3475"
									class="typewrite" data-period="2000"
									data-type='[ "Chào buổi tối, tối nay bạn có kế hoạch gì không ?"]'>
									<span class="wrap"></span>
								</a>
							</p>
						</c:if>

					</div>
				</div>

			</div>
		</div>

	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
</script>


	<script>
var xValuesAcc = ["Admin", "CEO", "Manager", "Leader", "Normal"];
var yValuesAcc = [${sizeEachAccountType.get(0)}, ${sizeEachAccountType.get(1)}, ${sizeEachAccountType.get(2)}, ${sizeEachAccountType.get(3)}, ${sizeEachAccountType.get(4)}];
var barColorsAcc = ["#e74a3b", "#1cc88a","#36b9cc","#4e73df","#858796"];
new Chart("myChartTypeAcc", {
	  type: "bar",
	  data: {
		labels: xValuesAcc,
	    datasets: [{
	      backgroundColor: barColorsAcc,
	      data: yValuesAcc
	    }]
	  },
	  options: {
		    legend: {display: false},
		    title: {
		      display: true,
		      text: "Số lượng loại tài khoản hiện có"
		    }
	  }
	});
	
var xValuesProject = ["Vừa tạo", "Đang tiến hành", "Hoàn thành", "Chờ kiểm tra", "Đã kiểm tra", "Trả lại", "Đã giải quyết", "Thông qua"];
var yValuesProject = [${sizeEachProjectStatus.get(0)}, ${sizeEachProjectStatus.get(1)}, ${sizeEachProjectStatus.get(2)}, ${sizeEachProjectStatus.get(3)}, 
	${sizeEachProjectStatus.get(4)}, ${sizeEachProjectStatus.get(5)}, ${sizeEachProjectStatus.get(6)}, ${sizeEachProjectStatus.get(7)}];
var barColorsProject = [
  "#b91d47",
  "#00aba9",
  "#2b5797",
  "#e8c3b9",
  "#1e7145",
  "#e74a3b",
  "#f6c23e",
  "#858796"
];

new Chart("myChartProject", {
  type: "pie",
  data: {
    labels: xValuesProject,
    datasets: [{
      backgroundColor: barColorsProject,
      data: yValuesProject
    }]
  },
  options: {
    title: {
      display: false,
      text: "Thống kê trạng thái dự án"
    }
  }
});

/* ------------- Animation ở đây*/
var TxtType = function(el, toRotate, period) {
    this.toRotate = toRotate;
    this.el = el;
    this.loopNum = 0;
    this.period = parseInt(period, 10) || 2000;
    this.txt = '';
    this.tick();
    this.isDeleting = false;
};

TxtType.prototype.tick = function() {
    var i = this.loopNum % this.toRotate.length;
    var fullTxt = this.toRotate[i];

    if (this.isDeleting) {
    this.txt = fullTxt.substring(0, this.txt.length - 1);
    } else {
    this.txt = fullTxt.substring(0, this.txt.length + 1);
    }

    this.el.innerHTML = '<span class="wrap">'+this.txt+'</span>';

    var that = this;
    var delta = 200 - Math.random() * 100;

    if (this.isDeleting) { delta /= 2; }

    if (!this.isDeleting && this.txt === fullTxt) {
    delta = this.period;
    this.isDeleting = true;
    } else if (this.isDeleting && this.txt === '') {
    this.isDeleting = false;
    this.loopNum++;
    delta = 500;
    }

    setTimeout(function() {
    that.tick();
    }, delta);
};

window.onload = function() {
    var elements = document.getElementsByClassName('typewrite');
    for (var i=0; i<elements.length; i++) {
        var toRotate = elements[i].getAttribute('data-type');
        var period = elements[i].getAttribute('data-period');
        if (toRotate) {
          new TxtType(elements[i], JSON.parse(toRotate), period);
        }
    }
    
    var css = document.createElement("style");
    css.type = "text/css";
    css.innerHTML = ".typewrite > .wrap { border-right: 0.08em solid #fff}";
    document.body.appendChild(css);
};
/* --------- */
</script>
</body>
</html>