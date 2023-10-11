<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>

<html>
<head>
    <title>게시글 수정 결과</title>
</head>
<body>
    <h1>게시글 수정 결과</h1>
    <%
    Connection conn = null;
    PreparedStatement pstmt = null;
    
    String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
    String jdbc_url = "jdbc:oracle:thin:@localhost:1521:xe";
    
    try {
        // JDBC 드라이버 로드
        Class.forName(jdbc_driver);
        
        // 데이터베이스 연결
        conn = DriverManager.getConnection(jdbc_url, "test", "12345"); // 사용자명과 비밀번호를 적절하게 변경
        
        // 사용자가 입력한 수정 내용을 받아옴
        int postId = Integer.parseInt(request.getParameter("post_id"));
        String newTitle = request.getParameter("new_title");
        String newContents = request.getParameter("new_contents");
        
        // SQL 쿼리 작성
        String sql = "UPDATE jdbc_test SET title=?, contents=? WHERE post_id=?";
        
        // PreparedStatement 생성
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, newTitle);
        pstmt.setString(2, newContents);
        pstmt.setInt(3, postId);
        
        // 쿼리 실행
        int rowCount = pstmt.executeUpdate();
        
        // 수정 결과를 출력
        if (rowCount > 0) {
    %>
        <p>게시글이 성공적으로 수정되었습니다.</p>
        <a href="total_listReal.html">목록 보기</a>
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
