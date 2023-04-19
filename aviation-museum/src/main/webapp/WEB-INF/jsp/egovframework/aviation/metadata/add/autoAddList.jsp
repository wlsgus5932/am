<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
      				<c:forEach var="list" items="${excelList}" varStatus="status">
      					<tr>
	      					<c:forEach var="val" items="${excelList[status.index]}" varStatus="stat">
      							<c:set var="keyVal" value="${val.key}"/>
	      						<td>${val }</td>
	      					</c:forEach>
	      				</tr>
      				</c:forEach>
							<!-- <tr>
                                  <td><input type="checkbox" name="" id=""></td>
                                  <td>1</td>
                                  <td>
                                    더미
                                  </td>
                                  <td>
                                    국립항공박물관 - ㅇㅇ - ㅇㅇ
                                   </td>
                                   <td>
                                    항공역사:물품:기체(더미)
                                   </td>
                                   <td>
                                    AHA01A001
                                   </td>
                                   <td>
                                    0000
                                   </td>
                                   <td>
                                    0
                                   </td>
                                   <td>
                                    -
                                   </td>
                                   <td>
                                    -
                                   </td>
                                   <td>
                                    -
                                   </td>
                                   <td>
                                    정상
                                   </td>
                                   <td>
                                    <button>수정</button>
                                   </td>
                              </tr> -->