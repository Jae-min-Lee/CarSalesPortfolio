<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.co.min.dao.OnetoOneDAO"%>
<%@ page import="kr.co.min.beans.OnetoOneBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		try {
		request.setCharacterEncoding("UTF-8");
	%>
	<!-- 게시글로 작성한 데이터를 한꺼번에 읽어드리는 내용 -->
	<jsp:useBean id="OnetoOnebean" class="kr.co.min.beans.OnetoOneBean">
		<jsp:setProperty name="OnetoOnebean" property="*" />
	</jsp:useBean>

	<%
		//데이터베이스 쪽으로 빈 클래스를 넘겨줍니다.
	OnetoOneDAO bdao = new OnetoOneDAO();
	//데이터 저장 메소드를 호출합니다.
	bdao.insertOnetoOne(OnetoOnebean);
	//게시글을 저장한후에 전체게시글로 이동
	%>
	<script>
		alert("문의사항 등록이 완료되었습니다.");
	</script>
	<%
		response.sendRedirect("Main.jsp");
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>


</body>
</html>