/**
 * 
 */

function chkInfo() {
	
	if(document.chkform.writer.value.length == 0) {
		alert("Please input your ID.");
		chkform.custname.focus();
		return;
	}
	
	if(document.chkform.subject.value.length == 0) {
		alert("Please input Subject.");
		chkform.custpw.focus();
		return;
	}
	
	if(document.chkform.email.value.length == 0) {
		alert("Please input your E-mail.");
		chkform.phone.focus();
		return;
	}
	
	if(document.chkform.password.value.length == 0) {
		alert("Please input your Password.");
		chkform.zipcode.focus();
		return;
	}
	
	if(document.chkform.content.value.length == 0) {
		alert("Please input your Content.");
		chkform.address1.focus();
		return;
	}
	
	document.chkform.submit();
}