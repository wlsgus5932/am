<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
            <div class="tab-pane" id="profile" role="tabpanel" style="display:block;">
              <div class="mb-0">
                <!-- 요청내역조회 탭 시작 -->
                <div class="st_wrap st_mv_wrap">
                    <!-- 자료구분 셀렉트 -->
                    <div class="fr_wrap">
                      <div class="mb-3 row fr_1">
	                      <form id="requestHistorySearchForm" name="requestHistorySearchForm" method="post" class="form-horizontal">
	                        <div class="col-md-10">
	                          <label class="col-md-2 col-form-label">구분</label>
	                            <select class="form-select" name="keyword">
	                                <option value="">전체</option>
	                                <option value="erasure">삭제</option>
	                                <option value="keyword">키워드</option>
	                            </select>
	                          <label class="col-md-2 col-form-label">자료구분</label>
	                            <select class="form-select" name="org_nm" onChange="orgCodeChange();">
	                            	<option value="">전체</option>
	                                <c:forEach var="getOrgList" items="${getOrgList}">
	                               		 <option value="${getOrgList.org_nm}">${getOrgList.org_nm}</option>
	                         	    </c:forEach>
	                            </select>
	                          <select class="form-select" name="possession_nm" id="possession_select">
	                              	<c:forEach var="getPosSessionList" items="${getPosSessionList}">
	                              		<option value="${getPosSessionList.possession_nm}">${getPosSessionList.possession_nm}</option>        
	                              	</c:forEach>                     
	                          </select>
	                          <!--  -->
	                            <label class="col-md-2 col-form-label">자료 번호</label>
	                            <!-- <div class="col-md-10"> -->
	                              <input class="form-control" list="datalistOptions" id="exampleDataList" placeholder="자료 번호" name="item_no">
	                              <input class="form-control" list="datalistOptions" id="exampleDataList" placeholder="세부" name="item_detail_no">
	                              <button class="btn btn-secondary waves-effect waves-light btn_ml" type="button" onClick="requestHistorySearchList();">조회</button>
	                      </div>
	                     </form>
                    </div>
                    </div>
                </div>
                <!-- 반려 사유 모달 -->
                <div id="ReturnModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-modal="true" role="dialog">
                  <div class="modal-dialog user-modal">
                      <div class="modal-content">
                          <div class="modal-header mv-modal-header">
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <div class="modal-body mv-modal-body">
                              <div class="mb-0 user-wrap">
                                <div class="st_wrap">
                                  <label class="col-md-2 col-form-label st_title">반려사유</label>
                                </div>
                                <div class="card-body">
                                  <div class="table-responsive">
                                      <table class="table mb-0">
                                          <tbody>
                                              <tr>
                                                <td>명칭</td>
                                                <td id="return_nm"></td>
                                                <td>등록일</td>
                                                <td id="return_regdt"></td>
                                              </tr>
                                              <tr>
                                                <td>사유</td>
                                                <td id="return_reason"></td>
                                              </tr>
                                          </tbody>
                                      </table>
                                  </div>
                              </div>
                            </div>
                            <!--  -->
                          </div>
                      </div>
                  </div>
              </div>
	            <!-- 수정 모달창 -->
	            <div id="code_update_modal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none" aria-hidden="true">
	              <div class="modal-dialog user-modal">
	                <div class="modal-content">
	                  <div class="modal-header mv-modal-header">
	                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="reasonKeywordModBtnClose"></button>
	                  </div>
	                  <div class="modal-body mv-modal-body">
	                    <div class="mb-0 user-wrap">
	                      <div class="st_wrap">
	                        <label class="col-md-2 col-form-label st_title">수정</label>
	                      </div>
	                       <form id="reasonKeywordModForm" name="reasonKeywordModForm" method="post" class="form-horizontal">
		                      <input type="hidden" id="request_idx" name="request_idx" value="" />
		                      <input type="hidden" id="keywordMod" name="keyword" value="" />
		                      <div class="card-body">
		                        <div class="table-responsive">
		                          <table class="table mb-0">
		                            <tbody>
		                              <tr>
		                                <td id="mod_reason_keyword"></td>
		                                <td><input type="text" id="mod_reason_keyword2" name=""/></td>
		                              </tr>
		                            </tbody>
		                          </table>
		                          <button class="btn btn-secondary btn_save" id="reasonKeywordModBtn" type="button" onClick="reasonKeywordMod()">저장</button>
		                        </div>
		                      </div>
	                     	</form>
	                    </div>
	                  </div>
	                </div>
	              </div>
	            </div>
                <!--  -->
                <div class="card-body">
                  <div class="table-responsive">
                      <table class="table mb-0">
                          <thead>
                              <tr class="tr_bgc">
                                  <th>번호</th>
                                  <th>자료구분</th>
                                  <th>자료번호</th>
                                  <th>세부번호</th>
                                  <th>명칭</th>
                                  <th>등록일</th>
                                  <th>구분</th>
                                  <th>승인내역</th>
                                  <th>승인요청내용</th>
                                  <th>수정</th>
                              </tr>
                          </thead>
                          <tbody>
							<c:forEach var="requestHistoryList" items="${requestHistoryList}">
		                        <tr>		                          
		                          <td>${perPageNum + 1 - requestHistoryList.rnum}</td>
		                          <td>${requestHistoryList.org_nm}</td>
