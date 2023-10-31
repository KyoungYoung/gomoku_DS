<%--
  Created by IntelliJ IDEA.
  User: kky
  Date: 2023/11/01
  Time: 1:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>웹소켓 채팅</title>
</head>
<script>
  let webSocket = new WebSocket("<%= application.getInitParameter("CHAT_ADDR")%>/ChatingServer");
  let chatWindow, chatMessage, chatId;

  window.onload = () => {
    chatWindow = document.getElementById("chatWindow");
    chatMessage = document.getElementById("chatMessage");
    chatId = document.getElementById("chatId").value;
  }

  function sendMessage() {
    chatWindow.innerHTML += "<div class='myMsg'> " + chatMessage.value + "</div>"
    webSocket.send(chatId + '|' + chatMessage.value);
    chatMessage.value = "";
    chatWindow.scrollTop = chatWindow.scrollHeight;
  }

  function disconnect() {
    webSocket.close();
  }

  function enterKey() {
    if (event.keyCode == 13) {
      sendMessage();
    }
  }

  webSocket.onopen = event => chatWindow.innerHTML += "웹소켓 서버에 연결되었습니다. <br/>";
  webSocket.onclose = event => chatWindow.innerHTML += "웹소켓 서버가 연결종료되었습니다. <br/>";

  webSocket.onerror = (event) => {
    alert(event.data);
    chatWindow.innerHTML += "채팅 중 에러가 발생하였습니다. <br/>";

  }
  webSocket.onmessage = (event) => {
    let message = event.data.split("|");
    let sender = message[0];
    let content = message[1];
    if (content != "") {
      if (content.match("/")) {
        if (content.match(("/" + chatId))) {
          let temp = content.replace(("/" + chatId), " [귓속말] : ");
          chatWindow.innerHTML += "<div>" + sender + "" + temp + "</div>";
        }
      }
      else {
        // 일반대화
        chatWindow.innerHTML += "<div>" + sender + " : " + content + "</div>";
      }
      chatWindow.scrollTop = chatWindow.scrollHeight;
    }
  }
</script>
<style>
  #chatWindow {
    border: 1px solid darkblue;
    width: 270px;
    height: 310px;
    overflow: scroll;
    padding: 7px;


  }
  #chatMessage {
    width: 235px;
    height: 30px;
  }

  #sendBtn {
    height: 30px;
    position: relative;
    top: 2px;
    left: -2px;
  }
  #closeBtn {
    margin-bottom: 3px;
    position: relative;
    top: 2px;
    left: -2px;
  }
  #chatId {
    width: 158px;
    height: 24px;
    border: 1px solid darkgray;
    background-color: whitesmoke;
  }
  .myMsg{
    text-align: right;
  }


</style>
<body>
  대화명 : <input type="text" id="chatId" value="${param.chatId}" readonly />
<button id="closeBtn" onclick="disconnect();">채팅종료</button>
<div id="chatWindow"></div>
<div>
  <input type="text" id="chatMessage" onkeyup="enterKey();">
  <button id="sendBtn" onclick="sendMessage();">전송</button>
</div>
</body>
</html>
