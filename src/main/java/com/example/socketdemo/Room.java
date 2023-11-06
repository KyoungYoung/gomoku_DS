package com.example.socketdemo;


// 방 정보를 나타내는 클래스 - 방 번호, 이름 등 다른 정보들 포함
public class Room {
    private String name;
    private int capacity;
    // 다른 방 정보 필드들을 추가할 수 있습니다.

    public Room(String roomTitle, String userNickname) {
        // 기본 생성자
    }

    public Room(String name, int capacity) {
        this.name = name;
        this.capacity = capacity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    // 다른 방 정보 필드의 getter 및 setter 메서드를 추가할 수 있다.
}