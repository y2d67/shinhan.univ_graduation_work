<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>교육행사 게시판</title>
<link rel="stylesheet"
    href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="css/education_festival.css" />

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
                <li><img class "boardimg" src="board.png" alt="게시판이미지" /><a href="haksang_dongari.jsp">학생회, 동아리</a></li>
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
                    <p>교육행사</p>
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
                Connection connection = null;
                PreparedStatement pstmt = null;

                try {
                    // MariaDB 데이터베이스 연결
                    Class.forName("org.mariadb.jdbc.Driver");
                    connection = DriverManager.getConnection("jdbc:mariadb://localhost:3306/test", "user1", "tmdcks15");

                    // 게시물 조회
                    String query = "SELECT post_id, title, author, ctime, tag FROM jdbc_test WHERE tag ='교육행사' ORDER BY post_id DESC";
                    pstmt = connection.prepareStatement(query);
                    ResultSet resultSet = pstmt.executeQuery();

                    while (resultSet.next()) {
                        int postId = resultSet.getInt("post_id");
                        String title = resultSet.getString("title");
                        String author = resultSet.getString("author");
                        String ctime = resultSet.getString("ctime");
                %>
                    <ul>
                        <li>
                            <span class="notify1"><input type="checkbox" id ="cb" name="selectedPosts" value="<%=postId%>"></span>
                            <span class="notify"><a href="javascript:void(0);" onclick="showPost(<%=postId%>, '<%=title%>', '<%=author%>', '<%=ctime%>');"><%=title%></a></span>
                            <span class="notify12"><p><%=author%></p></span>
                            <span class="notify1"><p><%=ctime%></p></span>
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
                    if (connection != null) {
                        connection.close();
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
                ul3.classList remove('show');
            } else {
                ul3.classList.add('show');
            }
        });
    </script>
</body>

</html>
