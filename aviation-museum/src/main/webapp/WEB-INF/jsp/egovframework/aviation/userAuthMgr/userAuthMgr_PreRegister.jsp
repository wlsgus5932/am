<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!-- 가등록 자료관리 권한 -->
            <div class="tab-pane" id="messages" role="tabpanel" style="display:block;">
              <div class="st_wrap st_mv_wrap"></div>
              <div class="user_control_wrap mb-0">
                <div class="user_control_letf col-xl-6">
                  <h5 class="user_control_text">그룹설명</h5>
                  <div class="user_control_card_wrap card">
                    <div class="table-responsive">
                      <table class="table mb-0">
                        <thead>
                          <tr class="tr_bgc">
<!--                             <th class="control_card_header"> -->
                            	<th style="text-align: left;">그룹명</th>
<!--                               <span>그룹명</span> -->
								<th>
	                              <select class="search_select" name="group_idx" id="group_select" onchange="groupChange(this)" style="float: right;">
		                              <c:forEach var="groupList" items="${groupList}">
		                                 <option value="${groupList.group_idx}">${groupList.group_nm}</option>
		                         	  </c:forEach>
	                              </select>								
								</th>
<!--                             </th> -->
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td colspan="2">중앙 관리자 권한입니다(시스템 생성)</td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                  <h5 class="user_control_text">사용자 목록</h5>
                  <div class="user_control_card_wrap card">
                    <div class="table-responsive">
                      <table class="table mb-0">
                        <thead>
                          <tr class="tr_bgc">
                            <th>사용자ID</th>
                            <th>사용자명</th>
                          </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="groupUserList" items="${groupUserList}">
	                          <tr>
	                            <td>${groupUserList.member_id}</td>
	                            <td>${groupUserList.member_nm}</td>
	                          </tr>
                          	</c:forEach>
                        	<c:if test="${empty groupUserList}">
							  <tr>
							  	<td colspan="2">사용자가 없습니다.</td>
							  </tr>
							</c:if>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
                <!--  -->
                <div class="user_control_right col-xl-6">
                  <h5 class="user_control_text">권한설정
                   <form action="/menuAuthUpdate.do" method="post" name="menuAuthModform" id="menuAuthModform" style="width: 22%;"> 
				  	<input type="hidden" id="pGroup_idx" name="group_idx"/>   
				  	<input type="hidden" id="pMenu_code_idx" name="possession_code_idx"/>
				  	<button class="custom_btn btn_707070 user_mgt_btn" type="button" id="allCheck">전체선택</button>  
				  	<button class="custom_btn btn_707070 user_mgt_btn" type="button" id="preRegisterModBtn">선택변경</button>     
				  </form>	                     	    
                  </h5>
                  <div class="user_control_card_wrap card">
                    <div class="table-responsive">
                      <table class="table mb-0">
                        <thead>
                          <tr class="tr_bgc">
                            <th colspan="2">소장구분 선택</th>
                            <th></th>
                          </tr>
                        </thead>
                        <tbody class="user_control_bd user_control_bd2">
                        	<tr>
                        	<c:forEach var="possessionList" items="${possessionList}" varStatus="varStatus">	                         
	                            <td class="menu_auth_small"><input type="checkbox" name="possession_code_idx" id="" value="${possessionList.possession_code_idx}"/>${possessionList.possession_nm}</td>
		                        <c:choose> 
									<c:when test="${varStatus.count%3==0}"> 
										</tr><tr> 
									</c:when> 
								</c:choose> 
							</c:forEach>      
	                        </tr>               
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <script>
            
        	$(function() {
        		// 소장구분 전체갯수와 선택된 소장구분 갯수가 같으면 전체선택버튼에 checked 
        		if(${possessionList.size() == groupPossessionList.size()}){
        			$('#allCheck').addClass("checked");
        		}
        		
        		$('#pGroup_idx').val(${getGroup_idx});
    		    var chk = $('input:checkbox[name=possession_code_idx]');

	        	<c:forEach items="${groupPossessionList}" var="item">
		      		  chk.filter('[value=' + ${item.possession_code_idx} + ']').prop('checked', true).addClass('checked');
    			</c:forEach>

        	});
        	
            function groupChange(e) {
	
	        		  	const group_idx = e.value;
	         	  	    			
		    			$.ajax({
		    				type : 'POST',                
		    				url : '/userPreRegisterGroupAjax.do',    
		    				data:{
		    					group_idx : group_idx
							},
							dataType : "html",           
		    				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
		    				error : function() {          
		    					alert('통신실패!');
		    				},
		    				success : function(data) {  
		    					$('#tab-content').empty().append(data);
		    					$('#group_select').val(group_idx);	    	    			
		    				}
		    			});
	         	}      
            
       		// 가등록 자료 관리 권한 소장구분 전체선택, 취소
 			$('#allCheck').click(function() {
 				var val = true;
 				
 				$('#allCheck').toggleClass("checked");
 				
 				if($('#allCheck').attr('class').indexOf('checked') == -1){
 					val = false;
 				}
 				 $(':checkbox').each(function() {
 		            this.checked = val;
 		            if(val == true){
 		           	 	$(':checkbox').addClass('checked');
 		            }else{
 		            	$(':checkbox').removeClass('checked');
 		            }
 		        });
		    });
       		 
            </script>