<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 	
 	<c:choose>
   		<c:when test="${getPosSessionList.size() != 0}">
	    	<c:forEach var="getPosSessionList" items="${getPosSessionList}">
	    		<option value="${getPosSessionList.possession_nm}">${getPosSessionList.possession_nm}</option>        
	    	</c:forEach>               
	    </c:when> 
	    <c:otherwise>
	  		    <option value="">선택</option> 
	    </c:otherwise>     
	</c:choose>