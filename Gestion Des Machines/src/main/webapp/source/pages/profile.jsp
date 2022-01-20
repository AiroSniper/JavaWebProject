
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
						<h2 class="content-header-title float-left mb-0">Profile</h2>
						<div class="breadcrumb-wrapper">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="home.jsp">Tableau
										de bord</a></li>
								<li class="breadcrumb-item active">Profile</li>
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
			<!-- account setting page -->
			<section id="page-account-settings">
				<div class="row">
					<!-- left menu section -->
					<div class="col-md-3 mb-2 mb-md-0">
						<ul class="nav nav-pills flex-column nav-left">
							<!-- general -->
							<li class="nav-item" onclick="clearAlert()"><a
								class="nav-link active" id="account-pill-general"
								data-toggle="pill" href="#account-vertical-general"
								aria-expanded="true"> <i data-feather="user"
									class="font-medium-3 mr-1"></i> <span class="font-weight-bold">Général</span>
							</a></li>
							<!-- change password -->
							<li class="nav-item" onclick="clearAlert()"><a
								class="nav-link" id="account-pill-password" data-toggle="pill"
								href="#account-vertical-password" aria-expanded="false"> <i
									data-feather="lock" class="font-medium-3 mr-1"></i> <span
									class="font-weight-bold">Changer le mot de passe</span>
							</a></li>


						</ul>
					</div>
					<!--/ left menu section -->

					<!-- right content section -->
					<div class="col-md-9">
						<div class="card">
							<div class="card-body">
								<div class="tab-content">
									<!-- general tab -->
									<div role="tabpanel" class="tab-pane active"
										id="account-vertical-general"
										aria-labelledby="account-pill-general" aria-expanded="true">
										<!-- header media -->
										<div class="media">
											<%
											if (request.getSession(false).getAttribute("login") != null) {
											%>
											<a href="javascript:void(0);" class="mr-25"> <img
												src="<%=request.getSession(false).getAttribute("image")%>"
												id="account-upload-img" class="rounded mr-50"
												alt="profile image" height="80" width="80" />
											</a>
											<%
											}
											%>
											<!-- upload and reset button -->
											<form action="../../UserController" method="post"
												enctype="multipart/form-data">
												<div class="media-body mt-75 ml-1">
													<label for="account-upload"
														class="btn btn-sm btn-primary mb-75 mr-75">Charger</label>
													<input type="file" name="fileImage" hidden
														accept="image/*" />
													<button type="submit" class="btn btn-sm btn-primary mb-75 mr-75">Modifier</button>
													<button type="reset" class="btn btn-sm btn-outline-secondary mb-75">Réinitialiser</button>
													<p>JPG, GIF ou PNG autorisés. Taille maximale de 800 Ko</p>
												</div>
											</form>
											<!--/ upload and reset button -->
										</div>
										<!--/ header media -->

										<!-- form -->
										<form class="validate-form mt-2">
											<div class="row">
												<div class="col-12 col-sm-6">
													<div class="form-group">

														<%
														if (request.getSession(false).getAttribute("login") != null) {
														%>
														<label for="login">Login <%
														if (request.getSession(false).getAttribute("id") != null) {
														%> <span hidden id="id_box">#<span id="id_label"><%=request.getSession(false).getAttribute("id")%></span></span>
															<%
															}
															%>
														</label> <input type="text" class="form-control" id="login"
															placeholder="Login"
															value="<%=request.getSession(false).getAttribute("login")%>" />

														<%
														}
														%>

													</div>
												</div>
												<div class="col-12 col-sm-6">
													<div class="form-group">
														<%
														if (request.getSession(false).getAttribute("nom") != null) {
														%>
														<label for="nom">Nom</label> <input type="text"
															class="form-control" id="nom" placeholder="Nom"
															value="<%=request.getSession(false).getAttribute("nom")%>" />
														<%
														}
														%>
													</div>
												</div>
												<div class="col-12 col-sm-6">
													<div class="form-group">
														<%
														if (request.getSession(false).getAttribute("email") != null) {
														%>
														<label for="email">E-mail</label> <input type="email"
															class="form-control" id="email" placeholder="Email"
															value="<%=request.getSession(false).getAttribute("email")%>" />
														<%
														}
														%>
													</div>

												</div>
												<div class="col-12 col-sm-6">
													<div class="form-group">
														<%
														if (request.getSession(false).getAttribute("prenom") != null) {
														%>
														<label for="prenom">Prenom</label> <input type="text"
															class="form-control" id="prenom" placeholder="Prenom"
															value="<%=request.getSession(false).getAttribute("prenom")%>" />
														<%
														}
														%>
													</div>
												</div>
												<div class="col-12" id="alert1" style="height: 60px"></div>
												<div class="col-12">
													<button type="button" onclick="editInfos()"
														class="btn btn-primary mt-2 mr-1">Sauvegarder</button>
													<button type="reset" class="btn btn-outline-secondary mt-2">Annuler</button>
												</div>
											</div>
										</form>
										<!--/ form -->
									</div>
									<!--/ general tab -->

									<!-- change password -->
									<div class="tab-pane fade" id="account-vertical-password"
										role="tabpanel" aria-labelledby="account-pill-password"
										aria-expanded="false">
										<!-- form -->
										<form class="validate-form mt-2">
											<div class="row">
												<div class="col-12 col-sm-6">
													<%
													if (request.getSession(false).getAttribute("password") != null) {
													%>
													<span hidden id="h_pass"><%=request.getSession(false).getAttribute("password")%></span>
													<%
													}
													%>
													<div class="form-group">

														<label for="old_password">Ancien mot de passe</label>
														<div
															class="input-group form-password-toggle input-group-merge">
															<input type="password" class="form-control"
																id="old_password" placeholder="Old Password" />
															<div class="input-group-append">
																<div class="input-group-text cursor-pointer">
																	<i data-feather="eye"></i>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-12 col-sm-6">
													<div class="form-group">
														<label for="new_password">Nouveau mot de passe</label>
														<div
															class="input-group form-password-toggle input-group-merge">
															<input type="password" id="new_password"
																class="form-control" placeholder="New Password" />
															<div class="input-group-append">
																<div class="input-group-text cursor-pointer">
																	<i data-feather="eye"></i>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="col-12 col-sm-6">
													<div class="form-group">
														<label for="re_new_password">Re-taper le nouveau
															mot de passe</label>
														<div
															class="input-group form-password-toggle input-group-merge">
															<input type="password" class="form-control"
																id="re_new_password" placeholder="New Password" />
															<div class="input-group-append">
																<div class="input-group-text cursor-pointer">
																	<i data-feather="eye"></i>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="col-12" id="alert2" style="height: 60px"></div>
												<div class="col-12">
													<button type="button" onclick="editPass()"
														class="btn btn-primary mr-1 mt-1">Sauvegarder</button>
													<button type="reset" class="btn btn-outline-secondary mt-1">Annuler</button>
												</div>
											</div>
										</form>
										<!--/ form -->
									</div>
									<!--/ change password -->


								</div>
							</div>
						</div>
					</div>
					<!--/ right content section -->
				</div>
			</section>
			<!-- / account setting page -->
		</div>
	</div>
</div>
<!-- END: Content-->

<div class="sidenav-overlay"></div>
<div class="drag-target"></div>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="scripts/profile.js"></script>
<%@include file="template/footer.jsp"%>