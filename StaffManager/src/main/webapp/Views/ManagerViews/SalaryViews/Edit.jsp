<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thay đổi bảng lương | Quản lý nhân sự</title>
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
	<form action="<c:url value='/manager/salary?type=edit&id=${stModel.id }'/>" method="post" id="form-edit-salary-tb" onsubmit="lazySubmit(event)">
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h4 class="m-0 font-weight-bold text-primary">${stModel.fullName }</h4>
		</div>
		<div class="card-body salay-detail">
			<div class="row mb-3">
				<div class="col-sm-3">
					<h6 class="mb-0">Vị trí nhân viên</h6>
				</div>
				<div class="col-sm-9 text-secondary">
					<input type="text" class="form-control" value="${position.get(stModel.positionId -1 ).name}"
						readonly="readonly">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3">
					<h6 class="mb-0">Hình thức nhân viên</h6>
				</div>
				<div class="col-sm-9 text-secondary">
					<input type="text" class="form-control" value="${types.get(stModel.typeId -1).name}"
						readonly="readonly">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3">
					<h6 class="mb-0">Lương cơ bản</h6>
				</div>
				<div class="col-sm-9 text-secondary">
					<fmt:setLocale value="vi_VN" />
					<fmt:formatNumber var="basicSalary" value="${staff.basicSalary }" type="currency" />
					 <input type="text" class="form-control" id="basicSalary" value="${basicSalary }"
						readonly="readonly">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3">
					<h6 class="mb-0">Kỳ lương</h6>
				</div>
				<div class="col-sm-9 text-secondary">
					<input type="text" class="form-control" value="${slrPeriods.get(stModel.periodId-1).name }"
						readonly="readonly">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3">
					<h6 class="mb-0">Số ngày công</h6>
				</div>
				<div class="col-sm-9 text-secondary">
					<input type="number" class="form-control" value="${stModel.workDay}"
						step="0.5" id="workDay" name = "workDay" onchange="changeValue()">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3">
					<h6 class="mb-0">Tăng ca</h6>
				</div>
				<div class="col-sm-9 text-secondary">
					<input type="number" class="form-control" value="${stModel.overtime}"
						step="0.5" id = "overtime" name="overtime" onchange="changeValue()">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3">
					<h6 class="mb-0">Thưởng</h6>
				</div>
				<div class="col-sm-9 text-secondary">
					<input type="number" class="form-control" value="${stModel.bonus}"
						id="bonus" name="bonus" onchange="changeValue()">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3">
					<h6 class="mb-0">Phạt</h6>
				</div>
				<div class="col-sm-9 text-secondary">
					<input type="number" class="form-control" value="${stModel.punish}"
						id="punish" name = "punish" onchange="changeValue()">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3">
					<h6 class="mb-0">Ứng trước</h6>
				</div>
				<div class="col-sm-9 text-secondary">
					<input type="number" class="form-control" value="${stModel.advance}"
						id="advance" name="advance" onchange="changeValue()">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3">
					<h6 class="mb-0">Bảo hiểm</h6>
				</div>
				<div class="col-sm-9 text-secondary">
					<input type="number" class="form-control" value="${stModel.insurance}"
						id="insurance" name="insurance" onchange="changeValue()">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3">
					<h6 class="mb-0">Thuế</h6>
				</div>
				<div class="col-sm-9 text-secondary">
					<input type="number" class="form-control" value="${stModel.tax}"
						 id="tax" name = "tax" readonly="readonly">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3">
					<h6 class="mb-0">Tồng</h6>
				</div>
				<div class="col-sm-9 text-secondary">
					<input type="text" class="form-control" value="${stModel.total}"
						readonly="readonly" id="total" name="total">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3">
					<h6 class="mb-0">Thanh toán</h6>
				</div>
				<div class="col-sm-9 text-secondary">
					<select id="payed" name="settlement" class="form-control">
						<option value="0" ${stModel.settlement==0?"selected":"" }>Chưa thanh toán</option>
						<option value="1" ${stModel.settlement==1?"selected":"" }>Đã thanh toán</option>
					</select>
				</div>
			</div>
			<div class="modal-footer">
				<a href="<c:url value='/manager/salary'/>" class="btn btn-secondary"
					>Close</a> <button class="btn btn-primary" type="submit">Lưu</button>
			</div>
		</div>
	</div>
	</form>
	<script src="<c:url value='/template/library/jquery/jquery.min.js'/>"></script>
	<script >
	function lazySubmit(e) {
		e.preventDefault();	
		var x = document.getElementById('prj-lzloading');
		x.classList.add("d-flex");	
		var form = document.getElementById(e.target.id);			
		setTimeout(() => {
			form.submit();
			x.classList.remove("d-flex");	
		}, 1000);			
	}
		function changeValue() {
			var basic = Math.floor( ${staff.basicSalary} / 184 );
			var workDay = parseFloat($('#workDay').val());
			var overtime =  parseFloat($('#overtime').val());
			var bonus =  parseInt($('#bonus').val());
			var punish =  parseInt($('#punish').val());
			var advance =  parseInt($('#advance').val());
			var insurance =  parseInt($('#insurance').val());
			var basicSalary = null;
			var tx = 0;
			var thuNhapTinhThue = 0;
			
			var otSalary = overtime * 1.5 * basic;
			if(${staff.typeSt}==1){ 
				basicSalary = (workDay>=22)? ${staff.basicSalary} : (basic * workDay);
				thuNhapTinhThue = basicSalary + overtime * basic + bonus - insurance - 11000000 - (${staff.dependent} * 4400000 );
				console.log("tntt: "+ thuNhapTinhThue);
				if(thuNhapTinhThue <= 0){
					tax =0;
				}else {
					let mucThue = [0, 5000000, 10000000, 18000000, 32000000, 52000000, 80000000];//6tr 350k
					let phanTram = [5,10,15,20,25,30,35];					
					let i = 0;
					while (mucThue[i]<=thuNhapTinhThue) {
						i++;
					}
					tax=0;
					i--;
					for (var j = 0; j < i; j++) {						
						tax += (mucThue[j+1] - mucThue[j])*phanTram[j]/100;
					}
					tax+=(thuNhapTinhThue-mucThue[i])*phanTram[i]/100;
				}
			}else {
				basicSalary = (basic * workDay);
				tax = (basicSalary + otSalary + bonus) * 10 / 100;
			}
			
			$('#tax').val(tax);		
			var tt = basicSalary + otSalary + bonus - punish - advance - insurance - tax;
			$('#total').val(tt);
		}
	</script>

</body>
</html>