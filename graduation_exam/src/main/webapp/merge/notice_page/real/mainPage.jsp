<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.util.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>신한대학교 소프트웨어융합학과 홈페이지</title>

<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="css/mainPage.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
    <div class="navbar">
        <img id="logo" src="신한대학교ui.jpg" alt="신한대학교" />
        <h2 class="software">소프트웨어융합학과</h2>
        <%
            String loggedInUserName = (String) session.getAttribute("loggedInUserName");

        		if (loggedInUserName != null) {%> 
                <p class="loginname"><%= loggedInUserName %>님 환영합니다.</p>
                <a href="total_listReal.jsp"><img id="edit_img" src="img/editing.png" alt="편집" /></a>
                <a href="logout.jsp"><img id="login_img" src="img/logout.png" alt="로그아웃" /></a>
                <%   
            } else {%>
                <p class="loginname1">로그인 되지 않았습니다. </p>
                <a href="login.html"><img id="login_img" src="img/login.png" alt="로그인" /></a>
                <% 
            }	
        %>
    </div>
    
   <div class="insta">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="img/firstinfoimg.jpg" alt="Mountain 1">
      </div>

      <div class="item">
        <img src="img/secondnfoimg.jpg" alt="Mountain 2">
      </div>

      <div class="item">
        <img src="img/thirdinfoimg.jpg" alt="Mountain 3">
      </div>

      <div class="item">
        <img src="img/forthinfoimg.jpg" alt="Mountain 4">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">이전</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">다음</span>
    </a>
  </div>
</div>
    
    
    <div class="noticebutton">
    	<div class="button-group">
        	<a href="total_listReal.jsp"><button id="botti" class="btn btn-primary rounded-pill px-3">전체게시판</button></a>
        	<a href="haksaReal.jsp"><button id="botti" class="btn btn-primary rounded-pill px-3">학사</button></a>
        	<a href="janghakReal.jsp"><button id="botti" class="btn btn-primary rounded-pill px-3">장학</button></a>
        	<a href="haksang_dongariReal.jsp"><button id="botti" class="btn btn-primary rounded-pill px-3">학생회/동아리</button></a>
    	</div>
    	<div class="button-group">
        	<a href="hubokhakReal.jsp"><button id="botti" class="btn btn-primary rounded-pill px-3">휴복학</button></a>
        	<a href="changupReal.jsp"><button id="botti" class="btn btn-primary rounded-pill px-3">취창업</button></a>
        	<a href="education_festivalReal.jsp"><button id="botti" class="btn btn-primary rounded-pill px-3">교육행사</button></a>
        	<a href="gradeall.jsp"><button id="botti" class="btn btn-primary rounded-pill px-3">학년</button></a>
    	</div>
	</div>
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
    <div class="threenotice">
    <h2 style="text-align:center">이번주 3줄 요약</h2>
    <br/>
    <h4>1. <%=s1 %></h4>
    <h4>2. <%=s2 %></h4>
    <h4>3. <%=s3 %></h4>
    </div>
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
