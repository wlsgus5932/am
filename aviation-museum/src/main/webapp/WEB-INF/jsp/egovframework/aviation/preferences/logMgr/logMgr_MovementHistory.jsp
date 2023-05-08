<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
           <!-- 이동사항 내역로그 -->
            <div class="tab-pane" id="datareview_4" role="tabpanel" style="display:block;">
              <!-- 보기 모달 -->
              <div id="view_Modal_2" class="modal fade hide" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-modal="true" role="dialog">
                <div class="modal-dialog user-modal user_in_modal_wrap user_in_modal_wrap_view">
                    <div class="modal-content">
                        <div class="modal-header mv-modal-header">
                            <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="userModInputClose"></button>
                        </div>
                        <div class="modal-body mv-modal-body">
                            <!-- 사용자 등록 모달 내용 -->
                            <div class="mb-0 user-wrap">
                              <div class="st_wrap">
                                <label class="col-md-2 col-form-label st_title">자세히 보기</label>
                              </div>
                              <!-- 자세히 보기 테이블 시작 -->
                              <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table mb-0">
                                        <thead >
                                          <tr class="tr_bgc">
                                            <th>변경항목명</th>
                                            <th>변경 전 내용</th>
                                            <th>변경 후 내용</th>
                                          </tr>
                                        </thead>
                                        <tbody id="tblList">
