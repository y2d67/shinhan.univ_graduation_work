<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>계정관리 페이지</title>
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
   <link type="text/css" rel="stylesheet" href="css/accountReal.css" />
</head>
<body>
<nav>
    <div class="container">
        <ul>
            <img class="img1" src="신한대학교ui.jpg" />
        </ul>
        <ul id="ul1">
            <li><a href="previewpageReal.jsp">미리보기</a></li>
            <li><a href="total_listReal.jsp">게시글 관리</a></li>
            <li> <a href="3sUploadReal.jsp">배너설정</a></li>
            <li class='sub-menu'> <a href="accountReal.jsp">계정관리</a></li>
            <li><a href="https://console.ncloud.com/chatbot/domain" target="_blank">챗봇관리<img id="link" src="img/link.png"/></a></li>
        </ul>
         <%
            String loggedInUserName = (String) session.getAttribute("loggedInUserName");

        		if (loggedInUserName != null) {%> 
                <p class="loginname"><%= loggedInUserName %>님 환영합니다.</p>
                <a href="logout.jsp"><img id="login_img" src="img/logout.png" alt="로그아웃" /></a>
                <%   
            } else {%>
                <p class="loginname">로그인 되지 않았습니다. </p>
                <a href="login.html"><img id="login_img" src="img/login.png" alt="로그인" /></a>
                <% 
            }	
        %>
    </div>
</nav>

<iframe src="AccountBoard.jsp" width="100%" height="800" frameborder="0"></iframe>
</body>
</html>
