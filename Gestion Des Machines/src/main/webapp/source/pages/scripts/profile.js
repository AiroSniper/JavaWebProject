

let id = -1


function hasClass(el, className) {
	if (el.classList)
		return el.classList.contains(className);
	return !!el.className.match(new RegExp('(\\s|^)' + className + '(\\s|$)'))
}

function addClass(el, className) {
	if (el.classList)
		el.classList.add(className)
	else if (!hasClass(el, className))
		el.className += " " + className
}

function removeClass(el, className) {
	if (el.classList)
		el.classList.remove(className);
	else if (hasClass(el, className)) {
		var reg = new RegExp('(\\s|^)' + className + '(\\s|$)')
		el.className = el.className.replace(reg, ' ')
	}
}


let home = document.querySelector("#home_page")
let salles = document.querySelector("#salles_page")
let machines = document.querySelector("#machines_page")
let machines_salle = document.querySelector("#machines_salle_page")
let achats = document.querySelector("#machines_dates_page")
let profile = document.querySelector("#profile_page")

let comptes = document.querySelector("#comptes_page")

let activate = "active"


addClass(profile, activate)
removeClass(home, activate)
removeClass(machines, activate)
removeClass(machines_salle, activate)
removeClass(achats, activate)
removeClass(salles, activate)
if (comptes)
	removeClass(comptes, activate)


function editInfos() {

	id = parseInt($("#id_label").text())
	let login = $("#login").val()
	let email = $("#email").val()
	let nom = $("#nom").val()
	let prenom = $("#prenom").val()

	if (login.trim() != "" && email.trim() != "" && nom.trim() != "" && prenom.trim() != "") {

		$.ajax({
			url: "../../UserController",
			type: "POST",
			data: { op: "editInfos", id: id, login: login, email: email, nom: nom, prenom: prenom },
			success: function(data) {

				if (data == 1)
					successAlert("Les infos sont modifiees avec succee")
				else if (data == 0)
					errorAlert("Probleme de modification")
				else if (data == -1)
					warningAlert("Ce login deja existe ")

			},
			error: function(xhr, desc, err) {
		
				errorAlert("Details0: " + desc + "\nError:" + err)

				
			}

		})
	} else {
		warningAlert("Les champs sont obligatoires")
	}



}

function editPass() {


	id = parseInt($("#id_label").text())
	let hPass = $("#h_pass").text()
	let oldPass = $("#old_password").val()
	let newPass = $("#new_password").val()
	let rePass = $("#re_new_password").val()


	console.log("id ", id, " h Pass", hPass, " old pass", oldPass, " new pass", newPass)


	if (oldPass != "" && newPass != "" && rePass != "") {

		if (hPass == oldPass) {
			if (newPass == rePass) {

				if (rePass.length >= 6) {

					$.ajax({
						url: "../../UserController",
						type: "POST",
						data: { op: "editass", id: id, pass: newPass },
						success: function(data) {

							if (data)
								successAlert("Le mot de passe et modifiee avec succee")
							else
								errorAlert("Probleme de modification")


						},
						error: function(xhr, desc, err) {
							console.log(xhr)
							errorAlert("Details0: " + desc + "\nError:" + err)

							
						}

					})

				} else {
					warningAlert("Svp sasir plus de 6 caractere")
				}

			} else {
				warningAlert("Svp retape le nouveau mot de passe")
			}
		} else {

			warningAlert("L'ancien mot de passe est incorrect")
		}


	} else {

		warningAlert("Les champs sont obligatoires")
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

	$("#alert1").html(message)
	$("#alert2").html(message)

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
	$("#alert1").html(message)
	$("#alert2").html(message)

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
	$("#alert1").html(message)
	$("#alert2").html(message)

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


	$("#alert1").html(message)
	$("#alert2").html(message)

	closeAlertAfterDelay(5000)
}

function clearAlert() {
	$("#alert1").html("")
	$("#alert2").html("")
}



function closeAlertAfterDelay(delay) {

	let interval = 0

	let _interval = setInterval(function() {

		interval += 1000

		if (interval >= delay) {

			$("#alert1").html("")
			$("#alert2").html("")

			clearInterval(_interval)
		}

	}, 1000);

}

