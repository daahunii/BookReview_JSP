<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.example.dao.BoardDAO, com.example.bean.BoardVO"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>Edit Form</title>
</head>
<body>

<%
    BoardDAO boardDAO = new BoardDAO();
    String id=request.getParameter("id");
    BoardVO u = boardDAO.getBoard(Integer.parseInt(id));
    request.setAttribute("u", u);
%>

<h1 align="center">동영상 수정</h1>
<div align="center">
    <form action="editpost.jsp" method="post" enctype="multipart/form-data">
        <input type="hidden" name="seq" value="<%=u.getSeq() %>"/>
        <label for="photo" class="form-label">썸네일:</label>
        <input type="file" id="photo" name="photo"/>
        <br /><br />
        <c:if test="${u.getPhoto() ne ''}"><br /><img width="420" height="233" src="${pageContext.request.contextPath}/upload/${u.getPhoto()}"></c:if>
        <br />
        <label for="title" class="form-label">제목:</label>
        <input type="text" id="title" name="title" value="<%=u.getTitle() %>"/>
        <br />
        <label for="youtuber" class="form-label">유튜버:</label>
        <input type="text" id="youtuber" name="youtuber" value="<%=u.getYoutuber() %>"/>
        <br />
        <label for="link" class="form-label">링크:</label>
        <input type="text" id="link" name="link" value="<%=u.getLink() %>"/>
        <br />
        <label for="views" class="form-label">조회수:</label>
        <input type="number" id="views" name="views" value="<%=u.getViews() %>"/>
        <br />
        <label for="content" class="form-label">정보:</label>
        <textarea cols="50" rows="5" id="content" name="content"><%=u.getContent() %></textarea>
        <br />
        <button type="submit" class="btn btn-primary" value="Edit Post">수정</button>
        <button type="button" class="btn btn-danger"><a href="posts.jsp" style="text-decoration: none; color: white;">취소</a></button>
    </form>
</div>
<%--</form>--%>


</body>
</html>