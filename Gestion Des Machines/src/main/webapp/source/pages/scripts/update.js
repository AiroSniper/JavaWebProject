


function modifier() {
	let id = parseInt($("#id_label").text())
	let password = $("#password").val()
	let re_password = $("#re_password").val()

	console.log(id, password, re_password)
	if (password.trim() != " " && re_password.trim() != "") {
		if (password == re_password) {
			if (password.length >= 6) {

				$.ajax({
					url: "../../UserController",
					type: "POST",
					data: { op: "editStatus", password: password, id: id },
					success: function(data) {

						if (data) {

							location.replace("home.jsp")
						}
						else {
							errorAlert("Probeleme de modification")
						}

					},
					error: function(xhr, desc, err) {
errorAlert("Details0: " + desc + "\nError:" + err)
					}

				})

			} else {
				warningAlert("Svp sasir plus de 6 caracteres")
			}


		} else {
			warningAlert("Svp retape le nouveau mot de passe")
		}
	}
	else {
		warningAlert("Le champs sont obligatoires")
	}
}


function errorAlert(msg) {



	let message = ` <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                            <div class="alert-body">
                                               <i class="fas fa-exclamation-triangle"></i>&nbsp;&nbsp;
                                                <span>`+ msg + `</span>
                                            </div>
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>`

	$("#alert").html(message)

	closeAlertAfterDelay(5000)
}

function warningAlert(msg) {

	let message = ` <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                            <div class="alert-body">
                                              <i class="fas fa-exclamation-circle"></i>&nbsp;&nbsp;
                                                <span>`+ msg + `</span>
                                            </div>
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>`
	$("#alert").html(message)

	closeAlertAfterDelay(5000)
}


function infosAlert(msg) {
	let message = ` <div class="alert alert-primary alert-dismissible fade show" role="alert">
                                            <div class="alert-body">
                                              <i class="fas fa-exclamation"></i>&nbsp;&nbsp;
                                                <span>`+ msg + `</span>
                                            </div>
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>`
	$("#alert").html(message)

	closeAlertAfterDelay(5000)

}

function successAlert(msg) {
	let message = ` <div class="alert alert-success alert-dismissible fade show" role="alert">
                                            <div class="alert-body">
                                            <i class="fas fa-check"></i>&nbsp;&nbsp;
                                                <span>`+ msg + `</span>
                                            </div>
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>`


	$("#alert").html(message)

	closeAlertAfterDelay(5000)
}


function closeAlertAfterDelay(delay) {

	let interval = 0

	let _interval = setInterval(function() {

		interval += 1000

		if (interval >= delay) {

			$("#alert").html("")

			clearInterval(_interval)
		}

	}, 1000);


}