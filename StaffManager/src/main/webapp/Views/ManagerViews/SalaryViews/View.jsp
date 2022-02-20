<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bảng lương chi tiết ${stModel.fullName } | Quản lý nhân
	sự</title>
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
					<input type="text" class="form-control"
						value="${position.get(stModel.positionId -1 ).name}"
						readonly="readonly">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3">
					<h6 class="mb-0">Hình thức nhân viên</h6>
				</div>
				<div class="col-sm-9 text-secondary">
					<input type="text" class="form-control"
						value="${types.get(stModel.typeId -1).name}" readonly="readonly">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3">
					<h6 class="mb-0">Lương cơ bản</h6>
				</div>
				<div class="col-sm-9 text-secondary">
					<fmt:setLocale value="vi_VN" />
					<fmt:formatNumber var="basicSalary" value="${staff.basicSalary }"
						type="currency" />
					<input type="text" class="form-control" id="basicSalary"
						value="${basicSalary }" readonly="readonly">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3">
					<h6 class="mb-0">Kỳ lương</h6>
				</div>
				<div class="col-sm-9 text-secondary">
					<input type="text" class="form-control"
						value="${slrPeriods.get(stModel.periodId-1).name }"
						readonly="readonly">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3">
					<h6 class="mb-0">Số ngày công</h6>
				</div>
				<div class="col-sm-9 text-secondary">
					<input type="number" class="form-control"
						value="${stModel.workDay}" readonly="readonly">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3">
					<h6 class="mb-0">Tăng ca</h6>
				</div>
				<div class="col-sm-9 text-secondary">
					<input type="number" class="form-control"
						value="${stModel.overtime}" readonly="readonly">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3">
					<h6 class="mb-0">Thưởng</h6>
				</div>
				<div class="col-sm-9 text-secondary">
					<fmt:setLocale value="vi_VN" />
					<fmt:formatNumber var="bonus" value="${stModel.bonus }"
						type="currency" />
					<input type="text" class="form-control" value="${bonus}"
						readonly="readonly">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3">
					<h6 class="mb-0">Phạt</h6>
				</div>
				<div class="col-sm-9 text-secondary">
					<fmt:setLocale value="vi_VN" />
					<fmt:formatNumber var="punish" value="${stModel.punish }"
						type="currency" />
					<input type="text" class="form-control" value="${punish}"
						readonly="readonly">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3">
					<h6 class="mb-0">Ứng trước</h6>
				</div>
				<div class="col-sm-9 text-secondary">
					<fmt:setLocale value="vi_VN" />
					<fmt:formatNumber var="advance" value="${stModel.advance }"
						type="currency" />
					<input type="text" class="form-control" value="${advance}"
						readonly="readonly">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3">
					<h6 class="mb-0">Bảo hiểm</h6>
				</div>
				<div class="col-sm-9 text-secondary">
					<fmt:setLocale value="vi_VN" />
					<fmt:formatNumber var="insurance" value="${stModel.insurance }"
						type="currency" />
					<input type="text" class="form-control" value="${insurance}"
						readonly="readonly">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3">
					<h6 class="mb-0">Thuế</h6>
				</div>
				<div class="col-sm-9 text-secondary">
					<fmt:setLocale value="vi_VN" />
					<fmt:formatNumber var="tax" value="${stModel.tax }" type="currency" />
					<input type="text" class="form-control" value="${tax}"
						readonly="readonly">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3">
					<h6 class="mb-0">Tồng</h6>
				</div>
				<div class="col-sm-9 text-secondary">
					<fmt:setLocale value="vi_VN" />
					<fmt:formatNumber var="total" value="${stModel.total }"
						type="currency" />
					<input type="text" class="form-control" value="${total}"
						readonly="readonly">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-sm-3">
					<h6 class="mb-0">Thanh toán</h6>
				</div>
				<div class="col-sm-9 text-secondary" style="display: flex;">
					<input type="checkbox" id="payed" style="margin: auto 10px;"
						${stModel.settlement==1?"checked":""} onclick="return false;">
					<label for="payed" style="margin: 0;"> Đã thanh toán </label>
				</div>
			</div>
			<div class="modal-footer">
				<a href="<c:url value='/manager/salary'/>" class="btn btn-secondary">Close</a>
				<a
					href="<c:url value='/manager/salary?type=edit&id=${stModel.id }'/>"
					class="btn btn-primary" type="submit">Sửa</a>
			</div>
		</div>
	</div>

</body>
</html>