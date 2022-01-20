function logout() {
	
	$.ajax({
		url: "../../UserController",
		type: "POST",
		data: { op: "logout" },
		success: function(data) {
			
			

		},
		error: function(xhr, desc, err) {
			console.log(xhr)
			console.log("Details0: " + desc + "\nError:" + err)
			
			errorAlert(err)
		}

	})
}