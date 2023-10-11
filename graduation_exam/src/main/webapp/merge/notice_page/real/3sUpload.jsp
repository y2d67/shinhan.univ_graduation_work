<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.util.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
<meta charset="utf-8">
<title>업로드하는곳</title>

<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	 <%
    // JDBC 연결 정보 설정
    String url =  "jdbc:oracle:thin:@localhost:1521:xe";
    String user = "test";
    String password = "12345";
    
    Connection connection = null;
    Statement statement = null;
    
    try {
        // JDBC 드라이버 로드
        Class.forName("oracle.jdbc.driver.OracleDriver");
        
        // 데이터베이스 연결
        connection = DriverManager.getConnection(url, user, password);
        
        // SQL 쿼리 작성
        String query = "SELECT s1, s2, s3 FROM weekly "; // WHERE 절에 원하는 조건을 추가하세요.
        
        statement = connection.createStatement();
        
        // 쿼리 실행
        ResultSet resultSet = statement.executeQuery(query);
        
        if (resultSet.next()) {
            // 쿼리 결과에서 s1, s2, s3 값을 가져옴
           String s1 = resultSet.getString("s1");
           String s2 = resultSet.getString("s2");
           String s3 = resultSet.getString("s3");
           %>
           <center>
		<h1>3줄 요약 작성</h1>
		
		<hr />
		<br />
		<br />
		<div style="width: 350px; height: 700px;">
			<form method="post" action="write3s.jsp">
				<label for="string">첫번째</label> <input type="text" id="s1"
					class="form-control" name="new_s1" value="<%=s1 %>"><br>
				<br> <label for="string">두번째</label> <input type="text" id="s2"
					class="form-control" name="new_s2" value="<%=s2 %>"><br>
				<br> <label for="string">세번째</label> <input type="text" id="s3"
					class="form-control" name="new_s3" value="<%=s3 %>"><br>
				<br> <input type="submit" class="btn" value="수정">
			</form>
		</div>
	</center>
           <% 
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // 연결과 리소스 해제
        if (statement != null) {
            statement.close();
        }
        if (connection != null) {
            connection.close();
        }
    }
    %>
</body>
</html>