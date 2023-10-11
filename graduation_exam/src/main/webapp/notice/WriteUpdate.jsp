<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.util.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>
<html>

<head>
    <meta charset="utf-8">
    <title>게시판 작성 페이지</title>
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">

    <!-- Bootstrap 및 Summernote CSS 및 JS 링크 추가 -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <script src="lang/summernote-ko-KR.js"></script>
    <link href="summernote.css" rel="stylesheet">
    <script src="summernote.min.js"></script>

    <script>
        // Summernote 초기화
        $(document).ready(function () {
            $('#summernote').summernote({
                lang: 'ko-KR',
                height: 140,
                placeholder: '내용을 입력하세요',
                toolbar: [
                    ['style', ['style']],
                    ['font', ['bold', 'italic', 'underline', 'clear']],
                    ['fontname', ['fontname']],
                    ['fontsize', ['fontsize']],
                    ['color', ['color']],
                    ['para', ['ul', 'ol', 'paragraph']],
                    ['height', ['height']],
                    ['table', ['table']],
                    ['insert', ['link', 'picture', 'video']]
                ],
                callbacks: {
                    onChange: function (contents, $editable) {
                        // 에디터 내용을 textarea에 복사
                        $('#summernote').val(contents); // ID 수정
                    }

                }
            });
        });

    </script>

    <style>
        @charset "UTF-8";

        @import url(style.css);
        @import url(media.css);
        @import url(https://fonts.googleapis.com/css?family=Roboto:400,700,500);

        /* main Styles */

        html {
            box-sizing: border-box;
        }

        *,
        *:before,
        *:after {
            box-sizing: inherit;
        }

        body {
            background: #fafafa;
            font-family: "Roboto", sans-serif;
            font-size: 14px;
            margin: 0;
        }

        .noticelook {
            display: inline-block;
            margin-left: 20px;
            height: 60px;
        }

        .allpost {
            display: inline-block;
            font-size: 20px;
            font-weight: bold;
            margin-top: 15px;
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

        .notice_write {
            border: 2px solid black;
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
            position: relative;
            margin-top: 240px;

            height: 50px;
            border-top: 1px solid black;
        }

        .noticepart {
            border: 1px solid red;
            margin-left: 300px;
            margin-top: 30px;
            height: 550px;
            width: 850px;
        }

        .ckbox {
            margin-left: 170px;
            margin-top: 20px;
            display: inline-block;
        }

        .ckbox p {
            display: inline-block;
            margin-right: 15px;
            margin-left: 3px;
        }

        .boardwrite {

            margin: 20px;
            width: 800px;
            height: 300px;
        }

        .checkbox12 {
            margin-left: 30px;
            display: inline-block;
        }

        .checkbox1 {
            width: 30px;
            height: 30px;
            display: inline-block;
        }

        .writetable {
            width: 100%;
            height: 300px;
            border: 1px black solid;
        }

        .noticealert {
            position: relative;
            display: inline-block;
            text-align: center;
            font-size: 20px;
            top: -7px;
            padding-left: 15px;
        }

        .noticepart {
            border: 1px solid red;
            margin-left: 300px;
            margin-top: 30px;
            height: 550px;
            width: 850px;
        }

        .btn_group1 {
            margin-top: 25px;
            float: right;
            margin-right: 40px;
        }

        .save_btn {
            width: 50px;
            height: 30px;
        }

        .can_btn {
            margin-left: 20px;
            width: 50px;
            height: 30px;
        }

        #noticeboardcontrol li {
            display: inline-block;
            text-align: center;
            padding: 5px;
            margin-left: 10px;
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


        .list_btn {
            width: 60px;
            height: 30px;
        }

        .noticelook {
            display: inline-block;
            margin-left: 20px;
        }

        .morelook {
            display: inline-block;
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

        .hr1 {
            margin: 2px;
        }

        .notify {
            width: 300px;
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

        .btn_group {
            float: right;
            margin-top: 30px;
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

        #txt2 {
            width: 300px;
            height: 300px;
        }

        .gradecheck input[type="checkbox"] {
            display: inline-block;
            font-size: 14px; /* 폰트 크기 설정 */
            /* 다른 스타일을 추가할 수 있습니다. */
        }

        .gradecheck p {
            display: inline-block;
            margin-right: 20px;
            margin-left: 5px;
            font-size: 14px; /* 폰트 크기 설정 */
            /* 다른 스타일을 추가할 수 있습니다. */
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

</head>

<body>

    <div class="asdf">
        <div class="inside1">
            <ul class="ul2">
                <li><img class="boardimg" src="board.png" alt="게시판이미지" /><a href="haksa1.jsp">학사</a></li>
                <li><img class="boardimg" src="board.png" alt="게시판이미지" /><a href="janghak1.jsp">장학</a></li>
                <li><img class="boardimg" src="board.png" alt="게시판이미지" /><a href="haksang_dongari.jsp">학생회, 동아리</a></li>
                <li><img class="boardimg" src="board.png" alt="게시판이미지" /><a href="hubokhak.jsp">휴복학</a></li>
                <li><img class="boardimg" src="board.png" alt="게시판이미지" /><a href="changup.jsp">취창업</a></li>
                <li><img class="boardimg" src="board.png" alt="게시판이미지" /><a href="education_festival.jsp">교육행사</a></li>
                <li class="extendgrade"><img class="boardimg" src="board.png" alt="게시판이미지" /><a id="gradebtn"
                        class="gradebtn" href="#">학년</a>
                    <ul class="ul3">
                        <li><img class="boardimg" src="board.png" alt="게시판이미지" /><a href="grade1.jsp">1학년</a></li>
                        <li><img class="boardimg" src="board.png" alt="게시판이미지" /><a href="grade2.jsp">2학년</a></li>
                        <li><img class="boardimg" src="board.png" alt="게시판이미지" /><a href="grade3.jsp">3학년</a></li>
                        <li><img class="boardimg" src="board.png" alt="게시판이미지" /><a href="grade4.jsp">4학년</a></li>
                        <li><img class="boardimg" src="board.png" alt="게시판이미지" /><a href="gradeall.jsp">전체학년</a></li>


                    </ul>
                </li>
            </ul>
        </div>

        <div>
            <section class="noticepart">
                <section>
                    <div class="noticelook">
                        <p class="allpost">게시글 수정</p>
                    </div>
                </section>
                <hr class="hr1" />
                <div class="ckbox">
                    <input type="radio" name="tag" value="학사" />
                    <p>학사</p>
                    <input type="radio" name="tag" value="장학" />
                    <p>장학</p>
                    <input type="radio" name="tag" value="휴복학" />
                    <p>휴복학</p>
                    <input type="radio" name="tag" value="학생회, 동아리" />
                    <p>학생회, 동아리</p>
                    <input type="radio" name="tag" value="취창업" />
                    <p>취창업</p>
                    <input type="radio" name="tag" value="교육행사" />
                    <p>교육행사</p>
                </div>
                <center>
                    <div class="gradecheck">
                        <input type="checkbox" id="gradetag" value="전체학년" /> <p>전체학년</p>
                        <input type="checkbox" id="gradetag" value="1학년" /> <p>1학년</p>
                        <input type="checkbox" id="gradetag" value="2학년" /> <p>2학년</p>
                        <input type="checkbox" id="gradetag" value="3학년" /> <p>3학년</p>
                        <input type="checkbox" id="gradetag" value="4학년" /> <p>4학년</p>
                    </div>
                </center>
                
                
				 <% 
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
        String jdbc_url = "jdbc:oracle:thin:@localhost:1521:xe";
        String title1 = request.getParameter("title"); // URL로 전달된 title1 값을 읽어옴
        
        try {
            // JDBC 드라이버 로드
            Class.forName(jdbc_driver);
            
            // 데이터베이스 연결
            conn = DriverManager.getConnection(jdbc_url, "test", "12345"); // 사용자명과 비밀번호를 적절하게 변경
            
            // SQL 쿼리 작성
            String sql = "SELECT post_id, author, title, contents FROM jdbc_test WHERE title = ?";
            
            // PreparedStatement 생성
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, title1); // title1 값을 SQL 쿼리에 바인딩
            
            // 쿼리 실행
            rs = pstmt.executeQuery();
            
            // 결과를 폼에 출력
            if (rs.next()) {
                String postId = rs.getString("post_id");
                String author = rs.getString("author");
                String title = rs.getString("title");
                String contents = rs.getString("contents");
                String loggedInUserName = (String) session.getAttribute("loggedInUserName");
        %>
        <form action="UpdatePost.jsp" method="post">
        <input type="hidden" name="post_id" value="<%= postId %>">
                <div class="boardwrite">
                        <div class="form-group">
                            <label for="title">제목</label>
                            <input type="text" class="form-control" name="new_title" id="title" value="<%= title %>" placeholder="제목을 입력하세요">
                        </div>
                        <div class="form-group">
                            <label for="content">내용</label>
                            <textarea class="form-control" id="summernote" name="new_contents"><%= contents %></textarea>
                            <textarea style="display: none;" name="author" id="txt2"><%=loggedInUserName %></textarea>
                        </div>
                        
                        <%
            } else {
                out.println("<p>게시글을 찾을 수 없습니다.</p>");
            }
        } catch (Exception e) {
            out.println("오류 발생: " + e.getMessage());
        } finally {
            // 자원 해제
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        %>
                        
                        
                </div>
                  
                <div class="checkbox12"><input type="checkbox" class="checkbox1" /> <label class="noticealert">공지 알림
                        (모바일
                        알림)</label></div>
                <div class="btn_group1"><input type="submit" value="수정" class="save_btn" /><input type="button"
                        value="취소" class="can_btn" /></div>
                         </form>
        </div>
        
    </div>
 

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
