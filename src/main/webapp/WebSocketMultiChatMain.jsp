<%--
  Created by IntelliJ IDEA.
  User: kky
  Date: 2023/11/01
  Time: 1:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>웹소켓 채팅</title>
</head>
<body>
<script>
    function chatWinOpen(){
        let id = document.getElementById("chatId");
        if (id.value == "") {
            alert("대화명을 입력 후 채팅창을 열어주세요");
            id.focus();
            return;
        }
        window.open("WebSocketChatWindow.jsp?chatId=" + id.value, "","width=320,height=400");
        id.value = "";
    }
</script>
<h2>웹 소켓 채팅 - 대화명 적용해서 채팅창 띄워주기</h2>
대화명  : <input type="text" id="chatId" />
<button onclick="chatWinOpen();">채팅참여</button>
</body>
</html>
