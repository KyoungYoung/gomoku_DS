package websocket;

import com.example.socketdemo.Room;
import com.example.socketdemo.RoomManager;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

@ServerEndpoint("/gomoku/{roomName}/{userNickname}")
public class OmokServer {
    private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
    private static final int MAX_CLIENTS = 100; // 허용할 최대 클라이언트 수


    @OnOpen
    public void onOpen(Session session, @PathParam("roomName") String roomName, @PathParam("userNickname") String userNickname) throws IOException {
        if (RoomManager.isRoomAvailable(roomName)) {
            Room room = RoomManager.getRoom(roomName);
            room.addUser(session);
            // 세션에 방 이름과 사용자 닉네임 저장
            session.getUserProperties().put("roomName", roomName);
            session.getUserProperties().put("userNickname", userNickname);
            System.out.println( userNickname + "님 방에 입장: " + roomName );
            System.out.println("session id: " + session.getId());
        } else {
            System.out.println("방이 가득 참");
            session.close();
        }
    }


    @OnMessage
    public void onMessage(String message, Session session) {
        System.out.println(session.getId() + "클라이언트가 보내온 메시지 : " + message);

        synchronized (clients) {
            for (Session client : clients) {
                if (!client.equals(session)) {
                    try {
                        client.getBasicRemote().sendText(message);
                        System.out.println("메세지 보내기");
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }

    @OnClose
    public void onClose(Session session) {
        clients.remove(session);
    }

    @OnError
    public void onError(Throwable error) {
        error.printStackTrace();
    }
}