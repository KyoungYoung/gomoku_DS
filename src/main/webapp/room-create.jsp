<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <title>방 생성</title>
</head>
<body>
<h2>새로운 방 만들기</h2>

<%--/room-create--%>
<form id="roomCreateForm" action="/createRoom" method="POST">
    <label for="roomTitle">방 이름:</label>
    <input type="text" id="roomTitle" name="title" required>
    <button type="submit">새 방 만들기</button>
</form>


<script>

</script>
</body>
</html>