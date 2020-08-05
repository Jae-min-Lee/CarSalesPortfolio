<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.co.min.dao.BoardDAO" %>  
<%@ page import = "kr.co.min.beans.BoardBean" %>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
	<jsp:useBean id="boardbean" class="kr.co.min.beans.BoardBean">
		<jsp:setProperty name="boardbean" property="*"/>
	</jsp:useBean>
<%
	BoardDAO bdao = new BoardDAO();
	String pass = bdao.getPass(boardbean.getNum());
	
	if(pass.equals(boardbean.getPassword())){
		bdao.updateBoard(boardbean);
		
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






