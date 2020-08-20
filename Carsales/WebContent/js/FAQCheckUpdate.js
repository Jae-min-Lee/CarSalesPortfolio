/**
 * 
 */

function chkInfo() {
	
	if(document.chkform.subject.value.length == 0) {
		alert("Please input Subject.");
		chkform.subject.focus();
		return;
	}
	
	if(document.chkform.content.value.length == 0) {
		alert("Please input Content.");
		chkform.content.focus();
		return;
	}
	
	document.chkform.submit();
}