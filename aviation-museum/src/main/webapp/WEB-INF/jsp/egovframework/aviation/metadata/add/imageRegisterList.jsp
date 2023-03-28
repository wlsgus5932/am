<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
                  
				<table class="table mb-0">
                        <thead>
                            <tr class="tr_bgc">
                                <th colspan="1"><input type="checkbox" onclick="imageAllCheck(this)"></th>
                                <th>번호</th>
                                <th>소장구분</th>
                                <th>소장품번호</th>
                                <th>세부번호</th>
                                <th>이미지명</th>
                                <th>파일경로</th>
                                <th>대국민서비스</th>
                                <th>기능</th>
                            </tr>
                        </thead>
                        <tbody>
						<c:choose>
							<c:when test="${imageList.size() > 0 }">
	                          	<c:forEach var="list" items="${imageList}" varStatus="status">
				                   <img style="display:none;" src="<c:url value="images/thumbnails/${list.thumbnail_nm}"/>" alt="이미지">
					                    
				 					<tr>
				 						<td colspan="1"><input type="checkbox" name="imageUpdateListCheckbox" id="imageCheckbox${status.index}" value="${list.image_idx}" value2="${list.image_path }"></td>
				                        <td>${list.rownum}</td>
				                        <td>${list.org_nm} - ${list.possession_nm}</td>
				                        <td>${list.item_no}</td>
				                        <td>${list.item_detail_no}</td>
				                        <td>${list.image_nm }</td>
				                        <td>${list.image_path }</td>
				                        <td><input type="checkbox" id="public_service${status.index}" name="public_service" value="${list.image_idx}" onclick="publicRepCheck(this)" ${list.public_service == "Y" ? "CHECKED" : ""}/></td>
				                        <%-- <td><button type="button" onclick="gallery.view(${status.index})">원본보기</button></td> --%>
				                        <td><button class="custom_btn btn_edit btn_ori_view" type="button" onclick="gallery.view(${status.index})">원본보기</button></td>
				                   </tr>
				                   </c:forEach>
					             </ul>
	                         </c:when>
							<c:otherwise>
									<tr>
				 						<td colspan="9">조회결과가 없습니다.</td>
				                   </tr>
								</c:otherwise>
							</c:choose>
							</tbody>
                    </table>
                    <div>
					<ul class="btn-group pagination">
					    <c:if test="${pageMaker.prev }">
					    <li>
					        <a href='javascript:;' onclick="imageRegistergoPage('${pageMaker.startPage-1 }');"><i class="fa fa-chevron-left"></i></a>
					    </li>
					    </c:if>
					    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
					    <li>
					        <a href='javascript:;' onclick="imageRegistergoPage('${pageNum}');"><i class="fa">${pageNum }</i></a>
					    </li>
					    </c:forEach>
					    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
					    <li>
					        <a href="javascript:;" onclick="imageRegistergoPage('${pageMaker.endPage+1 }');"><i class="fa fa-chevron-right"></i></a>
					    </li>
					    </c:if>
					</ul> 
					</div>