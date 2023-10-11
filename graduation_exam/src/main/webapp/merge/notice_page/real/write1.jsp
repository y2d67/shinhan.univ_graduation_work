<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>게시판 작성 페이지</title>
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
	 <link type="text/css" rel="stylesheet" href="css/write1.css" />
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
    
    <script>
    function cancelAction() {
        // total_list.jsp로 이동합니다.
        window.location.href = "total_list.jsp";
    }
</script>
    
    
    <script>
    $(document).ready(function () {
        // 전체학년 체크박스의 상태가 변경될 때
        $("#gradeall").change(function () {
            if ($(this).is(":checked")) {
                $(".grade").prop("checked", true); // 모든 학년 체크박스 체크
            } else {
                $(".grade").prop("checked", false); // 모든 학년 체크박스 해제
            }
        });

        // 개별 학년 체크박스 중 하나라도 체크가 해제될 때
        $(".grade").change(function () {
            if ($(".grade:checked").length === $(".grade").length) {
                // 모든 학년 체크박스가 체크되어 있을 때
                $("#gradeall").prop("checked", true);
            } else {
                $("#gradeall").prop("checked", false);
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
            <li><img class="boardimg" src="board.png" alt="게시판이미지" /><a href="grade.jsp">학년</a></li>
         </ul>
         
      </div>

      <div>
         <section class="noticepart">
            <section>
               <div class="noticelook">
                  <p class="allpost">게시글 작성</p>
               </div>
            </section>
            <hr class="hr1" />
            
            <div class="ckbox">
           <form method="POST" accept-charset="utf-8"  action="jdbctest.jsp">
                <label>
                    <input type="radio" name="tag" value="학사" >
                   <p>학사</p></label>
                <label>
                    <input type="radio" name="tag" value="장학" >
                    <p>장학</p></label>
                <label>
                    <input type="radio" name="tag" value="휴복학" >
                    <p>휴복학</p></label>
                <label>
                    <input type="radio" name="tag" value="학생회, 동아리" >
                    <p>학생회, 동아리</p></label>
                <label>
                   <input type="radio" name="tag" value="취창업" >
                    <p>취창업</p></label>
                <label>
                	<input type="radio" name="tag" value="교육행사" >
                	<p>교육행사</p></label>
              </div>
                
                
                
                <center>
            <div class="gradecheck">
                
              <input type="checkbox" name="grade1" class="grade" value="1학년" >
			  <label for="grade1">1학년</label>
			  
              <input type="checkbox" name="grade2" class="grade" style="margin-left:10px;" value="2학년">
			  <label for="grade2" >2학년</label>
                
              <input type="checkbox" name="grade3" class="grade" style="margin-left:10px;" value="3학년">
        	  <label for="grade3" >3학년</label>
              
              <input type="checkbox" name="grade4" class="grade" style="margin-left:10px;" value="4학년">
        	  <label for="grade4" >4학년</label>
              
              <input type="checkbox" name="gradeall" id="gradeall" style="margin-left:10px;" value="전체학년">
              <label for="gradeall" >전체학년</label>
            </div>
            </center>
           
          
            <div class="boardwrite">
             <%  String loggedInUserName = (String) session.getAttribute("loggedInUserName"); %>
                  <div class="form-group">
                     <label for="title">제목</label>
                     <input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력하세요">
                  </div>
                  <div class="form-group">
                     <label for="content">내용</label>
                     <textarea class="form-control" id="summernote" name="contents"></textarea>
                  </div>
                  <textarea style="display:none" name="author" id="txt2"><%=loggedInUserName %></textarea>
            </div>
            <div class="checkbox12"><input type="checkbox" class="checkbox1" /> <label class="noticealert">공지 알림
                  (모바일
                  알림)</label></div>
            <div class="btn_group1"><input type="submit" value="저장" class="save_btn" /><input type="button"
                  value="취소" class="can_btn" onclick="cancelAction()"/></div>
      </div>
      </form>
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
