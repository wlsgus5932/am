<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
const submitLogin = () => {
	let form = document.form;
	form.submit();
}

</script>
<body>
<form action="/login.do" method="post" name="form">
	id: <input type="text" name="member_id"/> <br/>
	pw: <input type="text" name="member_pw"/> <br/>
	<button type="button" onClick="submitLogin()">login</button>
</form>

</body>
</html>