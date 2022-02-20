<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/Common/ConstantLib.jsp"%>
<!-- Sidebar -->
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="/admin">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-laugh-wink"></i>
		</div>
		<div class="sidebar-brand-text mx-3">
			Manager <sup>1.0</sup>
		</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<!-- Nav Item - Dashboard -->
	<li class="nav-item active"><a class="nav-link" href="/admin">
			<i class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard </span>
	</a></li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	
	<li class="nav-item"><a class="nav-link " href="/admin/accounts">
			<i class="fas fa-fw fa-user"></i> <span>Quản lý tài khoản</span>
	</a></li>


	<!-- Nav Item - Utilities Collapse Menu -->
	<li class="nav-item"><a class="nav-link " href="/admin/projects">
			<i class="fas fa-fw fa-suitcase"></i> <span>Quản lý dự án</span>
	</a></li>
	<!-- Nav Item - Pages Collapse Menu 
	<li class="nav-item">
		<a class="nav-link collapsed" href="#">
			<i class="fas fa-fw fa-user"></i> <span>Quy trình dự án </span>
		</a>
	</li>
	<!-- Divider -->
	<hr class="sidebar-divider">



	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link "
		href="/admin/notifications"> 
		<i class="fas fa-bell fa-fw"></i> <span>Thông báo</span>
	</a>
	<li class="nav-item"><a class="nav-link " href="/admin/functions">
			<i class="fas fa-fw fa-folder"></i> <span>Chức năng</span>
	</a></li>

	<!-- Nav Item - Charts -->
	<li class="nav-item"><a class="nav-link" href="#"> <i
			class="fas fa-fw fa-chart-area"></i> <span>Email</span></a></li>

	<!-- Nav Item - Tables -->
	<li class="nav-item"><a class="nav-link" href="/admin/chatRoom"> <i
			class="fas fa-fw fa-table"></i> <span>Chat</span></a></li>

	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">

	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>

</ul>
<!-- End of Sidebar -->