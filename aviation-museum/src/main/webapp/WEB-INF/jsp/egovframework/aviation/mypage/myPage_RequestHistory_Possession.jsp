<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    		<option value="">전체</option>    
    	<c:forEach var="getPosSessionList" items="${getPosSessionList}">
    		<option value="${getPosSessionList.possession_nm}">${getPosSessionList.possession_nm}</option>        
    	</c:forEach>                     
