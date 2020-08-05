<%@page import="kr.co.min.beans.EventBean"%>
<%@page import="kr.co.min.dao.EventDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.min.beans.MemberBean"%>
<%@page import="kr.co.min.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 관리 페이지</title>
</head>
<body>
	<%
		try {
		String custname = (String) session.getAttribute("custname");

		MemberDAO mdao = new MemberDAO();

		MemberBean MemberBean = mdao.oneMemberInfo(custname);

		if (custname == null) {
	%>
	<script>
		alert("로그인을 먼저 해주세요.");
		location.href = 'MemberLogin.jsp';
	</script>

	<!-- 게시글 보기위하여 카운터링을 설정하기 위한 변수 선언 -->
	<%
		}
	int pageSize = 12; //화면에 보여질 게시글의 숫자 지정
	//현재 카운터를 클릭한 번호값으로 일어옵니다.
	String pageNum = request.getParameter("pageNum");

	if (pageNum == null) {
		pageNum = "1";
	}

	int count = 0; //전체 글의 갯수를 저장하는 변수
	int number = 0;//페이지 넘버링 변수

	//현재 보고자하는 페이지 숫자를 저장합니다.
	int currentPage = Integer.parseInt(pageNum);

	EventDAO dao = new EventDAO();
	//전체 게시글의 내용을 jsp쪽으로 가져옵니다. 전체 게시글의 갯수를 읽어드립니다. 
	count = dao.getAllcount();

	//현재 페이지에 보열줄 시작 번호를 설정  = 데이터 베이스에서 불러올 시작번호
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;

	//테이블에 표시할 번호를 지정
	number = count - (currentPage - 1) * pageSize;
	%>
	<c:import url="header.jsp" />
	<!-- Breadcrumb End -->
    <div class="breadcrumb-option set-bg" data-setbg="images/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Event</h2>
                        <div class="breadcrumb__links">
                            <a href="Main.jsp"><i class="fa fa-home"></i> Home</a>
                            <span>Event</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Begin -->
	    <!-- Car Section Begin -->
    <section class="car spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <span>Event</span>
                        <h2>Event Page</h2>
                    </div>
                    <ul class="filter__controls">
                        <li class="active" data-filter="*">모든 이벤트</li>
                        <li data-filter=".sale">종료된 이벤트</li>
                    </ul>
                </div>
            </div>
            <div class="row car-filter">
            <%
						//최신글 5개를 기준으로 게시글을 반환 받아주는 메소드 호출
					ArrayList<EventBean> al = dao.getAllBoard(startRow, endRow);
					int j = 0;
					for (int i = 0; i < al.size(); i++) {
						EventBean bean = al.get(i);
						if (j % 3 == 0) {
					%>
					<%
							}
						
						if(bean.getNum() < 8){%>
                <div class="col-lg-3 col-md-4 col-sm-6 mix sale">
                <div class="car__item">
                        <div class="car__item__pic__slider owl-carousel">
                            <a href="EventInfo.jsp?num=<%=bean.getNum()%>"> <img
									style="height: 150px; width: 100%; display: block;"
									src="event/<%=bean.getImg()%>" alt="Card image"></a>
                        </div>
                        <div class="car__item__text">
                            <div class="car__item__text__inner">
                                <div class="label-date">2020</div>
                                <h5><a href="#"><%=bean.getTitle()%></a></h5>
                            </div>
                            <div class="car__item__price">
                                <span class="car-option">Term : <%=bean.getTerm()%></span>
                                <h6></h6>
                            </div>
                        </div>
                    </div>
                </div>
                <%}else{
                    %><div class="col-lg-3 col-md-4 col-sm-6 mix">
                    <div class="car__item">
                        <div class="car__item__pic__slider owl-carousel">
                            <a href="EventInfo.jsp?num=<%=bean.getNum()%>"> <img
    								style="height: 150px; width: 100%; display: block;"
    								src="event/<%=bean.getImg()%>" alt="Card image"></a>
                        </div>
                        <div class="car__item__text">
                            <div class="car__item__text__inner">
                                <div class="label-date">2020</div>
                                <h5><a href="#"><%=bean.getTitle()%></a></h5>
                            </div>
                            <div class="car__item__price">
                               <span class="car-option">Term : <%=bean.getTerm()%></span>
                                <h6></h6>
                            </div>
                        </div>
                    </div>
                </div>
                <%}
							j = j + 1;
						}
					%>
					
    <!-- Car Section End -->
    </div>
   
				<%
					if (custname.equals("admin") && MemberBean.getCustno() == 1) {
				%>
				<div style="float: right; margin-right: 1%;">
					<p><button type="button" class="btn btn-danger"
						onclick="location.href='EventWriteForm.jsp'">Write</button></p>
				</div>
				<%
					}
				%>
				
				<!-- 페이지 카운터링 소스 작성 부분 -->
				<p>
				<div style="float: left; margin-left: 45%;">
					<ul class="pagination pagination-lg">
						<%
							if (count > 0) {
							//카운터링 숫자를 얼마까지 보여줄건지를 결정하는 부분.
							int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

							//시작 페이지 숫자 설정
							int startPage = 1;

							if (currentPage % 10 != 0) {
								startPage = (int) (currentPage / 10) * 10 + 1;
							} else {
								startPage = ((int) (currentPage / 10) - 1);
							}

							int pageBlock = 10;
							//화면에 보여질 페이지의 마지막 숫자
							int endPage = startPage + pageBlock - 1;

							if (endPage > pageCount)
								endPage = pageCount;
						%>
						<%
							if (startPage > 5) {
						%>

						<li class="page-item"><a class="page-link"
							href="Event.jsp?pageNum=<%=startPage - 10%>">&laquo;</a></li>
						<%
							}
						%>
						<%
							//페이징 처리
						for (int i = startPage; i <= endPage; i++) {
						%>
						<li class="page-item active"><a class="page-link"
							href="Event.jsp?pageNum=<%=i%>"> <%=i%></a></li>
						<%
							}
						%>
						<%
							if (endPage < pageCount) {
						%>
						<li class="page-item"><a class="page-link"
							href="Event.jsp?pageNum=<%=startPage + 10%>">&raquo;</a></li>
						<%
							}
						%>
						<%
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
						%>
					</ul>
					<br>
				</div>
			 </div>
    </section>
	<c:import url="footer.jsp" />
</body>
</html>