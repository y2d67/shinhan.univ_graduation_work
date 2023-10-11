<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.util.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>

<%
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
   String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
   String jdbc_url = "jdbc:oracle:thin:@localhost:1521:xe";
   
   String s1 = request.getParameter("s1");
   String s2 = request.getParameter("s2");
   String s3 = request.getParameter("s3");
 
   try {
      Class.forName(jdbc_driver);
      conn = DriverManager.getConnection(jdbc_url, "test", "12345");
    
      // 게시글 등록
      String insertSQL = "INSERT INTO weekly(s1, s2, s3) VALUES (?, ?, ?)";

      pstmt = conn.prepareStatement(insertSQL);
      pstmt.setString(1, s1);
      pstmt.setString(2, s2);
      pstmt.setString(3, s3);
      
      // INSERT 문 실행
      pstmt.executeUpdate();
      
      // 변경사항을 커밋
      conn.commit();
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
   <TITLE>3줄 요약 작성</TITLE>
   <style>
   .senda {
	text-align: center;
}
</style>
</HEAD>

<BODY>
<div align="center">
<br/><br/><br/><br/><br/><br/>
<H2 class="senda">3줄 요약이 수정되었습니다.</H2>
<H5 class="senda">3초후에 새로고침됩니다.</H5>
</div>
<script type="text/javascript">
    setTimeout(function(){
        window.location.href = "3sUpload.jsp";
    }, 3000);
</script>
<%
   try {
      Class.forName(jdbc_driver);
      conn = DriverManager.getConnection(jdbc_url, "test", "12345");

      String sql = "SELECT s1, s2, s3 FROM weekly";

      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      int i = 1;

      while (rs.next()) {
       
      }
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
</BODY>
</HTML>
