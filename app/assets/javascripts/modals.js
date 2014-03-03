$(document).ready(function(){

	/* ————— modal overlay for aboutUs ———————————— */
	$("#aboutUs").on("show", function() {    // wire up the OK button to dismiss the modal when shown
	    $("#aboutUs a.btn").on("click", function(e) {
	        console.log("button pressed");   // just as an example...
	        $("#aboutUs").modal('hide');     // dismiss the dialog
	    });
	});

	$("#aboutUs").on("hide", function() {    // remove the event listeners when the dialog is dismissed
	    $("#aboutUs a.btn").off("click");
	});

	$("#aboutUs").on("hidden", function() {  // remove the actual elements from the DOM when fully hidden
	    $("#aboutus").remove();
	});
	
	/* ———— modal overlay for privacy policy —————— */
	$("#privacyPolicy").on("show", function() {    // wire up the OK button to dismiss the modal when shown
	    $("#privacyPolicy a.btn").on("click", function(e) {
	        console.log("button pressed");   // just as an example...
	        $("#privacyPolicy").modal('hide');     // dismiss the dialog
	    });
	});

	$("#privacyPolicy").on("hide", function() {    // remove the event listeners when the dialog is dismissed
	    $("#privacyPolicy a.btn").off("click");
	});

	$("#privacyPolicy").on("hidden", function() {  // remove the actual elements from the DOM when fully hidden
	    $("#privacyPolicy").remove();
	});
	
		/* ———— modal overlay for kaplan privacy policy —————— */
		$("#privacyPolicyKaplan").on("show", function() {    // wire up the OK button to dismiss the modal when shown
		    $("#privacyPolicyKaplan a.btn").on("click", function(e) {
		        console.log("button pressed");   // just as an example...
		        $("#privacyPolicyKaplan").modal('hide');     // dismiss the dialog
		    });
		});

		$("#privacyPolicyKaplan").on("hide", function() {    // remove the event listeners when the dialog is dismissed
		    $("#privacyPolicyKaplan a.btn").off("click");
		});

		$("#privacyPolicyKaplan").on("hidden", function() {  // remove the actual elements from the DOM when fully hidden
		    $("#privacyPolicyKaplan").remove();
		});
	
	
	/* ———— modal overlay for contactUs —————— */
	$("#contactUs").on("show", function() {    // wire up the OK button to dismiss the modal when shown
	    $("#contactUs a.btn").on("click", function(e) {
	        console.log("button pressed");   // just as an example...
	        $("#contactUs").modal('hide');     // dismiss the dialog
	    });
	});

	$("#contactUs").on("hide", function() {    // remove the event listeners when the dialog is dismissed
	    $("#contactUs a.btn").off("click");
	});

	$("#contactUs").on("hidden", function() {  // remove the actual elements from the DOM when fully hidden
	    $("#contactUs").remove();
	});
	
});