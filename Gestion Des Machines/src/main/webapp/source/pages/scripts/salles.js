
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
		url: "../../SalleController",
		type: "POST",
		data: { op: "load" },
		success: function(data) {
			inject(data)
		},
		error: function(xhr, desc, err) {
			
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


addClass(salles, activate)
removeClass(home, activate)
removeClass(machines, activate)
removeClass(machines_salle, activate)
removeClass(achats, activate)
removeClass(profile, activate)
if (comptes)
	removeClass(comptes, activate)



$(document).ready(function() {

	$.ajax({
		url: "../../SalleController",
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
});

function inject(data) {
	let lines = ""

	data_length = data.length;
	p_count = Math.ceil(data_length / p_size);

	loadPages(p_count)
	paginate(data, p_size, p_number).forEach(function(line) {
		lines += ` <tr>
	                    <td>`+ line.id + `</td>
	                    <td>`+ line.code + `</td>
	                    <td>`+ line.label + `</td>
	                    <td>`+ line.type + `</td>
	                    <td class="d-flex justify-content-end">
	                        <button onclick="getInfos(this)" type="button"  data-toggle="modal" data-target="#editModal" class="btn btn-icon btn-primary mr-2">
	                            <i class="fas fa-edit"></i>
	                        </button>
	                        <button onclick="getId(this)" type="button" class="btn btn-icon btn-danger" data-toggle="modal" data-target="#delModal">
	                            <i class="fas fa-trash-alt"></i>
	                        </button>
	                    </td>
	               </tr>`
	})

	$("#tab").html(lines)
}

function add() {
	let code = $("#code").val()
	let label = $("#label").val()
	let type = $("#type").val()

	if (code && label && type) {
		$.ajax({
			url: "../../SalleController",
			type: "POST",
			data: { code: code, label: label, type: type },
			success: function(data) {
				inject(data)
				successAlert("La salle est bien ajoutee")
			},
			error: function(xhr, desc, err) {
				console.log(xhr)
			
			}

		})
	}
	else {
		warningAlert("Touts les champs sont obligatoires")
	}

	$("#code").val("")
	$("#label").val("")
	$("#type")[0].selectedIndex = 0

}

function getId(currentCell) {
	id = parseInt(currentCell.parentNode.parentNode.cells[0].innerText)
}

function del() {


	$.ajax({
		url: "../../SalleController",
		type: "POST",
		data: { op: "del", id: id },
		success: function(data) {
			inject(data)
			successAlert("La salle est bien supprimee")
		},
		error: function(xhr, desc, err) {
		
		}

	})
}

function getInfos(currentCell) {
	id = parseInt(currentCell.parentNode.parentNode.cells[0].innerText)
	let code = currentCell.parentNode.parentNode.cells[1].innerText
	let label = currentCell.parentNode.parentNode.cells[2].innerText
	let type = currentCell.parentNode.parentNode.cells[3].innerText

	$("#codeE").val(code)
	$("#labelE").val(label)
	$("#typeE").val(type)

}




function edit() {


	let code = $("#codeE").val()
	let label = $("#labelE").val()
	let type = $("#typeE").val()

	if (code && label && type) {
		$.ajax({
			url: "../../SalleController",
			type: "POST",
			data: { op: "edit", id: id, code: code, label: label, type: type },
			success: function(data) {
				inject(data)
				successAlert("La salle est bien modifiee")
			},
			error: function(xhr, desc, err) {
			
			}

		})
	}
	else {
		warningAlert("Touts les champs sont obligatoires")
	}

	$("#codeE").val("")
	$("#labelE").val("")
	$("#typeE")[0].selectedIndex = 0

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


$("#research").keyup(function() {
	let query = $(this).val()
	if (query) {
		$.ajax({
			url: "../../SalleController",
			type: "POST",
			data: { op: "search", query: query },
			success: function(data) {
				inject(data)

			},
			error: function(xhr, desc, err) {
				console.log(xhr)
			errorAlert("Details0: " + desc + "\nError:" + err)
			}

		})
	}
})

function refresh() {
	$.ajax({
		url: "../../SalleController",
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





