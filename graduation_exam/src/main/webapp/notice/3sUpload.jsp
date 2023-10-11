<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.util.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>

<html>
<head>
    <meta charset="UTF-8">
    <title>텍스트 입력 예제</title>
</head>
<body>
    <h1>3줄 요약 작성</h1>
    
    <form method="post" action="write3s.jsp">
        <label for="string">첫번째:</label>
        <input type="text" id="s1" name="s1" ><br><br>

        <label for="string">두번째:</label>
        <input type="text" id="s2" name="s2" ><br><br>

        <label for="string">세번째:</label>
        <input type="text" id="s3" name="s3" ><br><br>

        <input type="submit" value="제출">
    </form>
</body>
</html>
