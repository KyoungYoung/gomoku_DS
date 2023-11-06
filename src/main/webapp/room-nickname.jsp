<%--
  Created by IntelliJ IDEA.
  User: kky
  Date: 2023/11/07
  Time: 2:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/createRoom" method="POST">
    <label for="chatId">사용자 닉네임:</label>
    <input type="text" id="chatId" name="userNickname" required>
    <button type="submit">게임 들어가기</button>
</form>
</body>
</html>
