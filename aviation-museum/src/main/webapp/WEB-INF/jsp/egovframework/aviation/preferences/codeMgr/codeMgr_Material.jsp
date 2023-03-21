<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
            <!-- 재질코드 -->
            <div class="tab-pane" id="code-tap-4" role="tabpanel" style="display:block;">
              <div class="user_control_wrap mb-0">
                <!-- 왼쪽 -->
                <div class="user_control_letf col-xl-6">
                  <div class="user_control_card_wrap card">
                    <div class="table-responsive">
                      <table class="table mb-0">
                        <thead>
                          <tr class="tr_bgc">
                            <th colspan="7">재질분류 1코드</th>
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
 						  <c:forEach var="material1List" items="${material1List }" varStatus="varStatus">  
	                          <tr>
	                            <td>${material1List.seq }</td>
	                            <td onclick="material12List('${material1List.material1_code_idx}','${material1List.material1_nm}')">${material1List.material1_nm}</td>	                            
	                            <td>${material1List.mod_date}</td>
	                            <td>${material1List.mod_user}</td>
	                            <td>
	                            	<c:choose>
			                            <c:when test="${material1List.enabled != 'Y'}">  
	                            			<button class="custom_btn btn_preferences_user_enabled">미사용</button>
	                          			</c:when>
	                          			<c:otherwise>
	                          				<button class="custom_btn btn_preferences_user_enabled">사용</button>
	                          			</c:otherwise>
	                          		</c:choose>
	                            </td>
	                            <td><button class="custom_btn btn_edit" type="button" data-bs-toggle="modal" data-bs-target="#code_modify_modal-1"  onclick="modFormBtn('material1', '${material1List.material1_code_idx}', '${material1List.material1_nm}', '${material1List.enabled}')">수정</button></td>
	                            <td>
	                            	<c:choose>
			                            <c:when test="${varStatus.first}">  
			                             	<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(0,${material1List.seq},'up','material1')">▲</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(${material1List.material1_code_idx},${material1List.seq},'up','material1')">▲</button>
		                            	</c:otherwise>
	                            	</c:choose>
		                              
		                            <c:choose>
			                            <c:when test="${varStatus.last}">  
			                              <button class="custom_btn btn_arrow" type="button" onClick="updateSeq(0,${material1List.seq},'down','material1')">▼</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(${material1List.material1_code_idx},${material1List.seq},'down','material1')">▼</button>
		                            	</c:otherwise>
	                            	</c:choose>
	                            </td>
	                          </tr>
	                      </c:forEach> 
                        </tbody>
                      </table>
                    </div>
                  </div>
                  <button class="custom_btn btn_code_upload" data-bs-toggle="modal" data-bs-target="#code_insert_modal-1" onclick="insFormBtn('material1')">코드등록</button>
                </div>
                <!-- 화살표 -->
                <div class="center_arrow">▶</div>
                <!-- 오른쪽 -->
                <div class="user_control_right col-xl-6">
                  <div class="user_control_card_wrap card">
                    <div class="table-responsive">
                      <table class="table mb-0">
                        <thead>
                          <tr class="tr_bgc">
                            <th colspan="7">재질분류 2코드</th>
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
 						  <c:forEach var="material2List" items="${material2List }" varStatus="varStatus">  
	                          <tr>
	                          	<td>${material2List.seq }</td>
	                            <td>${material2List.material2_nm}</td>	                            
	                            <td>${material2List.mod_date}</td>
	                            <td>${material2List.mod_user}</td>
	                            <td>
	                            	<c:choose>
			                            <c:when test="${material2List.enabled != 'Y'}">  
	                            			<button class="custom_btn btn_preferences_user_enabled">미사용</button>
	                          			</c:when>
	                          			<c:otherwise>
	                          				<button class="custom_btn btn_preferences_user_enabled">사용</button>
	                          			</c:otherwise>
	                          		</c:choose>
	                            </td>
	                            <td><button class="custom_btn btn_edit" type="button" data-bs-toggle="modal" data-bs-target="#code_modify_modal-2" onclick="modSubFormBtn('material2', '${material2List.material2_code_idx}', '${material2List.material2_nm}', '${material2List.enabled}')">수정</button></td>
	                            <td>
	                            	<c:choose>
			                            <c:when test="${varStatus.first}">  
			                             	<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(0,${material2List.seq},'up','material2')">▲</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(${material2List.material2_code_idx},${material2List.seq},'up','material2')">▲</button>
		                            	</c:otherwise>
	                            	</c:choose>
		                              
		                            <c:choose>
			                            <c:when test="${varStatus.last}">  
			                              <button class="custom_btn btn_arrow" type="button" onClick="updateSeq(0,${material2List.seq},'down','material2')">▼</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(${material2List.material2_code_idx},${material2List.seq},'down','material2')">▼</button>
		                            	</c:otherwise>
	                            	</c:choose>
	                            </td>
	                          </tr>
	                      </c:forEach> 
                        </tbody>
                      </table>
                    </div>
                  </div>
                  <c:if test="${!empty material1VO.material1_code_idx}">
                  	<button class="custom_btn btn_code_upload" data-bs-toggle="modal" data-bs-target="#code_insert_modal-3-3" onclick="insSubFormBtn('material2')">코드등록</button>
                  </c:if>
                </div>
              </div>
            </div>
            
            <!-- 코드등록 모달창 -->
            <div id="code_insert_modal-1" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none" aria-hidden="true">
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
            
            <!-- 코드등록 모달창 3-3 -->
            <div id="code_insert_modal-3-3" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none" aria-hidden="true">
              <div class="modal-dialog user-modal">
                <div class="modal-content">
                  <div class="modal-header mv-modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="subCodeInsClose"></button>
                  </div>
                  <div class="modal-body mv-modal-body">
                    <div class="mb-0 user-wrap">
                      <div class="st_wrap">
                        <label class="col-md-2 col-form-label st_title">코드 등록</label>
                      </div>
                      <div class="card-body">
                        <div class="table-responsive">
                           <form action="" method="post" name="subCodeInsForm">
                        	  <input type="hidden" name="" id="subInsType"/>
                        	  <input type="hidden" name="material1_code_idx" id="subInsParentCode"/>
	                          <table class="table mb-0">
	                            <tbody>
	                             <tr>
	                                <td>상위코드</td>
	                                <td id="subInsParentCodeHtml">
									</td>
	                              </tr>
	                              <tr>
	                                <td>명칭</td>
	                                <td>
	                                  <input type="text" name="" id="subInsNm"/>
	                                </td>
	                              </tr>
	                              <tr>
	                                <td>사용여부</td>
	                                <td>
	                                	 <input type="checkbox" name="enabled" value="Y" id="subInsCodeEnabledY">사용
		                                 <input type="checkbox" name="enabled" value="N" id="subInsCodeEnabledN">미사용
	                                </td>
	                              </tr>
	                            </tbody>
	                          </table>
	                          <button class="btn btn-secondary btn_save" type="button" id="subInsBtn">저장</button>
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
            
           <!-- 코드수정 모달창2 -->
            <div id="code_modify_modal-2" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none" aria-hidden="true">
              <div class="modal-dialog user-modal">
                <div class="modal-content">
                  <div class="modal-header mv-modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="subModClose"></button>
                  </div>
                  <div class="modal-body mv-modal-body">
                    <div class="mb-0 user-wrap">
                      <div class="st_wrap">
                        <label class="col-md-2 col-form-label st_title">코드 수정</label>
                      </div>
                      <div class="card-body">
                        <div class="table-responsive">
                           <form action="" method="post" name="subCodeModForm">
                        	  <input type="hidden" name="" id="subModType"/>
                        	  <input type="hidden" name="material2_code_idx" id="subModIdx"/>
                        	  <input type="hidden" name="material1_code_idx" id="subModParentCode"/>
	                          <table class="table mb-0">
	                            <tbody>
	                              <tr>
	                                <td>상위코드</td>
	                                <td id="subModParentCodeHtml">
									</td>
	                              </tr>
	                              <tr>
	                                <td>명칭</td>
	                                <td>
	                                  <input type="text" name="" id="subModNm"/>
	                                </td>
	                              </tr>
	                              <tr>
	                                <td>사용여부</td>
	                                <td>
	                                	 <input type="checkbox" name="enabled" value="Y" id="subModCodeEnabledY">사용
		                                 <input type="checkbox" name="enabled" value="N" id="subModCodeEnabledN">미사용
	                                </td>
	                              </tr>
	                            </tbody>
	                          </table>
	                          <button class="btn btn-secondary btn_save" type="button" id="subModBtn">저장</button>
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
    		<%-- 재질분류2코드 조회 --%>
    		function material12List(value, value2) {
    			var material1_code_idx = value;
    			var material1_nm = value2;
    			
    			$.ajax({
    				type : 'POST',                 
    				url : '/materialListAjax.do',   
    				data:{
    					material1_code_idx : material1_code_idx
    				},
    				dataType : "html",           
    				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
    				error : function() {        
    					alert('통신실패!');
    				},
    				success : function(data) {  
    					$('#tab-content').empty().append(data);
    					$('#subInsParentCode').val(material1_code_idx);
    					$('#subModParentCode').val(material1_code_idx);
    	    			$('#subInsParentCodeHtml').html(material1_nm);
    	    			$('#subModParentCodeHtml').html(material1_nm);
    				}
    			});
    		}
            </script>