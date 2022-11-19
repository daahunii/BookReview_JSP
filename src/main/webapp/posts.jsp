<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.example.dao.BoardDAO, com.example.bean.BoardVO,java.util.*, java.io.File"%>
<%@page import="com.oreilly.servlet.*" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <title>HGU BR</title>
    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
        #list {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }
        #list td, #list th {
            border: 1px solid #ddd;
            padding: 8px;
            text-align:center;
        }
        #list tr:nth-child(even){background-color: #f2f2f2;}
        #list tr:hover {background-color: #ddd;}
        #list th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: center;
            background-color: #006bb3;
            color: white;
        }

        .mbg{
            background-color: mediumseagreen;
        }

        .btn-sm:hover{
            background-color: #dddddd;
        }

        #br{
            ext-align: center;
            font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS",
            sans-serif;
            font-size: 50pt;
            font-weight: bold;
            color: mediumseagreen;
            text-shadow: 1px 3px 3px rgb(10, 62, 0);
        }

    </style>
    <script>
        function delete_ok(id){
            var a = confirm("정말로 삭제하겠습니까?");
            if(a) location.href='deletepost.jsp?id=' + id;
        }
    </script>
</head>
<body>
<header>
    <div class="navbar navbar-dark mbg box-shadow">
        <div class="container d-flex justify-content-between" onclick="location.href='posts.jsp';">
            <a href="#" class="navbar-brand d-flex align-items-center">
                <ion-icon name="book"></ion-icon>
                <strong style="margin-left: 5px">Book Review</strong>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        </div>
    </div>
</header>

<%
    BoardDAO boardDAO = new BoardDAO();
    List<BoardVO> list = boardDAO.getBoardList();
    request.setAttribute("list",list);
%>

<section class="py-5 text-center container">
    <div class="row py-lg-5">
        <div class="col-lg-6 col-md-8 mx-auto">
            <h1 id="br">Book Review</h1>
            <br>
            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="https://t1.daumcdn.net/cfile/tistory/273E313652CBA52C12" class="d-block w-100">
                    </div>
                    <c:forEach items="${list}" var="u" varStatus="status">
                    <div class="carousel-item">
                        <img class="d-block w-100" style="height: 600px" src="${pageContext.request.contextPath}/upload/${u.getPhoto()}">
                    </div>
                    </c:forEach>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
                <br>
                <br>
                <a href="addpostform.jsp" class="btn btn-outline-success">책 리뷰 추가하기</a>
            </p>
        </div>
    </div>
</section>

<div class="album py-5 bg-light">
    <div class="container">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <c:forEach items="${list}" var="u" varStatus="status">
            <div class="col">
                <div class="card shadow-sm">
                        <img width="inherit" height="440px" src="${pageContext.request.contextPath}/upload/${u.getPhoto()}">
                        <div class="card-body">
                        <h5>${u.getTitle()}</h5>
                        <p class="card-text" style="height: 30px; overflow: hidden;">${u.getWriter()}</p>
                            <div class="d-flex justify-content-center align-items-center" style="margin-bottom: 30px;">
                                <button id="review" type="button" class="btn btn-outline-primary"><a href="review.jsp?id=${u.getSeq()}" style="color: #001897; text-decoration: none; font-weight: 800;">Review</a></button>
                            </div>
                        <div class="d-flex justify-content-between align-items-center">
                            <small class="text-muted">출판사 - ${u.getCompany()}</small>
                            <div class="btn-group" style="border-radius: 3px;">
                                <button id="edit" type="button" class="btn btn-sm btn-outline-secondary" style="border: none;"><a href="editform.jsp?id=${u.getSeq()}" style="color: mediumseagreen; text-decoration: none; font-weight: 800;">수정</a></button>|
                                <button id="del" type="button" class="btn btn-sm btn-outline-secondary" style="color: black; font-weight: 800; border: none;" onClick="javascript:delete_ok('${u.getSeq()}')">삭제</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
</div>
<br/>

<footer class="text-muted">
    <div class="container">
        <p>HGU BR © JDH</p>
        <p>Book Review website</p>
    </div>
</footer>
</body>
</html>