<!--                                           <tr> -->
<!--                                             <td>이동일자</td> -->
<!--                                             <td><input  class="custom_search_input custom_search_input_100" type="text" name="" id=""></td> -->
<!--                                             <td><input  class="custom_search_input custom_search_input_100" type="text" name="" id=""></td> -->
<!--                                           </tr> -->
<!--                                           <tr> -->
<!--                                             <td>보관구분</td> -->
<!--                                             <td><input class="custom_search_input custom_search_input_100" type="text" name="" id=""></td> -->
<!--                                             <td><input class="custom_search_input custom_search_input_100" type="text" name="" id=""></td> -->
<!--                                           </tr> -->
<!--                                           <tr> -->
<!--                                             <td>보관처</td> -->
<!--                                             <td><input class="custom_search_input custom_search_input_100" type="text" name="" id=""></td> -->
<!--                                             <td><input class="custom_search_input custom_search_input_100" type="text" name="" id=""></td> -->
<!--                                           </tr> -->
<!--                                           <tr> -->
<!--                                             <td>반입처</td> -->
<!--                                             <td><input class="custom_search_input custom_search_input_100" type="text" name="" id=""></td> -->
<!--                                             <td><input class="custom_search_input custom_search_input_100" type="text" name="" id=""></td> -->
<!--                                           </tr> -->
<!--                                           <tr> -->
<!--                                             <td>이동수량</td> -->
<!--                                             <td><input class="custom_search_input custom_search_input_100" type="text" name="" id=""></td> -->
<!--                                             <td><input class="custom_search_input custom_search_input_100" type="text" name="" id=""></td> -->
<!--                                           </tr> -->
<!--                                           <tr> -->
<!--                                             <td>격납요청자</td> -->
<!--                                             <td><input class="custom_search_input custom_search_input_100" type="text" name="" id=""></td> -->
<!--                                             <td><input class="custom_search_input custom_search_input_100" type="text" name="" id=""></td> -->
<!--                                           </tr> -->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                              <!--  -->
                          </div>
                                        <div class="user_in_modal_footer_wrap">
                                           <!-- <button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" id="userModBtn">저장</button> -->
                                          <button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" id="" data-bs-dismiss="modal">닫기</button>
                                        </div>
                        </div>
                    </div>
                </div>
            </div>
              <!--  -->
              <div class="mb-0">
                <div class="fr_wrap">
					<form id="movementHistoryLogSearchForm" name="movementHistoryLogSearchForm" method="post" class="form-horizontal">                      
	                  <div class="mb-3 row fr_1">
	                    <div class="col-md-10">
	                      <label class="col-md-2 col-form-label">기간</label>
	                      <input class="search_select" type="date" name="start_reg_date" id="start_reg_date"> ~ <input class="search_select" type="date" name="end_reg_date" id="end_reg_date">
	                      <!--  -->
	                      <label class="col-md-2 col-form-label">자료번호</label>
		                        <select class="search_select" name="org_nm" id="org_nm" onChange="orgCodeChange();">
		                        	<option value="">전체</option>
		                            <c:forEach var="getOrgList" items="${getOrgList}">
		                           		 <option value="${getOrgList.org_nm}">${getOrgList.org_nm}</option>
		                     	    </c:forEach>
		                        </select>
		                      <select class="search_select" name="possession_nm" id="possession_select">
		                          	<c:forEach var="getPosSessionList" items="${getPosSessionList}">
		                          		<option value="${getPosSessionList.possession_nm}">${getPosSessionList.possession_nm}</option>        
		                          	</c:forEach>                     
		                      </select>
	                      <input class="custom_search_input" type="text" placeholder="자료번호" id="item_no" name="item_no">
	                      <input class="custom_search_input" type="text" placeholder="세부번호" id="item_detail_no" name="item_detail_no">
	                    </div>
	                    <div class="col-md-10">
	                      <label class="col-md-2 col-form-label">검색</label>
	                      <select class="form-select" id="search_type" name="search_type">
	                        <option selected value="">전체</option>
	                        <option value="member_id">사용자ID</option>
	                        <option value="member_nm">사용자명</option>
	                      </select>
	                      <input class="custom_search_input" type="text" id="search_word" name="search_word">
	                      <button class="custom_btn btn_707070" type="button" onClick="movementHistoryLogSearchList();">조회</button>
	                    </div>
	                  </div>
                  	</form>
                </div>
              </div>
              <!-- -->
              <div class="st_wrap st_mv_wrap">
                <button class="custom_btn btn_ex" type="button" onclick="movementHistoryExcelList()">엑셀파일</button>
                <div class="all_number_text">총 건수: ${totalCount}건</div>
              </div>
              <!--  -->
              <div class="mb-0">
                <!-- 엑셀 모달 -->
                <div id="myModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
                  <div class="modal-dialog">
                      <div class="modal-content">
                          <div class="modal-header mv-modal-header">
                              <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <div class="modal-body mv-modal-body">
                              <!-- 엑셀 모달 내용 -->
                              <div class="mb-0 move-wrap">
                                <div class="st_wrap">
                                  <label class="col-md-2 col-form-label st_title">이동사항 등록 및 수정</label>
                                </div>
                                <div class="card-body">
                                  <div class="table-responsive">
                                      <table class="table mb-0">
                                          <tbody>
                                              <tr>
                                                <td>이동일자</td>
                                                  <td>
                                                    <select class="form-select st_select">
                                                      <option disabled selected>선택</option>
                                                      <option>더미1</option>
                                                      <option>더미2</option>
                                                      <option>더미3</option>
                                                    </select>
                                                  </td>
                                              </tr>
                                              <tr>
                                                <td>보관구분</td>
                                                  <td>
                                                    <select class="form-select st_select">
                                                      <option disabled selected>선택</option>
                                                      <option>더미1</option>
                                                      <option>더미2</option>
                                                      <option>더미3</option>
                                                    </select>
                                                  </td>
                                                  <td>
                                                    <select class="form-select st_select">
                                                      <option disabled selected>선택</option>
                                                      <option>더미1</option>
                                                      <option>더미2</option>
                                                      <option>더미3</option>
                                                    </select>
                                                  </td>
                                              </tr>
                                              <tr>
                                                <td>보관처</td>
                                                <td>
                                                  <select class="form-select st_select">
                                                    <option disabled selected>선택</option>
                                                    <option>더미1</option>
                                                    <option>더미2</option>
                                                    <option>더미3</option>
                                                  </select>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td>반입처</td>
                                                <td>
                                                  <select class="form-select st_select">
                                                    <option disabled selected>선택</option>
                                                    <option>더미1</option>
                                                    <option>더미2</option>
                                                    <option>더미3</option>
                                                  </select>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td>이동수량</td>
                                                <td>
                                                  <select class="form-select st_select">
                                                    <option disabled selected>선택</option>
                                                    <option>더미1</option>
                                                    <option>더미2</option>
                                                    <option>더미3</option>
                                                  </select>
                                                </td>
                                                <td>현수량</td>
                                                <td>
                                                  <select class="form-select st_select">
                                                    <option disabled selected>선택</option>
                                                    <option>더미1</option>
                                                    <option>더미2</option>
                                                    <option>더미3</option>
                                                  </select>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td>격납요청자</td>
                                                <td>
                                                  <input class="form-control st_input" type="text" name="" id="">
                                                </td>
                                                <td>실제전시여부</td>
                                                <td> <input type="checkbox" name="" id=""> </td>
                                              </tr>
                                              <tr>
                                                <td>비고</td>
                                                <td>
                                                  <input class="form-control st_input" type="text" name="" id="">
                                                </td>
                                              </tr>
                                          </tbody>
                                      </table>
                                      <button class="btn btn-secondary btn_save">저장</button>
                                  </div>
                              </div>
                            </div>
                            <!--  -->
                            <div class="mb-0 move-wrap">
                              <div class="st_wrap">
                                <label class="col-md-2 col-form-label st_title">과거 이동처 코드</label>
                              </div>
                              <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table mb-0">
                                        <thead>
                                            <tr class="tr_bgc">
                                                <th>번호</th>
                                                <th>과거이동처</th>
                                                <th>현수량</th>
                                                <th>입력값선택</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th scope="row">1</th>
                                                <td>
                                                20200000
                                                </td>
                                                <td>
                                                  0
                                                </td>
                                                <td>
                                                  <select class="form-select st_select">
                                                    <option disabled selected>선택</option>
                                                    <option>더미1</option>
                                                    <option>더미2</option>
                                                    <option>더미3</option>
                                                  </select>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                          </div>
                          </div>
                      </div>
                  </div>
              </div>
                <div class="card-body">
                  <div class="table-responsive">
                      <table class="table mb-0">
                          <thead>
                              <tr class="tr_bgc">
                                <th>변경일자</th>
                                <th>소장구분</th>
                                <th>자료번호</th>
                                <th>세부번호</th>
                                <th>수정자</th>
                                <th>수정자IP</th>
                                <th>상태</th>
                                <th>확인</th>
                              </tr>
                          </thead>
                          <tbody>
                             <c:forEach var="getMovementLogList" items="${getMovementLogList}">
	                              <tr>
	                                <td>${getMovementLogList.access_date}</td>
	                                <td>${getMovementLogList.possession_nm}</td>
	                                <td>${getMovementLogList.item_no}</td>
	                                <td>${getMovementLogList.item_detail_no}</td>
	                                <td>${getMovementLogList.member_nm}</td>
	                                <td>${getMovementLogList.access_ip}</td>
	                                <td>
	                                	<c:choose>
		                                	<c:when test="${getMovementLogList.access_type eq 0}">
		                               			 삽입
		                               		</c:when>
		                                	<c:when test="${getMovementLogList.access_type eq 1}">
		                               			 수정
		                               		</c:when>
		                                	<c:when test="${getMovementLogList.access_type eq 2}">
		                               			 삭제
		                               		</c:when>		                               				                               		
	                               		</c:choose>
	                               	</td>
	                                <td><button class="custom_btn btn_edit" data-bs-toggle="modal" data-bs-target="#view_Modal_2" type="button" onclick="movementLogView('${getMovementLogList.item_idx}')">보기</button></td>
	                              </tr>
                             </c:forEach>
                          </tbody>
                      </table>
