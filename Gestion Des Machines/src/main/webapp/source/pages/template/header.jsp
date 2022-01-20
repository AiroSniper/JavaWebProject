
<%
if (request.getSession(false).getAttribute("login") == null) {

	response.sendRedirect("login.jsp");
} else {

	if (request.getSession(false).getAttribute("status").equals(0)) {

		response.sendRedirect("update.jsp");
	} else if (request.getSession(false).getAttribute("status").equals(-1)) {

		request.getSession(false).invalidate();
		response.sendRedirect("login.jsp");

	}
}
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,user-scalable=0,minimal-ui">
<meta name="description"
	content="Vuexy admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
<meta name="keywords"
	content="admin template, Vuexy admin template, dashboard template, flat admin template, responsive admin template, web app">
<meta name="author" content="PIXINVENT">
<title>Manago</title>
<link rel="apple-touch-icon"
	href="../app-assets/images/ico/apple-icon-120.png">
<link rel="shortcut icon" type="image/x-icon"
	href="../app-assets/images/ico/favicon.ico">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,400;1,500;1,600"
	rel="stylesheet">

<!-- BEGIN: Vendor CSS-->
<link rel="stylesheet" type="text/css"
	href="../app-assets/vendors/css/vendors.min.css">
<!-- END: Vendor CSS-->

<!-- BEGIN: Theme CSS-->



<link rel="stylesheet" type="text/css"
	href="../app-assets/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="../app-assets/css/bootstrap-extended.css">
<link rel="stylesheet" type="text/css"
	href="../app-assets/css/colors.css">
<link rel="stylesheet" type="text/css"
	href="../app-assets/css/components.css">
<link rel="stylesheet" type="text/css"
	href="../app-assets/css/themes/dark-layout.css">
<link rel="stylesheet" type="text/css"
	href="../app-assets/css/themes/bordered-layout.css">
<link rel="stylesheet" type="text/css"
	href="../app-assets/css/themes/semi-dark-layout.css">

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css"
	href="../app-assets/css/core/menu/menu-types/vertical-menu.css">




<link rel="stylesheet" type="text/css"
	href="../app-assets/vendors/css/vendors.min.css">
<link rel="stylesheet" type="text/css"
	href="../app-assets/vendors/css/tables/datatable/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css"
	href="../app-assets/vendors/css/tables/datatable/responsive.bootstrap4.min.css">
<link rel="stylesheet" type="text/css"
	href="../app-assets/vendors/css/pickers/flatpickr/flatpickr.min.css">

<link rel="stylesheet" type="text/css"
	href="../app-assets/css/core/menu/menu-types/vertical-menu.css">
<link rel="stylesheet" type="text/css"
	href="../app-assets/css/plugins/charts/chart-apex.css">
<link rel="stylesheet" type="text/css"
	href="../app-assets/css/plugins/extensions/ext-component-toastr.css">
<link rel="stylesheet" type="text/css"
	href="../app-assets/css/pages/app-invoice-list.css">
<!-- END: Page CSS-->

<!-- BEGIN: font-awesome-->
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<!-- END: font-awesome-->

