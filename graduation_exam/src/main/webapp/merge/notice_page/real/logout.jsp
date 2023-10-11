<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    try {
        // 현재 요청의 세션을 가져옵니다.
        HttpSession session1 = request.getSession(false);

        // 세션이 존재하면 세션을 무효화하여 로그아웃 처리합니다.
        if (session1 != null) {
            session.invalidate();
        }

        // 로그아웃이 완료되면 다시 로그인 페이지로 리디렉션합니다.
        response.sendRedirect("mainPage.jsp");
    } catch (Exception e) {
        e.printStackTrace(); // 오류 메시지를 출력하여 디버깅합니다.
    }
%>