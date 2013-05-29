function validateForm() {

    	var err = 0; // default the error flag to 0

 		if ( $("#firstName").val().length == 0) {
			// Check if nothing was emtered into the form
 			$("#firstNameLabel").css('color', 'red');
 			err = 1; // set error
		} else {
			// Reset the color in case it was flagd red on the last submit.
			$("#firstNameLabel").css('color', 'black');
 		}

 		if ( $("#lastName").val().length == 0) {
			// Check if nothing was emtered into the form
 			$("#lastNameLabel").css('color', 'red');
 			err = 1; // set error
		} else {
			// Reset the color in case it was flagd red on the last submit.
			$("#lastNameLabel").css('color', 'black');		
 		}

		var phoneNumber = $("#phone").val(); // Set form value to phoneNumber
 		if ( phoneNumber.length == 0) {
			// Check if nothing was emtered into the form
 			$("#phoneLabel").css('color', 'red');
 			err = 1; // set error
		} else {
			// Reset the color in case it was flagd red on the last submit.
			$("#phoneLabel").css('color', 'black');	
 		}
		if ( !phoneNumber.match("^(([0-9]{3}-)|\([0-9]{3}\) ?)?[0-9]{3}-[0-9]{4}$") ) {
		  // invalid email
		  $("#phoneLabel").css('color', 'red');
		  err = 1; // set error
		} else {
			// Reset the color in case it was flagd red on the last submit.
			$("#phoneLabel").css('color', 'black');			  
		}


 		var cellNumber = $("#cell").val(); // Set form value to cellNumber
 		if ( cellNumber.length == 0) {
			// Check if nothing was emtered into the form
 			$("#cellLabel").css('color', 'red');
 			err = 1; // set error
		} else {
			// Reset the color in case it was flagd red on the last submit.
			$("#cellLabel").css('color', 'black');				
 		}
		if ( !cellNumber.match("^(([0-9]{3}-)|\([0-9]{3}\) ?)?[0-9]{3}-[0-9]{4}$") ) {
		  // invalid email
		  $("#cellLabel").css('color', 'red');
		  err = 1; // set error
		} else {
			// Reset the color in case it was flagd red on the last submit.
			$("#cellLabel").css('color', 'black');			  
		}


 		var emailAddress = $("#email").val(); // Set form value to emailAddress
 		if ( emailAddress.length == 0) {
			// Check if nothing was emtered into the form
 			$("#emailLabel").css('color', 'red');
 			err = 1; // set error
		} else {
			// Reset the color in case it was flagd red on the last submit.
			$("#emailLabel").css('color', 'black');				
 		}
		
		// Validate Email address
		if ( /^.+@.+\..+$/.test( emailAddress ) ){
		  // valid email
		  // Reset the color in case it was flagd red on the last submit.
		  $("#emailLabel").css('color', 'black');
		} else {
		  // invalid email
		  // Check if nothing was emtered into the form
		  $("#emailLabel").css('color', 'red');
		  err = 1; // set error
		}


 		if (err == 1) {
			//prevent form from submitting ERROR
        	return false;  
        	$("#errorMessage").text('Please Fix the Form Fields Highlighted in Red');
		} else {
			// All good submit form
			return true; 
        }

}
