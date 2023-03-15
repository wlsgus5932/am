<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
            <!-- 키워드 신청 탭 시작 -->
            <div class="tab-pane" id="messages" role="tabpanel" style="display:block;">
              <!-- 데이터 전환 모달 -->
              <div id="NomalModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <p>조회된 모든 소장품 데이터를 전환 하시겠습니까</p>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-primary waves-effect waves-light">확인</button>
                      <button type="button" class="btn btn-secondary waves-effect" data-bs-dismiss="modal">취소</button>
                    </div>
                  </div>
                </div>
              </div>
              
               <!-- 반려 사유 모달 -->
	         <div id="refusalModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
	           <div class="modal-dialog user-modal">
	               <div class="modal-content">
	                   <div class="modal-header mv-modal-header">
	                       <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
	                       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="refusalModalClose"></button>
	                   </div>
	                   <div class="modal-body mv-modal-body">
	                       <!-- 그룹 등록 모달 내용 -->
	                       <div class="mb-0 user-wrap">
	                         <div class="st_wrap">
	                           <label class="col-md-2 col-form-label st_title">반려 사유</label>
	                         </div>
	                         <div class="card-body">
	                           <div class="table-responsive">
	                         	  <form method="post" name="refusalModalform">    
	                         	  <input type="hidden" id="approval_state" name="approval_state" value="N" />
		                               <table class="table mb-0">
		                                   <tbody>
		                                       <tr>
		                                           <td>
		                                             <textarea type="text" name="refusal_reason" id="refusal_reason"></textarea>
		                                           </td>
		                                       </tr>
		                                   </tbody>
		                               </table>
	                              	   <button class="btn btn-secondary btn_save" type="button"onclick="allRefusalApproval()">저장</button>
	                               </form>
	                           </div>
	                           </div>
	                       </div>
	                     </div>
	                     <!--  -->
	                   </div>
	               </div>
	           </div>
	           <!-- -->
             <!-- 반려 사유 모달 -->
	         <div id="refusalModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
	           <div class="modal-dialog user-modal">
	               <div class="modal-content">
	                   <div class="modal-header mv-modal-header">
	                       <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
	                       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="refusalModalClose"></button>
	                   </div>
	                   <div class="modal-body mv-modal-body">
	                       <!-- 그룹 등록 모달 내용 -->
	                       <div class="mb-0 user-wrap">
	                         <div class="st_wrap">
	                           <label class="col-md-2 col-form-label st_title">반려 사유</label>
	                         </div>
	                         <div class="card-body">
	                           <div class="table-responsive">
	                         	  <form method="post" name="refusalModalform">    
	                         	  <input type="hidden" id="approval_state" name="approval_state" value="N" />
		                               <table class="table mb-0">
		                                   <tbody>
		                                       <tr>
		                                           <td>
		                                             <textarea type="text" name="refusal_reason" id="refusal_reason"></textarea>
		                                           </td>
		                                       </tr>
		                                   </tbody>
		                               </table>
	                              	   <button class="btn btn-secondary btn_save" type="button"onclick="allRefusalApproval()">저장</button>
	                               </form>
	                           </div>
	                           </div>
	                       </div>
	                     </div>
	                     <!--  -->
	                   </div>
	               </div>
	           </div>
              <!-- -->
             <!-- 반려 사유 모달2 -->
	         <div id="refusalModal2" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
	           <div class="modal-dialog user-modal">
	               <div class="modal-content">
	                   <div class="modal-header mv-modal-header">
	                       <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
	                       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="selectRefusalModalClose"></button>
	                   </div>
	                   <div class="modal-body mv-modal-body">
	                       <!-- 반려 사유 모달2 내용 -->
	                       <div class="mb-0 user-wrap">
	                         <div class="st_wrap">
	                           <label class="col-md-2 col-form-label st_title">반려 사유</label>
	                         </div>
	                         <div class="card-body">
	                           <div class="table-responsive">
