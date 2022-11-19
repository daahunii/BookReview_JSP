<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.example.dao.BoardDAO, com.example.bean.BoardVO"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <title>Edit Form</title>

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
    String id=request.getParameter("id");
    BoardVO u = boardDAO.getBoard(Integer.parseInt(id));
    request.setAttribute("u", u);
%>

<br>
<h1 align="center" id="br">EDIT</h1>
<br>
<div align="center" class="album py-5 bg-light">
    <form action="editpost.jsp" method="post" enctype="multipart/form-data">
        <input type="hidden" name="seq" value="<%=u.getSeq() %>"/>
        <label for="photo" class="form-label">책 표지:</label>
        <input type="file" id="photo" name="photo"/>
        <br /><br />
        <c:if test="${u.getPhoto() ne ''}"><br /><img width="420" height="233" src="${pageContext.request.contextPath}/upload/${u.getPhoto()}"></c:if>
        <br />
        <label for="title" class="form-label">책 제목:</label>
        <input type="text" id="title" name="title" value="<%=u.getTitle() %>"/>
        <br />
        <label for="writer" class="form-label">저자:</label>
        <input type="text" id="writer" name="writer" value="<%=u.getWriter() %>"/>
        <br />
        <label for="company" class="form-label">출판사:</label>
        <input type="text" id="company" name="views" value="<%=u.getCompany() %>"/>
        <br />
        <label for="content" class="form-label">책 내용:</label>
        <textarea cols="50" rows="5" id="content" name="content"><%=u.getContent() %></textarea>
        <br />
        <button type="submit" class="btn btn-primary" value="Edit Post">수정</button>
        <button type="button" class="btn btn-danger"><a href="posts.jsp" style="text-decoration: none; color: white;">취소</a></button>
    </form>
</div>

<footer class="text-muted">
    <div class="container">
        <p>HGU BR © JDH</p>
        <p>Book Review website</p>
    </div>
</footer>

</body>
</html>