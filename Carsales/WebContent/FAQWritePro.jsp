<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.co.min.dao.FAQDAO" %>  
<%@ page import = "kr.co.min.beans.FAQBean" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- 게시글로 작성한 데이터를 한꺼번에 읽어드리는 내용 -->
	<jsp:useBean id="FAQbean" class="kr.co.min.beans.FAQBean">
		<jsp:setProperty name="FAQbean" property="*"/>
	</jsp:useBean>

<%
//데이터베이스 쪽으로 빈 클래스를 넘겨줍니다.
	FAQDAO bdao = new  FAQDAO();
//데이터 저장 메소드를 호출합니다.
	bdao.insertFAQ(FAQbean);
	//게시글을 저장한후에 전체게시글로 이동
	response.sendRedirect("FAQ.jsp");
%>
	

</body>
</html>