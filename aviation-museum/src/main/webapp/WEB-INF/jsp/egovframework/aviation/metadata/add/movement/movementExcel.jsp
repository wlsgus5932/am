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

	String file_name = "이동사항정보";
	
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
                                                <th>번호</th>
				                                  <th>이동일자</th>
				                                  <th>보관구분</th>
				                                  <th>보관처</th>
				                                  <th>반입처</th>
				                                  <th>등록일</th>
				                                  <th>등록자</th>
				                                  <th>이동수량</th>
				                                  <th>현수량</th>
				                                  <th>비고</th>
				                                  <th>격납요청자</th>
                                            </tr>
                                        </thead>
                                        <tbody>
												<c:choose>
														<c:when test="${movementList.size() > 0 }">
													               <c:forEach var="list" items="${movementList}" varStatus="status">
																			<tr>
																				 <td scope="row">${list.rownum}</td>
																				 <td>${list.movement_date}</td>
																				 <td>${list.storage_type1_code_idx}</td>
																				 <td>${list.storage_in}</td>
																				 <td>${list.storage_out}</td>
																				 <td>${list.reg_date}</td>
																				 <td>${list.reg_user}</td>
																				 <td>${list.movement_qty}</td>
																				 <td>${list.current_qty}</td>
																				 <td>${list.remark}</td>
																				 <td>${list.requester}</td>
																			</tr>
																      </c:forEach>
													       </c:when>
																	<c:otherwise>
																			<tr>
																				<td colspan="11">검색된 결과가 없습니다.</td>
																			</tr>
																	</c:otherwise>
												</c:choose>	
												
												</tbody>
                                    	</table>
		<!-- //list -->
	</body>
</html>
