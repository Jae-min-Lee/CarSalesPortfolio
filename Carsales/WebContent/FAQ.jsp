<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="kr.co.min.beans.MemberBean"%>
<%@page import="kr.co.min.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.co.min.dao.FAQDAO"%>
<%@ page import="kr.co.min.beans.FAQBean"%>
<%@ page import="java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ</title>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</head>
<body>
	<c:import url="header.jsp" />
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
	int pageSize = 10; //화면에 보여질 게시글의 숫자 지정
	//현재 카운터를 클릭한 번호값으로 일어옵니다.
	String pageNum = request.getParameter("pageNum");

	if (pageNum == null) {
		pageNum = "1";
	}

	int count = 0; //전체 글의 갯수를 저장하는 변수
	int number = 0;//페이지 넘버링 변수

	//현재 보고자하는 페이지 숫자를 저장합니다.
	int currentPage = Integer.parseInt(pageNum);

	FAQDAO fdao = new FAQDAO();
	//전체 게시글의 내용을 jsp쪽으로 가져옵니다. 전체 게시글의 갯수를 읽어드립니다. 
	count = fdao.getAllcount();

	//현재 페이지에 보열줄 시작 번호를 설정  = 데이터 베이스에서 불러올 시작번호
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;

	//최신글 5개를 기준으로 게시글을 반환 받아주는 메소드 호출
	ArrayList<FAQBean> al = fdao.getAllFAQ(startRow, endRow);

	//테이블에 표시할 번호를 지정
	number = count - (currentPage - 1) * pageSize;
	%>
	<!-- Breadcrumb End -->
    <div class="breadcrumb-option set-bg" data-setbg="images/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>FAQ</h2>
                        <div class="breadcrumb__links">
                            <a href="Main.jsp"><i class="fa fa-home"></i> Home</a>
                            <span>FAQ</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Begin -->
    <section class="car spad">
	<div class="container" style="margin-top: 30px">
		<div class="card shadow">
			<div class="card-body">
				<h4 class="card-title">FAQ</h4>
				<table class="table table-hover" id='FAQ_list'>
					<thead>
						<tr>
							<th class="text-center d-none d-md-table-cell">No</th>
							<th class="w-50">Title</th>
							<th class="text-center d-none d-md-table-cell">Date</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (int i = 0; i < al.size(); i++) {
							FAQBean bean = al.get(i);//벡터에 저장된 빈클래스를 하나씩 추출
							DateFormat dffrom = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
							DateFormat dfto = new SimpleDateFormat("yyyy-MM-dd");  
							Date today = dffrom.parse(bean.getReg_date());
							String sdate = dfto.format(today);
						%>
						<tr>
							<td class="text-center d-none d-md-table-cell"><%=number--%></td>
							<td align="left" width="300"><a
								href="FAQInfo.jsp?num=<%=bean.getNum()%>"
								style="text-decoration: none"> <%=bean.getSubject()%></a></td>
							<td class="text-center d-none d-md-table-cell"><%=sdate%></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		<br>
		<p>
		<input type="button"
									class="btn btn-danger btn-lg btn-block" value="Contact Us"
									onclick="location.href='OnetoOne.jsp'"></p>
	</div>
	<p>
		<%
			if (custname.equals("admin") && MemberBean.getCustno() == 1) {
		%>
	
	<div style="float: right; margin-right: 21%;">
		<button type="button" class="btn btn-primary btn-lg"
			onclick="location.href='FAQWriteForm.jsp'">Write</button>
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

		if (startPage > 5) {
	%>
	<li class="page-item"><a class="page-link" href="FAQ.jsp?pageNum=<%=startPage - 10%>">&laquo;</a></li>
	<%
		}
	//페이징 처리
	for (int i = startPage; i <= endPage; i++) {
	%>
	<li class="page-item active"><a class="page-link" href="FAQ.jsp?pageNum=<%=i%>"><%=i%>
	</a></li>
	<%
		}
	if (endPage < pageCount) {
	%>
	<li class="page-item"><a class="page-link" href="FAQ.jsp?pageNum=<%=startPage + 10%>">&laquo;</a></li>
	<%
		}
	}
	} catch (Exception e) {
		e.printStackTrace();
	}
	%></ul>
	</div></div></section>
	<c:import url="footer.jsp" />
</body>
</html>