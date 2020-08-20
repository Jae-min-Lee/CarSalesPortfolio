/**
 * 
 */

function chkInfo() {
	
	if(document.chkform.password.value.length == 0) {
		alert("Please input your Password.");
		chkform.zipcode.focus();
		return;
	}
	
	document.chkform.submit();
}