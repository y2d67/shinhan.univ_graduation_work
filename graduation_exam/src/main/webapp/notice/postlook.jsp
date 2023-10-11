<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.util.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>

<html>

<head>
<meta charset="utf-8">
<title>게시판 작성 페이지</title>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">

<!-- Bootstrap 및 Summernote CSS 및 JS 링크 추가 -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="lang/summernote-ko-KR.js"></script>
<link href="summernote.css" rel="stylesheet">
<script src="summernote.min.js"></script>

<script>
	// Summernote 초기화
	$(document)
			.ready(
					function() {
						$('#summernote')
								.summernote(
										{
											lang : 'ko-KR',
											height : 140,
											placeholder : '내용을 입력하세요',
											toolbar : [
													[ 'style', [ 'style' ] ],
													[
															'font',
															[
																	'bold',
																	'italic',
																	'underline',
																	'clear' ] ],
													[ 'fontname',
															[ 'fontname' ] ],
													[ 'fontsize',
															[ 'fontsize' ] ],
													[ 'color', [ 'color' ] ],
													[
															'para',
															[ 'ul', 'ol',
																	'paragraph' ] ],
													[ 'height', [ 'height' ] ],
													[ 'table', [ 'table' ] ],
													[
															'insert',
															[ 'link',
																	'picture',
																	'video' ] ] ],
											callbacks : {
												onChange : function(contents,
														$editable) {
													// 에디터 내용을 textarea에 복사
													$('#summernote').val(
															contents); // ID 수정
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

*, *:before, *:after {
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
	height: auto;
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
	min-height: 500px; /* 최소 높이를 조정하세요 */
	max-height: 600px; /* 최대 높이를 조정하세요 */
	overflow-y: auto; /* 내용이 넘칠 경우 스크롤 표시 */
	width: 850px;
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
	margin-left: 800px;
	position: absolute;
}

.update_btn {
	margin-right: 10px;
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

.container {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
	border-radius: 5px;
}

h1 {
	font-size: 24px;
	margin-bottom: 10px;
}

.post-meta {
	display: flex; /* 가로로 배치하기 위해 flex 사용 */
	font-size: 14px;
	color: #777;
	position: relative;
	top: -30px;
}

.post-meta-item {
	margin-right: 20px; /* 아이템 간격 조절 */
}

.post-content {
	font-size: 16px;
	line-height: 1.6;
	position: relative;
	top: -150px;
}

.maincontents {
	text-align: center;
}

.upper {
	position: relative;
	top: -130px; /* 원하는 만큼 조정하여 위로 이동시킵니다. */
}
</style>

</head>

<body>
	<div class="asdf">
		<div class="inside1">
			<ul class="ul2">
				<li><img class="boardimg" src="board.png" alt="게시판이미지" /><a
					href="haksa1.html">학사</a></li>
				<li><img class="boardimg" src="board.png" alt="게시판이미지" /><a
					href="janghak1.html">장학</a></li>
				<li><img class="boardimg" src="board.png" alt="게시판이미지" /><a
					href="haksang_dongari.html">학생회, 동아리</a></li>
				<li><img class="boardimg" src="board.png" alt="게시판이미지" /><a
					href="hubokhak.html">휴복학</a></li>
				<li><img class="boardimg" src="board.png" alt="게시판이미지" /><a
					href="changup.html">취창업</a></li>
				<li><img class="boardimg" src="board.png" alt="게시판이미지" /><a
					href="education_festival.html">교육행사</a></li>
				<li><img class="boardimg" src="board.png" alt="게시판이미지" /><a
					href="grade.html">학년</a></li>
			</ul>
		</div>
<%
            // 이동할 페이지 URL 설정
            String updatePageURL = "WriteUpdate.jsp";
            String listPageURL = "total_list.jsp";
            
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            
            String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
            String jdbc_url = "jdbc:oracle:thin:@localhost:1521:xe";
            String title1 = request.getParameter("title"); // URL로 전달된 title1 값을 읽어옴
            String author = request.getParameter("author");
        %>
        <%
        
        try {
            // JDBC 드라이버 로드
            Class.forName(jdbc_driver);
            
            // 데이터베이스 연결
            conn = DriverManager.getConnection(jdbc_url, "test", "12345"); // 사용자명과 비밀번호를 적절하게 변경
            
            // SQL 쿼리 작성
            String sql = "SELECT post_id, author, title, contents, ctime FROM jdbc_test WHERE title = ?";
            
            // PreparedStatement 생성
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, title1); // title1 값을 SQL 쿼리에 바인딩
            
            // 쿼리 실행
            rs = pstmt.executeQuery();
            
            // 결과를 테이블에 출력
            while (rs.next()){
                String postTitle = rs.getString("title");
                String postContents = rs.getString("contents");
                String ctime = rs.getString("ctime");
        %>
                <div>
                    <section class="noticepart">
                        <div class="container">
                            <div class="upper">
                                <h1 class="title1"><%= postTitle %></h1>
                                <hr />
                                <br /> <span class="post-meta">
                                    <p class="post-meta-item">작성자: <%= author %></p> <!-- 작성자 이름 직접 설정 -->
                                    <p class="post-meta-item">작성일: <%= ctime %></p> <!-- 작성일은 고정값 혹은 필요에 따라 설정 -->
                                    <p class="post-meta-item">태그 : 학사</p>
                                    <p class="post-meta-item">글번호 : <%= rs.getInt("post_id") %></p>
                                </span>
                            </div>
                            <div class="post-content">
                                <p class="maincontents"><%= postContents %></p>
                            </div>
                        </div>
                    </section>
                </div>
        <%
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
		
		<span class="btn_group"> <a href="<%= updatePageURL %>?title=<%= title1 %>"><input type="button"
				class="update_btn" value="수정" /></a> <a class="cancle_btn1"
			href="total_list.jsp"><input type="button" class="cancle_btn"
				value="목록보기" /></a>
		</span>
	</div>
</body>

</html>
