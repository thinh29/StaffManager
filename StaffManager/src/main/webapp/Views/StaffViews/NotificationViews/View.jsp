<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${notification.title}| Quản lý nhân viên</title>
</head>
<body>
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">${notification.title}</h1>
	</div>
	<div class="row">

		<div class="col-12">
			<div class="card shadow mb-4">

				<div class="card-body">
					<div class="row mt-2">
						<div class="col-4">
							<div class="ntf-list-notifi">
								<c:forEach var="item" items="${notification.listResult}"
									varStatus="loop">
									<a class="dropdown-item d-flex align-items-center"
										href="<c:url value='/notifications?type=view&id=${item.id}' />"
										style="background:${item.id==notification.id?'#e5e5e5':''}">
										<div class="mr-3">
											<div class="icon-circle bg-${item.backgroundName}">
												<i
													class="fas fa-${item.level==1?'file-alt':(item.level==2?'exclamation-triangle':(item.level==3?'exclamation-circle':'donate'))} 
											text-white"></i>
											</div>

										</div>
									
									</div>
									<div>
										<div class="small text-gray-500">${notification.convertNumberMonthToMonthName(item.createAt.getMonth()+1)} ${item.createAt.getDate()}, ${item.createAt.getYear()+1900}</div>
										<c:if test="${seen.get(loop.index)==0}">
										<span class="font-weight-bold" >#${item.title}</span>
										</c:if>
										<c:if test="${seen.get(loop.index)!=0}">
										#${item.title}
										</c:if>
										</div>
									</a>
								</c:forEach>
								<a
									class="dropdown-item text-center small text-gray-800 font-weight-bold"
									href="/notifications"> Xem tất cả thông báo</a>
							</div>
						</div>

						<div class="col-8 ntf-d-content">
							<label>Thời gian thông báo: &nbsp;<span>${notification.createAt.getHours()}:${notification.createAt.getMinutes()<10?'0':''}${notification.createAt.getMinutes()}
									${notification.createAt.getDate()}/${notification.createAt.getMonth()+1}/${notification.createAt.getYear()+1900}</span></label>
							<div class="ntf-content">
								<p>${notification.content}</p>
							</div>

						</div>
					</div>
					<hr>
				</div>
			</div>

		</div>

	</div>
</body>
</html>