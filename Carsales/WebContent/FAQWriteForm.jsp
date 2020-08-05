<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글 쓰기</title>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</head>
<body>
	<c:import url="header.jsp" />
	 <!-- Breadcrumb End -->
    <div class="breadcrumb-option set-bg" data-setbg="images/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>FAQ_Write</h2>
                        <div class="breadcrumb__links">
                            <a href="Main.jsp"><i class="fa fa-home"></i> Home</a>
                            <a href="FAQ.jsp">FAQ</a>
                            <span>FAQ_Write</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Begin -->
	<form action="FAQWritePro.jsp" method="post">
		<div class="container" style="margin-top: 100px">
			<h4 class="card-title">FAQ_Write</h4>
			<fieldset>
				<div class="form-group">
					<label class="col-form-label col-form-label-lg" for="inputLarge">제목</label>
					<input type="text" name="subject" class="form-control"
						id="inputLarge" placeholder="제목을 입력해주세요." />
				</div>
				<div class="form-group">
					<label class="col-form-label col-form-label-lg" for="inputLarge">내용</label>
					<textarea class="form-control" name="content" style="resize: none;"
						id="exampleTextarea" rows="3"></textarea>
				</div>
				<div class="form-group" align="center">
					<input type="submit" class="btn btn-info" value="글쓰기">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" class="btn btn-warning" value="재작성">&nbsp;&nbsp;&nbsp;&nbsp;

					<button class="btn btn-primary"
						onclick="location.href='FAQ.jsp'">글 목록 보기</button>
				</div>
			</fieldset>
		</div>
	</form>
	<c:import url="footer.jsp" />
</body>
</html>