<%@ page contentType="application/vnd.ms-excel;charset=UTF-8" %>
<%----------------------------------------------------------------------------------------------
* 파일명 : photoBuy_list.jsp
* 생성일 : 2015. 12. 29
* 작성자 : 이 진 건
* 설   명 :  사료검색 리스트 AJAX
* ==============================================
* 변경이력:
* DATE				AUTHOR			DESCRIPTION
* ---------------------------------------------------------------------------
* 20150924			이진건				최초작성
 ----------------------------------------------------------------------------------------------%>
<%@page import="java.net.URLEncoder" %>
<%@page import="egovframework.aviation.mypage.DateUtils" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>    
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>    
<%@ taglib prefix="c" 		   uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn"       uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt"     uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <%@ taglib prefix="tags"    tagdir="/WEB-INF/tags" %> --%>

<%-- <%@ taglib uri="assets/tld/function_dateUtils.tld" prefix="dateUtils" %> --%>

<% 

	String file_name = "이미지정보";
	
	file_name = URLEncoder.encode(file_name, "UTF-8");
	
	if( !(request.getHeader("User-Agent").indexOf("MSIE") > -1) ){
		file_name = new String(file_name.getBytes("UTF-8"), "ISO-8859-1");
	}
	
    response.setHeader("Content-Disposition", "attachment; filename=\""+ file_name + "_" + DateUtils.getTime("yyyyMMddHHmmss") + ".xls\""); 
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Cache-Control", "no-cache");
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="application/vnd.ms-excel; charset=UTF-8">
<%-- 		<link rel="stylesheet" type="text/css" href="<spring:eval expression="@archive['domain.admin']" />static/assets/admin-tools/admin-forms/css/excel.css"></link> --%>
	</head>
	<body>
		<!-- list -->
		<table summary="" class="sheetListA" style="width:150%;" border="thin solid gray">
                <thead>
                            <tr class="tr_bgc">
                                <th>이미지명</th>
                                <th>파일정보</th>
                                <th>등록일</th>
                                <th>등록자</th>
                                <th>파일경로</th>
                                <th>대표이미지</th>
                                <th>대국민서비스</th>
                            </tr>
                        </thead>
                        <tbody>
						<c:choose>
							<c:when test="${imageList.size() > 0 }">
	                          	<c:forEach var="list" items="${imageList}" varStatus="status">
				 					<tr>
				                        <td>${list.image_nm}</td>
				                        <td>${list.image_width} x ${list.image_height}</td>
				                        <td>${list.reg_date}</td>
				                        <td>${list.reg_user }</td>
				                        <td>${list.image_path}</td>
				                        <td>${list.rep_image == "Y" ? "사용" : "비사용"}</td>
				                        <td>${list.public_service == "Y" ? "사용" : "비사용"}</td>
				                   </tr>
				                   </c:forEach>
	                         </c:when>
							<c:otherwise>
									<tr>
										<td colspan="6">검색된 결과가 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
		</table>
		<!-- //list -->
	</body>
</html>
