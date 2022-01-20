

let id = -1;
let p_size = 5;
let p_number = 1;
let data_length = 0;
let p_count = 1;

$("#pageSize").change(function() {

	p_size = parseInt($(this).val())

	load()

})

function load() {
	$.ajax({
		url: "../../UserController",
		type: "POST",
		data: { op: "load" },
		success: function(data) {
			inject(data)



		},
		error: function(xhr, desc, err) {
			console.log(xhr)
			errorAlert("Details0: " + desc + "\nError:" + err)
		}

	})
}

function loadPages(count) {

	let pages = ""
	pages += `<li class="page-item prev"><a class="page-link" id="prevPage" 
	onclick="navigate(event)" href="javascript:void(0);"></a></li>`
	for (let i = p_number - 1; i < Math.min(count, 5 + p_number - 1); i++) {

		if ((i + 1) == p_number) {
			pages += ` <li class="page-item active"><a class="page-link" id="` + "page_" + (i + 1) + `" 
		onclick="navigate(event)" href="javascript:void(0);">`+ (i + 1) + `</a></li>`
		}
		else {
			pages += ` <li class="page-item"><a class="page-link" id="` + "page_" + (i + 1) + `" 
		onclick="navigate(event)" href="javascript:void(0);">`+ (i + 1) + `</a></li>`
		}

	}
	pages += ` <li class="page-item next"><a class="page-link" id="nextPage" 
	onclick="navigate(event)" href="javascript:void(0);"></a></li>`

	$("#pagin").html(pages)
}

function navigate(e) {

	loadPages(p_count)
	if (e.target.id == "prevPage") {

		if (p_number > 1)
			p_number = --p_number
	}
	else if (e.target.id == "nextPage") {
		if (p_number < p_count)
			p_number = ++p_number
	}
	else {
		p_number = parseInt(e.target.innerText)
	}
	load()
}

function paginate(array, page_size, page_number) {
	return array.slice((page_number - 1) * page_size, page_number * page_size);
}



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


addClass(comptes, activate)
removeClass(home, activate)
removeClass(machines, activate)
removeClass(machines_salle, activate)
removeClass(achats, activate)
removeClass(salles, activate)
if (comptes)
	removeClass(profile, activate)


