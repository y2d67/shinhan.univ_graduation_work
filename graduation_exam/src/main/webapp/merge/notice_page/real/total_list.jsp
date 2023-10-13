<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>전체 게시글</title>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
	
	
<style>

@charset "UTF-8";

@import url(https://fonts.googleapis.com/css?family=Roboto:400,700,500);

/* main Styles */
html {
	box-sizing: border-box;
}

*, *:before, *:after {
	box-sizing: inherit;
}

body {
	background: #fafafa;
	font-family: "Roboto", sans-serif;
	font-size: 14px;
	margin: 0;
}

a {
	text-decoration: none;
}

.container {
	width: 1000px;
	margin: auto;
	position: center;
}

.img1 {
	width: 160px;
	height: 49px;
	position: absolute;
}

h1 {
	text-align: center;
	margin-top: 150px;
}

/* Navigation Styles */
#ul1 {
	text-align: center;
}

ul1 li {
	display: inline-block;
}

nav {
	background: #2ba0db;
}

nav ul {
	font-size: 0;
	margin-left: 200;
	padding: 0;
}

nav ul li {
	display: inline-block;
	position: relative;
}

nav ul li a {
	color: #fff;
	display: block;
	font-size: 14px;
	padding: 15px 14px;
	transition: 0.3s linear;
}

nav ul li:hover {
	background: #126d9b;
}

nav ul li ul {
	border-bottom: 5px solid #2ba0db;
	display: none;
	position: absolute;
	width: 250px;
}

nav ul li ul li {
	border-top: 1px solid #444;
	display: block;
}

nav ul li ul li:first-child {
	border-top: none;
}

nav ul li ul li a {
	background: #373737;
	display: block;
	padding: 10px 14px;
}

nav ul li ul li a:hover {
	background: #126d9b;
}

nav .fa.fa-angle-down {
	margin-left: 6px;
}

.asdf {
	border: 2px solid black;
	margin: auto;
	margin-top: 30px;
	width: 1200px;
	height: 600px;
}

.inside1 {
	border: 1px solid black;
	width: 200px;
	height: 550px;
	float: left;
	margin: 30px;
}

.ul2 {
	display: block;
	list-style-type: disc;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 20px;
}

.inside2 {
	border: 1px solid black;
	margin: 10px;
	width: 500px;
	height: 500px;
}

.inside1 ul li {
	list-style-type: none;
}

.inside1 ul li a {
	text-decoration-line: none;
}

.boardimg {
	width: 10px;
	height: 11px;
	margin-right: 5px;
}

.inside_under {
            position: absolute;
            top: 550px;
            height: 50px;
            
        }

.noticepart {
	border: 1px solid red;
	margin-left: 300px;
	margin-top: 30px;
	height: 550px;
	width: 850px;
}

#noticeboardcontrol li {
	display: inline-block;
	text-align: center;
	padding: 5px;
	margin-left: 3px;
}

#noticeboardcontrol {
	display: inline-block;
	list-style-type: disc;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 0px;
	margin-left: 10px;
	margin-bottom: 30px;
}

.noticelook {
	display: inline-block;
	margin-left: 20px;
}

.noticelook p {
	display: inline-block;
	font-size: 20px;
	font-weight: bold;
}

.morelook {
	display: inline;
	margin-left: 700px;
}

.big_notice span {
	display: inline-block;
}

.big_notice span p {
	margin-left: 70px;
}

.notice_start {
	display: inline-block;
	margin-left: 40px;
}

.sc1 span p {
	margin-left: 70px;
}

.sc1 span {
	display: inline-block;
}

.notice_pic {
	display: inline-block;
	margin-left: 50px;
	border: 2px solid red;
	background-color: red;
	width: 50px;
	height: 20px;
	text-align: center;
}

.notify {
	width: 310px;
	 
}

.notify1 {
	 left: 10px;
}


.notify12 {
	 width: 120px;
	 margin: -100px;
	 
	 
}

.notify123 {
	width:230px;
	margin-left:120px;
	
}

.notify1234{
	width: 140px;
    margin-left: -70px; 
}

#cb {
	margin-right: 80px;
}

.sc1 ul {
	list-style-type: none;
}

.sc1 span p {
	margin-left: 70px;
}



.board_page {
	margin-top: 30px;
	text-align: center;
	font-size: 0;
	display: inline-block;
	margin-left: 300px;
	margin-bottom: 500px;
}

.numbar {
    position: absolute; /* 절대 위치로 설정 */
    top: 620px; /* 아래로 배치할 위치를 조절합니다. */
    width: 100%;
}

