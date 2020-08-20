/**
 * 
 */
function idcheck(){
	
	 if(document.chkform.custname.value.length<1 || document.chkform.custname.value.length==null){
	  alert("Enter Your ID");
	  return false;
	 }
	 var url = "MemberUseId.jsp?custname="+document.chkform.custname.value;
	 window.open(url, "get", "height = 300, width = 600");
	 opener.chkform.idchk.value = 1;
	}