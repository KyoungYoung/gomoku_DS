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
  String userNickname = (String) session.getAttribute("userNickname");
%>

<p>사용자 닉네임: <%= userNickname %></p>

<%--<form action="/createRoom" method="POST">--%>
<%--  <label for="roomTitle">방 이름:</label>--%>
<%--  <input type="text" id="roomTitle" name="title" required>--%>
<%--  <button type="submit">새 방 만들기</button>--%>
<%--</form>--%>

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
  function goToRoom() {
    let popupWindow = window.open("/room-create", "_blank", "width=600, height=400");

    // 3초뒤 닫게하기
    // if (popupWindow) {
    //   // 팝업이 열려있을 때만 실행
    //   popupWindow.onload = function () {
    //     // 팝업이 로드되면 3초 후에 부모 창을 리로드하고 팝업을 닫음
    //     setTimeout(function () {
    //       popupWindow.opener.location.reload();
    //       popupWindow.close();
    //     }, 3000);
    //   };
    //
    // }
  }

</script>

</body>
</html>