.board_page a {
	display: inline-block;
	width: 32px;
	height: 32px;
	vertical-align: middle;
	border: 1px solid #ddd;
	border-left: 0;
	line-height: 100%;
}

.board_page a.bt {
	padding-top: 10px;
	font-size: 1.2rem;
	letter-spacing: -1px;
}

.board_page a.num {
	padding-top: 9px;
	font-size: 1.4rem;
}

.board_page a.num.on {
	border-color: #000;
	background: #000;
	color: #fff;
}

.board_page a:first-child {
	border-left: 1px solid #ddd;
}


.btn_group {
	margin-left: 150px;
	position: absolute;
	padding-top: 30px;
}

.add_btn {
	margin-right: 15px;
	width: 50px;
	height: 30px;
}

.delete_btn {
	margin-right: 15px;
	width: 50px;
	height: 30px;
}

.ul2 li {
	font-size: 18px;
	margin-top: 10px;
}

.ul2 li img {
	width: 17px;
	height: 17px;
}

.btnbtn {
	margin-left: 7px;
	width:60px;
}

.ul3 {
            display: none;
        }

        /* ul3를 보여주는 스타일 */
        .ul3.show {
            display: block;
            animation: slide-down 0.5s ease;
        }

        @keyframes slide-down {
            0% {
                opacity: 0;
                transform: translateY(-10px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }



</style>	
	
	
<script>
	function deletePost(post_id) {
		if (confirm("게시물을 삭제하시겠습니까?")) {
			// 선택된 게시물의 ID를 postId 필드에 설정
			document.getElementById("post_id").value = post_id;

			// 폼 제출
			document.getElementById("deleteForm").submit();
		}
	}
</script>

<script>
        function showPost(postId, title, author, ctime) {
            // 게시글 정보를 URL 매개변수로 조합하여 WriteShow.jsp로 이동
            var url = "postlook.jsp?post_id=" + postId +
                "&title=" + encodeURIComponent(title) +
                "&author=" + encodeURIComponent(author) +
                "&ctime=" + encodeURIComponent(ctime);

            window.location.href = url;
        }
        
    

    </script>
   
   

</head>

<body>
<form action="post_delete.jsp" method="post">
	<div class="asdf">
		<div class="inside1">
			<ul class="ul2">
                <li><img class="boardimg" src="board.png" alt="게시판이미지" /><a href="haksa1.jsp">학사</a></li>
                <li><img class="boardimg" src="board.png" alt="게시판이미지" /><a href="janghak1.jsp">장학</a></li>
                <li><img class="boardimg" src="board.png" alt="게시판이미지" /><a href="haksang_dongari.jsp">학생회, 동아리</a></li>
                <li><img class="boardimg" src="board.png" alt="게시판이미지" /><a href="hubokhak.jsp">휴복학</a></li>
                <li><img class="boardimg" src="board.png" alt="게시판이미지" /><a href="changup.jsp">취창업</a></li>
                <li><img class="boardimg" src="board.png" alt="게시판이미지" /><a href="education_festival.jsp">교육행사</a></li>
                <li class="extendgrade"><img class="boardimg" src="board.png" alt="게시판이미지" /><a id="gradebtn" class="gradebtn" href="#">학년</a>
                    <ul class="ul3">
                        <li><img class="boardimg" src="board.png" alt="게시판이미지" /><a href="grade1.jsp">1학년</a></li>
                        <li><img class="boardimg" src="board.png" alt="게시판이미지" /><a href="grade2.jsp">2학년</a></li>
                        <li><img class="boardimg" src="board.png" alt="게시판이미지" /><a href="grade3.jsp">3학년</a></li>
                        <li><img class="boardimg" src="board.png" alt="게시판이미지" /><a href="grade4.jsp">4학년</a></li>
                        <li><img class="boardimg" src="board.png" alt="게시판이미지" /><a href="gradeall.jsp">전체학년</a></li>
                    </ul>
                </li>
            </ul>
			
			<div class="inside_under">
				<ul id="noticeboardcontrol">
					<li><input type="button" href="#" class="btnbtn" value="추가"></li>
					<li><input type="button" href="#" class="btnbtn" value="삭제"></li>
				</ul>
			</div>
		</div>
		<section class="noticepart">
			<section>
				<div class="noticelook">
					<p>전체 게시글</p>
				</div>
			</section>
			<hr />
			<section>
				<span class="big_notice"><span> <p1 class="notice_pic">공지</p1>
				</span><span class="notice_start">
						<h3 class="notify">
							<a href="#">신한대 캡스톤 디자인 카페를 시작합니다.</a>
						</h3>
				</span><span>
						<p>관리자</p>
				</span><span>
						<p>2023.09.04</p>
				</span><span>
						<p>조회수 : 0</p>
				</span></span> <span class="big_notice"><span> <p1
							class="notice_pic">공지</p1>
				</span><span class="notice_start">
						<h3 class="notify">
							<a href="#">1번 공지</a>
						</h3>
				</span><span>
						<p>관리자</p>
				</span><span>
						<p>2023.09.05</p>
				</span><span>
						<p>조회수 : 0</p>
				</span></span>
				<hr />
			</section>
			<section class="sc1">
				<%
// MariaDB 연결 정보 설정
String jdbcUrl = "jdbc:mariadb://localhost:3306/test"; // 여기에 MariaDB의 호스트와 데이터베이스 이름을 설정하세요
String dbUser = "user1"; // 사용자명
String dbPassword = "tmdcks15"; // 비밀번호

Connection conn = null;
PreparedStatement pstmt = null;

try {
    // JDBC 드라이버 로드
    Class.forName("org.mariadb.jdbc.Driver");
    
    // 데이터베이스 연결
    conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

                    // 게시물 조회
                    String query = "SELECT post_id, title, author, ctime, views FROM jdbc_test ORDER BY post_id DESC";
                    pstmt = conn.prepareStatement(query);
                    ResultSet resultSet = pstmt.executeQuery();

                    while (resultSet.next()) {
                        int postId = resultSet.getInt("post_id");
                        String title = resultSet.getString("title");
                        String author = resultSet.getString("author");
                        String ctime = resultSet.getString("ctime");
                        String views = resultSet.getString("views");
            %>	
            		<ul style="top:20px;">
                        <li style="height:20px;">
                            <span class="notify1"><input type="checkbox" id ="cb" name="selectedPosts" value="<%=postId%>"></span>
                            <span class="notify"><a href="javascript:void(0);" onclick="showPost(<%=postId%>, '<%=title%>', '<%=author%>', '<%=ctime%>', '<%=views%>');"><%=title%></a></span>
                            <span class="notify12"><p><%=author%></p></span>
                            <span class="notify123" ><p><%=ctime%></p></span>
                            <span class="notify1234"><p>조회수 : <%=views %></p></span>
                        </li>
                        </ul>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (pstmt != null) {
                        pstmt.close();
                    }
                    if (conn != null) {
                    	conn.close();
                    }
                }
            %>
				</ul>
			</section>
			<section class="numbar">
				<div class="board_page">
					<a href="#" class="bt first"><<</a> <a href="#" class="bt prev"><</a>
					<a href="#" class="num on">1</a> <a href="#" class="num">2</a> <a
						href="#" class="num">3</a> <a href="#" class="num">4</a> <a
						href="#" class="num">5</a> <a href="#" class="bt next">></a> <a
						href="#" class="bt last">>></a>
				</div>
				 <span class="btn_group">
        
            <input type="button" class="add_btn" value="추가" onclick="checkLoggedInUser()">
        	<input type="submit" class="delete_btn" value="삭제" onclick="checkLoggedInUserAndSubmit(this.form)">
    </span>
    
    
    
   <script>
    function checkLoggedInUser() {
        // JSP에서 세션에 저장된 사용자 정보를 JavaScript로 가져옵니다.
        var loggedInUserName = '<%= (String)session.getAttribute("loggedInUserName") %>';

        if (loggedInUserName == null || loggedInUserName =="null") {
        	// 사용자가 로그인하지 않은 경우 알림창을 띄웁니다.
            alert("추가하려면 먼저 로그인을 해주세요.");
            
        } else {
        	// 사용자가 로그인한 경우, "write1.jsp" 페이지로 이동합니다.
            window.location.href = "write1.jsp";
        }
    }
</script>

<script>
    function checkLoggedInUserAndSubmit(form) {
        // JSP에서 세션에 저장된 사용자 정보를 JavaScript로 가져옵니다.
        var loggedInUserName = '<%= (String)session.getAttribute("loggedInUserName") %>';

        if (loggedInUserName == null || loggedInUserName == "null") {
            // 사용자가 로그인하지 않은 경우 알림창을 띄웁니다.
            alert("삭제하려면 먼저 로그인을 해주세요.");
        } else {
            // 사용자가 로그인한 경우, 폼을 제출합니다.
            form.submit();
        }
    }
</script>


    
     
			</section>
		</section>
	</div>
	<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
	</form>
	
	<script>
        // 학년 클릭 시 ul3 보이게 하기
        document.getElementById('gradebtn').addEventListener('click', function () {
            var ul3 = document.querySelector('.ul3');
            if (ul3.classList.contains('show')) {
                ul3.classList.remove('show');
            } else {
                ul3.classList.add('show');
            }
        });
    </script>
    
    
	
</body>

</html>