package websocket;

import com.example.socketdemo.Room;
import com.example.socketdemo.RoomManager;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.List;

@ServerEndpoint("/roomWebSocket")
public class RoomWebSocket {
    private static List<Session> sessions;

    @OnOpen
    public void onOpen(Session session) {
        RoomManager.addSession(session);
    }


    @OnClose
    public void onClose(Session session) {
        RoomManager.removeSession(session);
    }

    public static void broadcastRoomList(List<Room> rooms, List<Session> sessions) {
        String roomListJson = createRoomListJson(rooms);
        for (Session session : sessions) {
            try {
                session.getBasicRemote().sendText(roomListJson);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    private static String createRoomListJson(List<Room> rooms) {
        // TODO: Room 정보를 JSON으로 변환하는 로직 추가
        return "JSON representation of room list";
    }

    public static void setSessions(List<Session> sessions) {
        RoomWebSocket.sessions = sessions;
    }

}