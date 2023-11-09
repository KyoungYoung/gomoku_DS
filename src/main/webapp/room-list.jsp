<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.socketdemo.Room" %>


<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>방 리스트</title>
  <link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
<%--  <style>--%>
<%--    *{--%>
<%--      background-color: oldlace;--%>
<%--      text-align: center;--%>
<%--    }--%>
<%--    #container{--%>
<%--      width: 1440px;--%>
<%--      height: 1024px;--%>
<%--      margin: 4px auto;--%>

<%--    }--%>
<%--    #header{--%>

<%--      height: 170px;--%>
<%--      margin: 0 auto;--%>
<%--      text-align: center;--%>
<%--      font-size: 10px;--%>
<%--      color: orange;--%>
<%--      font-family: 'East Sea Dokdo', sans-serif;--%>
<%--      background-color: oldlace;--%>
<%--    }--%>
<%--    p{--%>
<%--      font-size: 40px;--%>
<%--      color: orange;--%>
<%--      margin-top: 0;--%>
<%--      margin-bottom: 0;--%>
<%--      text-align: center;--%>
<%--      font-family: 'East Sea Dokdo', sans-serif;--%>
<%--    }--%>
<%--    a{--%>
<%--      text-decoration-line: none;--%>
<%--    }--%>

<%--    #roomTitle{--%>
<%--      width: 200px;--%>
<%--      height: 35px;--%>
<%--      color: white;--%>
<%--      background-color: orange;--%>
<%--      border: 0px orange;--%>
<%--      border-radius: 100px;--%>
<%--      text-align: left;--%>
<%--    }--%>
<%--    #idbox{--%>
<%--      width: 200px;--%>
<%--      height: 35px;--%>
<%--      color: white;--%>
<%--      background-color: orange;--%>
<%--      border: 0px orange;--%>
<%--      border-radius: 100px;--%>
<%--      text-align: center;--%>
<%--    }--%>
<%--    h1{--%>
<%--      font-family: 'East Sea Dokdo', sans-serif;--%>
<%--      font-size: 80px;--%>
<%--      text-align: center;--%>
<%--    }--%>
<%--    #contents{--%>
<%--      width: 100%;--%>
<%--      height: 900px;--%>
<%--      margin: 0 auto;--%>
<%--      background-color: oldlace;--%>
<%--      float: left;--%>
<%--    }--%>
<%--    #roomList{--%>
<%--      width: 400px;--%>
<%--      height: 150px;--%>
<%--      border: 5px solid orange;--%>
<%--      box-shadow : 10px 10px  orange;--%>
<%--      border-radius: 80px;--%>
<%--      float: left;--%>
<%--      margin-left: 35px;--%>
<%--      margin-top: 15px;--%>
<%--    }--%>
<%--    #rmname{--%>
<%--      font-size: 70px;--%>
<%--      font-family: 'East Sea Dokdo', sans-serif;--%>
<%--      text-align: center;--%>
<%--      color:orange;--%>
<%--    }--%>

<%--    .makeroombtn{--%>
<%--      width: 200px;--%>
<%--      height: 50px;--%>
<%--      text-align: center;--%>
<%--      font-size: 40px;--%>
<%--      font-weight: 300;--%>
<%--      border: 0px solid black;--%>
<%--      border-radius: 100px;--%>
<%--      background-image:url(img/monarch-2873979_1280.png);--%>
<%--      color:white;--%>
<%--      font-family: 'East Sea Dokdo', sans-serif;--%>
<%--    }--%>

<%--  </style>--%>
</head>
<body>
<%
  List<Room> rooms = (List<Room>) request.getAttribute("rooms");
  String chatId = request.getParameter("chatId");
  session.setAttribute("userNickname",chatId);

%>

<div id="container">
  <header id="header"><h1>모두의 오목</h1></header>
</div>

<section id="contents">
  <div>
    <p>사용자 닉네임: <%= chatId%></p>
  </div>
  <div>
    <p><button class="makeroombtn" onclick="goToRoom();">방 만들기</button></p>
    <p><button class="makeroombtn" onclick="updateRoom();">새로고침</button></p>
  </div>

  <div id="roomListt">
    <c:forEach items="${rooms}" var="room">
      <div class="room">
        <fieldset id="roomList">
          <a href="OmokAndChat.jsp?roomName=${room.name}&chatId=${userNickname}">
            <p>방 이름: ${room.name}</p>
            <p>인원 제한: ${room.capacity}</p>
          </a>
        </fieldset>
      </div>
    </c:forEach>
  </div>
</section>



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