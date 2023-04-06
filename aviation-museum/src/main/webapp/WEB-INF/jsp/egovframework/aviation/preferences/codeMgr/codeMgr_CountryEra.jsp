<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    
           <!-- 국적/시대코드 -->
            <div class="tab-pane" id="code-tap-3" role="tabpanel" style="display:block;">
              <div class="user_control_wrap mb-0">
                <!-- 왼쪽 -->
                <div class="user_control_letf col-xl-6">
                  <div class="user_control_card_wrap card">
                    <div class="table-responsive">
                      <table class="table mb-0">
                        <thead>
                          <tr class="tr_bgc tr_bgc_2">
                            <th colspan="7">국적코드</th>
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
 						  <c:forEach var="countryList" items="${countryList }" varStatus="varStatus">  
	                          <tr>
	                            <td>${countryList.seq}</td>
	                            <td onclick="countryEraList('${countryList.country_code_idx}','${countryList.country_nm}')">${countryList.country_nm}</td>	                            
	                            <td>${countryList.mod_date}</td>
	                            <td>${countryList.mod_user}</td>
	                            <td>
	                            	<c:choose>
			                            <c:when test="${countryList.enabled != 'Y'}">  
	                            			<button class="custom_btn btn_preferences_user_enabled">미사용</button>
	                          			</c:when>
	                          			<c:otherwise>
	                          				<button class="custom_btn btn_preferences_user_enabled">사용</button>
	                          			</c:otherwise>
	                          		</c:choose>
	                            </td>
	                            <td><button class="custom_btn btn_edit" type="button" data-bs-toggle="modal" data-bs-target="#code_modify_modal-1"  onclick="modFormBtn('country', '${countryList.country_code_idx}', '${countryList.country_nm}', '${countryList.enabled}')">수정</button></td>
	                            <td>
	                            	<c:choose>
			                            <c:when test="${varStatus.first}">  
			                             	<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(0,${countryList.seq},'up','country')">▲</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(${countryList.country_code_idx},${countryList.seq},'up','country')">▲</button>
		                            	</c:otherwise>
	                            	</c:choose>
		                              
		                            <c:choose>
			                            <c:when test="${varStatus.last}">  
			                              <button class="custom_btn btn_arrow" type="button" onClick="updateSeq(0,${countryList.seq},'down','country')">▼</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(${countryList.country_code_idx},${countryList.seq},'down','country')">▼</button>
		                            	</c:otherwise>
	                            	</c:choose>
	                            </td>
	                          </tr>
	                      </c:forEach> 
                        </tbody>
                      </table>
                    </div>
                  </div>
                  <button class="custom_btn btn_code_upload" data-bs-toggle="modal" data-bs-target="#code_insert_modal-1" onclick="insFormBtn('country')">코드등록</button>
                </div>
                <!-- 화살표 -->
                <div class="center_arrow">▶</div>
                <!-- 오른쪽 -->
                <div class="user_control_right col-xl-6">
                  <div class="user_control_card_wrap card">
                    <div class="table-responsive">
                      <table class="table mb-0">
                        <thead>
                          <tr class="tr_bgc tr_bgc_2">
                            <th colspan="9">시대코드</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr class="setting_thead">
                            <th>번호</th>
                            <th>명칭</th>
                            <th style="width: 5%;">시작연도</th>
                            <th>종료연도</th>
                            <th>수정일</th>
                            <th>수정자</th>
                            <th>사용여부</th>
                            <th>수정</th>
                            <th>순서</th>
                          </tr>
 						  <c:forEach var="eraList" items="${eraList }" varStatus="varStatus">  
	                          <tr>
	                          	<td>${varStatus.count}</td>
	                            <td>${eraList.era_nm}</td>
	                            <td>${eraList.start_year}</td>
	                            <td>${eraList.end_year}</td>	                            
	                            <td>${eraList.mod_date}</td>
	                            <td>${eraList.mod_user}</td>
	                            <td>
	                            	<c:choose>
			                            <c:when test="${eraList.enabled != 'Y'}">  
	                            			<button class="custom_btn btn_preferences_user_enabled">미사용</button>
	                          			</c:when>
	                          			<c:otherwise>
	                          				<button class="custom_btn btn_preferences_user_enabled">사용</button>
	                          			</c:otherwise>
	                          		</c:choose>
	                            </td>
	                            <td><button class="custom_btn btn_edit" type="button" data-bs-toggle="modal" data-bs-target="#code_modify_modal-2" onclick="modEraSubFormBtn('era', '${eraList.era_code_idx}', '${eraList.era_nm}', '${eraList.enabled}', '${eraList.start_year}', '${eraList.end_year}')">수정</button></td>
	                            <td>
	                            	<c:choose>
			                            <c:when test="${varStatus.first}">  
			                             	<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(0,${eraList.seq},'up','era')">▲</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(${eraList.era_code_idx},${eraList.seq},'up','era')">▲</button>
		                            	</c:otherwise>
	                            	</c:choose>
		                              
		                            <c:choose>
			                            <c:when test="${varStatus.last}">  
			                              <button class="custom_btn btn_arrow" type="button" onClick="updateSeq(0,${eraList.seq},'down','era')">▼</button>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<button class="custom_btn btn_arrow" type="button" onClick="updateSeq(${eraList.era_code_idx},${eraList.seq},'down','era')">▼</button>
		                            	</c:otherwise>
	                            	</c:choose>
	                            </td>
	                          </tr>
	                       </c:forEach>  
                        </tbody>
                      </table>
                    </div>
                  </div>
                  <c:if test="${!empty countryVO.country_code_idx}">
                  	 <button class="custom_btn btn_code_upload" data-bs-toggle="modal" data-bs-target="#code_insert_modal-3-2" onclick="insSubFormBtn('era')">코드등록</button>
                  </c:if>
                </div>
              </div>
            </div>
            
            <!-- 코드 등록 모달창 -->
            <div id="code_insert_modal-1" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none" aria-hidden="true">
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
             
             <!-- 코드등록 모달창 3-2 -->
            <div id="code_insert_modal-3-2" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none" aria-hidden="true">
              <div class="modal-dialog user-modal preferences_deit_modal_wrap">
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
                        	  <input type="hidden" name="country_code_idx" id="subInsParentCode"/>
	                          <table class="table mb-0">
	                            <tbody>
	                              <tr>
	                                <td style="width: 15%;">상위코드</td>
	                                <td id="subInsParentCodeHtml">
	                              </tr>
	                              <tr>
	                                <td>명칭</td>
	                                <td>
	                                  <input class="custom_search_input user_in_modal_input" type="text" id="subInsNm"/>
	                                </td>
	                              </tr>
	                              <tr>
	                                <td>연도</td>
	                                <td><input class="custom_search_input code_year_input" type="text" name="start_year" id="subInsStart"/>~<input class="custom_search_input code_year_input" type="text" name="end_year" id="subInsEnd"/></td>
	                              </tr>
	                              <tr>
	                                <td>사용여부</td>
	                                <td>
	                                  	 <input type="radio" name="enabled" value="Y" id="subInsCodeEnabledY">사용
		                                 <input type="radio" name="enabled" value="N" id="subInsCodeEnabledN">미사용
	                                </td>
	                              </tr>
	                            </tbody>
	                          </table>

                          </form>
                        </div>
                      </div>
                    </div>
	                          <div class="user_in_modal_footer_wrap">
	                          	<button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" id="subInsBtn">저장</button>
                       			<button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" id="" data-bs-dismiss="modal">닫기</button>
							  </div>                    
                  </div>
                </div>
              </div>
            </div>
                        
            <!-- 코드 수정 모달창 -->
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
            
           <!-- 코드수정 모달창2 -->
            <div id="code_modify_modal-2" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none" aria-hidden="true">
              <div class="modal-dialog user-modal preferences_deit_modal_wrap">
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
                        	  <input type="hidden" name="era_code_idx" id="subModIdx"/>
                        	  <input type="hidden" name="country_code_idx" id="subModParentCode"/>
	                          <table class="table mb-0">
	                            <tbody>
	                              <tr>
	                                <td style="width: 15%;">상위코드</td>
	                                <td id="subModParentCodeHtml">
									</td>
	                              </tr>
	                              <tr>
	                                <td>명칭</td>
	                                <td>
	                                  <input class="custom_search_input user_in_modal_input" type="text" name="" id="subModNm"/>
	                                </td>
	                              </tr>
	                              <tr>
	                                <td>연도</td>
	                                <td><input class="custom_search_input code_year_input" type="text" name="start_year" id="subModStart"/>~<input class="custom_search_input code_year_input" type="text" name="end_year" id="subModEnd"/></td>
	                              </tr>
	                              <tr>
	                                <td>사용여부</td>
	                                <td>
	                                	 <input type="radio" name="enabled" value="Y" id="subModCodeEnabledY">사용
		                                 <input type="radio" name="enabled" value="N" id="subModCodeEnabledN">미사용
	                                </td>
	                              </tr>
	                            </tbody>
	                          </table>
	                        <div>

                          </form>
                        </div>
                      </div>
                    </div>
	                        <div class="user_in_modal_footer_wrap">
	                          <button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" id="subModBtn">저장</button>
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
    		<%-- 시대코드 조회 --%>
    		function countryEraList(value, value2) {
    			var country_code_idx = value;
    			var country_nm = value2;
    			
    			$.ajax({
    				type : 'POST',                 
    				url : '/countryEraListAjax.do',   
    				data:{
    					country_code_idx : country_code_idx
    				},
    				dataType : "html",           
    				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
    				error : function() {        
    					alert('통신실패!');
    				},
    				success : function(data) {  
    					$('#tab-content').empty().append(data);
    					$('#subInsParentCode').val(country_code_idx);
    					$('#subModParentCode').val(country_code_idx);
    	    			$('#subInsParentCodeHtml').html(country_nm);
    	    			$('#subModParentCodeHtml').html(country_nm);
    				}
    			});
    		}
            </script>