<%-- 								  <td>${requestHistoryList.possession_nm}</td> --%>
		                          <td>${requestHistoryList.item_no}</td>
		                          <td>${requestHistoryList.item_detail_no}</td>
		                          <td>${requestHistoryList.item_nm}</td>
		                          <td>${requestHistoryList.reg_date}</td>
		                          <c:choose>
		                          	<c:when test="${requestHistoryList.keyword eq 'keyword'}">
		                          		<td>키워드</td>
		                          	</c:when>
		                          	<c:otherwise>
		                          		<td>삭제</td>
		                          	</c:otherwise>
		                          </c:choose>
		                          <c:choose>
		                          	 <c:when test="${requestHistoryList.approval_state eq 'N'}">
		                          		<td><button data-bs-toggle="modal" data-bs-target="#ReturnModal" type="button" onClick="returnModalBtn('${requestHistoryList.request_idx}','${requestHistoryList.keyword}')">${requestHistoryList.approval_state}</button></td>
		                       		 </c:when>
		                       		 <c:otherwise>
		                       		 	<td><button>${requestHistoryList.approval_state}</button></td>
		                       		 </c:otherwise>
		                          </c:choose>
		                          <td>${requestHistoryList.keyword_list}</td>

		                          
		                          <c:choose>
		                          	<c:when test="${requestHistoryList.approval_state eq 'N' or requestHistoryList.approval_state eq 'F'}">
		                          		<td><button  data-bs-toggle="modal" data-bs-target="#code_update_modal" class="btn btn-secondary waves-effect waves-light btn_ml btn_wh" type="button" onClick="keywordModFormBtn('${requestHistoryList.request_idx}','${requestHistoryList.keyword}')">수정</button></td>
		                          	</c:when>
		                          	<c:otherwise>
		                          		<td><button class="btn btn-secondary waves-effect waves-light btn_ml btn_wh">수정</button></td>
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
		
	            function orgCodeChange() {
				
	    			var queryString = $("form[name=requestHistorySearchForm]").serialize();
	    			
					$.ajax({
						type : 'post',
						url : '/requestHistoryPossessionAjax.do',
						data : queryString,
						dataType : 'html',
						contentType : "application/x-www-form-urlencoded;charset=UTF-8",
						error: function(xhr, status, error){
							alert(error);
						},
						success : function(data){
							$('#possession_select').empty().append(data);
						}
					});
	    		}
	            
	    		<%-- 요청내역조회 조건 검색 --%>
	    		function requestHistorySearchList(){
// 	    			var speciality_code_idx = $('#speciality_code_idx').val();
// 	    			var search_word = $('#search_word').val();
// 	    			var search_type = $('#search_type').val();
	    			// 태그 조건 검색			
	    			var queryString = $("form[name=requestHistorySearchForm]").serialize();
	
	    				$.ajax({
	    					type : 'post',
	    					url : '/requestHistoryAjax.do',
	    					data : queryString,
	    					dataType : 'html',
	    					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
	    					error: function(xhr, status, error){
	    						alert(error);
	    					},
	    					success : function(data){
	    						$('#tab-content').empty().append(data);
	    						$('#possession_select').empty()
// 	    						$('#speciality_code_idx2').val(speciality_code_idx);
// 	    						$('#search_word2').val(search_word);
// 	    						$('#search_type2').val(search_type);
	    					}
	    				});
	    		}
	    		
	    		<%-- 관심자료 페이지 이동 --%>
	    		function goPage(value) {
	    			var perPageNum = $('#perPageNum').val();
	    			var search_word = $('#search_word').val();
	    			var search_type = $('#search_type').val();
	    			var page = value;
	    			$.ajax({
	    				type : 'POST',                 
	    				url : '/requestHistoryAjax.do',   
	    				data:{
	    					perPageNum : perPageNum,
	    					search_type : search_type,
	    					search_word : search_word,
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
	    		
	    		function returnModalBtn(value1, value2){
	    			var request_idx = value1;
	    			var keyword = value2;
	    			
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
	    		
				function keywordModFormBtn(value1, value2){
	    			
	    			var request_idx = value1;
	    			var keyword = value2;
	    			$('#request_idx').val(request_idx);
	    			if(keyword == 'keyword'){
	    				$('#mod_reason_keyword').html('키워드');
	    			}else{
	    				$('#mod_reason_keyword').html('삭제사유');
	    			}
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
    					
    						console.log(data.RefusalReason);
    						
    		    			if(keyword == 'keyword'){
    		    				$('#mod_reason_keyword2').val(data.RefusalReason.keyword_list);
    		    				$('#mod_reason_keyword2').attr('name', 'keyword_list');
    		    				$('#keywordMod').val('keyword');
    		    			}else{
    		    				$('#mod_reason_keyword2').val(data.RefusalReason.erasure_reason);
    		    				$('#mod_reason_keyword2').attr('name', 'erasure_reason');
    		    				$('#keywordMod').val('erasure');
    		    			}
    		    			
//     						$('#return_nm').html(data.RefusalReason.item_nm);
//     						$('#return_regdt').html(data.RefusalReason.reg_date);
//     						$('#return_reason').html(data.RefusalReason.refusal_reason);
    					}
    				});
	    		}
				
	    		function reasonKeywordMod(){
	    			if($('#keywordMod').val() == 'keyword'){
	    				arr =  $('#mod_reason_keyword2').val().toString().split(",");
	    				if(arr.length >5){
	    					alert('키워드는 5개까지 가능합니다.');
	    					return;
	    				}
	    			}
	    			var queryString = $("form[name=reasonKeywordModForm]").serialize();
	    			
	    				$.ajax({
	    					type : 'post',
	    					url : '/reasonKeywordModAjax.do',
	    					data : queryString,
	    					dataType : 'json',
	    					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
	    					error: function(xhr, status, error){
	    						alert(error);
	    					},
	    					success : function(data){
	    						alert("수정되었습니다.");
	    						$('#reasonKeywordModBtnClose').click();
	    							$.ajax({
	    								type : 'POST',                
	    								url : '/requestHistoryAjax.do',    
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
	    		
	    		
            </script>