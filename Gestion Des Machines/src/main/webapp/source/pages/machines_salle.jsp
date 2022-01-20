
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
						<h2 class="content-header-title float-left mb-0">Machines par
							salle</h2>
						<div class="breadcrumb-wrapper">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="home.jsp">Tableau
										de bord</a></li>
								<li class="breadcrumb-item active">Machines par salle</li>
							</ol>
						</div>
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
								class="dropdown-item" href=""><i class="mr-1"
								data-feather="calendar"></i><span class="align-middle">Calendar</span></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="content-body">
			<div class="row">
				<div class="col-12" id="alert" style="height: 60px"></div>
			</div>

			<div class="row">
				<div class="col-4">
					<select id="salle" class="form-control" style="cursor: pointer;">

					</select>

				</div>
				<div class="col-4">
					<select id="pageSize" class="form-control" style="cursor: pointer;">
						<option value="5">5</option>
						<option value="10">10</option>
						<option value="15">15</option>
						<option value="20">20</option>
					</select>
				</div>
				<div class="col-4 d-flex justify-content-end">
					<button type="button" onclick="refresh()" class="btn btn-primary">
						<i data-feather='refresh-ccw'></i>
					</button>
				</div>
			</div>

			<div class="row">
				<div class="col-12">
					<div class="mb-2 mt-2"></div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<!-- Button trigger modal -->

					<!-- Modal -->

					<div class="modal fade text-left" id="editModal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title" id="myModalLabel33">Modifier salle</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<label>Reference: </label>
									<div class="form-group">
										<input type="text" id="refE"
											placeholder="Reference de machine" class="form-control" />
									</div>

									<label>Marque: </label>
									<div class="form-group">
										<input type="text" id="marqueE"
											placeholder="Marque de machine" class="form-control" />
									</div>

									<label>Prix: </label>
									<div class="form-group">
										<input type="text" id="prixE" placeholder="Prix d'achat"
											class="form-control" />
									</div>

									<label>Date d'achat: </label>
									<div class="form-group">
										<input type="date" id="dateE" class="form-control" />
									</div>


									<label>Salle: </label>
									<div class="form-group">
										<select id="salleE" class="form-control"
											style="cursor: pointer;">

										</select>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-outline-primary"
										data-dismiss="modal" aria-label="Close">Annuler</button>
									<button onclick="edit()" type="button" class="btn btn-primary"
										data-dismiss="modal">
										<i data-feather='edit'></i> Modifier
									</button>
								</div>
							</div>
						</div>
					</div>
					<div class="modal fade text-left" id="delModal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel20" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered modal-xs"
							role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title" id="myModalLabel20">Supprmer
										Machine</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">Vous voulez supprimer ?</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-outline-primary"
										data-dismiss="modal">Non</button>
									<button type="button" class="btn btn-primary"
										data-dismiss="modal" onclick="del()">Oui</button>
								</div>
							</div>
						</div>
					</div>

					<div class="table-responsive">
						<table class="table table-borderless">

							<thead>
								<tr>
									<th>ID</th>
									<th>Reference</th>
									<th>Marque</th>
									<th>Date d'achat</th>
									<th>Prix</th>
									<th>Salle</th>
									<th></th>

								</tr>
							</thead>
							<tbody id="tab">

							</tbody>
						</table>

					</div>
					<nav>
						<ul class="pagination mt-2" id="pagin">

						</ul>
					</nav>
				</div>

			</div>

		</div>
	</div>
</div>
<!-- END: Content-->

<div class="sidenav-overlay"></div>
<div class="drag-target"></div>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="scripts/machines_salle.js"></script>
<%@include file="template/footer.jsp"%>