<!-- 	                         	  <form method="post" name="selectRefusalModalform">     -->
	                         	  <input type="hidden" id="approval_state" name="approval_state" value="N" />
		                               <table class="table mb-0">
		                                   <tbody>
		                                       <tr>
		                                           <td>
		                                             <textarea type="text" name="refusal_reason" id="refusal_reason2"></textarea>
		                                           </td>
		                                       </tr>
		                                   </tbody>
		                               </table>
	                              	   <button class="btn btn-secondary btn_save" type="button" onclick="selectRefusalApproval()">저장</button>
<!-- 	                               </form> -->
	                           </div>
	                           </div>
	                       </div>
	                     </div>
	                     <!--  -->
	                   </div>
	               </div>
	           </div>
              <!-- -->
             <!-- 반려 사유 모달3 -->
	         <div id="refusalModal3" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
	           <div class="modal-dialog user-modal">
	               <div class="modal-content">
	                   <div class="modal-header mv-modal-header">
	                       <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
	                       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="selectRefusalModalClose2"></button>
	                   </div>
	                   <div class="modal-body mv-modal-body">
	                       <!-- 반려 사유 모달2 내용 -->
	                       <div class="mb-0 user-wrap">
	                         <div class="st_wrap">
	                           <label class="col-md-2 col-form-label st_title">반려 사유</label>
	                         </div>
	                         <div class="card-body">
	                           <div class="table-responsive">
	                         	  <form method="post" name="selectRefusalModalform">    
	                         	  <input type="hidden" id="group_seqList" name="group_seqList" value="" />
	                         	  <input type="hidden" id="approval_state" name="approval_state" value="N" />
		                               <table class="table mb-0">
		                                   <tbody>
		                                       <tr>
		                                           <td>
		                                             <textarea type="text" name="refusal_reason" id="refusal_reason3"></textarea>
		                                           </td>
		                                       </tr>
		                                   </tbody>
		                               </table>
	                              	   <button class="btn btn-secondary btn_save" type="button" onclick="selectRefusalApproval2()">저장</button>
	                               </form>
	                           </div>
	                           </div>
	                       </div>
	                     </div>
	                     <!--  -->
	                   </div>
	               </div>
	           </div>
              <!-- -->
              <div class="mb-0">
	              <div class="custom_btn_wrap">
	                <div class="auto_btn_left">
	               		<button class="custom_btn btn_3d3d3d" type="button" onclick="allApproval('Y')">전체승인</button>
	                	<button class="custom_btn btn_c58672" type="button" data-bs-toggle="modal" data-bs-target="#refusalModal">전체반려</button>
	                	<button class="custom_btn btn_3d3d3d" type="button" onclick="selectApproval('Y')">선택승인</button>
	                	<button class="custom_btn btn_c58672" type="button" data-bs-toggle="modal" data-bs-target="#refusalModal2">선택반려</button>
	                	<button type="button" data-bs-toggle="modal" data-bs-target="#refusalModal3" style="display:none;" id="approvalBtn">반려</button>
	                </div>
	              <form id="keywordSearchForm" name="keywordSearchForm" method="post" class="form-horizontal" style="width: 100% !important;">            
	                <div class="auto_btn_right">
	                  리스트 출력 갯수 :
	                    <select class="search_select" id="perPageNum" name="perPageNum" onchange="keywordPerPageNum();">	                      
	                      <option value="10">10</option>
	                      <option value="15">15</option>
	                      <option value="20">20</option>
	                    </select>
	                </div>
	              </form>
	              </div>              
                <div class="card-body">
                  <div class="table-responsive">
                      <table class="table mb-0">
                          <thead>
                              <tr class="tr_bgc">
                                  <th><input type="checkbox" id="allCheck" value="" onchange="agreeAllCheck();"></th>
                                  <th>번호</th>
                                  <th>소장구분</th>
                                  <th>자료번호</th>
                                  <th>세부번호</th>
                                  <th>명칭</th>
                                  <th>내용</th>
                                  <th>등록일</th>
                                  <th>신청자</th>
                                  <th>승인여부</th>
                              </tr>
                          </thead>
                          <tbody>
                          	<c:forEach var="keywordList" items="${keywordList}">
                              <tr>
                                  <td><input type="checkbox" name="group_seqList" class="check_temp" id="" value="${keywordList.request_idx}"></td>
                                  <td>${perPageNum + 1 - keywordList.rnum}</td>
                                  <td>
                                    ${keywordList.org_nm}
                                  </td>
                                  <td>
                                    ${keywordList.item_no}
                                  </td>
                                   <td>
                                    ${keywordList.item_detail_no}
                                   </td>
                                   <td>
                                    ${keywordList.item_nm}
                                   </td>
                                   <td>
                                    테스트
                                   </td>
                                   <td>
                                    ${keywordList.reg_date}
                                   </td>
                                   <td>
                                    ${keywordList.reg_user}
                                   </td>
                                  <c:choose>
                                  	<c:when test="${keywordList.approval_state != 'F'}">
	                                    <c:choose>
                                 		   <c:when test="${keywordList.approval_state != 'Y'}">
			                                   <td>
			                                    <button class="custom_btn btn_edit" data-bs-toggle="modal" data-bs-target="#ReturnModal" type="button" onClick="returnModalBtn('${keywordList.request_idx}')">반려</button>
			                                   </td>
	                                   	   </c:when>
	                                   	   <c:otherwise>
	                                   	   	   <td>
			                                    <button>승인</button>
			                                   </td>
	                                   	   </c:otherwise>
	                                   	</c:choose>
	                                </c:when>
	                                <c:otherwise>  
	                                   <td>
		                                <select class="form-select st_select" onchange="approvalProcess(this.value, ${keywordList.request_idx})">
							                  <option value="Y">승인</option>
							                  <option value="F" selected>미승인</option>
							                  <option value="N">반려</option>
		                                </select>
		                               </td>
		                            </c:otherwise> 
	                              </c:choose> 
                              </tr>
                            </c:forEach>
                             
                          </tbody>
                      </table>
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
                  </div>
              </div>
            </div>
            </div>
            
            <script>
	    		$('input[type="text"]').keydown(function() {
		  			  if (event.keyCode === 13) {
		  			    event.preventDefault();
		  			  };
				});
	    		
	    		<%-- 페이지 이동 --%>
	    		function goPage(value) {
	    			var perPageNum = $('#perPageNum').val();
// 	    			var search_word = $('#search_word').val();
// 	    			var search_type = $('#search_type').val();
	    			var page = value;
	    			$.ajax({
	    				type : 'POST',                 
	    				url : '/keywordListAjax.do',   
	    				data:{
	    					perPageNum : perPageNum,
// 	    					search_type : search_type,
// 	    					search_word : search_word,
	    					page : page
	    				},
	    				dataType : "html",           
	    				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
	    				error : function() {        
	    					alert('통신실패!');
	    				},
	    				success : function(data) {  
	    					$('#tab-content').empty().append(data);
//     						$('#perPageNum').val(perPageNum);
//     						$('#search_word').val(search_word);
//     						$('#search_type').val(search_type);
	    				}
	    			});
	    		}
	    		
	    		function allApproval(value){
					var approval_state = value; 
				    var allApproval = "Y"
				    
	    			if(approval_state == 'Y'){
	    				var check_submit = confirm('전체승인 하시겠습니까?');
	    			}
	    			
	    			if(check_submit){
    					$.ajax({
    						type : 'post',
    						url : '/keywordApprovalModAjax.do',
    						data : {
    							allApproval : allApproval,
    							approval_state : approval_state
    						},
    						dataType : 'json',
    						contentType : "application/x-www-form-urlencoded;charset=UTF-8",
    						error: function(xhr, status, error){
    							alert(error);
    						},
    						success : function(success){
    							alert('처리되었습니다.');
//     							$('#tagModBtnClose').click();
    							$.ajax({
    								type : 'POST',                 
    								url : '/keywordListAjax.do',   
    								dataType : "html",           
    								contentType : "application/x-www-form-urlencoded;charset=UTF-8",
    								error : function() {        
    									alert('통신실패!');
    								},
    								success : function(data) {  
    									$('#tab-content').empty().append(data);
    									
    								}
    							});
    						}
    					});
	    			}
	    		}
	    		
	    		function allRefusalApproval(){
					
	    			var check_submit = confirm('전체반려 하시겠습니까?');
	    			
	    			var queryString = $("form[name=refusalModalform]").serialize();

	    			if(check_submit){
    					$.ajax({
    						type : 'post',
    						url : '/keywordApprovalModAjax.do',
    						data : queryString ,
    						dataType : 'json',
    						contentType : "application/x-www-form-urlencoded;charset=UTF-8",
    						error: function(xhr, status, error){
    							alert(error);
    						},
    						success : function(success){
    							alert('처리되었습니다.');
    							$('#refusalModalClose').click();
    							$.ajax({
    								type : 'POST',                 
    								url : '/keywordListAjax.do',   
    								dataType : "html",           
    								contentType : "application/x-www-form-urlencoded;charset=UTF-8",
    								error : function() {        
    									alert('통신실패!');
    								},
    								success : function(data) {  
    									$('#tab-content').empty().append(data);
    									
    								}
    							});
    						}
    					});
	    			}
	    		}
	    		
	    		function selectApproval(value){
	    			var approval_state = value; 
	    			
	    			if(!$('input:checkbox[name="group_seqList"]').is(':checked')){
	    				alert("선택하신 신청내역이 없습니다.");

	    				return false;
	    			}
	    			
	    			if(approval_state == 'Y'){
	    				var check_submit = confirm('선택승인 하시겠습니까?');
	    			}
	    			
	    			var group_seqList = [];
	    			
	    			$('.check_temp:checked').each(function(i){
	    				group_seqList.push($(this).val());
	    			});
	    			if(check_submit){
    					$.ajax({
    						type : 'post',
    						url : '/keywordApprovalModAjax.do',
    						data : {
    							approval_state : approval_state,
    							group_seqList : group_seqList
    						},
    						dataType : 'json',
    						contentType : "application/x-www-form-urlencoded;charset=UTF-8",
    						error: function(xhr, status, error){
    							alert(error);
    						},
    						success : function(success){
    							alert('처리되었습니다.');
//     							$('#tagModBtnClose').click();
    							$.ajax({
    								type : 'POST',                 
    								url : '/keywordListAjax.do',   
    								dataType : "html",           
    								contentType : "application/x-www-form-urlencoded;charset=UTF-8",
    								error : function() {        
    									alert('통신실패!');
    								},
    								success : function(data) {  
    									$('#tab-content').empty().append(data);
    									
    								}
    							});
    						}
    					});
	    			}
	    		}
	    		
	    		function selectRefusalApproval(){
	    			
	    			if(!$('input:checkbox[name="group_seqList"]').is(':checked')){
	    				alert("선택하신 신청내역이 없습니다.");

	    				return false;
	    			}	    			
	    			
	    			var check_submit = confirm('선택반려 하시겠습니까?');
	    			
// 	    			var queryString = $("form[name=selectRefusalModalform]").serialize();
	    			
	    			var group_seqList = [];
	    			
	    			$('.check_temp:checked').each(function(i){
	    				group_seqList.push($(this).val());
	    			});
	    			
	    			var refusal_reason = $('#refusal_reason2').val();
	    			if(check_submit){
    					$.ajax({
    						type : 'post',
    						url : '/keywordApprovalModAjax.do',
    						data : {
    							refusal_reason : refusal_reason,
    							approval_state : "N",
    							group_seqList : group_seqList
    						},
    						dataType : 'json',
    						contentType : "application/x-www-form-urlencoded;charset=UTF-8",
    						error: function(xhr, status, error){
    							alert(error);
    						},
    						success : function(success){
    							alert('처리되었습니다.');
    							$('#selectRefusalModalClose').click();
    							$.ajax({
    								type : 'POST',                 
    								url : '/keywordListAjax.do',   
    								dataType : "html",           
    								contentType : "application/x-www-form-urlencoded;charset=UTF-8",
    								error : function() {        
    									alert('통신실패!');
    								},
    								success : function(data) {  
    									$('#tab-content').empty().append(data);
    									
    								}
    							});
    						}
    					});
	    			}
	    		}	    		
	    		
	    		<%-- 키워드신청 리스트 출력 갯수 --%>
	    		function keywordPerPageNum() {
	    			var perPageNum = $('#perPageNum').val();

	    			$.ajax({
	    				type : 'POST',                 
	    				url : '/keywordListAjax.do',   
	    				data:{
	    					perPageNum : perPageNum
	    				},
	    				dataType : "html",           
	    				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
	    				error : function() {        
	    					alert('통신실패!');
	    				},
	    				success : function(data) {  
	    					$('#tab-content').empty().append(data);
    						$('#perPageNum').val(perPageNum);

	    				}
	    			});
	    			  
	    		};
	    		
	    		function approvalProcess(value, value2){
	    			var approval_state = value;
	    			var group_seqList = [];
	    			group_seqList.push(value2);
	    			
	    			if(approval_state == 'Y'){

		    			var check_submit = confirm('승인 하시겠습니까?');
		    			
		    			if(check_submit){
	    					$.ajax({
	    						type : 'post',
	    						url : '/keywordApprovalModAjax.do',
	    						data : {
	    							approval_state : approval_state,
	    							group_seqList : group_seqList
	    						},
	    						dataType : 'json',
	    						contentType : "application/x-www-form-urlencoded;charset=UTF-8",
	    						error: function(xhr, status, error){
	    							alert(error);
	    						},
	    						success : function(success){
	    							alert('처리되었습니다.');
//	     							$('#tagModBtnClose').click();
	    							$.ajax({
	    								type : 'POST',                 
	    								url : '/keywordListAjax.do',   
	    								dataType : "html",           
	    								contentType : "application/x-www-form-urlencoded;charset=UTF-8",
	    								error : function() {        
	    									alert('통신실패!');
	    								},
	    								success : function(data) {  
	    									$('#tab-content').empty().append(data);
	    									
	    								}
	    							});
	    						}
	    					});
		    			}
	    				
	    			}else if(approval_state == 'N'){
	    				$('#group_seqList').val(value2);
	    				$('#approvalBtn').click();
	    			}
	    		}
	    		
	    		
	    		function selectRefusalApproval2(){
	    			
	    			var check_submit = confirm('반려 하시겠습니까?');
	    			
	    			var queryString = $("form[name=selectRefusalModalform]").serialize();
	    			    			
	    			if(check_submit){
    					$.ajax({
    						type : 'post',
    						url : '/keywordApprovalModAjax.do',
    						data : queryString ,
    						dataType : 'json',
    						contentType : "application/x-www-form-urlencoded;charset=UTF-8",
    						error: function(xhr, status, error){
    							console.log('error');
    							alert(error);
    						},
    						success : function(success){
    							alert('처리되었습니다.');
    							$('#selectRefusalModalClose2').click();
    							$.ajax({
    								type : 'POST',                 
    								url : '/keywordListAjax.do',   
    								dataType : "html",           
    								contentType : "application/x-www-form-urlencoded;charset=UTF-8",
    								error : function() {        
    									alert('통신실패!');
    								},
    								success : function(data) {  
    									$('#tab-content').empty().append(data);
    									
    								}
    							});
    						}
    					});
	    			}
	    		}
	    			    		
	    		function returnModalBtn(value1){
	    			var request_idx = value1;
	    			var keyword = 'keyword';
	    			
    				$.ajax({
    					type : 'post',
    					url : '/refusalReasonAjax.do',
	    				data:{
	    					request_idx : request_idx,
	    					keyword : keyword
	    				},
    					dataType : 'json',
    					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
    					error: function(xhr, status, error){
    						alert(error);
    					},
    					success : function(data){
    						$('#return_nm').html(data.RefusalReason.item_nm);
    						$('#return_regdt').html(data.RefusalReason.reg_date);
    						$('#return_reason').html(data.RefusalReason.refusal_reason);
    					}
    				});

	    		}
            </script>