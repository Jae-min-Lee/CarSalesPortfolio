<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.co.min.dao.BoardDAO" %>  
<%@ page import = "kr.co.min.beans.BoardBean" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Free Board_Delete</title>
</head>
<body>
<%
		int num = Integer.parseInt(request.getParameter("num"));
		String pass = request.getParameter("password");

		//
		BoardDAO bdao = new BoardDAO();
		String password = bdao.getPass(num);
	
	//삭제시에 패스워드와 기존패스워드값을 비교하여 같은지를 확인 
	if(pass.equals(password)){
		bdao.deleteBoard(num);   
		
		response.sendRedirect("BoardList.jsp");   
	}else {		
%>
	<script>
		alert("패스워드가 잘못되었습니다. 확인 바랍니다.");
		history.go(-1);
	</script>
<%
	}
%>	
	
	
	
</body>
</html>