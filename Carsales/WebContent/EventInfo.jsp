<%@page import="kr.co.min.beans.MemberBean"%>
<%@page import="kr.co.min.dao.MemberDAO"%>
<%@page import="kr.co.min.beans.EventBean"%>
<%@page import="kr.co.min.dao.EventDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 상세정보</title>
</head>
<body>
		<c:import url="header.jsp" />
	<%
		String custname = (String) session.getAttribute("custname");

	MemberDAO mdao = new MemberDAO();

	MemberBean MemberBean = mdao.oneMemberInfo(custname);

	int num = Integer.parseInt(request.getParameter("num"));

	EventDAO dao = new EventDAO();
	EventBean bean = dao.getOneBoard(num);
	%>
				 <!-- Breadcrumb End -->
    <div class="breadcrumb-option set-bg" data-setbg="images/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Event_Info</h2>
                        <div class="breadcrumb__links">
                            <a href="Main.jsp"><i class="fa fa-home"></i> Home</a>
                            <a href="Event.jsp">Event</a>
                            <span>Event_Info</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Begin -->
	<div class="container" style="margin-top: 100px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<div class="form-group">
							<label for="board_subject">제목</label> <input type="text"
								id="board_writer_name" name="title" class="form-control"
								value="<%=bean.getTitle()%>" disabled="disabled" />
						</div>
						<div class="form-group">
							<label for="board_subject">기간</label> <input type="text"
								id="board_writer_name" name="term" class="form-control"
								value="<%=bean.getTerm()%>" disabled="disabled" />
						</div>
						<div class="form-group">
							<label for="board_subject">내용</label>
							<textarea class="form-control" name="content"
								style="resize: none;" id="exampleTextarea" rows="3">
								<%=bean.getContent() %>
							</textarea>
						</div>
						<%
							if (custname.equals("admin") && MemberBean.getCustno() == 1) {
						%>
						<div class="form-group">
							<div class="text-right">
								<a
									href="EventUpdateForm.jsp?num=<%=bean.getNum()%>"
									class="btn btn-primary">수정하기</a>
									<a
									href="EventDeleteForm.jsp?num=<%=bean.getNum()%>"
									class="btn btn-danger">삭제하기</a>
									<a href='Event.jsp' class="btn btn-info">목록보기</a>
							</div>
						</div>
						<%
							} else {
						%>
						<div class="form-group">
							<div class="text-right">
								<a href='Event.jsp' class="btn btn-info">목록보기</a>
							</div>
						</div>
						<%
							}
						%>
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<footer>
		<c:import url="footer.jsp" />
	</footer>
</body>
</html>