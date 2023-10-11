<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>

<html>
<head>
    <title>게시글 수정 결과</title>
</head>
<body>
    
    <%
    Connection conn = null;
    PreparedStatement pstmt = null;
    
    String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
    String jdbc_url = "jdbc:oracle:thin:@localhost:1521:xe";
    int postId = Integer.parseInt(request.getParameter("post_id"));
    String title = request.getParameter("new_title");
    String contents = request.getParameter("new_contents");
    String tag = request.getParameter("new_tag");
    String grade1 = request.getParameter("new_grade1");
    String grade2 = request.getParameter("new_grade2");
    String grade3 = request.getParameter("new_grade3");
    String grade4 = request.getParameter("new_grade4");
    String gradeall = request.getParameter("new_gradeall");
    
    try {
        // JDBC 드라이버 로드
        Class.forName(jdbc_driver);
        
        // 데이터베이스 연결
        conn = DriverManager.getConnection(jdbc_url, "test", "12345"); // 사용자명과 비밀번호를 적절하게 변경
        
        // 사용자가 입력한 수정 내용을 받아옴
       
        
        
        
        // SQL 쿼리 작성
        String sql = "UPDATE jdbc_test SET title=?, contents=?, tag=?, grade1=?, grade2=?, grade3=?, grade4=?, gradeall=? WHERE post_id=?";
        
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, title);
        pstmt.setString(2, contents);
        pstmt.setString(3, tag);
        pstmt.setString(4, grade1);
        pstmt.setString(5, grade2);
        pstmt.setString(6, grade3);
        pstmt.setString(7, grade4);
        pstmt.setString(8, gradeall);
        pstmt.setInt(9, postId);
        // 쿼리 실행
        int rowCount = pstmt.executeUpdate();
        
        if (rowCount > 0) {
        	%>
        	    <script>
        	        // 게시글이 성공적으로 수정되었을 때 total_listReal.jsp로 자동 리디렉션
        	        setTimeout(function () {
        	            window.location.href = "total_list.jsp";
        	        }, 0000); // 2초 후에 리디렉션
        	    </script>
        	<%
        	} else {
        	%>
        	    <p>게시글 수정에 실패했습니다.</p>
        	<%
        	}
    } catch (Exception e) {
        out.println("오류 발생: " + e.getMessage());
    } finally {
        // 자원 해제
        if (pstmt != null) {
            pstmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
    %>
</body>
</html>
