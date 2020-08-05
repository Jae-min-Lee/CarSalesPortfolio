<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.co.min.dao.BoardDAO" %>  
<%@ page import = "kr.co.min.beans.BoardBean" %> 
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정용 게시글 보기 페이지</title>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</head>
<body>
	<%
		int num = Integer.parseInt(request.getParameter("num"));

	BoardDAO bdao = new BoardDAO();
	BoardBean bean = bdao.getOneUpdateBoard(num);
	%>
	<c:import url="header.jsp"/>
					<!-- Breadcrumb End -->
	    <div class="breadcrumb-option set-bg" data-setbg="images/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Board Info Update Page</h2>
                        <div class="breadcrumb__links">
                            <a href="Main.jsp"><i class="fa fa-home"></i> Home</a>
                            <a href="BoardList.jsp">FreeBoard</a>
                            <span>Board Info Update Page</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Begin -->
<form action="BoardUpdatePro.jsp" method="post">
<div class="container" style="margin-top: 100px">
<h2 align="center">Board Info Update Page</h2>
		<fieldset>
				<div class="form-group">
					<label class="col-form-label col-form-label-lg" for="inputLarge">글번호</label>
					<input type="text" class="form-control" id="inputLarge"
						value="<%=bean.getNum()%>" readonly="readonly" />
				</div>
				<div class="form-group">
					<label class="col-form-label col-form-label-lg" for="inputLarge">조회수</label>
					<input type="text" class="form-control" id="inputLarge"
						value="<%=bean.getReadCount()%>" readonly="readonly" />
				</div>
				<div class="form-group">
					<label class="col-form-label col-form-label-lg" for="inputLarge">작성자</label>
					<input type="text" class="form-control" id="inputLarge"
						value="<%=bean.getWriter()%>" readonly="readonly" />
				</div>
				<div class="form-group">
					<label class="col-form-label col-form-label-lg" for="inputLarge">작성일</label>
					<input type="text" name="writer" class="form-control"
						id="inputLarge" value="<%=bean.getReg_date()%>"
						readonly="readonly" />
				</div>
				<div class="form-group">
					<label class="col-form-label col-form-label-lg" for="inputLarge">이메일</label>
					<input type="text" name="writer" class="form-control"
						id="inputLarge"/>
				</div>
				<div class="form-group">
					<label class="col-form-label col-form-label-lg" for="inputLarge">제목</label>
					<input type="text" name="writer" class="form-control"
						id="inputLarge"/>
				</div>
				<div class="form-group">
					<label class="col-form-label col-form-label-lg" for="inputLarge">비밀번호</label>
					<input type="password" name="password" class="form-control"
						id="inputLarge" placeholder="비밀번호를 입력해주세요." />
				</div>
				<div class="form-group">
					<label class="col-form-label col-form-label-lg" for="inputLarge">내용</label>
					<input type="text" name="writer" class="form-control"
						id="inputLarge"/>
				</div>
				<div class="form-group" align="center">
					<input type="hidden" name="num" value="<%=bean.getNum()%>"> 
					<input type="submit" class="btn btn-warning" value="글수정하기">&nbsp;&nbsp; <input type="button" onclick="location.href='BoardList.jsp'" class="btn btn-primary" value="글 목록 보기">
				</div>
			</fieldset>
		</div>
	</form>
	<c:import url="footer.jsp" />
</body>
</html>

