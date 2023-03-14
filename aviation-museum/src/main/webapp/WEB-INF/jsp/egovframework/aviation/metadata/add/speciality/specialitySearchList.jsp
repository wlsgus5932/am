<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
				
					<table class="table mb-0">
                            <thead>
                                <tr class="tr_bgc">
                                    <th>번호</th>
                                    <th>작성자</th>
                                    <th>일자</th>
                                    <th>구분</th>
                                    <th>제목</th>
                                    <th>첨부파일</th>
                                    <th>저작권자</th>
                                    <th>수정</th>
                                    <th>삭제</th>
                                </tr>
                            </thead>
                            <tbody id="speciality-tbody">
                            	<c:forEach var="list" items="${specialityList}" varStatus="status">
	                            <tr>
									<th scope="row">${list.rownum}</th>					   
									<td>${list.reg_user}</td>
									<td>${list.reg_date}</td>
									<td>${list.speciality_nm}</td>
									<td>${list.title}</td>
									<td>
										<a href="${list.file_path}${list.file_nm}">${list.file_nm}</a>
									</td>
									<td>${list.copyright}</td>
									<td><button id="modify-speciality-btn" type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_wh" data-bs-toggle="modal" data-bs-target=".bs-example-modal-xl" onclick="modifySpeciality(${list.speciality_idx})">수정</button></td>
									<td><button id="delete-speciality-btn" type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_wh" idx="${list.speciality_idx}" file_path="${list.file_path}" file_nm="${list.file_nm}" onclick="deleteSpeciality(this)">삭제</button></td>
									
								</tr>
								</c:forEach>
							</tbody>
                        </table>
                        <ul class="btn-group pagination">
					    	<c:if test="${pageMaker.prev }">
							    <li>
							        <a href='javascript:;' onclick="goSpecialitySearchPage('${pageMaker.startPage-1 }');"><i class="fa fa-chevron-left"></i></a>
							    </li>
							    </c:if>
							    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
							    <li>
							        <a href='javascript:;' onclick="goSpecialitySearchPage('${pageNum}');"><i class="fa">${pageNum }</i></a>
							    </li>
							    </c:forEach>
							    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
							    <li>
							        <a href="javascript:;" onclick="goSpecialitySearchPage('${pageMaker.endPage+1 }');"><i class="fa fa-chevron-right"></i></a>
							    </li>
						    </c:if>
						</ul> 