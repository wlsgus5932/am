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

	String file_name = "작업내역정보목록";
	
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
		<table border="thin solid gray" summary="" class="sheetListA" style="width:150%">
			<caption>관심자료목록</caption>
			<colgroup>
				<col style="width:5%" />
				<col style="width:5%" />
				<col />
				<col style="width:5%" />
				<col style="width:5%" />
				<col style="width:5%" />
			</colgroup>
                <thead>
                     <tr class="tr_bgc">
                         <th>번호</th>
                         <th>기관이름</th>
                         <th>소장구분이름</th>
                         <th>자료명칭</th>
                         <th>자료번호</th>
                         <th>세부번호</th>
                         <th>작업날짜</th>
                     </tr>
                 </thead>
			<tbody>
				<!-- for -->
				<c:choose>
					<c:when test="${workHistoryList.size() > 0 }">
							<c:forEach var="workHistoryList" items="${workHistoryList}">
                                <tr>
                                    <th scope="row">${perPageNum + 1 - workHistoryList.rnum}</th>
                                    <td>
                                     ${workHistoryList.org_nm}
                                    </td>
                                    <td>
                                      ${workHistoryList.possession_nm}
                                     </td>
                                     <td>
                                      ${workHistoryList.item_nm}
                                     </td>
                                     <td>
                                      ${workHistoryList.item_no}
                                     </td>
                                     <td>
                                      ${workHistoryList.item_detail_no}
                                     </td>
                                     <td>
                                      ${workHistoryList.reg_date}
                                     </td>	                                                                         
                                </tr>
							</c:forEach> 
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="6">검색된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				<!-- //for -->
			</tbody>
		</table>
		<!-- //list -->
	</body>
</html>
