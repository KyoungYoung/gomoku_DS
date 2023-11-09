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
<h2>방이 생성되었습니다.</h2>
<button onclick="closeToRoom();">닫기</button>

<%--<div id="roomList">--%>
<%--  <c:forEach items="${rooms}" var="room">--%>
<%--    <div class="room">--%>
<%--      <a href="OmokAndChat.jsp?roomName=${room.name}&chatId=${userNickname}">--%>
<%--        <p>방 이름: ${room.name}</p>--%>
<%--        <p>인원 제한: ${room.capacity}</p>--%>
<%--      </a>--%>
<%--    </div>--%>
<%--  </c:forEach>--%>
<%--</div>--%>

<script>
  function closeToRoom() {
    window.opener.location.reload();
    window.close();
  }
  
</script>

</body>
</html>
