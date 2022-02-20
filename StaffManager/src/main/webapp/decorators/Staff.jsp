<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><dec:title default="Trang chủ | Quản lý nhân viên" /></title>

<link href="<c:url value='/template/library/css/sb-admin-2.min.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='/template/library/fontawesome-free/css/all.min.css'/>"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link href="<c:url value='/template/styles/staff/css/prj-styles.css'/>"
	rel="stylesheet">
<link href="<c:url value='/template/styles/staff/css/ntf-styles.css'/>"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type='text/javascript'
	src='<c:url value="/template/library/js/jquery-2.2.3.min.js" />'></script>
<link rel="stylesheet"
	href="<c:url value ='/template/styles/staff/css/style.css' />">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="<c:url value='/template/library/css/sweetalert2.min.css'/>"
	rel="stylesheet">
<link href="<c:url value='/template/styles/admin/css/profile-admin.css'/>"
	rel="stylesheet">

</head>
<body id="page-top">
	<div id="wrapper">
		<%@include file="/Components/Staff/LeftColumn/LeftColumn.jsp"%>
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- header  -->
				<%@include file="/Components/Staff/Header/Header.jsp"%>
				<!-- end header -->
				<div class="container-fluid">
					<dec:body />
				</div>
			</div>
			<%@include file="/Components/Staff/Footer/Footer.jsp"%>
		</div>
	</div>

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Bootstrap core JavaScript-->

	<script src="<c:url value='/template/library/jquery/jquery.min.js'/>"></script>
	<script
		src="<c:url value='/template/library/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="<c:url value='/template/library/jquery-easing/jquery.easing.min.js'/>"></script>

	<!-- Custom scripts for all pages-->
	<script src="<c:url value='/template/library/js/sb-admin-2.min.js'/>"></script>
	<script src="<c:url value='/template/library/js/sweetalert2.js' />"></script>
	
</body>
</html>