<!-- BEGIN: Custom CSS-->
<link rel="stylesheet" type="text/css" href="../assets/css/style.css">
<!-- END: Custom CSS-->

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body
	class="vertical-layout vertical-menu-modern  navbar-floating footer-static  "
	data-open="click" data-menu="vertical-menu-modern" data-col="">

	<!-- BEGIN: Header-->
	<nav
		class="header-navbar navbar navbar-expand-lg align-items-center floating-nav navbar-light navbar-shadow container-xxl">
		<div class="navbar-container d-flex content">
			<div class="bookmark-wrapper d-flex align-items-center">
				<ul class="nav navbar-nav d-xl-none">
					<li class="nav-item"><a class="nav-link menu-toggle"
						href="javascript:void(0);"><i class="ficon"
							data-feather="menu"></i></a></li>
				</ul>
				<ul class="nav navbar-nav bookmark-icons">
					<li class="nav-item d-none d-lg-block"><a class="nav-link"
						href="" data-toggle="tooltip" data-placement="top" title="Email"><i
							class="ficon" data-feather="mail"></i></a></li>
					<li class="nav-item d-none d-lg-block"><a class="nav-link"
						href="" data-toggle="tooltip" data-placement="top" title="Chat"><i
							class="ficon" data-feather="message-square"></i></a></li>
					<li class="nav-item d-none d-lg-block"><a class="nav-link"
						href="" data-toggle="tooltip" data-placement="top"
						title="Calendar"><i class="ficon" data-feather="calendar"></i></a></li>
					<li class="nav-item d-none d-lg-block"><a class="nav-link"
						href="" data-toggle="tooltip" data-placement="top" title="Todo"><i
							class="ficon" data-feather="check-square"></i></a></li>
				</ul>
				<ul class="nav navbar-nav">
					<li class="nav-item d-none d-lg-block"><a
						class="nav-link bookmark-star"><i class="ficon text-warning"
							data-feather="star"></i></a>
						<div class="bookmark-input search-input">
							<div class="bookmark-input-icon">
								<i data-feather="search"></i>
							</div>
							<input class="form-control input" type="text"
								placeholder="Bookmark" tabindex="0" data-search="search">
							<ul class="search-list search-list-bookmark"></ul>
						</div></li>
				</ul>
			</div>
			<ul class="nav navbar-nav align-items-center ml-auto">

				<li class="nav-item d-none d-lg-block"><a
					class="nav-link nav-link-style"><i class="ficon"
						data-feather="moon"></i></a></li>


				<li class="nav-item dropdown dropdown-user"><a
					class="nav-link dropdown-toggle dropdown-user-link"
					id="dropdown-user" href="javascript:void(0);"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<div class="user-nav d-sm-flex d-none">



							<%
							if (request.getSession(false).getAttribute("nom") == null && request.getSession(false).getAttribute("prenom") == null) {
							%>

							<span class="user-name font-weight-bolder"><%=request.getSession(false).getAttribute("login")%></span>
							<%
							} else if (request.getSession(false).getAttribute("nom") != null
									&& request.getSession(false).getAttribute("prenom") != null) {
							%>
							<span class="user-name font-weight-bolder"><%=request.getSession(false).getAttribute("prenom").toString().substring(0, 1).toUpperCase() + ". "
		+ request.getSession(false).getAttribute("nom").toString().toUpperCase()%></span>

							<%
							}
							%>

							<%
							if (request.getSession(false).getAttribute("status") != null
									&& request.getSession(false).getAttribute("status").equals(0)) {
							%>

							<span class="user-status">User</span>
							<%
							}
							%>


							<%
							if (request.getSession(false).getAttribute("status") != null
									&& request.getSession(false).getAttribute("status").equals(1)) {
							%>

							<span class="user-status">Admin</span>
							<%
							}
							%>

							<%
							if (request.getSession(false).getAttribute("status") != null
									&& request.getSession(false).getAttribute("status").equals(2)) {
							%>

							<span class="user-status">Super Admin</span>
							<%
							}
							%>


						</div> <span class="avatar"> <%
 if (request.getSession(false).getAttribute("image") != null) {
 %> <img class="round"
							src="<%=request.getSession(false).getAttribute("image")%>"
							alt="avatar" height="40" width="40"> <%
 }
 %> <span class="avatar-status-online"></span></span>
				</a>
					<div class="dropdown-menu dropdown-menu-right"
						aria-labelledby="dropdown-user">
						<a class="dropdown-item" href="profile.jsp"><i class="mr-50"
							data-feather="user"></i> Profile</a><a class="dropdown-item"
							onclick="logout()" href=""><i class="mr-50"
							data-feather="power"></i> Logout</a>
					</div></li>
			</ul>
		</div>
	</nav>

	<script src="scripts/logout.js"></script>
	<!-- END: Header-->