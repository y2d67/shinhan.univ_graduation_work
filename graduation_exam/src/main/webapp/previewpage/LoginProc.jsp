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
  //�ѱ۷� �Ѿ�� �����Ͱ� ������ �ֱ⿡
  request.setCharacterEncoding("utf-8"); //post��Ķ� �ѱ��� ������ ����
  
  //���̵� �о�帲 == �Ķ���͸��� ���Ͽ� ���� �޾ƿ�
  String id = request.getParameter("id1");
  String pass = request.getParameter("passw1");
 %>
 ����� id = <%=id %> �̰� �н������ <%=pass %> �Դϴ�.
</body>
</html>