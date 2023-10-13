<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.util.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>
<html>

<head>
    <meta charset="utf-8">
    <title>게시글 수정</title>
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
    <link type="text/css" rel="stylesheet" href="css/WriteUpdate.css" />
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
                <li class="extendgrade"><img class "boardimg" src="board.png" alt="게시판이미지" /><a id="gradebtn"
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

                <%
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String jdbc_driver = "org.mariadb.jdbc.Driver";
        String jdbc_url = "jdbc:mariadb://localhost:3306/test";
        String title1 = request.getParameter("title");

        try {
            Class.forName(jdbc_driver);
            conn = DriverManager.getConnection(jdbc_url, "user1", "tmdcks15");
            
            String sql = "SELECT post_id, author, title, contents, tag, grade1, grade2, grade3, grade4, gradeall FROM jdbc_test WHERE title = ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, title1);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                String postId = rs.getString("post_id");
                String author = rs.getString("author");
                String title = rs.getString("title");
                String contents = rs.getString("contents");
                String tag = rs.getString("tag");
                String grade1 = rs.getString("grade1");
                String grade2 = rs.getString("grade2");
                String grade3 = rs.getString("grade3");
                String grade4 = rs.getString("grade4");
                String gradeall = rs.getString("gradeall");
                String loggedInUserName = (String) session.getAttribute("loggedInUserName");
        %>
        <form action="UpdatePost.jsp" method="post">
        
        <input type="hidden" name="post_id" value="<%= postId %>">
         <div class="ckbox">
                	<label>
                    <input type="radio" name="new_tag" value="학사" />
                    <p>학사</p></label>
                    <label>
                    <input type="radio" name="new_tag" value="장학" />
                    <p>장학</p></label>
                    <label>
                    <input type="radio" name="new_tag" value="휴복학" />
                    <p>휴복학</p></label>
                    <label>
                    <input type="radio" name="new_tag" value="학생회, 동아리" />
                    <p>학생회, 동아리</p></label>
                    <label>
                    <input type="radio" name="new_tag" value="취창업" />
                    <p>취창업</p></label>
                    <label>
                    <input type="radio" name="new_tag" value="교육행사" />
                    <p>교육행사</p></label>
                </div>
               <center>
                    <div class="gradecheck">
                        <input type="checkbox" id="grade1" name="new_grade1" value="1학년" /> <label for="grade1">1학년</label>
                        <input type="checkbox" id="grade2" name="new_grade2"value="2학년" /> <label for="grade2">2학년</label>
                        <input type="checkbox" id="grade3" name="new_grade3"value="3학년" /> <label for="grade3">3학년</label>
                        <input type="checkbox" id="grade4" name="new_grade4"value="4학년" /> <label for="grade4">4학년</label>
                        <input type="checkbox" id="gradeall" name="new_gradeall"value="전체학년" /> <label for="gradeall">전체학년</label>
                    </div>
                </center>
                
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

        <script>
            // 페이지 로드 시, request로 받아온 값에 따라 체크박스 체크
            window.addEventListener('DOMContentLoaded', function () {
                var tagValue = '<%= tag %>';
                var grade1Value = '<%= grade1 %>';
                var grade2Value = '<%= grade2 %>';
                var grade3Value = '<%= grade3 %>';
                var grade4Value = '<%= grade4 %>';
                var gradeallValue = '<%= gradeall %>';

                // tag 값에 따라 radio 버튼 체크
                var tagRadios = document.querySelectorAll('input[name="new_tag"]');
                tagRadios.forEach(function (radio) {
                    if (radio.value === tagValue) {
                        radio.checked = true;
                    }
                });

                // 학년 체크박스 체크
                var grade1Checkbox = document.getElementById('grade1');
                var grade2Checkbox = document.getElementById('grade2');
                var grade3Checkbox = document.getElementById('grade3');
                var grade4Checkbox = document.getElementById('grade4');
                var gradeallCheckbox = document.getElementById('gradeall');

                if (grade1Value === '1학년') {
                    grade1Checkbox.checked = true;
                }
                if (grade2Value === '2학년') {
                    grade2Checkbox.checked = true;
                }
                if (grade3Value === '3학년') {
                    grade3Checkbox.checked = true;
                }
                if (grade4Value === '4학년') {
                    grade4Checkbox.checked = true;
                }
                if (gradeallValue === '전체학년') {
                    gradeallCheckbox.checked = true;
                }
            });
        </script>
        <%
            } else {
                out.println("<p>게시글을 찾을 수 없습니다.</p>");
            }
        } catch (Exception e) {
            out.println("오류 발생: " + e.getMessage());
        } finally {
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
                        알림)</div>
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