<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<html>
<head>
    <title>오목 게임 및 채팅</title>
    <style>
        *{
            background-color: oldlace;
            text-align: center;
        }
        #container{
            width: 1440px;
            height: 1024px;
            margin: 4px auto;
            background-color: oldlace;
        }
        .omok-board{
            width: 600px;
            margin-left: 120px;
            margin-top: 20px;
            display: grid;
            grid-template-columns: repeat(19, 30px);
            grid-template-rows: repeat(19, 30px);
        }
        .omok-cell {
            width: 30px;
            height: 30px;
            border: 1px solid #000;
            display: flex;
            justify-content: center;
            align-items: center;
            border: 1px solid orange;
            font-size: 18px;
            color: #000;
        }
        .header{
            width: 100%;
            height: 140px;
            margin: 0 auto;
            text-align: center;
            font-size: 10px;
            color: orange;
            font-family: 'East Sea Dokdo', sans-serif;
        }

        h1{
            font-family: 'East Sea Dokdo', sans-serif;
            font-size: 80px;
            color: orange;
        }
        h3{
            font-family: 'East Sea Dokdo', sans-serif;
            font-size: 35px;
            text-align: center;
            color: orange;
        }
        #left-sidebar{
            width: 18%;
            height: 700px;
            text-align: center;
            float: left;
            margin-top: 10px;
        }
        #contents{
            width: 60%;
            height: 700px;
            margin-left: 0 auto;
            border: 10px solid orange;
            border-radius:100px;
            background-color: oldlace;
            float: left;
        }
        #right-sidebar{
            width: 18%;
            height: 700px;
            text-align: center;
            background-color: oldlace;
            float: right;
            margin-top: 10px;
        }
        #footer{
            width: 100%;
            height: 500px;

            margin:0 auto;
            background-color: oldlace;
            clear: left;
        }

        #chatWindow {
            border: 5px solid orange;
            border-radius:20px;
            width: 1200px;
            height: 310px;
            overflow: scroll;
            padding: 7px;
            margin:0 auto;

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
            width: 100%;
            height: 50%;
            font-size:1rem;
            font-family: 'East Sea Dokdo', sans-serif;
            border: 1px solid orange;
            background-color: orange;
            text-align: center;
            margin-top: 50%;
            border-radius: 30px;

        }

        #chatId {
            width: 100px;
            height: 100%;
            border: none;
            border-radius: 100px;
            color:orange;
            font-size:2rem;
            justify-items: center;
            justify-content: center;
            text-align: left;
            font-family: 'East Sea Dokdo', sans-serif;
        }
        #sendbox{
            margin:0 auto;
            text-align: center;
        }
        .myMsg {
            text-align: right;
            font-size:40px;
            color:black;
            font-family:'Orbit', sans-serif;
        }
        #chatMessage {
            width: 500px;
            height: 50px;
            border: 2px solid orange;
            margin:0 auto;
        }
        #sendBtn {
            width: 120px;
            height: 50px;
            top: 2px;
            left: -2px;
            border: 0px solid orange;
            color:orange;
            font-size:40px;
            font-family: 'East Sea Dokdo', sans-serif;


        }
        #playbtn{
            margin-top: 30%;
            width: 90px;
            height: 50px;
            text-align: center;
            font-size: 1rem;
            font-weight: 300;
            border: 0px solid black;
            border-radius: 100px;
            background-image:url(img/monarch-2873979_1280.png);
            color:white;
            font-family: 'East Sea Dokdo', sans-serif;
        }
        #chatName{
            display: flex;
            justify-content: center;
        }

        #chatName > div:first-child{
            display: flex;
            margin-right: 20px;
        }

    </style>
</head>
<body>
<div id="header">
    <h1>모두의 오목</h1>
</div>

