
<%
if (request.getSession(false).getAttribute("login") == null) {

	response.sendRedirect("login.jsp");
} else {

	if (request.getSession(false).getAttribute("status").equals(-1)) {

		request.getSession(false).invalidate();
		response.sendRedirect("login.jsp");
	} else if (request.getSession(false).getAttribute("status").equals(1) || request.getSession(false).getAttribute("status").equals(2)) {

		response.sendRedirect("home.jsp");

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

<!-- BEGIN: font-awesome-->
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<!-- END: font-awesome-->
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
	href="../app-assets/css/plugins/forms/form-validation.css">
<link rel="stylesheet" type="text/css"
	href="../app-assets/css/pages/page-auth.css">
<!-- END: Page CSS-->

<!-- BEGIN: Custom CSS-->
<link rel="stylesheet" type="text/css" href="../assets/css/style.css">
<!-- END: Custom CSS-->

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body
	class="vertical-layout vertical-menu-modern blank-page navbar-floating footer-static  "
	data-open="click" data-menu="vertical-menu-modern"
	data-col="blank-page">
	<!-- BEGIN: Content-->
	<div class="app-content content ">
		<div class="content-overlay"></div>
		<div class="header-navbar-shadow"></div>
		<div class="content-wrapper">
			<div class="content-header row"></div>
			<div class="content-body">
				<div class="auth-wrapper auth-v1 px-2">
					<div class="auth-inner py-2">
						<!-- Login v1 -->
						<div class="card mb-0">
							<div class="card-body">
								<a href="javascript:void(0);" class="brand-logo"> <svg
										viewbox="0 0 139 95" version="1.1"
										xmlns="http://www.w3.org/2000/svg"
										xmlns:xlink="http://www.w3.org/1999/xlink" height="28">
                                        <defs>
                                            <lineargradient
											id="linearGradient-1" x1="100%" y1="10.5120544%" x2="50%"
											y2="89.4879456%">
                                                <stop
											stop-color="#000000" offset="0%"></stop>
                                                <stop
											stop-color="#FFFFFF" offset="100%"></stop>
                                            </lineargradient>
                                            <lineargradient
											id="linearGradient-2" x1="64.0437835%" y1="46.3276743%"
											x2="37.373316%" y2="100%">
                                                <stop
											stop-color="#EEEEEE" stop-opacity="0" offset="0%"></stop>
                                                <stop
											stop-color="#FFFFFF" offset="100%"></stop>
                                            </lineargradient>
                                        </defs>
                                        <g id="Page-1" stroke="none"
											stroke-width="1" fill="none" fill-rule="evenodd">
                                            <g id="Artboard"
											transform="translate(-400.000000, -178.000000)">
                                                <g id="Group"
											transform="translate(400.000000, 178.000000)">
                                                    <path
											class="text-primary" id="Path"
											d="M-5.68434189e-14,2.84217094e-14 L39.1816085,2.84217094e-14 L69.3453773,32.2519224 L101.428699,2.84217094e-14 L138.784583,2.84217094e-14 L138.784199,29.8015838 C137.958931,37.3510206 135.784352,42.5567762 132.260463,45.4188507 C128.736573,48.2809251 112.33867,64.5239941 83.0667527,94.1480575 L56.2750821,94.1480575 L6.71554594,44.4188507 C2.46876683,39.9813776 0.345377275,35.1089553 0.345377275,29.8015838 C0.345377275,24.4942122 0.230251516,14.560351 -5.68434189e-14,2.84217094e-14 Z"
											style="fill: currentColor"></path>
                                                    <path id="Path1"
											d="M69.3453773,32.2519224 L101.428699,1.42108547e-14 L138.784583,1.42108547e-14 L138.784199,29.8015838 C137.958931,37.3510206 135.784352,42.5567762 132.260463,45.4188507 C128.736573,48.2809251 112.33867,64.5239941 83.0667527,94.1480575 L56.2750821,94.1480575 L32.8435758,70.5039241 L69.3453773,32.2519224 Z"
											fill="url(#linearGradient-1)" opacity="0.2"></path>
                                                    <polygon id="Path-2"
											fill="#000000" opacity="0.049999997"
											points="69.3922914 32.4202615 32.8435758 70.5039241 54.0490008 16.1851325"></polygon>
                                                    <polygon
											id="Path-21" fill="#000000" opacity="0.099999994"
											points="69.3922914 32.4202615 32.8435758 70.5039241 58.3683556 20.7402338"></polygon>
                                                    <polygon id="Path-3"
											fill="url(#linearGradient-2)" opacity="0.099999994"
											points="101.428699 0 83.0667527 94.1480575 130.378721 47.0740288"></polygon>
                                                </g>
                                            </g>
                                        </g>
                                    </svg>
									<h2 class="brand-text text-primary ml-1">Manago</h2>
								</a>

								<h4 class="card-title mb-1">Bienvenue à Manago 👋</h4>
								<p class="card-text mb-2">Mettez à jour votre mot de passe</p>

 														<% if (request.getSession(false).getAttribute("id") != null) {%>
														<span hidden id="id_label"><%= request.getSession(false).getAttribute("id")%></span>
														<%}%>

								<div class="form-group">
									<div class="d-flex justify-content-between">
										<label for="password">Nouveau mot de passe</label>
									</div>
									<div class="input-group input-group-merge form-password-toggle">
										<input id="password" type="password"
											class="form-control form-control-merge" tabindex="2"
											placeholder="Mot de Passe" />
										<div class="input-group-append">
											<span class="input-group-text cursor-pointer"><i
												data-feather="eye"></i></span>
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<div class="d-flex justify-content-between">
										<label for="re_password">Re-taper le nouveau mot de passe</label>
									</div>
									<div class="input-group input-group-merge form-password-toggle">
										<input id="re_password" type="password"
											class="form-control form-control-merge" tabindex="2"
											placeholder="Mot de Passe" />
										<div class="input-group-append">
											<span class="input-group-text cursor-pointer"><i
												data-feather="eye"></i></span>
										</div>
									</div>
								</div>
								<div class="form-group mb-4"></div>
								<button type="button" onclick="modifier()"
									class="btn btn-primary btn-block" tabindex="4">Modifier</button>




								<div class="divider" id="alert" style="height: 60px;"></div>


							</div>
						</div>
						<!-- /Login v1 -->
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- END: Content-->


	<!-- BEGIN: Vendor JS-->
	<script src="../app-assets/vendors/js/vendors.min.js"></script>
	<!-- BEGIN Vendor JS-->

	<!-- BEGIN: Page Vendor JS-->
	<script
		src="../app-assets/vendors/js/forms/validation/jquery.validate.min.js"></script>
	<!-- END: Page Vendor JS-->

	<!-- BEGIN: Theme JS-->
	<script src="../app-assets/js/core/app-menu.js"></script>
	<script src="../app-assets/js/core/app.js"></script>
	<!-- END: Theme JS-->

	<!-- BEGIN: Page JS-->
	<script src="../app-assets/js/scripts/pages/page-auth-login.js"></script>
	<!-- END: Page JS-->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="scripts/update.js"></script>
	<script>
		$(window).on('load', function() {
			if (feather) {
				feather.replace({
					width : 14,
					height : 14
				});
			}
		})
	</script>
</body>
<!-- END: Body-->

</html>