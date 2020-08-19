<%@page import="kr.co.min.beans.MemberBean"%>
<%@page import="kr.co.min.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Info Update</title>
</head>
<body>
	<%
		try {
		request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="MemberBean" class="kr.co.min.beans.MemberBean">
		<jsp:setProperty name="MemberBean" property="*" />
	</jsp:useBean>
	<%
		int custno = Integer.parseInt(request.getParameter("custno"));

	MemberDAO dao = new MemberDAO();
	String custpw = dao.getPass(custno);

	//사용자가 입력한 패스워드와 데이터베이스에서 읽어온 패스워드를 비교
	if (MemberBean.getCustpw().equals(custpw)) {

		dao.updateMemberInfo(MemberBean);

		response.sendRedirect("Main.jsp");

	} else {
	%>
	<script type="text/javascript">
		alert("패스워드가 맞지 않습니다. 다시 확인 바랍니다.");
		history.back(-1);
	</script>
	<%
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</body>
</html>