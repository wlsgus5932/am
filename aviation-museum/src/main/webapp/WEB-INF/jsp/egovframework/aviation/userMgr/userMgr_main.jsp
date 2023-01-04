<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <script src="<c:url value='/resources/js/jquery.ajax.js'/>" defer></script> --%>
<script type="text/javascript" src=""></script>
<script type="text/javascript">

// $(function() {		
// 	console.log('gdgd');
// 	ajaxCallPost('/usermgr/userListAjax.do', 'userForm', 'user_lists_Area');
// 	console.log('gd');
// });
</script>
</head>
<body>

gdgddgdgd
<%-- ${list } --%>
<div class="user_lists_Area" id="user_lists_Area"></div>

<form id="userForm" name="userForm" method="post">
	<input type="hidden" 	id="umember_id"				name="member_id" 			value="dd" />
	<input type="hidden" 	id="umember_nm" 			name="member_nm" 			value="dd" />
<!-- 	<input type="hidden" 	id="ugroup_idx" 			name="group_idx"	 		value="" /> -->
</form>
</body>
</html>