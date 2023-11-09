//package com.example.socketdemo;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import java.io.IOException;
//
//@WebServlet("/setNickname")
//public class SetNickNameServlet extends HttpServlet {
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, IOException {
//        request.setCharacterEncoding("utf-8");
//        // HTML이 UTF-8 형식이라는 것을 브라우저에게 전달
//        response.setContentType("text/html; charset=utf-8");
//
//        String userNickname = request.getParameter("userNickname");
//
//        if (userNickname != null && !userNickname.isEmpty()) {
//            HttpSession session = request.getSession();
//            session.setAttribute("userNickname", userNickname);
//            response.sendRedirect("room-list.jsp"); // 방 목록 페이지로 이동
//        } else {
//            // 유효하지 않은 입력에 대한 처리
//            response.sendRedirect("error.jsp"); // 오류 페이지로 이동
//        }
//    }
//}
