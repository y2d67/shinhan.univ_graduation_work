<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.util.Date, java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>

<html>
<head>
    <title>게시물 삭제</title>

</head>
<body>


    <%
        Connection connection = null;
        PreparedStatement pstmt = null;

        try {
            // 오라클 데이터베이스 연결
            Class.forName("oracle.jdbc.driver.OracleDriver");
            
            String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
            String jdbc_url = "jdbc:oracle:thin:@localhost:1521:xe";
            connection = DriverManager.getConnection(jdbc_url, "test", "12345");

            
            // 선택된 항목 삭제
            String[] selectedPosts = request.getParameterValues("selectedPosts");
            
            
            if (selectedPosts != null) {
                for (String post_id : selectedPosts) {
                    String deleteQuery = "DELETE FROM jdbc_test WHERE post_id = ?";
                    pstmt = connection.prepareStatement(deleteQuery);
                    pstmt.setInt(1, Integer.parseInt(post_id)); // 문자열을 정수로 변환
                    pstmt.executeUpdate();
                }
            }

            // 삭제가 완료되면 메시지를 표시
    %>
    <% 
    out.println("삭제된 게시물 번호 값: ");
            for (String post_id : selectedPosts) {
                out.println(post_id + " ");
            }
            %>
            <H2 style="text-align: center;">선택된 항목이 삭제되었습니다.</H2>
            <H5 style="text-align: center;">3초후에 새로고침됩니다.</H5>
            <script type="text/javascript">
    setTimeout(function(){
        window.location.href = "total_list.jsp";
    }, 3000);
</script>
    <%
        } catch (Exception e) {
            e.printStackTrace();
    %>
            <script>
        alert("오류가 발생하여 항목을 삭제할 수 없습니다.");
        window.location.href = "total_list.jsp"; // 오류 발생 시 목록 페이지로 이동
    </script>
    <%
        } finally {
            if (pstmt != null) {
                pstmt.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
    %>

    
</body>
</html>
