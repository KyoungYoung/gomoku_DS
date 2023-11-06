//package com.example.socketdemo;
//
//import com.google.gson.Gson;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.List;
//
//
//// 방 목록을 동적으로 가져오는 서블릿
//@WebServlet("/getAvailableRooms")
//public class RoomService extends HttpServlet {
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<Room> availableRooms = getAvailableRooms(); // 방 목록을 동적으로 생성합니다.
//        request.setCharacterEncoding("utf-8");
//        // HTML이 UTF-8 형식이라는 것을 브라우저에게 전달
//        response.setContentType("text/html; charset=utf-8");
//        response.setContentType("application/json; charset=UTF-8");
//        response.setCharacterEncoding("UTF-8");
//
//
//        // JSON 문자열로 변환
//        String json = new Gson().toJson(availableRooms);
//        response.getWriter().write(json);
//    }
//
//    public List<Room> getAvailableRooms() {
//        // 실제로 사용 가능한 방 목록을 데이터베이스에서 또는 다른 소스로 가져오는 대신, 여기서 방 목록을 동적으로 생성합니다.
//        List<Room> rooms = new ArrayList<>();
//
//        // 예제: 방 목록을 동적으로 생성
//        Room room1 = new Room("Room 1", 2);
//        Room room2 = new Room("Room 2", 2);
//        Room room3 = new Room("Room 3", 2);
//
//        rooms.add(room1);
//        rooms.add(room2);
//        rooms.add(room3);
//        System.out.println("방 목록: " + rooms); // 로그에 방 목록을 출력
//        return rooms;
//    }
//
//
//}
