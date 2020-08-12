/**
 * 
 */
function idcheck(){
	
	 if(document.chkform.custname.value.length<1 || document.chkform.custname.value.length==null){
	  alert("중복체크할 아이디를 입력하십시오");
	  return false;
	 }
	 var url = "MemberUseId.jsp?custname="+document.chkform.custname.value;
	 window.open(url, "get", "height = 300, width = 600");
	 opener.chkform.idchk.value = 1;
	}