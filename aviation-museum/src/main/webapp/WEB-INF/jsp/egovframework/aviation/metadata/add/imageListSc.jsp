<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


					<table class="table mb-0">
                        <thead>
                            <tr class="tr_bgc">
                                <th style="width: 5%;">선택</th>
                                <th>번호</th>
                                <th>이미지명</th>
                                <th style="width: 10%;">파일정보</th>
                                <th>파일경로</th>
                                <th style="width: 10%;">대표이미지</th>
                                <th style="width: 10%;">대국민서비스</th>
                                <th style="width: 10%;">기능</th>
                            </tr>
                        </thead>
                        <tbody id="image_tbody">
						<c:choose>
							<c:when test="${imageList.size() > 0 }">
	                          	<c:forEach var="list" items="${imageList}" varStatus="status">
				 					<tr>
				 						<td><input type="checkbox" name="imageListCheckbox" id="imageCheckbox${status.index}" value="${list.image_idx}" onclick="imageCheckboxChecked(this)"></td>
				                        <td>${list.rownum}</td>
				                        <td>${list.image_nm}</td>
				                        <td>${list.image_width} x ${list.image_height}</td>
				                        <td>${list.image_path}</td>
				                        <td><input type="checkbox" id="req_image${status.index}" value="${list.image_idx}" colunmName="rep_image" onclick="changeRep(this)" ${list.rep_image == "Y" ? "CHECKED" : ""} disabled/></td>
				                        <td>
				                       		<input type="checkbox" id="public_service${status.index}" value="${list.image_idx}" colunmName="public_service" onclick="publicRepCheck(this)" ${list.public_service == "Y" ? "CHECKED" : ""} disabled>
				                        </td>
				                        <td>
				                       		<button class="custom_btn btn_edit btn_ori_view" type="button" onclick="gallery.view(${status.index})">원본보기</button>
				                        </td>
				                   </tr>
				                   </c:forEach>
	                         </c:when>
							<c:otherwise>
								</c:otherwise>
							</c:choose>
							</tbody>
                    </table>
                    <div>
					<ul class="btn-group pagination">
					    <c:if test="${pageMaker.prev }">
					    <li class="page-item">
					        <a class="page-link" href='javascript:;' onclick="goPage('${pageMaker.startPage-1 }');"><i class="fa fa-chevron-left"></i></a>
					    </li>
					    </c:if>
					    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
					    <li class="page-item">
					        <a class="page-link" href='javascript:;' onclick="goPage('${pageNum}');"><i class="fa">${pageNum }</i></a>
					    </li>
					    </c:forEach>
					    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
					    <li class="page-item">
					        <a class="page-link" href="javascript:;" onclick="goPage('${pageMaker.endPage+1 }');"><i class="fa fa-chevron-right"></i></a>
					    </li>
					    </c:if>
					</ul> 
					</div>