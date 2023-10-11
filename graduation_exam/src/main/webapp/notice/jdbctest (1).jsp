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
   String title = request.getParameter("title");
   //String contents = request.getParameter("contents");
   String contents = request.getParameter("contents");
	if (contents != null) {
   contents = contents.replaceAll("<p>", "").replaceAll("</p>", "\n");  // <p> 태그를 제거하고 </p> 태그를 줄바꿈으로 대체합니다.
	}
   //contents = contents.replaceAll("<p>", "").replaceAll("</p>", "\n");  // <p> 태그를 제거하고 </p> 태그를 줄바꿈으로 대체합니다.
  
   
   String author = request.getParameter("author"); /* 작성자받아오는거고쳐야함 */
   try{
      // JDBC 드라이버 로드
      Class.forName(jdbc_driver);

      // 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
      //conn = DriverManager.getConnection(jdbc_url,"system","12345");
      conn = DriverManager.getConnection(jdbc_url,"test","12345");

      // Connection 클래스의 인스턴스로 부터 SQL  문 작성을 위한 Statement 준비
      String sql = "insert into jdbc_test values(?,?,?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1,request.getParameter("title"));
    //pstmt.setString(2,request.getParameter("contents"));
      pstmt.setString(2, contents);
      pstmt.setString(3,request.getParameter("author"));
      
      
     /*    Date currentDate = new Date();
         // SimpleDateFormat을 사용하여 원하는 날짜 및 시간 형식을 지정
         SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
         String formattedDate = dateFormat.format(currentDate);
         // 생성한 날짜를 데이터베이스에 저장
         pstmt.setString(4, formattedDate); */

      
         
      //  사용자가 폼을 제출할 때 입력한 데이터를 데이터베이스에 추가
      if(request.getParameter("title") != null) {
         pstmt.executeUpdate(); //데이터베이스에 데이터를 추가
         
         
      }
   }
   catch(Exception e) {
      System.out.println(e);
   }
%>
<HTML>
<HEAD><TITLE>JDBC 테스트 </TITLE></HEAD>

<BODY>
<div align="center">
<H2>게시글 등록</H2>
<HR>

<form name=form1 method=post action=jdbctest.jsp > 
제목 : <%= title %>
내용 : <%= contents %>
작성자 :<%= author %>  




<input type=submit value="등록">
</form>

<HR>
</div>


   # 데이터베이스에서 등록된 데이터 목록을 화면에 표시
   <br/>
<%
   try{
      // select 문장을 문자열 형태로 구성한다.
      // 데이터베이스에서 데이터를 조회하기 위한 SQL 쿼리를 정의
      String sql = "select title, contents, author from jdbc_test";

      pstmt = conn.prepareStatement(sql);

      //: SQL 쿼리를 실행하여 결과를 ResultSet 클래스의 객체로 가져옵니다.
      ResultSet rs = pstmt.executeQuery();
      int i=1;

      // 마지막 데이터까지 반복함.
      while(rs.next()) {      
         out.println(i + " : " + rs.getString(1) + " , " + rs.getString("contents")  + " , "
         + rs.getString("author") + "<BR>");
         i++;
      }

      // 사용한 자원의 반납.
      rs.close();
      pstmt.close();
      conn.close();
   }
   catch(Exception e) {
      System.out.println(e);
   }
%>
</BODY>
</HTML>