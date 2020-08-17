<%@page import="kr.co.min.beans.MemberBean"%>
<%@page import="kr.co.min.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<%
try{
request.setCharacterEncoding("UTF-8");

String address1 = request.getParameter("zipcode");
String address2 = request.getParameter("address1");
String address3 = request.getParameter("address2");
String address4 = request.getParameter("address3");
String address = address1+address2+address3+address4;

%>
	<jsp:useBean id="MemberBean" class="kr.co.min.beans.MemberBean">
		<jsp:setProperty name="MemberBean" property="*"/> <!-- mapping시킵니다. -->
	</jsp:useBean>
	<%
	MemberBean.setAdress(address);
	MemberDAO dao = new MemberDAO();
	dao.signupMember(MemberBean);
	%>
	<script type="text/javascript">
	alert('Success Signup.');
	</script><%
	//회원을 마쳤으면 로그인 화면으로 이동
		 response.sendRedirect("MemberLogin.jsp"); 
	 }catch(Exception e){
	e.printStackTrace();
}%>

	
</body>
</html>