<!--                          <ul class="btn-group pagination"> -->
<%-- 						    <c:if test="${pageMaker.prev }"> --%>
<!-- 						    <li class="page-item"> -->
<%-- 						        <a class="page-link" href='javascript:;' onclick="goPage('${pageMaker.startPage-1 }');"><i class="fa fa-chevron-left"></i></a> --%>
<!-- 						    </li> -->
<%-- 						    </c:if> --%>
<%-- 						    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum"> --%>
<!-- 						    <li class="page-item"> -->
<%-- 						        <a class="page-link" href='javascript:;' onclick="goPage('${pageNum}');"><i class="fa">${pageNum }</i></a> --%>
<!-- 						    </li> -->
<%-- 						    </c:forEach> --%>
<%-- 						    <c:if test="${pageMaker.next && pageMaker.endPage >0 }"> --%>
<!-- 						    <li class="page-item"> -->
<%-- 						        <a class="page-link" href="javascript:;" onclick="goPage('${pageMaker.endPage+1 }');"><i class="fa fa-chevron-right"></i></a> --%>
<!-- 						    </li> -->
<%-- 						    </c:if> --%>
<!-- 						</ul>  -->
                  </div>
              </div>
            </div>
            </div>
                         <ul class="btn-group pagination">
						    <c:if test="${pageMaker.prev }">
						    <li class="page-item">
						        <a class="page-link" href='javascript:;' onclick="goPage('${pageMaker.startPage-1 }');"><i class="fa fa-chevron-left"></i></a>
						    </li>
						    </c:if>
						    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
						    <li class="page-item">
						        <a class="page-link" href='javascript:;' onclick="goPage('${pageNum}');"><i class="fa">${pageNum }</i></a>
						    </li>
						    </c:forEach>
						    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
						    <li class="page-item">
						        <a class="page-link" href="javascript:;" onclick="goPage('${pageMaker.endPage+1 }');"><i class="fa fa-chevron-right"></i></a>
						    </li>
						    </c:if>
						</ul>             
            <!--  -->
            <script>

	            $(function() {
	            	// 자료구분 선택 //
	            	$('#org_nm').val('${sessionScope.userSessionOrgCodeNm}');
	            	orgCodeChange();
	            	////////////////
	  				
	            })
		       function orgCodeChange() {
	  				
	    			var queryString = $("form[name=movementHistoryLogSearchForm]").serialize();
	    			
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
	            
	       		<%-- 전문정보 등록 로그 조건 검색 --%>
	    		function movementHistoryLogSearchList(){

	    			var queryString = $("form[name=movementHistoryLogSearchForm]").serialize();
	    			
	    			var org_nm = $('#org_nm').val();
	    			var possession_select = $('#possession_select').val();
	    			var item_no = $('#item_no').val();
	    			var item_detail_no = $('#item_detail_no').val();
	    			var start_reg_date = $('#start_reg_date').val();
	    			var end_reg_date = $('#end_reg_date').val();
	    			var search_word = $('#search_word').val();
	    			var search_type = $('#search_type').val();
	    			
	    				$.ajax({
	    					type : 'post',
	    					url : 'movementHistoryAjax.do',
	    					data : queryString,
	    					dataType : 'html',
	    					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
	    					error: function(xhr, status, error){
	    						alert(error);
	    					},
	    					success : function(data){
	    						$('#search_org_nm').val(org_nm);
	      						$('#search_possession_nm').val(possession_select);
	      						$('#search_item_no').val(item_no);
	      						$('#search_item_detail_no').val(item_detail_no);
	      						$('#search_start_reg_date').val(start_reg_date);
	      						$('#search_end_reg_date').val(end_reg_date);
	      						$('#search_search_type').val(search_type);
	      						$('#search_search_word').val(search_word);
	      						
	    						$('#tab-content').empty().append(data);
	    						
//	     						$('#org_nm').val(org_nm);
//	     						$('#possession_select').val(possession_select);
//	     						$('#item_no').val(item_no);
//	       						$('#item_detail_no').val(item_detail_no);
//	       						$('#start_reg_date').val(start_reg_date);
//	       						$('#end_reg_date').val(end_reg_date);
//	       						$('#search_type').val(search_type);
//	       						$('#search_word').val(search_word);
	    						$('#search_word').focus();
	    						
	      						
	    					}
	    				});
	    		}
	    		
	    		<%-- 페이지 이동 --%>
	    		function goPage(value) {
//	     			var search_word = $('#search_word').val();
//	     			var search_type = $('#search_type').val();
	    			var page = value;
	    			$('#search_page').val(value);
					var queryString = $("form[name=ExcelForm]").serialize();
	    		
					$.ajax({
	    				type : 'POST',                 
	    				url : '/movementHistoryAjax.do',   
	    				data: queryString,
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
	    		
	    		function movementLogView(value){
	    			$('#tblList').empty();
	    			var item_idx = value;
	    			
					$.ajax({
	    				type : 'POST',                 
	    				url : '/movementHistoryViewAjax.do',   
	    				data: {item_idx : item_idx},
	    				dataType : "json",           
	    				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
	    				error : function() {        
	    					alert('통신실패!');
	    				},
	    				success : function(data) {  
							
	    					 $.each(data.getMovementDetailLogList, function(idx, item){
	    						
	    						 var new_dataEtc = [];
	    						 var step = 0;
	    						 var jold_data = '';
	    						 var jnew_data = '';
	    						 
	    						 if(item.old_data != ''){
	    							 jold_data =JSON.parse(item.old_data)
	    						 }
								 jnew_data =JSON.parse(item.new_data)
								 	
								 if(item.old_data != '' && item.old_data != null){
		    						 $.each(jold_data, function(idx, item){
		    				              var old_dataJson = jold_data[idx];
		    				              var new_dataJson = jnew_data[idx];
	
		    				              $.each(new_dataJson, function (idx3, item3) {
		    				            	  new_dataEtc.push(item3);
				    	                  });	    				              
		    				              
		    				              $.each(old_dataJson, function (idx2, item2) {			    				            	
		 		    	                        $('#tblList').append("<tr><td>" + idx2 + "</td><td>"
		 		    	                            + item2 + "</td><td>"+new_dataEtc[step]+"</td></tr>");
		 		    	                        step++;
				    	                  });
		    						 })
								 }else{
									 $.each(jnew_data, function(idx, item){
		    				              var new_dataJson = jnew_data[idx];
	
		    				              $.each(new_dataJson, function (idx3, item3) {
		    				            	  
		    				            	  $('#tblList').append("<tr><td>" + idx3 + "</td><td></td><td>"+item3+"</td></tr>");
			 		    	                      
				    	                  });	    				              
	
		    						 })
								 }
		    					 
	    					 })
	    				}
	    			});
	    		}
	    		
	    		function movementHistoryExcelList() {
	    			var $form = $('#ExcelForm');
	    				$('#search_page').val(1);
	    				
	    				$form.attr("action", "/movementHistoryExcelDownload.do");
	    				$form.submit();
	    		}
            </script>