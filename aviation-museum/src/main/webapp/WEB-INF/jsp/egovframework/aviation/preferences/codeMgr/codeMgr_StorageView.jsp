<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

                  <div class="user_control_card_wrap card">
                    <div class="table-responsive">
                      <table class="table mb-0">
                        <thead>
                          <tr class="tr_bgc">
                            <th colspan="7">보관처 코드</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr class="setting_thead">
                            <th>번호</th>
                            <th>명칭</th>
                            <th>수정일</th>
                            <th>수정자</th>
                            <th>사용여부</th>
                            <th>수정</th>
                            <th>순서</th>
                          </tr>
                          <c:forEach var="storageCodeViewList" items="${storageCodeVO.storageCodeViewList }" varStatus="varStatus">
	                          <tr>
	                            <td>${varStatus.count }</td>
	                            <td>${storageCodeViewList.storage_nm }</td>
	                            <td>${storageCodeViewList.mod_user }</td>
	                            <td>${storageCodeViewList.mod_date }</td>
	                            <td>
	                            	<c:choose>
			                            <c:when test="${storageCodeViewList.enabled != 'Y'}">  
	                            			<button class="custom_btn btn_preferences_user_enabled">미사용</button>
	                          			</c:when>
	                          			<c:otherwise>
	                          				<button class="custom_btn btn_preferences_user_enabled">사용</button>
	                          			</c:otherwise>
	                          		</c:choose>
	                            </td>
	                            <td><button class="custom_btn btn_edit" type="button" data-bs-toggle="modal" data-bs-target="#code_modify_modal-2" onclick="modSubFormBtn('storage', '${storageCodeViewList.storage_code_idx}', '${storageCodeViewList.storage_nm}', '${storageCodeViewList.enabled}')">수정</button></td>
	                            <td>
	                              	<c:choose>
			                            <c:when test="${varStatus.first}">  
			                             	<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(0,${storageCodeViewList.seq},'up','storage')">▲</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(${storageCodeViewList.storage_code_idx},${storageCodeViewList.seq},'up','storage')">▲</button>
		                            	</c:otherwise>
	                            	</c:choose>
		                              
		                            <c:choose>
			                            <c:when test="${varStatus.last}">  
			                              <button class="custom_btn btn_arrow" type="button" onClick="updateSeq(0,${storageCodeViewList.seq},'down','storage')">▼</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(${storageCodeViewList.storage_code_idx},${storageCodeViewList.seq},'down','storage')">▼</button>
		                            	</c:otherwise>
	                            	</c:choose>
	                            </td>
	                          </tr>
                          </c:forEach>
                        </tbody>
                      </table>
                    </div>
                  </div>
                  <button class="custom_btn btn_code_upload" data-bs-toggle="modal" data-bs-target="#code_insert_modal-1" onclick="insSubFormBtn('storage')">코드등록</button>

