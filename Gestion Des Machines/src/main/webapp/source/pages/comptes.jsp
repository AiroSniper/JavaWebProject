

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
						<h2 class="content-header-title float-left mb-0">Gestion des
							comptes</h2>
						<div class="breadcrumb-wrapper">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="home.jsp">Tableau
										de bord</a></li>
								<li class="breadcrumb-item active">Gestion des comptes</li>
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

			<div class="row mb-2">
				<div class="col-4">

					<div class="form-group">
						<select id="pageSize" class="form-control"
							style="cursor: pointer;">
							<option value="5">5</option>
							<option value="10">10</option>
							<option value="15">15</option>
							<option value="20">20</option>
						</select>
					</div>
				</div>
				<div class="col-8">
					<button type="button" data-toggle="modal" data-target="#genModal"
						class="btn btn-icon btn-primary">
						<i class="fas fa-user-plus"></i> &nbsp;&nbsp; Generer
					</button>
				</div>
			</div>


			<div class="row">
				<div class="col-12">

					<div class="modal fade text-left" id="genModal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel20" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered modal-xs"
							role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title" id="myModalLabel20">Generer Compte</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">Vous voulez Generer un Compte ?</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-outline-primary"
										data-dismiss="modal">Non</button>
									<button type="button" class="btn btn-primary"
										data-dismiss="modal" onclick="generate()">Oui</button>
								</div>
							</div>
						</div>
					</div>

					<div class="modal fade text-left" id="upModal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel20" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered modal-xs"
							role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title" id="myModalLabel20">Activer Compte</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">Vous voulez Activer ce Compte ?</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-outline-primary"
										data-dismiss="modal">Non</button>
									<button type="button" class="btn btn-primary"
										data-dismiss="modal" onclick="up()">Oui</button>
								</div>
							</div>
						</div>
					</div>

					<div class="modal fade text-left" id="copyModal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel20" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered modal-xs"
							role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title" id="myModalLabel20">Copier Les
										infos</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">Vous voulez Copie les infos ?</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-outline-primary"
										data-dismiss="modal">Non</button>
									<button type="button" class="btn btn-primary"
										data-dismiss="modal" onclick="copy()">Oui</button>
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
										Compte</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">Vous voulez supprimer ce Compte ?</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-outline-primary"
										data-dismiss="modal">Non</button>
									<button type="button" class="btn btn-primary"
										data-dismiss="modal" onclick="del()">Oui</button>
								</div>
							</div>
						</div>
					</div>

					<div class="modal fade text-left" id="downModal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel20" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered modal-xs"
							role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title" id="myModalLabel20">Desactiver
										Compte</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">Vous voulez Desactiver ce Compte ?</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-outline-primary"
										data-dismiss="modal">Non</button>
									<button type="button" class="btn btn-primary"
										data-dismiss="modal" onclick="down()">Oui</button>
								</div>
							</div>
						</div>
					</div>

					<div class="table-responsive">
						<table class="table table-borderless">

							<thead>
								<tr>
									<th>Image</th>
									<th>Nom</th>
									<th>Prenom</th>
									<th>Email</th>
									<th>Login</th>
									<th>Status</th>
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
<script src="scripts/comptes.js"></script>
<%@include file="template/footer.jsp"%>