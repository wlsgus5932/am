<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

								<table class="table mb-0">
                                        <thead>
                                            <tr class="tr_bgc">
                                                <th>번호</th>
				                                  <th>이동일자</th>
				                                  <th>보관구분</th>
				                                  <th>보관처</th>
				                                  <th>반입처</th>
				                                  <th>이동수량</th>
				                                  <th>현수량</th>
				                                  <th>비고</th>
				                                  <th>격납요청자</th>
				                                  <th>수정</th>
				                                  <th>삭제</th>
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
																				 <td>${list.movement_qty}</td>
																				 <td>${list.current_qty}</td>
																				 <td>${list.remark}</td>
																				 <td>${list.requester}</td>
																				 <td>
																				 <button id="modify-movement-btn" type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_wh" data-bs-toggle="modal" data-bs-target="#myModal" value="${list.movement_idx}" onclick="btn_control(1), getMovementData(this)">수정</button>
																				 </td>
																				 <td><button id="delete-movement-btn" type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_wh" value="${list.movement_idx}" onclick="deleteMovement(this)">삭제</button></td>
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

					<ul class="btn-group pagination">
					    <c:if test="${pageMaker.prev }">
					    <li>
					        <a href='javascript:;' onclick="movementGoPage('${pageMaker.startPage-1 }');"><i class="fa fa-chevron-left"></i></a>
					    </li>
					    </c:if>
					    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
					    <li>
					        <a href='javascript:;' onclick="movementGoPage('${pageNum}');"><i class="fa">${pageNum }</i></a>
					    </li>
					    </c:forEach>
					    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
					    <li>
					        <a href="javascript:;" onclick="movementGoPage('${pageMaker.endPage+1 }');"><i class="fa fa-chevron-right"></i></a>
					    </li>
					    </c:if>
					</ul> 