<div id="container">
    <aside id="left-sidebar">
        <img src="/img/white.png" width="150px height= 400px">
        <h2>백돌 님</h2>
    </aside>
    <section id="contents">

        <!-- 오목 게임 보드 -->
        <div class="omok-board" id="omok-board">
            <!-- 19x19 게임 보드를 생성합니다. --> </div>
        <p> <div id="currentPlayerMessage" style="font-size: 40px"> </div></p>
    </section>
    <aside id="right-sidebar">
        <img src="/img/black.png" width="150px height= 400px">
        <h2>흑돌 님</h2>
    </aside>

    <footer id="footer">
        <div>
            <div id="chatName">
                <div>
                    <h3>유저 :  </h3>
                    <input type="text" id="chatId" value="${param.chatId}" readonly />
                </div>
                <div>
                <button id="playbtn" onclick="disconnect();">채팅종료</button>
                </div>
            </div>
            <!-- 채팅 창 -->
            <div id="chatWindow">
                <!-- 채팅 메시지를 표시하는 영역 -->
            </div>
            <div id="sendbox">
                <input type="text" id="chatMessage" onkeyup="enterKey();">
                <button id="sendBtn" onclick="sendMessage();">전송</button>
            </div>
        </div>
    </footer>
<%--<div>--%>
<%--    <!-- 오목 게임 보드 -->--%>
<%--    <div class="omok-board" id="omok-board">--%>
<%--        <!-- 19x19 게임 보드를 생성합니다. -->--%>
<%--    </div>--%>
<%--</div>--%>
<%--<div>--%>
<%--    <div>--%>
<%--        대화명 : <input type="text" id="chatId" value="${param.chatId}" readonly />--%>
<%--        <button id="closeBtn" onclick="disconnect();">채팅종료</button>--%>
<%--    </div>--%>
<%--    <!-- 채팅 창 -->--%>
<%--    <div id="chatWindow">--%>
<%--        <!-- 채팅 메시지를 표시하는 영역 -->--%>

