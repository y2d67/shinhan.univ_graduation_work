<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.util.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>

<%
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
   String jdbc_driver = "org.mariadb.jdbc.Driver";
   String jdbc_url = "jdbc:mariadb://localhost:3306/test";
   
   String title = request.getParameter("title");
   String contents = request.getParameter("contents");
   if (contents != null) {
	   contents = contents.replaceAll("<p>", "").replaceAll("</p>", "\n");  // <p> 태그를 제거하고 </p> 태그를 줄바꿈으로 대체합니다.
		}
   String author = request.getParameter("author");
   String tag = request.getParameter("tag");
   String grade1 = request.getParameter("grade1");
   String grade2 = request.getParameter("grade2");
   String grade3 = request.getParameter("grade3");
   String grade4 = request.getParameter("grade4");
   String gradeall = request.getParameter("gradeall");
   
   try {
	   Class.forName("org.mariadb.jdbc.Driver");
      conn = DriverManager.getConnection(jdbc_url, "root", "12345");

      // 시퀀스에서 다음 post_id 값을 가져오기
      String seqSQL = "SELECT AUTO_INCREMENT FROM information_schema.TABLES WHERE TABLE_NAME='post_id_seq'";
      pstmt = conn.prepareStatement(seqSQL);
      rs = pstmt.executeQuery();
      int post_id = 0;
      if (rs.next()) {
         post_id = rs.getInt(1);
      }

      // 게시글 등록
      String insertSQL = "INSERT INTO jdbc_test(post_id, title, contents, author, ctime, tag, grade1, grade2, grade3, grade4, gradeall) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
      pstmt = conn.prepareStatement(insertSQL);
      pstmt.setInt(1, post_id);
      pstmt.setString(2, title);
      pstmt.setString(3, contents);
      pstmt.setString(4, author);
      
      Date currentDate = new Date();
      SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
      String formattedDate = dateFormat.format(currentDate);
      pstmt.setString(5, formattedDate);
      
      pstmt.setString(6, tag);
      pstmt.setString(7, grade1);
      pstmt.setString(8, grade2);
      pstmt.setString(9, grade3);
      pstmt.setString(10, grade4);
      pstmt.setString(11, gradeall);
      pstmt.executeUpdate();
   } catch (Exception e) {
      e.printStackTrace();
   } finally {
      try {
         if (rs != null) {
            rs.close();
         }
         if (pstmt != null) {
            pstmt.close();
         }
         if (conn != null) {
            conn.close();
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }
   }
%>

<HTML>
<HEAD>
   <TITLE>JDBC 테스트</TITLE>
</HEAD>

<BODY>

<script type="text/javascript">
    setTimeout(function(){
        window.location.href = "total_list.jsp";
    }, 0000);
</script>

</BODY>
</HTML>
