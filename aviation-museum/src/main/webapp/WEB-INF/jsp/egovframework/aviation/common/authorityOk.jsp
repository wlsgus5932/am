<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"         uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NoPermission</title>
</head>
<body>
<script type="text/javascript">
	alert("${authorityOk}");
	location.href="<c:url value="${before_address}"/>";
</script>
</body>
</html>