function inject(data) {
	let lines = ""


	data_length = data.length;
	p_count = Math.ceil(data_length / p_size);

	loadPages(p_count)
	paginate(data, p_size, p_number).forEach(function(line) {

		if (line.nom && line.prenom && line.email && line.login) {
			if (line.status == 0) {
				lines += ` <tr>
						<td>  <div class="avatar mr-75"><img src="`+ line.image + `" alt="png"
                             height="32"></div></td>
	                    <td>`+ line.nom + `</td>
	                    <td>`+ line.prenom + `</td>
	                    <td>`+ line.email + `</td>
 						<td>`+ line.login + `</td>
						<td class="text-primary">A Mofifier</td>
	                     <td class="d-flex justify-content-end">

							

	                        <button onclick="getLogin(this)" type="button" class="btn btn-icon btn-outline-primary  mr-2" data-toggle="modal" data-target="#copyModal">
	                           <i class="fas fa-copy"></i>
	                        </button>
							
	                        <button onclick="getLogin(this)" type="button" class="btn btn-icon btn-outline-danger" data-toggle="modal" data-target="#delModal">
	                        <i class="fas fa-user-times"></i>
	                        </button>
						
	                    </td>
	               </tr>`
			}
			else if (line.status == 1) {
				lines += ` <tr>
						<td>  <div class="avatar mr-75"><img src="`+ line.image + `" alt="png"
                             height="32"></div></td>
	                    <td>`+ line.nom + `</td>
	                    <td>`+ line.prenom + `</td>
	                    <td>`+ line.email + `</td>
 						<td>`+ line.login + `</td>
						<td class="text-success">Active</td>
	                   <td class="d-flex justify-content-end">

	                        <button onclick="getLogin(this)" type="button" class="btn btn-icon btn-outline-primary  mr-2" data-toggle="modal" data-target="#copyModal">
	                           <i class="fas fa-copy"></i>
	                        </button>
							<button onclick="getLogin(this)" type="button"  data-toggle="modal" data-target="#downModal" class="btn btn-icon btn-outline-warning mr-2">
	                        <i class="fas fa-user-slash"></i>
	                        </button>
	                        <button onclick="getLogin(this)" type="button" class="btn btn-icon btn-outline-danger" data-toggle="modal" data-target="#delModal">
	                        <i class="fas fa-user-times"></i>
	                        </button>
						
	                    </td>
	               </tr>`

			}


			else if (line.status == -1) {
				lines += ` <tr>
						<td>  <div class="avatar mr-75"><img src="`+ line.image + `" alt="png"
                             height="32"></div></td>
	                    <td>`+ line.nom + `</td>
	                    <td>`+ line.prenom + `</td>
	                    <td>`+ line.email + `</td>
 						<td>`+ line.login + `</td>
						<td class="text-danger">Non Active</td>
	                   <td class="d-flex justify-content-end">

	                        <button onclick="getLogin(this)" type="button" class="btn btn-icon btn-outline-primary  mr-2" data-toggle="modal" data-target="#copyModal">
	                           <i class="fas fa-copy"></i>
	                        </button>
							 <button onclick="getLogin(this)" type="button" class="btn btn-icon btn-outline-success  mr-2" data-toggle="modal" data-target="#upModal">
	                         <i class="fas fa-user-check"></i>
	                        </button>
	                        <button onclick="getLogin(this)" type="button" class="btn btn-icon btn-outline-danger" data-toggle="modal" data-target="#delModal">
	                        <i class="fas fa-user-times"></i>
	                        </button>
						
	                    </td>
	               </tr>`

			}
		} else {
			if (line.status == 0) {
				lines += ` <tr>
					<td>  <div class="avatar mr-75"><img src="`+ line.image + `" alt="png"
                             height="32"></div></td>
	                    <td></td>
	                    <td></td>
	                    <td></td>
 						<td>`+ line.login + `</td>
						<td class="text-primary">A Mofifier</td>
	                  <td class="d-flex justify-content-end">
	                        <button onclick="getLogin(this)" type="button" class="btn btn-icon btn-outline-primary  mr-2" data-toggle="modal" data-target="#copyModal">
	                           <i class="fas fa-copy"></i>
	                        </button>
	                        <button onclick="getLogin(this)" type="button" class="btn btn-icon btn-outline-danger" data-toggle="modal" data-target="#delModal">
	                        <i class="fas fa-user-times"></i>
	                        </button>
						
	                    </td>
	               </tr>`
			}
			else if (line.status == 1) {
				lines += ` <tr>
				<td>  <div class="avatar mr-75"><img src="`+ line.image + `" alt="png"
                             height="32"></div></td>
	                    <td></td>
	                    <td></td>
	                    <td></td>
 						<td>`+ line.login + `</td>
						<td  class="text-success">Active</td>
	                 <td class="d-flex justify-content-end">
	                        <button onclick="getLogin(this)" type="button" class="btn btn-icon btn-outline-primary  mr-2" data-toggle="modal" data-target="#copyModal">
	                           <i class="fas fa-copy"></i>
	                        </button>
							<button onclick="getLogin(this)" type="button"  data-toggle="modal" data-target="#downModal" class="btn btn-icon btn-outline-warning mr-2">
	                        <i class="fas fa-user-slash"></i>
	                        </button>
	                        <button onclick="getLogin(this)" type="button" class="btn btn-icon btn-outline-danger" data-toggle="modal" data-target="#delModal">
	                        <i class="fas fa-user-times"></i>
	                        </button>
						
	                    </td>
	               </tr>`

			}


			else if (line.status == -1) {
				lines += ` <tr>
				<td>  <div class="avatar mr-75"><img src="`+ line.image + `" alt="png"
                             height="32"></div></td>
	                    <td></td>
	                    <td></td>
	                    <td></td>
 						<td>`+ line.login + `</td>
						<td class="text-danger">Non Active</td>
	                   <td class="d-flex justify-content-end">

	                        <button onclick="getLogin(this)" type="button" class="btn btn-icon btn-outline-primary  mr-2" data-toggle="modal" data-target="#copyModal">
	                           <i class="fas fa-copy"></i>
	                        </button>
							 <button onclick="getLogin(this)" type="button" class="btn btn-icon btn-outline-success  mr-2" data-toggle="modal" data-target="#upModal">
	                         <i class="fas fa-user-check"></i>
	                        </button>
	                        <button onclick="getLogin(this)" type="button" class="btn btn-icon btn-outline-danger" data-toggle="modal" data-target="#delModal">
	                        <i class="fas fa-user-times"></i>
	                        </button>
						
	                    </td>
	               </tr>`

			}
		}



	})

	$("#tab").html(lines)
}

