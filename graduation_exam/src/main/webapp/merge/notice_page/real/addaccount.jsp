<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.util.Date, java.text.SimpleDateFormat"%>
<!--java.sql 패키지를 임포트하여 JDBC 기능을 사용-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>

<%
   // 데이터베이스 연결관련 변수 선언
   Connection conn = null; //conn :데이터베이스 연결을 나타내는 객체
   // pstmt : SQL 문장을 실행하기 위한 준비된 객체
   // String => SQL문법으로 형변환
   PreparedStatement pstmt = null; 

   // 데이터베이스 연결관련정보를 문자열로 선언(전 세계공용!)
   String jdbc_driver = "oracle.jdbc.driver.OracleDriver"; //사용할 JDBC 드라이버의 클래스 이름
   String jdbc_url = "jdbc:oracle:thin:@localhost:1521:xe";
   String id = request.getParameter("id");
   String pwd = request.getParameter("pwd");
   String oname = request.getParameter("oname");
   String role = request.getParameter("role");
   
   try{
      // JDBC 드라이버 로드
      Class.forName(jdbc_driver);

      // 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
      //conn = DriverManager.getConnection(jdbc_url,"system","12345");
      conn = DriverManager.getConnection(jdbc_url,"test","12345");

      // Connection 클래스의 인스턴스로 부터 SQL  문 작성을 위한 Statement 준비
      String sql = "insert into login_test values(?,?,?,?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1,request.getParameter("id"));
      pstmt.setString(2,request.getParameter("pwd"));
      pstmt.setString(3,request.getParameter("oname"));
      pstmt.setString(4,request.getParameter("role"));
      
      
          
      //  사용자가 폼을 제출할 때 입력한 데이터를 데이터베이스에 추가
      if(request.getParameter("id") != null) {
         pstmt.executeUpdate(); //데이터베이스에 데이터를 추가
      }
   }
   catch(Exception e) {
      System.out.println(e);
   }
%>
<HTML>
<HEAD><TITLE>계정추가 </TITLE></HEAD>
<BODY>
<div align="center">
<br/><br/><br/><br/><br/><br/>
<H2 style ="text-align: center;">계정이 추가 되었습니다.</H2>
<H5 style ="text-align: center;">3초후에 새로고침됩니다.</H5>
</div>
<script type="text/javascript">
    setTimeout(function(){
        window.location.href = "AccountBoard.jsp";
    }, 3000);
</script>

</BODY>
</HTML>