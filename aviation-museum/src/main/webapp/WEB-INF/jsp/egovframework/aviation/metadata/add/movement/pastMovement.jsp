<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
									<table class="table mb-0">
                                        <thead>
                                            <tr class="tr_bgc">
                                                <th>번호</th>
                                                <th>과거이동처</th>
                                                <th>현수량</th>
                                                <th>입력값선택</th>
                                            </tr>
                                        </thead>
                                        <tbody>
												<c:choose>
														<c:when test="${movementList.size() > 0 }">
													               <c:forEach var="list" items="${movementList}" varStatus="status">
													               			<td>${list.rownum }</td>
													               			<td>${list.storage_in} - ${list.storage_out}</td>
													               			<td>${list.movement_qty}</td>
																				<td>
																					<select class="form-select st_select" onchange="change_Inout(${list.movement_idx})">
																						<option selected value="">선택</option>
																						<option value="IN">보관처</option>
																						<option value="OUT">반입처</option>
																					</select>
																				</td>
																			</tr>
																      </c:forEach>
													       </c:when>
																	<c:otherwise>
																			<tr>
																				<td colspan="4">검색된 결과가 없습니다.</td>
																			</tr>
																	</c:otherwise>
												</c:choose>	
												
												</tbody>
                                    	</table>

					<%-- <ul class="btn-group pagination">
					    <c:if test="${pageMaker.prev }">
					    <li>
					        <a href='javascript:;' onclick="goPage('${pageMaker.startPage-1 }');"><i class="fa fa-chevron-left"></i></a>
					    </li>
					    </c:if>
					    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
					    <li>
					        <a href='javascript:;' onclick="goPage('${pageNum}');"><i class="fa">${pageNum }</i></a>
					    </li>
					    </c:forEach>
					    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
					    <li>
					        <a href="javascript:;" onclick="goPage('${pageMaker.endPage+1 }');"><i class="fa fa-chevron-right"></i></a>
					    </li>
					    </c:if>
					</ul>  --%>