function generate() {
	$.ajax({
		url: "../../UserController",
		type: "POST",
		data: { op: "usrGen" },
		success: function(data) {



			inject(data)
			successAlert("Le Compte a ete generer avec succee")

		},
		error: function(xhr, desc, err) {
			console.log(xhr)
			errorAlert("Details0: " + desc + "\nError:" + err)

			
		}

	})
}


$(window).on('load', function() {

	$.ajax({
		url: "../../UserController",
		type: "POST",
		data: { op: "load" },
		success: function(data) {
			inject(data)



		},
		error: function(xhr, desc, err) {
			console.log(xhr)
			errorAlert("Details0: " + desc + "\nError:" + err)
		}

	})
})


let login = ""
function getLogin(x) {

	login = x.parentNode.parentNode.cells[4].innerText


}

function up() {


	$.ajax({
		url: "../../UserController",
		type: "POST",
		data: { op: "up", login: login },
		success: function(data) {



			inject(data)
			successAlert("Le Compte a ete activee avec succee")

		},
		error: function(xhr, desc, err) {
			console.log(xhr)
			errorAlert("Details0: " + desc + "\nError:" + err)

			
		}

	})
}

function down() {

	$.ajax({
		url: "../../UserController",
		type: "POST",
		data: { op: "down", login: login },
		success: function(data) {



			inject(data)
			successAlert("Le Compte a ete desactiver avec succee")

		},
		error: function(xhr, desc, err) {
			console.log(xhr)
			errorAlert("Details0: " + desc + "\nError:" + err)

			
		}

	})

}

function del() {

	$.ajax({
		url: "../../UserController",
		type: "POST",
		data: { op: "del", login: login },
		success: function(data) {



			inject(data)
			successAlert("Le Compte a ete supprimee avec succee")

		},
		error: function(xhr, desc, err) {
			console.log(xhr)
			errorAlert("Details0: " + desc + "\nError:" + err)

			
		}

	})
}
function copyToClipboard(text) {
	var sampleTextarea = document.createElement("textarea");
	document.body.appendChild(sampleTextarea);
	sampleTextarea.value = text; //save main text in it
	sampleTextarea.select(); //select textarea contenrs
	document.execCommand("copy");
	document.body.removeChild(sampleTextarea);
}
function copy() {

	$.ajax({
		url: "../../UserController",
		type: "POST",
		data: { op: "copy", login: login },
		success: function(data) {

			copyToClipboard("Login : " + data.user.login + " | Password : " + data.user.password)

			if (data.users) {
				inject(data.users)
				successAlert("Le Compte a ete copiee avec succee")
			}
			else {
				errorAlert("Error")
			}




		},
		error: function(xhr, desc, err) {
			console.log(xhr)
			errorAlert("Details0: " + desc + "\nError:" + err)

			
		}

	})
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

