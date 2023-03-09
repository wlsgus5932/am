<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<div>
            ※총 ${perPageNum}건의 소장품이 검색되었습니다.
            <!-- <button>전체삭제</button> -->
            
          </div>
          <!--  -->
          <div class="card-body">
            <div class="table-responsive" style="overflow-y: scroll; height: 300px; padding: 4px; border: 1 solid #000000">
              <table class="table mb-0">
                <thead>
                  <tr class="tr_bgc">
                    <th><input type="checkbox" id="deletionAllCheckbox" onclick="deletionCheckAll()"/></th>
                    <th>번호</th>
                    <th>소장구분</th>
                    <th>소장품번호</th>
                    <th>세부번호</th>
                    <th>명칭</th>
                  </tr>
                </thead>
                <tbody id="deletion-tbody">
                <c:choose>
					<c:when test="${deletionList.size() > 0 }">
						<c:forEach var="list" items="${deletionList}">
	                              <tr>
				                    <td><input type="checkbox" name="item_idx" id="deletionCheckbox" value="${list.item_idx}"/></td>
				                    <td>${list.rownum}</td>
				                    <td>${list.org_nm } - ${list.possession_nm}</td>
				                    <td>${list.item_no} </td>
				                    <td>${list.item_detail_no} </td>
				                    <td>${list.item_nm}</td>
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
            </div>
          </div>
          <ul class="btn-group pagination">
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
					</ul> 
          <div class="" style="width: 100%; border-top: 1px solid">
            <textarea style="width: 100%" type="text" name="erasure_reason" id="erasure_reason" value="잘못 입력된 자료 정보 입니다. 삭제 신청합니다." placeholder="잘못 입력된 자료 정보 입니다. 삭제 신청합니다."></textarea>
          </div>