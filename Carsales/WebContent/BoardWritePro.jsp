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
<!-- 게시글로 작성한 데이터를 한꺼번에 읽어드리는 내용 -->
	<jsp:useBean id="boardbean" class="kr.co.min.beans.BoardBean">
		<jsp:setProperty name="boardbean" property="*"/>
	</jsp:useBean>

<%
//데이터베이스 쪽으로 빈 클래스를 넘겨줍니다.
	BoardDAO bdao = new  BoardDAO();
//데이터 저장 메소드를 호출합니다.
	bdao.insertBoard(boardbean);
	//게시글을 저장한후에 전체게시글로 이동
	response.sendRedirect("BoardList.jsp");
%>
	

</body>
</html>