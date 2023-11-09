package com.example.socketdemo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;


// 방 생성 및 목록 관리 서블릿 만들기 - 클라이언트로부터 방 생성 요청 수신, 새로운 방 만들어 방 목록에 추가
@WebServlet("/createRoom")
public class CreateRoomServlet extends HttpServlet {
    List<Room> roomList = new ArrayList<Room>();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("방 서블릿 실행");
        request.setCharacterEncoding("utf-8");
        // HTML이 UTF-8 형식이라는 것을 브라우저에게 전달
        response.setContentType("text/html; charset=utf-8");
        // 클라이언트에서 보낸 방 이름 가져오기
        String roomTitle = request.getParameter("title");
        // 사용자가 입력한 닉네임을 가져옵니다.
        String userNickname = request.getParameter("userNickname");
        // 방을 생성한 후, 방 목록을 업데이트하고 세션에 저장
        HttpSession session = request.getSession();
        session.setAttribute("rooms", roomList);

        // 방 이름이 유효한 경우에만 새로운 방을 생성
        if (roomTitle != null && !roomTitle.isEmpty()) {
            // 방 생성 로직 (서버 데이터베이스에 방 추가 등)

            // 성공적으로 방을 생성한 후, 클라이언트에 응답으로 성공 메시지를 보내거나 새로운 방 정보를 JSON으로 반환
            String successMessage = "방이 성공적으로 생성되었습니다.";
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(successMessage);
            Room newRoom = new Room(roomTitle, 2);
            roomList.add(newRoom);
            System.out.println("방이 성공적으로 생성되었습니다.");
            if(userNickname != null && userNickname != "") {
                String encodedChatId = URLEncoder.encode(userNickname, StandardCharsets.UTF_8);
                String redirectURL = "room-list.jsp?chatId=" + encodedChatId;
                response.sendRedirect(redirectURL);;
            }
        } else {

            session.setAttribute("userNickname", userNickname);
            session.setAttribute("rooms", roomList);

            String encodedChatId = URLEncoder.encode(userNickname, StandardCharsets.UTF_8);
            String redirectURL = "room-list.jsp?chatId=" + encodedChatId;
            response.sendRedirect(redirectURL);

            // 방 이름이 유효하지 않을 때 에러 응답을 보냅니다.
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400 Bad Request
        }
    }
}