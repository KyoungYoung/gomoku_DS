<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.socketdemo.Room" %>


<html>
<head>
  <title>방 리스트</title>
</head>
<body>
<h2>방 리스트</h2>
<%
  List<Room> rooms = (List<Room>) request.getAttribute("rooms");
  String chatId = request.getParameter("chatId");
  session.setAttribute("userNickname",chatId);

%>

<p>사용자 닉네임: <%= chatId%></p>

<div>
  <button onclick="goToRoom();">방만들기</button>
</div>
<div>
  <button onclick="updateRoom();">새로고침</button>
</div>
<div id="roomList">
  <c:forEach items="${rooms}" var="room">
    <div class="room">
      <a href="OmokAndChat.jsp?roomName=${room.name}&chatId=${userNickname}">
        <p>방 이름: ${room.name}</p>
        <p>인원 제한: ${room.capacity}</p>
      </a>
    </div>
  </c:forEach>
</div>


<script>
  // WebSocket 연결
  const socket = new WebSocket("<%= application.getInitParameter("CHAT_ADDR")%>roomWebSocket");
  console.log(socket)

  socket.onmessage = function (event) {
    // 서버에서 전송한 메시지 처리 (방 목록 업데이트)
    let roomList = JSON.parse(event.data);

    // 방 목록 업데이트 함수 호출
    updateRoomList(roomList);
  };
  socket.onclose = function (event) {
    // 연결이 종료될 때의 처리
    console.log("WebSocket closed: " + event.code + ", " + event.reason);
  };

  function updateRoomList(roomList) {
    // 방 목록 업데이트 로직 구현
    var roomListContainer = document.getElementById("roomList");
    roomListContainer.innerHTML = ""; // 기존 목록 비우기

    for (var i = 0; i < roomList.length; i++) {
      var room = roomList[i];
      var roomDiv = document.createElement("div");
      roomDiv.className = "room";

      var roomLink = document.createElement("a");
      roomLink.href = "OmokAndChat.jsp?roomName=" + room.name + "&chatId=" + userNickname;

      var roomNameParagraph = document.createElement("p");
      roomNameParagraph.textContent = "방 이름: " + room.name;

      var capacityParagraph = document.createElement("p");
      capacityParagraph.textContent = "인원 제한: " + room.capacity;

      roomLink.appendChild(roomNameParagraph);
      roomLink.appendChild(capacityParagraph);
      roomDiv.appendChild(roomLink);

      roomListContainer.appendChild(roomDiv);
    }
  }

  function goToRoom(){
    let popupWindow = window.open("room-create.jsp","_blank","width=1000, height=500");
    setTimeout(()=>{
      if (popupWindow) {
        popupWindow.close()
      }
    },5000)
  }

  function updateRoom() {
    window.location.reload();
  }

</script>
</body>
</html>