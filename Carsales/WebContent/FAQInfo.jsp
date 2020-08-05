<%@page import="kr.co.min.beans.MemberBean"%>
<%@page import="kr.co.min.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.co.min.dao.FAQDAO"%>
<%@ page import="kr.co.min.beans.FAQBean"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 보기 페이지</title>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</head>
<body>
	<c:import url="header.jsp" />

	<%
		String custname = (String) session.getAttribute("custname");

	MemberDAO mdao = new MemberDAO();

	MemberBean MemberBean = mdao.oneMemberInfo(custname);

	int num = Integer.parseInt(request.getParameter("num"));

	FAQDAO bdao = new FAQDAO();
	FAQBean bean = bdao.getOneFAQ(num);
	%>
		 <!-- Breadcrumb End -->
    <div class="breadcrumb-option set-bg" data-setbg="images/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>FAQ_Info</h2>
                        <div class="breadcrumb__links">
                            <a href="Main.jsp"><i class="fa fa-home"></i> Home</a>
                            <a href="FAQ.jsp">FAQ</a>
                            <span>FAQ_Info</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Begin -->
	<div class="container" style="margin-top: 100px">
		<h4 class="card-title">FAQ_Info</h4>
		<fieldset>
			<div class="form-group">
				<label class="col-form-label col-form-label-lg" for="inputLarge">글번호</label>
				<input type="text" class="form-control" id="inputLarge"
					value="<%=bean.getNum()%>" readonly="readonly" />
			</div>
			<div class="form-group">
				<label class="col-form-label col-form-label-lg" for="inputLarge">제목</label>
				<input type="text" name="writer" class="form-control"
					id="inputLarge" value="<%=bean.getSubject()%>" readonly="readonly" />
			</div>
			<div class="form-group">
				<label class="col-form-label col-form-label-lg" for="inputLarge">내용</label>
				<input type="text" name="writer" class="form-control"
					id="inputLarge" value="<%=bean.getContent()%>" readonly="readonly" />
			</div>
			<div class="form-group">
							<div class="text-right">
			<%
				if (custname.equals("admin") && MemberBean.getCustno() == 1) {
			%>
				<input type="button" class="btn btn-warning" value="수정하기"
					onclick="location.href='FAQUpdateForm.jsp?num=<%=bean.getNum()%>'">
				<input type="button" class="btn btn-danger" value="삭제하기"
					onclick="location.href='FAQDeleteForm.jsp?num=<%=bean.getNum()%>'">
					<input type="button" class="btn btn-primary" value="목록보기"
					onclick="location.href='FAQ.jsp'">
				<%
					} else {
				%>
				<input type="button" class="btn btn-primary" value="목록보기"
					onclick="location.href='FAQ.jsp'">
				<%
					}
				%>
			</div></div>
		</fieldset>
	</div>
	<br><br><br>
	<c:import url="footer.jsp" />
</body>
</html>