<%@page import="kr.co.min.beans.MemberGradeBean"%>
<%@page import="kr.co.min.beans.ReservationBean"%>
<%@page import="kr.co.min.dao.ReservationDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="kr.co.min.beans.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.min.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
	<c:import url="header.jsp"/>
<!-- 게시글 보기위하여 카운터링을 설정하기 위한 변수 선언 -->
	<%
		String custname = (String) session.getAttribute("custname");
	

	MemberDAO mdao = new MemberDAO();

	MemberBean MemberBean = mdao.oneMemberInfo(custname);
	
	ReservationDAO rdao = new ReservationDAO();
	
	
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

	//전체 게시글의 내용을 jsp쪽으로 가져옵니다. 전체 게시글의 갯수를 읽어드립니다. 
	count = mdao.getAllcount();

	//현재 페이지에 보열줄 시작 번호를 설정  = 데이터 베이스에서 불러올 시작번호
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;

	//최신글 5개를 기준으로 게시글을 반환 받아주는 메소드 호출
	ArrayList<MemberBean> al = mdao.getAllMember(startRow, endRow);

	//테이블에 표시할 번호를 지정
	number = count - (currentPage - 1) * pageSize;
	
	
	%>
    <div class="breadcrumb-option set-bg" data-setbg="images/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Admin Page</h2>
                        <div class="breadcrumb__links">
                            <a href="Main.jsp"><i class="fa fa-home"></i> Home</a>
                            <span>AdminPage</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Begin -->
	<div class="container" style="margin-top: 30px; margin-bottom: 30px">
		<div class="card shadow">
			<div class="card-body">
				<h2 class="card-title" align="center">Member List</h2><br>
				<table class="table table-hover" id='OnetoOne_list'>
					<thead>
						<tr>
							<th class="text-center d-none d-md-table-cell">No</th>
							<th class="text-center d-none d-md-table-cell">ID</th>
							<th class="text-center d-none d-md-table-cell">Tel</th>
							<th class="w-35">주소</th>
							<th class="text-center d-none d-md-table-cell">Join Date</th>
							<th class="text-center d-none d-md-table-cell">Grade</th>
							<th class="text-center d-none d-md-table-cell">Update Grade</th>
							<th class="text-center d-none d-md-table-cell">City Code</th>
							<th class="text-center d-none d-md-table-cell">Sales</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (int i = 0; i < al.size(); i++) {
							MemberBean bean = al.get(i);
							DateFormat dffrom = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
							DateFormat dfto = new SimpleDateFormat("yyyy-MM-dd");  
							Date today = dffrom.parse(bean.getJoindate());
							String sdate = dfto.format(today);
							ReservationBean rbean = rdao.getReservationCheck(bean.getCustno());
							
						%>
						<tr>
							<td class="text-center d-none d-md-table-cell"><%=bean.getCustno() %></td>
							<td class="text-center d-none d-md-table-cell"><%=bean.getCustname() %></td>
							<td class="text-center d-none d-md-table-cell"><%=bean.getPhone() %></td>
							<td align="left" width="300"><%=bean.getAdress() %></td>
								<td class="text-center d-none d-md-table-cell"><%=sdate %></td>
								<%
								MemberGradeBean gbean = mdao.readMemberGrade(bean.getGrade());
								%>
								<td class="text-center d-none d-md-table-cell"><%=gbean.getName() %></td>
								<td class="text-center d-none d-md-table-cell"><form action="MemberGradeInsert.jsp" method="post"><select name="grade">
								<option value ="S">VIP</option>
								<option value ="A">Gold</option>
								<option value ="B">Silver</option>
								<option value ="C">Bronze</option>
								<option value ="D">Iron</option>
								</select><input type ="hidden" value="<%=bean.getCustno() %>" name="custno"><br><input type="submit" value="Enter Member Grade"></form></td>
							<td class="text-center d-none d-md-table-cell"><%=bean.getCity() %></td>
							<td class="text-center d-none d-md-table-cell"><%=rbean.getPrice() %></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div><br>
		<a href=" AdminOnetoOneList.jsp" class="btn btn-danger btn-lg btn-block">Contact Us List</a>
	
	<p>
<div style="float: right; margin-right: 49%;">
  <ul class="pagination pagination-lg">
	
	<!-- 페이지 카운터링 소스 작성 부분 -->

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
	<li class="page-item"><a  class="page-link"  href="Adminpage.jsp?pageNum=<%=startPage - 10 %>">&laquo;</a></li>
	<%
		}
	//페이징 처리
	for (int i = startPage; i <= endPage; i++) {
	%>
	<li class="page-item"><a  class="page-link"  href="Adminpage.jsp?pageNum=<%=i %>"> <%=i %></a></li>
	<%
		}
	if (endPage < pageCount) {
	%>
	<li class="page-item"><a  class="page-link"  href="Adminpage.jsp?pageNum=<%=startPage + 10 %>">&raquo;</a></li>
	<%
		}
	}
	%>
	</ul>
<br>
</div></div>
	<br>
	<br>
	<br>
	<c:import url="footer.jsp" />
</body>
</html>