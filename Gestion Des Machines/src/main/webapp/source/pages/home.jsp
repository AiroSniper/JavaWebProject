
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header.jsp"%>
<%@include file="template/menu.jsp"%>
<!-- BEGIN: Content-->
<div class="app-content content ">
	<div class="content-overlay"></div>
	<div class="header-navbar-shadow"></div>
	<div class="content-wrapper container-xxl p-0">
		<div class="content-header row">
			<div class="content-header-left col-md-9 col-12 mb-2">
				<div class="row breadcrumbs-top">
					<div class="col-12">
						<h2 class="content-header-title float-left mb-0">Tableau de
							bord</h2>
					</div>
				</div>
			</div>
			<div
				class="content-header-right text-md-right col-md-3 col-12 d-md-block d-none">
				<div class="form-group breadcrumb-right">
					<div class="dropdown">
						<button
							class="btn-icon btn btn-primary btn-round btn-sm dropdown-toggle"
							type="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">
							<i data-feather="grid"></i>
						</button>
						<div class="dropdown-menu dropdown-menu-right">
							<a class="dropdown-item" href=""><i class="mr-1"
								data-feather="check-square"></i><span class="align-middle">Todo</span></a><a
								class="dropdown-item" href=""><i class="mr-1"
								data-feather="message-square"></i><span class="align-middle">Chat</span></a><a
								class="dropdown-item" href=""><i class="mr-1"
								data-feather="mail"></i><span class="align-middle">Email</span></a><a
								class="dropdown-item" href=""><i
								class="mr-1" data-feather="calendar"></i><span
								class="align-middle">Calendar</span></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="content-body">
			<div class="row match-height">



				<div class="col-6">
					<div class="card">
						<div class="card-header">
							<div>
								<h2 class="font-weight-bolder mb-0" id="machinesCount"></h2>
								<p class="card-text">Nombre De Machines</p>
							</div>
							<div class="avatar bg-light-primary p-50 m-0">
								<div class="avatar-content">
									<i data-feather='monitor' class="font-medium-5"></i>
								</div>
							</div>
						</div>
					</div>
				</div>


				<div class="col-6">
					<div class="card">
						<div class="card-header">
							<div>
								<h2 class="font-weight-bolder mb-0" id="sallesCount"></h2>
								<p class="card-text">Nombre De Salles</p>
							</div>
							<div class="avatar bg-light-primary p-50 m-0">
								<div class="avatar-content">
									<i data-feather='columns' class="font-medium-5"></i>
								</div>
							</div>
						</div>
					</div>
				</div>



			</div>
			<section id="chartjs-chart">


				<!-- Line Chart Starts-->
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<div>
									<h4 class="card-title">Machines Par Salles</h4>

								</div>
							</div>
							<div class="card-body">
								<canvas class="bar-chart-ex chartjs" data-height="450"></canvas>
							</div>
						</div>
					</div>
				</div>
				<!-- Line Chart Ends-->

				<div class="row">
					<!-- Radar Chart Starts-->
					<div class="col-lg-6 col-12">
						<div class="card">
							<div
								class="card-header d-flex flex-row justify-content-between align-items-center">
								<h4 class="card-title">Machines Par Marques</h4>
								<div class="d-flex align-items-center flex-wrap">
									<div id="tooltip" class="tooltip-placeholder"></div>
								</div>
							</div>
							<div class="card-body">
								<canvas class="horizontal-bar-chart-ex chartjs" id="canvas"
									data-height="355"></canvas>
							</div>
						</div>
					</div>
					<!-- Radar Chart Ends-->


					<div class="col-lg-6 col-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">Machines Par Tye Des Salles</h4>
							</div>
							<div class="card-body">
								<canvas class="line-chart-ex  chartjs" data-height="350"></canvas>
							</div>
						</div>
					</div>
				</div>


				<div class="row">

					<div class="col-lg-6 col-12">
						<div class="card">

							<div class="card-header">
								<h4 class="card-title">Liste Des Machines</h4>
							</div>
							<div class="card-body">

								<div class="table-responsive"
									style="overflow-y: scroll; height: 400px;">
									<table class="table table-borderless">

										<thead>
											<tr>

												<th>Reference</th>
												<th>Marque</th>
												<th>Prix</th>



											</tr>
										</thead>
										<tbody id="tabM">

										</tbody>
									</table>
								</div>

							</div>


						</div>
					</div>

					<div class="col-lg-6 col-12">
						<div class="card">

							<div class="card-header">
								<h4 class="card-title">Liste Des Salles</h4>
							</div>
							<div class="card-body">

								<div class="table-responsive"
									style="overflow-y: scroll; height: 400px;">
									<table class="table table-borderless">

										<thead>
											<tr>

												<th>Code</th>
												<th>Label</th>
												<th>Type</th>



											</tr>
										</thead>
										<tbody id="tabS">

										</tbody>
									</table>
								</div>

							</div>


						</div>
					</div>
			</section>

		</div>
	</div>
</div>
<!-- END: Content-->

<div class="sidenav-overlay"></div>
<div class="drag-target"></div>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="../app-assets/vendors/js/charts/apexcharts.min.js"></script>
<script src="../app-assets/vendors/js/extensions/toastr.min.js"></script>
<script src="../app-assets/vendors/js/extensions/moment.min.js"></script>
<script src="../app-assets/js/scripts/pages/dashboard-analytics.js"></script>
<script src="../app-assets/js/scripts/pages/app-invoice-list.js"></script>
<script src="../app-assets/vendors/js/charts/chart.min.js"></script>
<script
	src="../app-assets/vendors/js/pickers/flatpickr/flatpickr.min.js"></script>

<script src="scripts/home.js"></script>
<%@include file="template/footer.jsp"%>