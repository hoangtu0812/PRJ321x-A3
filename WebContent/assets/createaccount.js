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
	$("#confirmpwd").blur(function(){
		confirmPWD();
	})
	$("#nameOfUser").blur(function(){
		validateUserName();
	})
	$("#address").blur(function(){
		validateAddress();
	})
	$("#phoneNumber").blur(function(){
		validatePhoneNumber();
	})
})

function validationUID(){
	var uid = $("#username").val();
	//var uidpattern = /^(?=[a-zA-Z0-9._]{8,20}$)(?!.*[_.]{2})[^_.].*[^_.]$/;
	var uidpattern =/^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	var testspace = /^S/;
	if(uid.trim() == "" || uid.trim() == null || uidpattern.test(uid) == false || testspace.test(uid) || uid.length >= 100) {
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
	if(pwd.trim() == "" || pwd.trim() == null || pwdpattern.test(pwd) == false || testspace.test(pwd) || pwd.length >= 64) {
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
function confirmPWD(){
	var testPwd = $("#pwd").val();
	var pwd = $("#confirmpwd").val();
	var pwdpattern = /^(?=[a-zA-Z0-9._]{8,20}$)(?!.*[_.]{2})[^_.].*[^_.]$/;
	var testspace = /^S/;
	if(pwd != testPwd) {
		$("#confirmpwd").css("border-color", "red");
		//$(".login-btn").prop("disabled", true);
		$("#confirmpwd-mess").text("Password do not match!");
		return false;
	}
	if(pwd.trim() == "" || pwd.trim() == null || pwdpattern.test(pwd) == false || testspace.test(pwd)) {
		$("#confirmpwd").css("border-color", "red");
		//$(".login-btn").prop("disabled", true);
		$("#confirmpwd-mess").text("Password is invalid!");
		return false;
	} else {
		$("#confirmpwd").css("border-color", "#cccccc");
		//$(".login-btn").prop("disabled", false);
		$("#confirmpwd-mess").text("");
		return true;
	}
}
function validateUserName() {
	var name = $("#nameOfUser").val();
	if(name.length >= 50) {
		$("#nameOfUser").css("border-color", "red");
		//$(".login-btn").prop("disabled", true);
		$("#name-mess").text("Can not more than 50 characters!");
		return false;
	} else {
		$("#nameOfUser").css("border-color", "#cccccc");
		//$(".login-btn").prop("disabled", false);
		$("#name-mess").text("");
		return true;
	}
}

function validateAddress() {
	var address = $("#address").val();
	if(address.length >= 255) {
		$("#address").css("border-color", "red");
		//$(".login-btn").prop("disabled", true);
		$("#address-mess").text("Can not more than 50 characters!");
		return false;
	} else {
		$("#address").css("border-color", "#cccccc");
		//$(".login-btn").prop("disabled", false);
		$("#address-mess").text("");
		return true;
	}
}

function validatePhoneNumber() {
	var phone = $("#phoneNumber").val();
	if(phone.length > 10) {
		$("#phoneNumber").css("border-color", "red");
		//$(".login-btn").prop("disabled", true);
		$("#phone-mess").text("Can not more than 50 characters!");
		return false;
	} else {
		$("#phoneNumber").css("border-color", "#cccccc");
		//$(".login-btn").prop("disabled", false);
		$("#phone-mess").text("");
		return true;
	}
}


function validation(){
	validationUID();
	if(validationPWD() == true && validationUID() == true && confirmPWD() == true && validateUserName() == true && validateAddress() == true && validatePhoneNumber() == true){
		return true;
	}
	return false;
}