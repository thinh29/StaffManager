<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tìm kiếm '${s }' | Quản lý nhân sự</title>
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
			<h4 class="m-0 font-weight-bold text-primary">Tìm kiếm nhân viên
				"${s }"</h4>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-7">
						<div style="margin: 10px;">
							<c:if test="${not empty message}">
								<div class="alert alert-danger">${message}</div>
							</c:if>
						</div>
					</div>
					<div class="col-5">
						<div class=" text-right" style="margin: 10px;">
							<a href="<c:url value='/manager/salary'/>"
								class="btn btn-primary"> <i class="fa fa-list-alt"></i> Xem
								tất cả
							</a>
						</div>
					</div>
				</div>

			</div>

		</div>

		<div class="row">
			<div class="col-md-9">
				<form class="slr-form-sort" action="/manager/salary" method="POST"
					id="slr--sort" onsubmit="lazySubmit(event)">
					<div class="row" style="margin: 10px;">
						<div class="col-3">
							<select id="sortKey" name="sortBy" class="form-control"
								onchange="changeSort()">
								<option value="" ${sortOption=="id desc"?"selected":"" }>Sắp
									xếp theo</option>
								<option value="full_name DESC"
									${sortOption=="full_name DESC"?"selected":"" }>Tên
									tăng dần</option>
								<option value="full_name ASC"
									${sortOption=="full_name ASC"?"selected":"" }>Tên giảm
									dần</option>
								<option value="total DESC"
									${sortOption=="total DESC"?"selected":"" }>Lương tăng
									dần</option>
								<option value="total ASC"
									${sortOption=="total ASC"?"selected":"" }>Lương giảm
									dần</option>
								<option value="position_id DESC"
									${sortOption=="position_id DESC"?"selected":"" }>Vị
									trí nhân viên tăng dần</option>
								<option value="position_id ASC"
									${sortOption=="position_id ASC"?"selected":"" }>Vị trí
									nhân viên giảm dần</option>
							</select>
						</div>

						<div class="col-6">
							<select id="periodSort" class="form-control"
								onchange="changeSort()">
								<option value="" ${slrPer==""?"selected":"" }>Chọn kỳ
									lương</option>
								<c:forEach var="sP" items="${slrPeriods}">
									<option value="${sP.id }" ${slrPer==sP.id?"selected":"" }>${sP.name }</option>
								</c:forEach>
							</select>
						</div>

						<div class="col-3">
							<select id="getByType" name="getByType" class="form-control"
								onchange="changeSort()">
								<option value="" ${typeSort==""?"selected":"" }>Hình
									thức nhân viên</option>
								<c:forEach var="ht" items="${types}">
									<option value="${ht.id }" ${typeSort==ht.id?"selected":"" }>${ht.name }</option>
								</c:forEach>
							</select>
						</div>
					</div>


				</form>
			</div>
			<div class="col-md-3">
				<form class="stf-form-search" action="/manager/salary" method="GET"
					id="stf-skw" onsubmit="lazySubmit(event)">
					<input type="hidden" value="search" id="prj-st" name="type" /> <input
						type="text" name="s" class="form-control" id="prj-skw"
						placeholder="Tìm kiếm tên nhân viên..."
						onKeyPress="pressKeyboard(event, this)" required
						value=${not empty s ? s:""}>
					<!--project search keyword-->
					<button type="submit" class="btn stf-search-btn">
						<i class="fas fa-search"></i>
					</button>

				</form>
			</div>
		</div>

		<div class="card-body">
			<div class="table-responsive" style="overflow-x: srcoll !important">
				<div class="wrap-table100">
					<div class="table100 ver1">
						<div class="table100-head">
							<table>
								<thead>
									<tr class="row100 head">
										<th class="cell100 column1">#</th>
										<th class="cell100 column2">Họ và tên</th>
										<th class="cell100 column3">Vị trí</th>
										<th class="cell100 column4">Hình thức</th>
										<th class="cell100 column5">Kỳ lương</th>
										<th class="cell100 column6">Số dư</th>
										<th class="cell100 column7">Thanh toán</th>
										<th class="cell100 column8">Chi tiết</th>

									</tr>
								</thead>
							</table>
						</div>

						<div class="table100-body js-pscroll">
							<table>
								<tbody>

									<c:forEach var="item" items="${listSTM}" varStatus="loop">
										<tr class="row100 body">
											<td class="cell100 column1">${(page -1)*20 + loop.index + 1}</td>
											<td class="cell100 column2">${item.fullName }</td>
											<td class="cell100 column3">${position.get(item.positionId-1).name }</td>
											<td class="cell100 column4">${types.get(item.typeId - 1).name }</td>
											<td class="cell100 column5">${slrPeriods.get(item.periodId-1).name }</td>
											<td class="cell100 column6"><fmt:setLocale value="vi_VN" />
												<fmt:formatNumber value="${item.total }" type="currency" />
											</td>
											<td class="cell100 column7"><input type="checkbox"
												${item.settlement == 1?"checked":"" }
												onclick="return false;" class="checked-box" /></td>
											<td class="cell100 column8"><a
												href="<c:url value='/manager/salary?type=view&id=1'/> "
												class="btn btn-primary stm-btn-view"> <i
													class="far fa-eye"></i> Xem chi tiết
											</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<ul class="pagination" id="pagination"></ul>

			<form action="<c:url value='/manager/salary'/>" id="formSort"
				method="post" onsubmit="lazySubmit(event)">
				<input type="hidden" id="typeSort" name="type" value=""> <input
					type="hidden" id="pageSort" name="page" value=""> <input
					type="hidden" id="maxPageItemSort" name="maxPageItem" value="">
				<input type="hidden" id="sortNameSort" name="sortName" value="">
				<input type="hidden" id="sortBySort" name="sortBy" value="">
				<input type="hidden" id="searchK" name="s" value=""> <input
					type="hidden" id="slrPeriodSort" name="slrPeriodSort" value="">
				<input type="hidden" id="typeStaff" name="typeStaff" value="">
			</form>
		</div>
	</div>


	<!-- Custom scripts for all pages-->
	<%-- <c:if test="${ message!=null}">
		<script>
  
         alert("${message}");
   
    </script>
	</c:if> --%>

	<script
		src="<c:url value='/template/library/jquery/jquery-3.2.1.min.js'/>"></script>
	<script src="<c:url value='/template/library/jquery/jquery.min.js'/>"></script>
	<script src="<c:url value='/template/library/bootstrap/js/popper.js'/>"></script>
	<script
		src="<c:url value='/template/library/bootstrap/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/template/library/select2/select2.min.js'/>"></script>
	<script
		src="<c:url value='/template/library/perfect-scrollbar/perfect-scrollbar.min.js'/>"></script>
	<script
		src="<c:url value = '/template/library/js/jquery.dataTables.min.js'/>"></script>
	<script
		src="<c:url value = '/template/library/js/dataTables.bootstrap4.min.js'/>"></script>
	<script
		src="<c:url value = '/template/library/jquery/jquery.twbsPagination.js' />"></script>
	<script>
		function pressKeyboard(e, input) {
			if (e.keyCode === 13) { // check enter press
				document.getElementById("stf-skw").submit();
			}
		}
		var totalPages = ${totalPage};
		var currentPage = ${page};
		var limit = 20;
		$(function() {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages : totalPages,
				visiblePages : 10,
				startPage : currentPage,
				onPageClick : function(event, page) {
					if (currentPage != page) {
						$('#maxPageItemSort').val(limit);
						$('#pageSort').val(page);
						if($('#sortKey').val() !== ""){
							let sortNameSort = $('#sortKey').val().split(" ")[0];
							let sortBySort = $('#sortKey').val().split(" ")[1];
							$('#sortNameSort').val(sortNameSort);
							$('#sortBySort').val(sortBySort);
						} else {
							$('#sortNameSort').val('id');
							$('#sortBySort').val('desc');								
						}
						$('#slrPeriodSort').val($('#periodSort').val());
						$('#typeStaff').val($('#getByType').val());
						$('#typeSort').val('search');	
						$('#searchK').val($('#prj-skw').val());
						$('#formSort').submit();
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
			}, 1000);			
		}
		function changeSort() {
			$('#typeSort').val('search');
			$('#pageSort').val('1');
			$('#maxPageItemSort').val(20);
			 if($('#sortKey').val() !== ""){
				let sortNameSort = $('#sortKey').val().split(" ")[0];
				let sortBySort = $('#sortKey').val().split(" ")[1];
				$('#sortNameSort').val(sortNameSort);
				$('#sortBySort').val(sortBySort);
			}else{
				$('#sortNameSort').val('id');
				$('#sortBySort').val('desc');
			}
			$('#slrPeriodSort').val($('#periodSort').val());
			$('#typeStaff').val($('#getByType').val());
			$('#searchK').val($('#prj-skw').val());
			$('#formSort').submit();
		}
		</script>
</body>
</html>