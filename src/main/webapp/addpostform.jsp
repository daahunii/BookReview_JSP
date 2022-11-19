<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>Insert title here</title>
</head>
<body >
<h1 align="center">동영상 추가</h1>
<div align="center">
    <form action="addpost.jsp" enctype="multipart/form-data" method="post">
        <label for="photo" class="form-label">썸네일:</label>
        <input type="file" id="photo" name="photo"/>
        <br />
        <label for="title" class="form-label">제목:</label>
        <input type="text" id="title" name="title"/>
        <br />
        <label for="youtuber" class="form-label">유튜버:</label>
        <input type="text" id="youtuber" name="youtuber"/>
        <br />
        <label for="link" class="form-label">링크:</label>
        <input type="text" id="link" name="link"/>
        <br />
        <label for="views" class="form-label">조회수:</label>
        <input type="number" id="views" name="views"/>
        <br />
        <label for="content" class="form-label">정보:</label>
        <textarea cols="50" rows="5" id="content" name="content"></textarea>
        <br />
        <button type="submit" class="btn btn-primary" value="Add Post">추가</button>
        <button type="button" class="btn btn-danger"><a href="posts.jsp" style="text-decoration: none; color: white;">취소</a></button>
    </form>
</div>




</body>
</html>