/**
 * 
 */

function chkInfo() {
	
	if(document.chkform.img.value.length == 0) {
		alert("Please Upload Event Image.");
		chkform.img.focus();
		return;
	}
	
	if(document.chkform.title.value.length == 0) {
		alert("Please input Subject.");
		chkform.title.focus();
		return;
	}
	
	if(document.chkform.term.value == 'yyyy/mm/dd~yyyy/mm/dd Please fill in the form.') {
		alert("Please input Event Term.");
		chkform.term.focus();
		return;
	}
	
	if(document.chkform.content.value.length == 0) {
		alert("Please input Content.");
		chkform.content.focus();
		return;
	}
	
	document.chkform.submit();
}