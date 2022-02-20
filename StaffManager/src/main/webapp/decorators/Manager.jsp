<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title><dec:title default="Trang chủ" /></title>

<link
	href="<c:url value='/template/library/fontawesome-free/css/all.min.css'/>"
	rel="stylesheet" type="text/css">
<link
	href="<c:url value='/template/library/fontawesome-free/css/fontawesome.min.css'/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value='/template/library/select2/select2.min.css'/>"
	rel="stylesheet" type="text/css">
<link
	href="<c:url value='/template/library/perfect-scrollbar/perfect-scrollbar.css'/>"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link
	href="<c:url value='/template/library/bootstrap/bootstrap-select.min.css'/>"
	rel="stylesheet" type="text/css">
<link
	href="<c:url value='/template/library/bootstrap/bootstrap.min.css'/>"
	rel="stylesheet">
<link href="<c:url value='/template/library/css/sb-admin-2.min.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='/template/styles/manager/css/stm-styles.css'/>"
	rel="stylesheet">
<link href="<c:url value='/template/styles/manager/css/animate.css'/>"
	rel="stylesheet">
<link href="<c:url value='/template/styles/manager/css/util.css'/>"
	rel="stylesheet">
<link href="<c:url value='/template/styles/manager/css/main.css'/>"
	rel="stylesheet">
<link href="<c:url value='/template/styles/admin/css/profile-admin.css'/>"
	rel="stylesheet">


</head>

<body id="page-top">

	<div id="wrapper">
		<%@include file="/Components/Manager/LeftColumn/LeftColumn.jsp"%>
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- header  -->
				<%@include file="/Components/Manager/Header/Header.jsp"%>
				<!-- end header -->
				<div class="container-fluid">
					<dec:body />
				</div>
			</div>
			<%@include file="/Components/Manager/Footer/Footer.jsp"%>
		</div>
	</div>

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<script src="<c:url value='/template/library/jquery/jquery.min.js'/>"></script>
	<script
		src="<c:url value='/template/library/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
	<script
		src="<c:url value='/template/library/jquery-easing/jquery.easing.min.js'/>"></script>
	<script src="<c:url value='/template/library/js/sb-admin-2.min.js'/>"></script>
	<script
		src="<c:url value='/template/library/bootstrap/bootstrap-select.min.js'/>"></script>
	<script src="<c:url value='/template/styles/manager/js/main.js'/>"></script>
</body>
</html>