package websocket;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

@ServerEndpoint("/gomoku/{roomName}")
public class OmokServer {
    private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
    private static final int MAX_CLIENTS = 100; // 허용할 최대 클라이언트 수

    @OnOpen
    public void onOpen(Session session) throws IOException {
        if (clients.size() < MAX_CLIENTS) {
            System.out.println("클라이언트가 접속했습니다.");
            System.out.println("session id : " + session.getId());
            clients.add(session);
        } else {
            System.out.println("방이 꽉 참");
            session.close();
            onClose(session);
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