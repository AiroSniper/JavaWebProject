

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
		url: "../../MachineController",
		type: "POST",
		data: { op: "load" },
		success: function(data) {

			console.log(data)
			inject(data)
		},
		error: function(xhr, desc, err) {
			console.log(xhr)
			console.log("Details0: " + desc + "\nError:" + err)
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


addClass(machines_salle, activate)
removeClass(home, activate)
removeClass(salles, activate)
removeClass(machines, activate)
removeClass(achats, activate)
removeClass(profile, activate)
if (comptes)
	removeClass(comptes, activate)



$(document).ready(function() {

	$.ajax({
		url: "../../MachineController",
		type: "POST",
		data: { op: "load" },
		success: function(data) {

			console.log(data)
			inject(data)
		},
		error: function(xhr, desc, err) {
			console.log(xhr)
			console.log("Details0: " + desc + "\nError:" + err)
		}

	})
});

function inject(data) {

	let options = ""
	let lines = ""

	if (data.machines) {

		data_length = data.machines.length;
		p_count = Math.ceil(data_length / p_size);

		loadPages(p_count)


		paginate(data.machines, p_size, p_number).forEach(function(line) {

			if (line.salle) {

				lines += ` <tr>
	                    <td>`+ line.id + `</td>
	                    <td>`+ line.reference + `</td>
 						<td>`+ line.marque + `</td>
					 	<td>`+ line.dateAchat + `</td>
	                    <td>`+ line.prix + `</td>
	                    <td>`+ line.salle.label + `</td>
	                    <td class="d-flex justify-content-end">
	                        <button onclick="getInfos(this)" type="button"  data-toggle="modal" data-target="#editModal" class="btn btn-icon btn-primary mr-2">
	                            <i class="fas fa-edit"></i>
	                        </button>
	                        <button onclick="getId(this)" type="button" class="btn btn-icon btn-danger" data-toggle="modal" data-target="#delModal">
	                            <i class="fas fa-trash-alt"></i>
	                        </button>
	                    </td>
	               </tr>`
			}
			else {
				lines += ` <tr>
	                    <td>`+ line.id + `</td>
	                    <td>`+ line.reference + `</td>
 						<td>`+ line.marque + `</td>
					 	<td>`+ line.dateAchat + `</td>
	                    <td>`+ line.prix + `</td>
	                    <td> - </span></td>
	                    <td class="d-flex justify-content-end">
	                        <button onclick="getInfos(this)" type="button"  data-toggle="modal" data-target="#editModal" class="btn btn-icon btn-primary mr-2">
	                            <i class="fas fa-edit"></i>
	                        </button>
	                        <button onclick="getId(this)" type="button" class="btn btn-icon btn-danger" data-toggle="modal" data-target="#delModal">
	                            <i class="fas fa-trash-alt"></i>
	                        </button>
	                    </td>
	               </tr>`
			}


		})

		$("#tab").html(lines)

	}
	else {
		data.forEach(function(line) {

			if (line.salle) {

				lines += ` <tr>
	                    <td>`+ line.id + `</td>
	                    <td>`+ line.reference + `</td>
 						<td>`+ line.marque + `</td>
					 	<td>`+ line.dateAchat + `</td>
	                    <td>`+ line.prix + `</td>
	                    <td>`+ line.salle.label + `</td>
	                    <td class="d-flex justify-content-end">
	                        <button onclick="getInfos(this)" type="button"  data-toggle="modal" data-target="#editModal" class="btn btn-icon btn-primary mr-2">
	                            <i class="fas fa-edit"></i>
	                        </button>
	                        <button onclick="getId(this)" type="button" class="btn btn-icon btn-danger" data-toggle="modal" data-target="#delModal">
	                            <i class="fas fa-trash-alt"></i>
	                        </button>
	                    </td>
	               </tr>`
			}
			else {
				lines += ` <tr>
	                    <td>`+ line.id + `</td>
	                    <td>`+ line.reference + `</td>
 						<td>`+ line.marque + `</td>
					 	<td>`+ line.dateAchat + `</td>
	                    <td>`+ line.prix + `</td>
	                    <td> - </span></td>
	                    <td class="d-flex justify-content-end">
	                        <button onclick="getInfos(this)" type="button"  data-toggle="modal" data-target="#editModal" class="btn btn-icon btn-primary mr-2">
	                            <i class="fas fa-edit"></i>
	                        </button>
	                        <button onclick="getId(this)" type="button" class="btn btn-icon btn-danger" data-toggle="modal" data-target="#delModal">
	                            <i class="fas fa-trash-alt"></i>
	                        </button>
	                    </td>
	               </tr>`
			}


		})

		$("#tab").html(lines)

	}



	if (data.salles) {
		data.salles.forEach(function(option) {
			options += `<option value = "` + option.id + `">` + option.label + `</option>`
		})

		$("#salle").html(options)
		$("#salleE").html(options)
	}




}

function add() {


	let ref = $("#ref").val()
	let marque = $("#marque").val()
	let prix = $("#prix").val()
	let date = $("#date").val()
	let salle = $("#salle").val()

	if (ref && marque && prix && date && salle) {
		$.ajax({
			url: "../../MachineController",
			type: "POST",
			data: { ref: ref, marque: marque, prix: prix, date: date, salle: salle },
			success: function(data) {
				inject(data)
				successAlert("La machine est bien ajoutee")
			},
			error: function(xhr, desc, err) {

				errorAlert(desc)
			}

		})
	}
	else {
		warningAlert("Touts les champs sont obligatoires")
	}


	$("#ref").val("")
	$("#marque").val("")
	$("#prix").val("")
	$("#date").val(new Date())
	$("#salle")[0].selectedIndex = 0


}

function getId(currentCell) {
	id = parseInt(currentCell.parentNode.parentNode.cells[0].innerText)
}

function del() {

	$.ajax({
		url: "../../MachineController",
		type: "POST",
		data: { op: "del", id: id },
		success: function(data) {
			inject(data)
			successAlert("La machine est bien supprimee")
		},
		error: function(xhr, desc, err) {
			errorAlert(desc)
		}

	})
}

function getInfos(currentCell) {


	id = parseInt(currentCell.parentNode.parentNode.cells[0].innerText)
	let ref = currentCell.parentNode.parentNode.cells[1].innerText
	let marque = currentCell.parentNode.parentNode.cells[2].innerText
	let dt = currentCell.parentNode.parentNode.cells[3].innerText
	let prix = currentCell.parentNode.parentNode.cells[4].innerText
	let salle = currentCell.parentNode.parentNode.cells[5].innerText


	let _date = new Date(dt);

	let day = ("0" + _date.getDate()).slice(-2);
	let month = ("0" + (_date.getMonth() + 1)).slice(-2);
	let date = _date.getFullYear() + "-" + (month) + "-" + (day);

	$("#refE").val(ref)
	$("#marqueE").val(marque)
	$("#dateE").val(date)
	$("#prixE").val(prix)
	$("#salleE").find("option").filter(function() {
		return $(this).text() == salle
	}).prop('selected', true)





}




function edit() {


	let ref = $("#refE").val()
	let marque = $("#marqueE").val()
	let prix = $("#prixE").val()
	let date = $("#dateE").val()
	let salle = $("#salleE").val()

	console.log(ref, marque, prix, date, salle)

	if (ref && marque && prix && date && salle) {
		$.ajax({
			url: "../../MachineController",
			type: "POST",
			data: { op: "edit", id: id, ref: ref, marque: marque, prix: prix, date: date, salle: salle },
			success: function(data) {
				inject(data)
				successAlert("La machine est bien modifiee")
			},
			error: function(xhr, desc, err) {
				errorAlert(xhr.responseText)
			}

		})
	}
	else {
		warningAlert("Touts les champs sont obligatoires")
	}

	$("#refE").val("")
	$("#marqueE").val("")
	$("#prixE").val("")
	$("#dateE").val(new Date())
	$("#salleE")[0].selectedIndex = 0

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

	closeAlertAfterDelay(50000000)
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


$("#research").keyup(function() {
	let query = $(this).val()
	if (query) {
		$.ajax({
			url: "../../MachineController",
			type: "POST",
			data: { op: "search", query: query },
			success: function(data) {
				inject(data)
			},
			error: function(xhr, desc, err) {
				console.log(xhr)
				errorAlert(xhr.responseText)
			}

		})
	}
})

$("#salle").change(function() {
	let query = $(this).val()
	if (query) {
		$.ajax({
			url: "../../MachineController",
			type: "POST",
			data: { op: "search_salle", query: query },
			success: function(data) {
				inject(data)
			},
			error: function(xhr, desc, err) {
				console.log(xhr)
				errorAlert(xhr.responseText)
			}

		})
	}
})

function refresh() {
	$.ajax({
		url: "../../MachineController",
		type: "POST",
		data: { op: "load" },
		success: function(data) {
			inject(data)
		},
		error: function(xhr, desc, err) {
			console.log(xhr)
			console.log("Details0: " + desc + "\nError:" + err)
		}

	})
}





