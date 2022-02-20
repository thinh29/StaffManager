<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ | Manager</title>
</head>
<body>
<link
	href="<c:url value='/template/styles/manager/css/hp-style.css'/>"
	rel="stylesheet" type="text/css">
<div class="container mt-5 pt-5 hp">
      <div class="row">
        <div class="col-lg-6 py-3 wow fadeInLeft" style="visibility: visible; animation-name: fadeInLeft;">
          <h2 class="title-section">Xin chào, <span class="marked">${account}</span></h2>
          <div class="divider"></div>
          <p>Manager, </p>
          <p class="mb-5">Chúc bạn một ngày vui vẻ và tốt lành .</p>
          <a href="/manager/staffs" class="btn btn-primary mt-2">Quản lý nhân viên</a> 
          <a href="/manager/salary" class="btn btn-outline mt-2 ml-2">Quản lý lương</a></div>
        <div class="col-lg-6 py-3 wow zoomIn" style="visibility: visible; animation-name: zoomIn;">
          <div class="img-place text-center"><img src="<c:url value='/assits/manager/img/wc-photo.svg'/>" alt="website template image"></div>
        </div>
      </div>
    </div>
</body>
</html>