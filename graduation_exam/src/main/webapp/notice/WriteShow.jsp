<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>

<html>

<head>   
    <title>게시글 보기</title>
</head>

<body>
    <h1>게시글 보기</h1>
    <table border="1">
    	<%
            // 이동할 페이지 URL 설정
            String updatePageURL = "WriteUpdate.jsp";
            String listPageURL = "total_listReal.jsp";
            
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            
            String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
            String jdbc_url = "jdbc:oracle:thin:@localhost:1521:xe";
            String title1 = request.getParameter("title"); // URL로 전달된 title1 값을 읽어옴
            
        %>
        
        <tr>
            <th>post_id</th>
            <th>작성자</th>
            <th>제목</th>
            <th>내용</th>
        </tr>
         <tr>
            <!-- 수정 버튼 -->
            <td colspan="4">
                <a href="<%= updatePageURL %>?title=<%= title1 %>">수정</a>
            </td>
            <!-- 목록 버튼 -->
            <td>
                <a href="<%= listPageURL %>">목록보기</a>
            </td>
        </tr>
        <%
        
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
            
            // 결과를 테이블에 출력
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getInt("post_id") + "</td>");
                out.println("<td>" + rs.getString("author") + "</td>");
                out.println("<td>" + rs.getString("title") + "</td>");
                out.println("<td>" + rs.getString("contents") + "</td>");
                out.println("</tr>");
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
    </table>
</body>

</html>
