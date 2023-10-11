<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Log In</title>
</head>
<body>

  <center>
  <form action="LoginProc.jsp" method="post">
  <table width="400" border="1">
  <tr height="40" align="center">
   <td width="150">아이디 </td>
   <td width="250" align="center">
   <input type="text" name="id1"> </td>
  </tr> 
  <tr height="40" align="center">
   <td width="150">패스워드 </td>
   <td width="250" align="center">
   <input type="password" name="passw1">
   </td>
  </tr> 
  <tr height="40" align="center" bgcolor="yellow">
   <td colspan="2"><input type="submit" value="전송"></td>
  </tr> 
  </table>
  </form>
  </center>

</body>
</html>