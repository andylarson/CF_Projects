function validateForm() {

    	var err = 0; // default the error flag to 0

 		if ( $("#firstName").val().length == 0) {
			// Check if nothing was emtered into the form
 			$("#firstNameLabel").addClass('red');
 			err = 1; // set error
		} else {
			// Reset the color in case it was flagd red on the last submit.
			$("#firstNameLabel").removeClass('red');
 		}

 		if ( $("#lastName").val().length == 0) {
			// Check if nothing was emtered into the form
 			$("#lastNameLabel").addClass('red');
 			err = 1; // set error
		} else {
			// Reset the color in case it was flagd red on the last submit.
			$("#lastNameLabel").removeClass('red');		
 		}

		var phoneNumber = $("#phone").val(); // Set form value to phoneNumber
 		if ( phoneNumber.length == 0) {
			// Check if nothing was emtered into the form
 			$("#phoneLabel").addClass('red');
 			err = 1; // set error
		} else {
			// Reset the color in case it was flagd red on the last submit.
			$("#phoneLabel").removeClass('red');	
 		}
		if ( !phoneNumber.match("^(([0-9]{3}-)|\([0-9]{3}\) ?)?[0-9]{3}-[0-9]{4}$") ) {
		  // invalid email
		  $("#phoneLabel").addClass('red');
		  err = 1; // set error
		} else {
			// Reset the color in case it was flagd red on the last submit.
			$("#phoneLabel").removeClass('red');			  
		}


 		var cellNumber = $("#cell").val(); // Set form value to cellNumber
 		if ( cellNumber.length == 0) {
			// Check if nothing was emtered into the form
 			$("#cellLabel").addClass('red');
 			err = 1; // set error
		} else {
			// Reset the color in case it was flagd red on the last submit.
			$("#cellLabel").removeClass('red');				
 		}
		if ( !cellNumber.match("^(([0-9]{3}-)|\([0-9]{3}\) ?)?[0-9]{3}-[0-9]{4}$") ) {
		  // invalid email
		  $("#cellLabel").addClass('red');
		  err = 1; // set error
		} else {
			// Reset the color in case it was flagd red on the last submit.
			$("#cellLabel").removeClass('red');			  
		}


 		var emailAddress = $("#email").val(); // Set form value to emailAddress
 		if ( emailAddress.length == 0) {
			// Check if nothing was emtered into the form
 			$("#emailLabel").addClass('red');
 			err = 1; // set error
		} else {
			// Reset the color in case it was flagd red on the last submit.
			$("#emailLabel").removeClass('red');				
 		}
		
		// Validate Email address
		if ( /^.+@.+\..+$/.test( emailAddress ) ){
		  // valid email
		  // Reset the color in case it was flagd red on the last submit.
		  $("#emailLabel").removeClass('red');
		} else {
		  // invalid email
		  // Check if nothing was emtered into the form
		  $("#emailLabel").addClass('red');
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
