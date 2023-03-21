<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!-- 그룹관리권한 탭 -->
            <div class="tab-pane" id="profile" role="tabpanel" style="display:block;">
              <div class="st_wrap st_mv_wrap"></div>
              <div class="user_control_wrap mb-0">
                <div class="user_control_letf col-xl-6">
                  <h5 class="user_control_text">그룹설명</h5>
                  <div class="user_control_card_wrap card">
                    <div class="table-responsive">
                      <table class="table mb-0">
                        <thead>
                          <tr class="tr_bgc">
                          	<th style="text-align: left;">그룹명</th>
                          	<th>
                              <select class="search_select" name="group_idx" id="group_select" onchange="groupChange(this)" style="float: right;">
	                              <c:forEach var="groupList" items="${groupList}">
	                                 <option value="${groupList.group_idx}">${groupList.group_nm}</option>
	                         	  </c:forEach>
                              </select>                          	
                          	</th>
<!--                             <th class="control_card_header"> -->
<!--                               <span>그룹명</span> -->
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
               	  <form action="/possessionAuthUpdate.do" method="post" name="possessionAuthModform" id="possessionAuthModform" style="width: 20%;"> 
				  	<input type="hidden" id="mGroup_idx" name="group_idx"/>   
				  	<input type="hidden" id="mMenu_code_idx" name="menu_code_idx"/>
				  	<button class="custom_btn btn_707070 user_mgt_btn" type="button" id="allCheck">전체선택</button>  
				  	<button class="custom_btn btn_707070 user_mgt_btn" type="button" id="menuAuthModBtn">선택변경</button>
				  </form>	                 
                  </h5>
                  <div class="user_control_card_wrap card">
                    <div class="table-responsive">
                      <table class="table mb-0">
                        <thead>
                          <tr class="tr_bgc">
                            <th>메뉴명</th>
                            <th>세부메뉴명/권한명</th>
                          </tr>
                        </thead>                           		                      			            	
		                     	 <c:forEach var="menuCodeListLarge" items="${menuCodeListLarge}">
			                        <tbody class="user_control_bd">                          
			                           <tr id="menuCodeListLargeTr">
			                            <td class="user_control_border" rowspan="10"><input id="menuCodeListLarge" type="checkbox" name="menu_code_idx" value="${menuCodeListLarge.menu_code_idx}" />${menuCodeListLarge.menu_nm}</td>
			                           </tr>
					                   <c:forEach var="menuCodeListMiddle" items="${menuCodeList}">
			                           	  <c:if test="${menuCodeListMiddle.parent_menu == menuCodeListLarge.menu_code_idx}">
					                          <tr id="menuCodeListMiddleTr">
					                            <td class="menu_auth_middle"><input id="menuCodeListMiddle" type="checkbox" name="menu_code_idx" value="${menuCodeListMiddle.menu_code_idx}" />${menuCodeListMiddle.menu_nm}</td>
					                          </tr>
					                          <c:forEach var="menuCodeListSmall" items="${menuCodeList}">
			                           	 			<c:if test="${menuCodeListSmall.parent_menu == menuCodeListMiddle.menu_code_idx}">
							                          <tr id="menuCodeListSmallTr">
							                            <td class="menu_auth_small"><input id="menuCodeListSmall" type="checkbox" name="menu_code_idx" value="${menuCodeListSmall.menu_code_idx}" />${menuCodeListSmall.menu_nm}</td>
							                          </tr>
					                          		</c:if>
					                          </c:forEach>
				                          </c:if>
				                       </c:forEach>                           
			                        </tbody>
								 </c:forEach>						 					
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <script>
            
            	$(function() {
            		// 세부메뉴 전체갯수와 선택된 세부메뉴 갯수가 같으면 전체선택버튼에 checked 
            		if(${menuCodeList.size() == groupMenuList.size()}){
            			$('#allCheck').addClass("checked");
            		}
            		
            		$('#mGroup_idx').val(${getGroup_idx});
        		    var chk = $('input:checkbox[name=menu_code_idx]');

    	        	<c:forEach items="${groupMenuList}" var="item">
    		      		  chk.filter('[value=' + ${item.menu_code_idx} + ']').prop('checked', true).addClass('checked');
	    			</c:forEach>

            	});
				 // 그룹관리 권한 그룹명 변경
           		 function groupChange(e) {

           		  	const group_idx = e.value;          			
           			
	    			$.ajax({
	    				type : 'POST',                
	    				url : '/userAuthGroupAjax.do',    
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
           		// 그룹관리 권한 세부메뉴 전체선택, 취소
     			$('#allCheck').click(function() {
     				var val = true;
     				
     				$('#allCheck').toggleClass("checked");
     				
     				if(!$('#allCheck').attr('class')){
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
     			

     				
     		    // 그룹관리 권한 세부메뉴 분류별 체크박스 제어 
				$('input[type="checkbox"][name="menu_code_idx"]').click(function(){
						var val1 = false;
						var val2 = false;
						var val3 = false;
						
						if($(this).attr('id') == "menuCodeListLarge"){
							
		     				if($(this).is(":checked")){
		     					val1 = true;
		     				}
		     				
		     				$(this).closest('tr').nextUntil("#menuCodeListLargeTr").find('input[type="checkbox"][name="menu_code_idx"]').prop('checked', val1);
						}
						
						if($(this).attr('id') == "menuCodeListMiddle"){

							if($(this).is(":checked")){
		     					val2 = true;
		     				}
		     				
							if(!val2){
		     					$(this).closest('tbody').find('input[type="checkbox"][name="menu_code_idx"]:first').prop('checked', val2);
							}
		     				$(this).closest('tr').nextUntil("#menuCodeListMiddleTr").find('input[type="checkbox"][name="menu_code_idx"]').prop('checked', val2);
		     				
						}
						if($(this).attr('id') == "menuCodeListSmall"){
							
							if($(this).is(":checked")){
		     					val3 = true;
		     				}
							if(!val3){
		     					$(this).closest('tbody').find('input[type="checkbox"][name="menu_code_idx"]:first').prop('checked', val3);
		     					$(this).closest('tr').prevAll("#menuCodeListMiddleTr").find('input[type="checkbox"][name="menu_code_idx"]').prop('checked', val3);
							}	     				
						}
				});
				

            </script>