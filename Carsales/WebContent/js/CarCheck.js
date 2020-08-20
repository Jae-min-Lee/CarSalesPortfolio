/**
 * 
 */

function chkInfo() {
	
	if(document.chkform.carsale_name.value.length == 0) {
		alert("Please input CarName.");
		chkform.carsale_name.focus();
		return;
	}
	
	if(document.chkform.carsale_Category.value == 'Select Category') {
		alert("Please select Category.");
		chkform.carsale_Category.focus();
		return;
	}
	
	if(document.chkform.carsale_Price.value.length == 0) {
		alert("Please input Car Price.");
		chkform.carsale_Price.focus();
		return;
	}
	
	if(document.chkform.carsale_company.value == 'Select Brand') {
		alert("Please select Car Company.");
		chkform.carsale_company.focus();
		return;
	}
	
	if(document.chkform.carsale_info.value.length == 0) {
		alert("Please input Car Information.");
		chkform.carsale_info.focus();
		return;
	}
	
	if(document.chkform.carsale_img.value.length == 0) {
		alert("Please Upload Car Image.");
		chkform.carsale_img.focus();
		return;
	}
	
	document.chkform.submit();
}