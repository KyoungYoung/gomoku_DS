//package com.example.socketdemo;
//
//import com.example.socketdemo.Room;
//import websocket.RoomWebSocket;
//
//import javax.websocket.Session;
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//public class RoomManager {
//    private static Map<String, Room> rooms = new HashMap<>();
//    private static List<Session> sessions = new ArrayList<>();
//
//    public static boolean isRoomAvailable(String roomName) {
//        Room room = rooms.get(roomName);
//        if (room == null) {
//            room = new Room(roomName, 2);
//            rooms.put(roomName, room);
//        }
//        return room.isAvailable();
//    }
//
//    public static Room getRoom(String roomName) {
//        return rooms.get(roomName);
//    }
//
//    public static List<Room> getRooms() {
//        return new ArrayList<>(rooms.values());
//    }
//
//    public static void addSession(Session session) {
//        sessions.add(session);
//    }
//
//    public static void removeSession(Session session) {
//        sessions.remove(session);
//    }
//
//    public static void broadcastRoomList() {
//        RoomWebSocket.broadcastRoomList(getRooms(), sessions);
//    }
//}