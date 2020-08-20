/**
 * 
 */

function chkInfo() {
	
	if(document.chkform.custname.value.length == 0) {
		alert("Please input your ID.");
		chkform.custname.focus();
		return;
	}
	
	if(document.chkform.custname.value.length < 5 || document.chkform.custname.value.length > 13) {
		alert("ID should be 5~12 letter long.");
		chkform.custname.focus();
		return;
	}
	
	if(document.chkform.useid.value == 0) {
		alert("Please Duplicate ID check.");
		chkform.custname.focus();
		return;
	}
	
	if(document.chkform.custpw.value.length == 0) {
		alert("Please input your Password.");
		chkform.custpw.focus();
		return;
	}
	
	if(document.chkform.custpw.value != document.chkform.custpw2.value) {
		alert("Password does not match.");
		chkform.custpw2.focus();
		return;
	}
	
	if(document.chkform.phone.value.length == 0) {
		alert("Please input your Phone Number.");
		chkform.phone.focus();
		return;
	}
	
	if(document.chkform.zipcode.value.length == 0) {
		alert("Please input your Zipcode.");
		chkform.zipcode.focus();
		return;
	}
	
	if(document.chkform.address1.value.length == 0) {
		alert("Please input your Address.");
		chkform.address1.focus();
		return;
	}
	
	if(document.chkform.city.value == 'City') {
		alert("Please select your City.");
		chkform.city.focus();
		return;
	}
	
	document.chkform.submit();
}