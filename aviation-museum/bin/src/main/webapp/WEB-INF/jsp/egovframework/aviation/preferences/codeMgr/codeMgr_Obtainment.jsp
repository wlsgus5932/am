<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
            <!-- 입수정보코드 -->
            <div class="tab-pane" id="code-tap-6" role="tabpanel" style="display:block;">
              <div class="user_control_wrap mb-0">
                <!-- 왼쪽 -->
                <div class="user_control_letf col-xl-6">
                  <div class="user_control_card_wrap card">
                    <div class="table-responsive">
                      <table class="table mb-0">
                        <thead>
                          <tr class="tr_bgc">
                            <th colspan="8">입수연유코드</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr class="setting_thead">
                            <th>명칭</th>
                            <th>코드</th>
                            <th>순서</th>
                            <th>수정일</th>
                            <th>수정자</th>
                            <th>사용여부</th>
                            <th>수정</th>
                            <th>순서</th>
                          </tr>
						  <c:forEach var="obtainmentList" items="${obtainmentList }" varStatus="varStatus">  
	                          <tr>
	                            <td>${obtainmentList.obtainment_nm}</td>
	                            <td></td>
	                            <td>${obtainmentList.seq }</td>
	                            <td>${obtainmentList.mod_date}</td>
	                            <td>${obtainmentList.mod_user}</td>
	                            <td><button>${obtainmentList.enabled}</button></td>
	                            <td><button type="button" data-bs-toggle="modal" data-bs-target="#code_modify_modal-1" onclick="modFormBtn('obtainment', '${obtainmentList.obtainment_code_idx}', '${obtainmentList.obtainment_nm}', '${obtainmentList.enabled}')">수정</button></td>
	                            <td>
	                            	<c:choose>
			                            <c:when test="${varStatus.first}">  
			                             	<button type="button" onClick="updateSeq(0,${obtainmentList.seq},'up','obtainment')">▲</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button type="button" onClick="updateSeq(${obtainmentList.obtainment_code_idx},${obtainmentList.seq},'up','obtainment')">▲</button>
		                            	</c:otherwise>
	                            	</c:choose>
		                              
		                            <c:choose>
			                            <c:when test="${varStatus.last}">  
			                              <button type="button" onClick="updateSeq(0,${obtainmentList.seq},'down','obtainment')">▼</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button type="button" onClick="updateSeq(${obtainmentList.obtainment_code_idx},${obtainmentList.seq},'down','obtainment')">▼</button>
		                            	</c:otherwise>
	                            	</c:choose>
	                            </td>
	                          </tr>
	                       </c:forEach>  
                        </tbody>
                      </table>
                    </div>
                  </div>
                  <button data-bs-toggle="modal" data-bs-target="#code_insert_modal-3-1" onclick="insFormBtn('obtainment')">코드등록</button>
                </div>
                <!-- 오른쪽 -->
                <div class="user_control_right col-xl-6">
                  <div class="user_control_card_wrap card">
                    <div class="table-responsive">
                      <table class="table mb-0">
                        <thead>
                          <tr class="tr_bgc">
                            <th colspan="8">가격단위코드</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr class="setting_thead">
                            <th>명칭</th>
                            <th>코드</th>
                            <th>순서</th>
                            <th>수정일</th>
                            <th>수정자</th>
                            <th>사용여부</th>
                            <th>수정</th>
                            <th>순서</th>
                          </tr>
						  <c:forEach var="priceUnitList" items="${priceUnitList }" varStatus="varStatus">  
	                          <tr>
	                            <td>${priceUnitList.price_unit_nm}</td>
	                            <td></td>
	                            <td>${priceUnitList.seq }</td>
	                            <td>${priceUnitList.mod_date}</td>
	                            <td>${priceUnitList.mod_user}</td>
	                            <td><button>${priceUnitList.enabled}</button></td>
	                            <td><button type="button" data-bs-toggle="modal" data-bs-target="#code_modify_modal-1" onclick="modFormBtn('price_unit', '${priceUnitList.price_unit_code_idx}', '${priceUnitList.price_unit_nm}', '${priceUnitList.enabled}')">수정</button></td>
	                            <td>
	                            	<c:choose>
			                            <c:when test="${varStatus.first}">  
			                             	<button type="button" onClick="updateSeq(0,${priceUnitList.seq},'up','price_unit')">▲</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button type="button" onClick="updateSeq(${priceUnitList.price_unit_code_idx},${priceUnitList.seq},'up','price_unit')">▲</button>
		                            	</c:otherwise>
	                            	</c:choose>
		                              
		                            <c:choose>
			                            <c:when test="${varStatus.last}">  
			                              <button type="button" onClick="updateSeq(0,${priceUnitList.seq},'down','price_unit')">▼</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button type="button" onClick="updateSeq(${priceUnitList.price_unit_code_idx},${priceUnitList.seq},'down','price_unit')">▼</button>
		                            	</c:otherwise>
	                            	</c:choose>
	                            </td>
	                          </tr>
	                       </c:forEach>  
                        </tbody>
                      </table>
                    </div>
                  </div>
                  <button data-bs-toggle="modal" data-bs-target="#code_insert_modal-3-1" onclick="insFormBtn('price_unit')">코드등록</button>
                </div>
              </div>
              <!--  -->
              <div class="user_control_wrap mb-0">
                <!-- 왼쪽 -->
                <div class="user_control_letf col-xl-6">
                  <div class="user_control_card_wrap card">
                    <div class="table-responsive">
                      <table class="table mb-0">
                        <thead>
                          <tr class="tr_bgc">
                            <th colspan="8">구입구분 1코드</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr class="setting_thead">
                            <th>명칭</th>
                            <th>코드</th>
                            <th>순서</th>
                            <th>수정일</th>
                            <th>수정자</th>
                            <th>사용여부</th>
                            <th>수정</th>
                            <th>순서</th>
                          </tr>
						  <c:forEach var="purchase1List" items="${purchase1List }" varStatus="varStatus">  
	                          <tr>
	                            <td>${purchase1List.purchase1_nm}</td>
	                            <td></td>
	                            <td>${purchase1List.seq }</td>
	                            <td>${purchase1List.mod_date}</td>
	                            <td>${purchase1List.mod_user}</td>
	                            <td><button>${purchase1List.enabled}</button></td>
	                            <td><button type="button" data-bs-toggle="modal" data-bs-target="#code_modify_modal-1" onclick="modFormBtn('purchase1', '${purchase1List.purchase1_code_idx}', '${purchase1List.purchase1_nm}', '${purchase1List.enabled}')">수정</button></td>
	                            <td>
	                            	<c:choose>
			                            <c:when test="${varStatus.first}">  
			                             	<button type="button" onClick="updateSeq(0,${purchase1List.seq},'up','purchase1')">▲</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button type="button" onClick="updateSeq(${purchase1List.purchase1_code_idx},${purchase1List.seq},'up','purchase1')">▲</button>
		                            	</c:otherwise>
	                            	</c:choose>
		                              
		                            <c:choose>
			                            <c:when test="${varStatus.last}">  
			                              <button type="button" onClick="updateSeq(0,${purchase1List.seq},'down','purchase1')">▼</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button type="button" onClick="updateSeq(${purchase1List.purchase1_code_idx},${purchase1List.seq},'down','purchase1')">▼</button>
		                            	</c:otherwise>
	                            	</c:choose>
	                            </td>
	                          </tr>
	                       </c:forEach> 
                        </tbody>
                      </table>
                    </div>
                  </div>
                  <button data-bs-toggle="modal" data-bs-target="#code_insert_modal-3-1" onclick="insFormBtn('purchase1')">코드등록</button>
                </div>
                <!-- 오른쪽 -->
                <div class="user_control_right col-xl-6">
                  <div class="user_control_card_wrap card">
                    <div class="table-responsive">
                      <table class="table mb-0">
                        <thead>
                          <tr class="tr_bgc">
                            <th colspan="8">고입구분 2코드</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr class="setting_thead">
                            <th>명칭</th>
                            <th>코드</th>
                            <th>순서</th>
                            <th>수정일</th>
                            <th>수정자</th>
                            <th>사용여부</th>
                            <th>수정</th>
                            <th>순서</th>
                          </tr>
						  <c:forEach var="purchase2List" items="${purchase2List }" varStatus="varStatus">  
	                          <tr>
	                            <td>${purchase2List.purchase2_nm}</td>
	                            <td></td>
	                            <td>${purchase2List.seq }</td>
	                            <td>${purchase2List.mod_date}</td>
	                            <td>${purchase2List.mod_user}</td>
	                            <td><button>${purchase2List.enabled}</button></td>
	                            <td><button type="button" data-bs-toggle="modal" data-bs-target="#code_modify_modal-1" onclick="modFormBtn('purchase2', '${purchase2List.purchase2_code_idx}', '${purchase2List.purchase2_nm}', '${purchase2List.enabled}')">수정</button></td>
	                            <td>
	                            	<c:choose>
			                            <c:when test="${varStatus.first}">  
			                             	<button type="button" onClick="updateSeq(0,${purchase2List.seq},'up','purchase2')">▲</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button type="button" onClick="updateSeq(${purchase2List.purchase2_code_idx},${purchase2List.seq},'up','purchase2')">▲</button>
		                            	</c:otherwise>
	                            	</c:choose>
		                              
		                            <c:choose>
			                            <c:when test="${varStatus.last}">  
			                              <button type="button" onClick="updateSeq(0,${purchase2List.seq},'down','purchase2')">▼</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button type="button" onClick="updateSeq(${purchase2List.purchase2_code_idx},${purchase2List.seq},'down','purchase2')">▼</button>
		                            	</c:otherwise>
	                            	</c:choose>
	                            </td>
	                          </tr>
	                       </c:forEach> 
                        </tbody>
                      </table>
                    </div>
                  </div>
                  <button data-bs-toggle="modal" data-bs-target="#code_insert_modal-3-1" onclick="insFormBtn('purchase2')">코드등록</button>
                </div>
              </div>
            </div>
            
            <!-- 코드등록 모달창 3-1 (국적,재질,기본정보,입수정보,보관구분 1단계) -->
            <div id="code_insert_modal-3-1" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none" aria-hidden="true">
              <div class="modal-dialog user-modal">
                <div class="modal-content">
                  <div class="modal-header mv-modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="codeInsClose"></button>
                  </div>
                  <div class="modal-body mv-modal-body">
                    <div class="mb-0 user-wrap">
                      <div class="st_wrap">
                        <label class="col-md-2 col-form-label st_title">코드 등록</label>
                      </div>
                      <div class="card-body">
                        <div class="table-responsive">
                          <form action="" method="post" name="codeInsForm">
                        	  <input type="hidden" name="" id="insType"/>
	                          <table class="table mb-0">
	                            <tbody>
	                              <tr>
	                                <td>명칭</td>
	                                <td>
	                                  <input type="text" name="" id="insNm"/>
	                                </td>
	                              </tr>
	                              <tr>
	                                <td>사용여부</td>
	                                <td>
	                                	 <input type="checkbox" name="enabled" value="Y" id="insCodeEnabledY">사용
		                                 <input type="checkbox" name="enabled" value="N" id="insCodeEnabledN">미사용
	                                </td>
	                              </tr>
	                            </tbody>
	                          </table>
	                          <button class="btn btn-secondary btn_save" type="button" id="insBtn">저장</button>
                          </form>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
             </div>
             
            <!-- 코드수정 모달창 -->
            <div id="code_modify_modal-1" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none" aria-hidden="true">
              <div class="modal-dialog user-modal">
                <div class="modal-content">
                  <div class="modal-header mv-modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="codeModClose"></button>
                  </div>
                  <div class="modal-body mv-modal-body">
                    <div class="mb-0 user-wrap">
                      <div class="st_wrap">
                        <label class="col-md-2 col-form-label st_title">코드 수정</label>
                      </div>
                      <div class="card-body">
                        <div class="table-responsive">
                           <form action="" method="post" name="codeModForm">
                         	  <input type="hidden" name="" id="modType"/>
                        	  <input type="hidden" name="" id="modIdx"/>
	                          <table class="table mb-0">
	                            <tbody>
	                              <tr>
	                                <td>명칭</td>
	                                <td>
	                                  <input type="text" name="" id="modNm"/>
	                                </td>
	                              </tr>
	                              <tr>
	                                <td>사용여부</td>
	                                <td>
	                                	 <input type="checkbox" name="enabled" value="Y" id="modCodeEnabledY">사용
		                                 <input type="checkbox" name="enabled" value="N" id="modCodeEnabledN">미사용
	                                </td>
	                              </tr>
	                            </tbody>
	                          </table>
	                          <button class="btn btn-secondary btn_save" type="button" id="modBtn">저장</button>
                          </form>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <script>
				<%-- 코드 등록 사용 여부 체크박스 단일선택 --%>
				$('input[type="checkbox"][name="enabled"]').click(function(){
					  if($(this).prop('checked')){
					 
					     $('input[type="checkbox"][name="enabled"]').prop('checked',false);
					 
					     $(this).prop('checked',true);
					 
					    }
					  
				});
	    		$('input[type="text"]').keydown(function() {
		  			  if (event.keyCode === 13) {
		  			    event.preventDefault();
		  			  };
	  			});
			</script>