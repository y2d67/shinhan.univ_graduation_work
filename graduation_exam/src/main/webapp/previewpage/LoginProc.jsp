<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

 <%
  //한글로 넘어온 데이터가 깨질수 있기에
  request.setCharacterEncoding("utf-8"); //post방식때 한글이 깨지지 않음
  
  //아이디를 읽어드림 == 파라미터명을 통하여 값을 받아옴
  String id = request.getParameter("id1");
  String pass = request.getParameter("passw1");
 %>
 당신의 id = <%=id %> 이고 패스워드는 <%=pass %> 입니다.
</body>
</html>