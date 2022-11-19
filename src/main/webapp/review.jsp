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

    .form-label{
        font-size: large;
        font-family: "Noto Sans Khojki";
    }

    .form-label>span{
        font-size: larger;
        font-weight: bold;
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
  String id=request.getParameter("id");
  BoardVO u = boardDAO.getBoard(Integer.parseInt(id));
  request.setAttribute("u", u);
%>

<br>
<h1 align="center" id="br">Book Review</h1>
<br>
<div align="center" class="album py-5 bg-light">
    <input type="hidden" name="seq" value="<%=u.getSeq() %>"/>
    <c:if test="${u.getPhoto() ne ''}"><br /><img width="430" height="600" src="${pageContext.request.contextPath}/upload/${u.getPhoto()}"></c:if>
    <br />
    <br>
    <label class="form-label"><span>- 제목 -</span> <p class="con"><%=u.getTitle() %></p></label>
    <br />
    <label class="form-label"><span>- 저자 -</span> <p class="con"><%=u.getWriter() %></p></label>
    <br />
    <label class="form-label"><span>- 출판사 -</span> <p class="con"><%=u.getCompany() %></p></label>
    <br />
    <label class="form-label"><span>- 책 내용 -</span> <p class="con" style="width: 60%"><%=u.getContent() %></p></label>
    <br />
</div>

<footer class="text-muted">
  <div class="container">
    <p>HGU BR © JDH</p>
    <p>Book Review website</p>
  </div>
</footer>
</body>
</html>

