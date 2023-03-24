<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

            <!-- 기본정보코드 -->
            <div class="tab-pane" id="code-tap-5" role="tabpanel" style="display:block;">
              <div class="user_control_wrap mb-0">
                <!-- 왼쪽 -->
                <div class="user_control_letf col-xl-6">
                  <div class="user_control_card_wrap card">
                    <div class="table-responsive">
                      <table class="table mb-0">
                        <thead>
                          <tr class="tr_bgc">
                            <th colspan="7">수량단위코드</th>
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
						  <c:forEach var="qtyUnitList" items="${qtyUnitList }" varStatus="varStatus">  
	                          <tr>
	                            <td>${qtyUnitList.seq }</td>
	                            <td>${qtyUnitList.qty_unit_nm}</td>	                           
	                            <td>${qtyUnitList.mod_date}</td>
	                            <td>${qtyUnitList.mod_user}</td>
	                            <td>
	                            	<c:choose>
			                            <c:when test="${qtyUnitList.enabled != 'Y'}">  
	                            			<button class="custom_btn btn_preferences_user_enabled">미사용</button>
	                          			</c:when>
	                          			<c:otherwise>
	                          				<button class="custom_btn btn_preferences_user_enabled">사용</button>
	                          			</c:otherwise>
	                          		</c:choose>
	                            </td>
	                            <td><button class="custom_btn btn_edit" type="button" data-bs-toggle="modal" data-bs-target="#code_modify_modal-1" onclick="modFormBtn('qty_unit', '${qtyUnitList.qty_unit_code_idx}', '${qtyUnitList.qty_unit_nm}', '${qtyUnitList.enabled}')">수정</button></td>
	                            <td>
	                            	<c:choose>
			                            <c:when test="${varStatus.first}">  
			                             	<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(0,${qtyUnitList.seq},'up','qty_unit')">▲</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(${qtyUnitList.qty_unit_code_idx},${qtyUnitList.seq},'up','qty_unit')">▲</button>
		                            	</c:otherwise>
	                            	</c:choose>
		                              
		                            <c:choose>
			                            <c:when test="${varStatus.last}">  
			                              <button class="custom_btn btn_arrow" type="button" onClick="updateSeq(0,${qtyUnitList.seq},'down','qty_unit')">▼</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(${qtyUnitList.qty_unit_code_idx},${qtyUnitList.seq},'down','qty_unit')">▼</button>
		                            	</c:otherwise>
	                            	</c:choose>
	                            </td>
	                          </tr>
	                       </c:forEach>  
                        </tbody>
                      </table>
                    </div>
                  </div>
                  <button class="custom_btn btn_code_upload" data-bs-toggle="modal" data-bs-target="#code_insert_modal-3-1" type="button" onclick="insFormBtn('qty_unit')">코드등록</button>
                </div>
                <!-- 오른쪽 -->
                <div class="user_control_right col-xl-6">
                  <div class="user_control_card_wrap card">
                    <div class="table-responsive">
                      <table class="table mb-0">
                        <thead>
                          <tr class="tr_bgc">
                            <th colspan="7">현존여부코드</th>
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
						  <c:forEach var="existenceList" items="${existenceList }" varStatus="varStatus">  
	                          <tr>
	                            <td>${existenceList.seq }</td>
	                            <td>${existenceList.existence_nm}</td>	                            
	                            <td>${existenceList.mod_date}</td>
	                            <td>${existenceList.mod_user}</td>
	                            <td>
	                            	<c:choose>
			                            <c:when test="${existenceList.enabled != 'Y'}">  
	                            			<button class="custom_btn btn_preferences_user_enabled">미사용</button>
	                          			</c:when>
	                          			<c:otherwise>
	                          				<button class="custom_btn btn_preferences_user_enabled">사용</button>
	                          			</c:otherwise>
	                          		</c:choose>
	                            </td>
	                            <td><button class="custom_btn btn_edit" type="button" data-bs-toggle="modal" data-bs-target="#code_modify_modal-1" onclick="modFormBtn('existence', '${existenceList.existence_code_idx}', '${existenceList.existence_nm}', '${existenceList.enabled}')">수정</button></td>
	                            <td>
	                            	<c:choose>
			                            <c:when test="${varStatus.first}">  
			                             	<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(0,${existenceList.seq},'up','existence')">▲</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(${existenceList.existence_code_idx},${existenceList.seq},'up','existence')">▲</button>
		                            	</c:otherwise>
	                            	</c:choose>
		                              
		                            <c:choose>
			                            <c:when test="${varStatus.last}">  
			                              <button class="custom_btn btn_arrow" type="button" onClick="updateSeq(0,${existenceList.seq},'down','existence')">▼</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(${existenceList.existence_code_idx},${existenceList.seq},'down','existence')">▼</button>
		                            	</c:otherwise>
	                            	</c:choose>
	                            </td>
	                          </tr>
	                       </c:forEach>  
                        </tbody>
                      </table>
                    </div>
                  </div>
                  <button class="custom_btn btn_code_upload" data-bs-toggle="modal" data-bs-target="#code_insert_modal-3-1" onclick="insFormBtn('existence')">코드등록</button>
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
                            <th colspan="7">실측부위코드</th>
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
						  <c:forEach var="measurementList" items="${measurementList }" varStatus="varStatus">  
	                          <tr>
	                            <td>${measurementList.seq }</td>
	                            <td>${measurementList.measurement_nm}</td>	                            
	                            <td>${measurementList.mod_date}</td>
	                            <td>${measurementList.mod_user}</td>
	                            <td>
	                            	<c:choose>
			                            <c:when test="${measurementList.enabled != 'Y'}">  
	                            			<button class="custom_btn btn_preferences_user_enabled">미사용</button>
	                          			</c:when>
	                          			<c:otherwise>
	                          				<button class="custom_btn btn_preferences_user_enabled">사용</button>
	                          			</c:otherwise>
	                          		</c:choose>
	                            </td>
	                            <td><button class="custom_btn btn_edit" type="button" data-bs-toggle="modal" data-bs-target="#code_modify_modal-1" onclick="modFormBtn('measurement', '${measurementList.measurement_code_idx}', '${measurementList.measurement_nm}', '${measurementList.enabled}')">수정</button></td>
	                            <td>
	                            	<c:choose>
			                            <c:when test="${varStatus.first}">  
			                             	<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(0,${measurementList.seq},'up','measurement')">▲</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(${measurementList.measurement_code_idx},${measurementList.seq},'up','measurement')">▲</button>
		                            	</c:otherwise>
	                            	</c:choose>
		                              
		                            <c:choose>
			                            <c:when test="${varStatus.last}">  
			                              <button class="custom_btn btn_arrow" type="button" onClick="updateSeq(0,${measurementList.seq},'down','measurement')">▼</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(${measurementList.measurement_code_idx},${measurementList.seq},'down','measurement')">▼</button>
		                            	</c:otherwise>
	                            	</c:choose>
	                            </td>
	                          </tr>
	                       </c:forEach>  
                        </tbody>
                      </table>
                    </div>
                  </div>
                  <button class="custom_btn btn_code_upload" data-bs-toggle="modal" data-bs-target="#code_insert_modal-3-1" onclick="insFormBtn('measurement')">코드등록</button>
                </div>
                <!-- 오른쪽 -->
                <div class="user_control_right col-xl-6">
                  <div class="user_control_card_wrap card">
                    <div class="table-responsive">
                      <table class="table mb-0">
                        <thead>
                          <tr class="tr_bgc">
                            <th colspan="7">실측단위코드</th>
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
						  <c:forEach var="measurementUnitList" items="${measurementUnitList }" varStatus="varStatus">  
	                          <tr>
	                            <td>${measurementUnitList.seq }</td>
	                            <td>${measurementUnitList.measurement_unit_nm}</td>	                            
	                            <td>${measurementUnitList.mod_date}</td>
	                            <td>${measurementUnitList.mod_user}</td>
	                            <td>
	                            	<c:choose>
			                            <c:when test="${mesurementUnitList.enabled != 'Y'}">  
	                            			<button class="custom_btn btn_preferences_user_enabled">사용</button>
	                          			</c:when>
	                          			<c:otherwise>
	                          				<button class="custom_btn btn_preferences_user_enabled">미사용</button>
	                          			</c:otherwise>
	                          		</c:choose>
	                            </td>
	                            <td><button class="custom_btn btn_edit" type="button" data-bs-toggle="modal" data-bs-target="#code_modify_modal-1" onclick="modFormBtn('measurement_unit', '${measurementUnitList.measurement_unit_code_idx}', '${measurementUnitList.measurement_unit_nm}', '${measurementUnitList.enabled}')">수정</button></td>
	                            <td>
	                            	<c:choose>
			                            <c:when test="${varStatus.first}">  
			                             	<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(0,${measurementUnitList.seq},'up','measurement_unit')">▲</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(${measurementUnitList.measurement_unit_code_idx},${measurementUnitList.seq},'up','measurement_unit')">▲</button>
		                            	</c:otherwise>
	                            	</c:choose>
		                              
		                            <c:choose>
			                            <c:when test="${varStatus.last}">  
			                              <button class="custom_btn btn_arrow" type="button" onClick="updateSeq(0,${measurementUnitList.seq},'down','measurement_unit')">▼</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(${measurementUnitList.measurement_unit_code_idx},${measurementUnitList.seq},'down','measurement_unit')">▼</button>
		                            	</c:otherwise>
	                            	</c:choose>
	                            </td>
	                          </tr>
	                       </c:forEach>  
                        </tbody>
                      </table>
                    </div>
                  </div>
                  <button class="custom_btn btn_code_upload" data-bs-toggle="modal" data-bs-target="#code_insert_modal-3-1" onclick="insFormBtn('measurement_unit')">코드등록</button>
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
                            <th colspan="7">자료상태코드</th>
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
						  <c:forEach var="conditionList" items="${conditionList }" varStatus="varStatus">  
	                          <tr>
	                            <td>${conditionList.seq }</td>
	                            <td>${conditionList.condition_nm}</td>	                            
	                            <td>${conditionList.mod_date}</td>
	                            <td>${conditionList.mod_user}</td>
	                            <td>
	                            	<c:choose>
			                            <c:when test="${conditionList.enabled != 'Y'}">  
	                            			<button class="custom_btn btn_preferences_user_enabled">미사용</button>
	                          			</c:when>
	                          			<c:otherwise>
	                          				<button class="custom_btn btn_preferences_user_enabled">사용</button>
	                          			</c:otherwise>
	                          		</c:choose>
	                            </td>
	                            <td><button class="custom_btn btn_edit" type="button" data-bs-toggle="modal" data-bs-target="#code_modify_modal-1" onclick="modFormBtn('condition', '${conditionList.condition_code_idx}', '${conditionList.condition_nm}', '${conditionList.enabled}')">수정</button></td>
	                            <td>
	                            	<c:choose>
			                            <c:when test="${varStatus.first}">  
			                             	<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(0,${conditionList.seq},'up','condition')">▲</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(${conditionList.condition_code_idx},${conditionList.seq},'up','condition')">▲</button>
		                            	</c:otherwise>
	                            	</c:choose>
		                              
		                            <c:choose>
			                            <c:when test="${varStatus.last}">  
			                              <button class="custom_btn btn_arrow" type="button" onClick="updateSeq(0,${conditionList.seq},'down','condition')">▼</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(${conditionList.condition_code_idx},${conditionList.seq},'down','condition')">▼</button>
		                            	</c:otherwise>
	                            	</c:choose>
	                            </td>
	                          </tr>
	                       </c:forEach>  
                        </tbody>
                      </table>
                    </div>
                  </div>
                  <button class="custom_btn btn_code_upload" data-bs-toggle="modal" data-bs-target="#code_insert_modal-3-1" onclick="insFormBtn('condition')">코드등록</button>
                </div>
                <!-- 오른쪽 -->
                <div class="user_control_right col-xl-6">
                  <div class="user_control_card_wrap card">
                    <div class="table-responsive">
                      <table class="table mb-0">
                        <thead>
                          <tr class="tr_bgc">
                            <th colspan="7">전시순위코드</th>
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
						  <c:forEach var="rankingList" items="${rankingList }" varStatus="varStatus">  
	                          <tr>
	                            <td>${rankingList.seq }</td>
	                            <td>${rankingList.ranking_nm}</td>	                            
	                            <td>${rankingList.mod_date}</td>
	                            <td>${rankingList.mod_user}</td>
	                            <td>
	                            	<c:choose>
			                            <c:when test="${rankingList.enabled != 'Y'}">  
	                            			<button class="custom_btn btn_preferences_user_enabled">미사용</button>
	                          			</c:when>
	                          			<c:otherwise>
	                          				<button class="custom_btn btn_preferences_user_enabled">사용</button>
	                          			</c:otherwise>
	                          		</c:choose>
	                            </td>
	                            <td><button class="custom_btn btn_edit" type="button" data-bs-toggle="modal" data-bs-target="#code_modify_modal-1" onclick="modFormBtn('ranking', '${rankingList.ranking_code_idx}', '${rankingList.ranking_nm}', '${rankingList.enabled}')">수정</button></td>
	                            <td>
	                            	<c:choose>
			                            <c:when test="${varStatus.first}">  
			                             	<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(0,${rankingList.seq},'up','ranking')">▲</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(${rankingList.ranking_code_idx},${rankingList.seq},'up','ranking')">▲</button>
		                            	</c:otherwise>
	                            	</c:choose>
		                              
		                            <c:choose>
			                            <c:when test="${varStatus.last}">  
			                              <button class="custom_btn btn_arrow" type="button" onClick="updateSeq(0,${rankingList.seq},'down','ranking')">▼</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(${rankingList.ranking_code_idx},${rankingList.seq},'down','ranking')">▼</button>
		                            	</c:otherwise>
	                            	</c:choose>
	                            </td>
	                          </tr>
	                       </c:forEach>  
                        </tbody>
                      </table>
                    </div>
                  </div>
                  <button class="custom_btn btn_code_upload" data-bs-toggle="modal" data-bs-target="#code_insert_modal-3-1" onclick="insFormBtn('ranking')">코드등록</button>
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
                            <th colspan="7">공공누리서비스코드</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr class="setting_thead">
                            <th>순서</th>
                            <th>명칭</th>                          
                            <th>수정일</th>
                            <th>수정자</th>
                            <th>사용여부</th>
                            <th>수정</th>
                            <th>순서</th>
                          </tr>
						  <c:forEach var="ggnuriList" items="${ggnuriList }" varStatus="varStatus">  
	                          <tr>
	                            <td>${ggnuriList.seq }</td>
	                            <td>${ggnuriList.ggnuri_nm}</td>	                            	                            
	                            <td>${ggnuriList.mod_date}</td>
	                            <td>${ggnuriList.mod_user}</td>
	                            <td>
	                            	<c:choose>
			                            <c:when test="${ggnuriList.enabled != 'Y'}">  
	                            			<button class="custom_btn btn_preferences_user_enabled">미사용</button>
	                          			</c:when>
	                          			<c:otherwise>
	                          				<button class="custom_btn btn_preferences_user_enabled">사용</button>
	                          			</c:otherwise>
	                          		</c:choose>
	                            </td>
	                            <td><button class="custom_btn btn_edit" type="button" data-bs-toggle="modal" data-bs-target="#code_modify_modal-1" onclick="modFormBtn('ggnuri', '${ggnuriList.ggnuri_code_idx}', '${ggnuriList.ggnuri_nm}', '${ggnuriList.enabled}')">수정</button></td>
	                            <td>
	                            	<c:choose>
			                            <c:when test="${varStatus.first}">  
			                             	<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(0,${ggnuriList.seq},'up','ggnuri')">▲</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(${ggnuriList.ggnuri_code_idx},${ggnuriList.seq},'up','ggnuri')">▲</button>
		                            	</c:otherwise>
	                            	</c:choose>
		                              
		                            <c:choose>
			                            <c:when test="${varStatus.last}">  
			                              <button class="custom_btn btn_arrow" type="button" onClick="updateSeq(0,${ggnuriList.seq},'down','ggnuri')">▼</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(${ggnuriList.ggnuri_code_idx},${ggnuriList.seq},'down','ggnuri')">▼</button>
		                            	</c:otherwise>
	                            	</c:choose>
	                            </td>
	                          </tr>
	                       </c:forEach>  
                        </tbody>
                      </table>
                    </div>
                  </div>
                  <button class="custom_btn btn_code_upload" data-bs-toggle="modal" data-bs-target="#code_insert_modal-3-1" onclick="insFormBtn('ggnuri')">코드등록</button>
                </div>
                <!-- 오른쪽 -->
                <div class="user_control_right col-xl-6">
                  <div class="user_control_card_wrap card">
                    <div class="table-responsive">
                      <table class="table mb-0">
                        <thead>
                          <tr class="tr_bgc">
                            <th colspan="7">전문정보코드</th>
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
						  <c:forEach var="specialityList" items="${specialityList }" varStatus="varStatus">  
	                          <tr>
	                            <td>${specialityList.seq }</td>
	                            <td>${specialityList.speciality_nm}</td>	                            
	                            <td>${specialityList.mod_date}</td>
	                            <td>${specialityList.mod_user}</td>
	                            <td>
	                            	<c:choose>
			                            <c:when test="${specialityList.enabled != 'Y'}">  
	                            			<button class="custom_btn btn_preferences_user_enabled">미사용</button>
	                          			</c:when>
	                          			<c:otherwise>
	                          				<button class="custom_btn btn_preferences_user_enabled">사용</button>
	                          			</c:otherwise>
	                          		</c:choose>
	                            </td>
	                            <td><button class="custom_btn btn_edit" type="button" data-bs-toggle="modal" data-bs-target="#code_modify_modal-1" onclick="modFormBtn('speciality', '${specialityList.speciality_code_idx}', '${specialityList.speciality_nm}', '${specialityList.enabled}')">수정</button></td>
	                            <td>
	                            	<c:choose>
			                            <c:when test="${varStatus.first}">  
			                             	<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(0,${specialityList.seq},'up','speciality')">▲</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(${specialityList.speciality_code_idx},${specialityList.seq},'up','speciality')">▲</button>
		                            	</c:otherwise>
	                            	</c:choose>
		                              
		                            <c:choose>
			                            <c:when test="${varStatus.last}">  
			                              <button class="custom_btn btn_arrow" type="button" onClick="updateSeq(0,${specialityList.seq},'down','speciality')">▼</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(${specialityList.speciality_code_idx},${specialityList.seq},'down','speciality')">▼</button>
		                            	</c:otherwise>
	                            	</c:choose>
	                            </td>
	                          </tr>
	                       </c:forEach>  
                        </tbody>
                      </table>
                    </div>
                  </div>
                  <button class="custom_btn btn_code_upload" data-bs-toggle="modal" data-bs-target="#code_insert_modal-3-1" onclick="insFormBtn('speciality')">코드등록</button>
                </div>
              </div>
            </div>
           
           <!-- 코드등록 모달창 3-1 (국적,재질,기본정보,입수정보,보관구분 1단계) -->
            <div id="code_insert_modal-3-1" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none" aria-hidden="true">
              <div class="modal-dialog user-modal preferences_deit_modal_wrap_2">
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
	                                <td style="width: 15%;">명칭</td>
	                                <td>
	                                  <input class="custom_search_input user_in_modal_input" type="text" name="" id="insNm"/>
	                                </td>
	                              </tr>
	                              <tr>
	                                <td>사용여부</td>
	                                <td>
	                                	 <input type="radio" name="enabled" value="Y" id="insCodeEnabledY">사용
		                                 <input type="radio" name="enabled" value="N" id="insCodeEnabledN">미사용
	                                </td>
	                              </tr>
	                            </tbody>
	                          </table>
	                         
                          </form>
                        </div>
                      </div>
                    </div>
						<div class="user_in_modal_footer_wrap">
						  <button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" id="insBtn">저장</button>
						  <button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" id="" data-bs-dismiss="modal">닫기</button>
						</div>
                  </div>
                </div>
              </div>
            </div>
            
            <!-- 코드수정 모달창 -->
            <div id="code_modify_modal-1" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none" aria-hidden="true">
              <div class="modal-dialog user-modal preferences_deit_modal_wrap_2">
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
	                                <td style="width: 15%;">명칭</td>
	                                <td>
	                                  <input class="custom_search_input user_in_modal_input" type="text" name="" id="modNm"/>
	                                </td>
	                              </tr>
	                              <tr>
	                                <td>사용여부</td>
	                                <td>
	                                	 <input type="radio" name="enabled" value="Y" id="modCodeEnabledY">사용
		                                 <input type="radio" name="enabled" value="N" id="modCodeEnabledN">미사용
	                                </td>
	                              </tr>
	                            </tbody>
	                          </table>
	                          
                          </form>
                        </div>
                      </div>
                    </div>
						<div class="user_in_modal_footer_wrap">
						  <button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" id="modBtn">저장</button>
						  <button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" id="" data-bs-dismiss="modal">닫기</button>
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