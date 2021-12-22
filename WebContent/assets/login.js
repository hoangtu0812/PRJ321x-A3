/**
 * 
 */
$(document).ready(function(){
	$("#username").blur(function(){
		validationUID();
	})
	$("#pwd").blur(function(){
		validationPWD();
	})
})

function validationUID(){
	var uid = $("#username").val();
	//var uidpattern = /^(?=[a-zA-Z0-9._]{8,20}$)(?!.*[_.]{2})[^_.].*[^_.]$/;
	var uidpattern =/^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	var testspace = /^S/;
	if(uid.trim() == "" || uid.trim() == null || uidpattern.test(uid) == false || testspace.test(uid)) {
		$("#username").css("border-color", "red");
		//$(".login-btn").prop("disabled", true);
		$("#uid-mess").text("Username is invalid!");
		return false;
	} else {
		$("#username").css("border-color", "#cccccc");
		//$(".login-btn").prop("disabled", false);
		$("#uid-mess").text("");
		return true;
	}
	
}

function validationPWD(){
	var pwd = $("#pwd").val();
	var pwdpattern = /^(?=[a-zA-Z0-9._]{8,20}$)(?!.*[_.]{2})[^_.].*[^_.]$/;
	var testspace = /^S/;
	if(pwd.trim() == "" || pwd.trim() == null || pwdpattern.test(pwd) == false || testspace.test(pwd)) {
		$("#pwd").css("border-color", "red");
		//$(".login-btn").prop("disabled", true);
		$("#pwd-mess").text("Password is invalid!");
		return false;
	} else {
		$("#pwd").css("border-color", "#cccccc");
		//$(".login-btn").prop("disabled", false);
		$("#pwd-mess").text("");
		return true;
	}
}


function validation(){
	validationUID();
	if(validationPWD() == true && validationUID() == true){
		return true;
	}
	return false;
}