<%--    </div>--%>
<%--    <input type="text" id="chatMessage" onkeyup="enterKey();">--%>
<%--    <button id="sendBtn" onclick="sendMessage();">전송</button>--%>
<%--</div>--%>
<script>

    // 오목 게임 관련 JavaScript 코드

    // 게임 보드 요소에 대한 참조를 가져오고 서버와의 WebSocket 연결을 설정합니다.
    const board = document.getElementById("omok-board");
    const socket = new WebSocket("<%= application.getInitParameter("CHAT_ADDR")%>gomoku/${param.roomName}/${param.chatId}");
    console.log(socket);
    let currentPlayer = "O";
    let nowTurn = "O";
    // 특정 클래스를 가진 div 엘리먼트를 생성하여 19x19 게임 보드를 만듭니다.
    for (let i = 0; i < 19; i++) {
        for (let j = 0; j < 19; j++) {
            const cell = document.createElement('div');
            cell.classList.add('omok-cell');
            cell.dataset.row = i;
            cell.dataset.col = j;
            board.appendChild(cell);
        }
    }

    let gameEnded = false;
    document.addEventListener("DOMContentLoaded", function () {
        // 게임 보드의 모든 셀에 대한 참조를 가져오고 초기 게임 변수를 설정합니다.
        const cellLinks = document.querySelectorAll(".omok-cell");


        // 게임 보드의 각 셀에 클릭 이벤트 리스너를 추가합니다.
        cellLinks.forEach(link => {
            link.addEventListener("click", function (e) {
                e.preventDefault();
                if (gameEnded) {
                    return; // 게임이 종료되었으면 더 이상 움직일 수 없습니다.
                }
                if (currentPlayer === nowTurn){
                    const row = link.dataset.row;
                    const col = link.dataset.col;
                    const stone = currentPlayer;
                    if (nowTurn === "O"){
                        nowTurn = "X";
                    }
                    else{
                        nowTurn = "O";
                    }

                    if (!link.classList.contains("occupied")) {
                        link.classList.add("occupied");
                        link.textContent = currentPlayer;

                        // 선택한 셀의 좌표와 현재 플레이어의 돌을 서버로 보냅니다.
                        sendCoordinateToServer(stone, row, col);
                    }

                }
            });
        });

        function sendCoordinateToServer(stone, row, col) {
            const xhr = new XMLHttpRequest();
            const url = "setStone.do"; // 서블릿 URL

            // GET 요청을 사용하고, URL에 데이터를 추가
            xhr.open("GET", url + "?row=" + row + "&col=" + col + "&stone=" + stone, true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    if (xhr.responseText === "victory") {
                        // 게임에서 승리했다면 사용자에게 알림 표시
                        alert("게임에서 승리했습니다!");

                        const eventData = {
                            event: "end",
                            row: row,
                            col: col,
                            stone: stone
                        }
                        const eventDataStr = JSON.stringify(eventData);
                        socket.send(eventDataStr);
                        gameEnded = true;
                    }
                }
            };

            xhr.send(); // 요청 전송
            // 움직임 데이터를 포함한 JSON 객체를 생성하고 문자열로 서버에 보냅니다.
            const eventData = {
                event: "place_stone",
                row: row,
                col: col,
                stone: stone
            };
            const eventDataStr = JSON.stringify(eventData);
            socket.send(eventDataStr);
        }

    });

    // 서버에서 받은 메시지를 처리합니다.
    socket.onmessage = function (event) {

        const eventData = JSON.parse(event.data);
        if(eventData.event === "end"){

            alert("게임에서 패배했습니다!");
            gameEnded = true;
        }

        // 서버에서 받은 돌 놓기 이벤트를 처리합니다.
        if (eventData.event === "place_stone") {
            const row = eventData.row;
            const col = eventData.col;
            const stone = eventData.stone;
            if (currentPlayer === stone){
                if (stone === "O")
                    currentPlayer = "X";
                else{
                    currentPlayer = "O";
                }
            }
            if (nowTurn === "O"){
                nowTurn = "X";
            }
            else{
                nowTurn = "O";
            }
            const cell = document.querySelector(`[data-row='\${row}'][data-col='\${col}']`);

            if (!cell.classList.contains("occupied")) {
                cell.classList.add("occupied");
                cell.textContent = stone;
            }
        }
        else{

            const sender = eventData.chatId;
            const content = eventData.content;

            if (content.match("/")) {
                if (content.match(("/" + chatId))) {
                    let temp = content.replace(("/" + chatId), " [귓속말] : ");
                    // chatWindow.innerHTML += "<div>" + sender + "" + temp + "</div>";
                }
            } else if(!content.match("/") && content !=null) {
                // 일반대화
                chatWindow.innerHTML += "<div>" + sender + " : " + content + "</div>";
            }
            chatWindow.scrollTop = chatWindow.scrollHeight;
        }


        // 서버가 게임이 이겼음을 알리면 알림을 표시합니다.
        if (eventData.event === "victory") {
            alert("게임에서 승리했습니다!");
            gameEnded = true;
        }
    };



    // 채팅 관련 JavaScript 코드
    let chatWindow, chatMessage, chatId;

    window.onload = () => {
        chatWindow = document.getElementById("chatWindow");
        chatMessage = document.getElementById("chatMessage");
        chatId = document.getElementById("chatId").value;
    }

    function sendMessage() {
        const messageContent = chatMessage.value;
        const message = {
            chatId: chatId,
            content: messageContent
        };

        chatWindow.innerHTML += "<div class='myMsg'> " + messageContent + "</div>";

        // 객체를 JSON 문자열로 변환하여 보냅니다.
        socket.send(JSON.stringify(message));

        chatMessage.value = "";
        chatWindow.scrollTop = chatWindow.scrollHeight;
    }

    function disconnect() {
        socket.close();
        window.location.href = "index.jsp";
    }

    function enterKey() {
        if (event.keyCode == 13) {
            sendMessage();
        }
    }

    // socket.onopen = event => chatWindow.innerHTML += "웹소켓 서버에 연결되었습니다. ";
    socket.onclose = event => {
        console.error("WebSocket 생성에 실패했습니다.");
        alert("방이 꽉차부렀으");
        // chatWindow.innerHTML += "웹소켓 서버가 연결종료되었습니다. ";
        window.location.href = "room-list.jsp?chatId=" + encodeURIComponent(chatId);
    }

    socket.onerror = (event) => {
        window.location.href = "room-list.jsp?chatId=" + encodeURIComponent(chatId);
        chatWindow.innerHTML += "채팅 중 에러가 발생하였습니다.";

    }


</script>

</body>
</html>