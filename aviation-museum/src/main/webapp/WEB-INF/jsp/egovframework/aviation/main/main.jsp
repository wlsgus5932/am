<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
main
 <c:choose>
    <c:when test="${null eq session}">
		<button onclick="location.href='<c:url value='/login.do' />' ">login</button>
    </c:when>
    <c:otherwise>
    	<button onclick="location.href='<c:url value='/logout.do' />' ">logout</button>
    </c:otherwise>
</c:choose>
		<button onclick="location.href='<c:url value='/metadata/add.do' />' ">add</button>
</body>
</html>