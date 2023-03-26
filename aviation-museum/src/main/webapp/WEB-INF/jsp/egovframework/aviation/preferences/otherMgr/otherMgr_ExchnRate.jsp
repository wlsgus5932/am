<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
            <!-- 환율정보관리 탭  -->
            <div class="tab-pane" id="profile" role="tabpanel" style="display:block;">
              <!-- 선택삭제 모달 -->
              <div id="DelModal1" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-modal="true" role="dialog">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <p>N건의 관심자료를 삭제하시겠습니까?</p>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-primary waves-effect waves-light" id="exchnRateDelBtn">확인</button>
                      <button type="button" class="btn btn-secondary waves-effect" data-bs-dismiss="modal" id="exchnRateDelBtnClose">취소</button>
                    </div>
                  </div>
                </div>
              </div>
              <!-- ㅎ 모달 -->
              <div id="TagModal-11" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
                <div class="modal-dialog user-modal preferences_deit_modal_wrap">
                    <div class="modal-content">
                        <div class="modal-header mv-modal-header">
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="exchnRateInsBtnClose"></button>
                        </div>
                        <div class="modal-body mv-modal-body">
                            <div class="mb-0 user-wrap">
                              <div class="st_wrap">
                                <label class="col-md-2 col-form-label st_title">환율 등록</label>
                              </div>
                              <div class="card-body">
                                <div class="table-responsive">
                                    <form action="/exchnRateInsert.do" method="post" name="exchnRateInsertForm">
	                                    <table class="table mb-0">
	                                        <tbody>
	                                            <tr>
	                                              <td>제공자이름</td>
	                                                <td>
	                                                  <input class="custom_search_input user_in_modal_input" type="text" name="provider_nm" id="insExchnRateNm">
	                                                </td>
	                                            </tr>
	                                            <tr>
	                                              <td>제공주소</td>
	                                                <td>
	                                                  <input class="custom_search_input user_in_modal_input" type="text" name="service_url" id="insExchnRateServiceUrl">
	                                                </td>
	                                            </tr>
<!-- 	                                            <tr> -->
<!-- 	                                              <td>순서</td> -->
<!-- 	                                                <td> -->
<!-- 	                                                  <input type="text" name="seq" id="insExchnRateSeq"> -->
<!-- 	                                                </td> -->
<!-- 	                                            </tr> -->
	                                            <tr>
	                                              <td>사용 여부</td>
	                                              <td>
	                                                <input type="radio" name="enabled" value="Y">사용
	                                                <input type="radio" name="enabled" value="N">미사용
	                                              </td>
	                                            </tr>
	                                        </tbody>
	                                    </table>
                                   		
                                	</form>
                                </div>
                                </div>
                            </div>
                            	<div class="user_in_modal_footer_wrap">
                          				 <button class="custom_btn btn_c58672 user_in_modal_footer_btn" id="exchnRateInsBtn">저장</button>
	                             	     <button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" id="" data-bs-dismiss="modal">닫기</button>
	                            </div>
                          </div>
                        </div>
                    </div>
                </div>
              <!-- 태그수정 모달 -->
              <div id="TagModal-22" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
                <div class="modal-dialog user-modal preferences_deit_modal_wrap">
                    <div class="modal-content">
                        <div class="modal-header mv-modal-header">
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="exchnRateModBtnClose"></button>
                        </div>
                        <div class="modal-body mv-modal-body">
                            <div class="mb-0 user-wrap">
                              <div class="st_wrap">
                                <label class="col-md-2 col-form-label st_title">환율 수정</label>
                              </div>
                              <div class="card-body">
                                <div class="table-responsive">
	                                <form action="" method="post" name="exchnRateUpdateForm">   
	                             	    <input type="hidden" name="exchange_rate_idx" id="modExchnRateIdx"/>
	                                    <table class="table mb-0">
	                                        <tbody>
	                                          	<tr>
	                                              <td>제공자이름</td>
	                                                <td>
	                                                  <input class="custom_search_input user_in_modal_input"  type="text" name="provider_nm" id="modExchnRateNm">
	                                                </td>
	                                            </tr>
	                                            <tr>
	                                              <td>제공주소</td>
	                                                <td>
	                                                  <input class="custom_search_input user_in_modal_input"  type="text" name="service_url" id="modExchnRateServiceUrl">
	                                                </td>
	                                            </tr>
<!-- 	                                            <tr> -->
<!-- 	                                              <td>순서</td> -->
<!-- 	                                                <td> -->
<!-- 	                                                  <input type="text" name="seq" id="modExchnRateSeq"> -->
<!-- 	                                                </td> -->
<!-- 	                                            </tr> -->
	                                            <tr>
	                                              <td>사용 여부</td>
	                                              <td>
	                                                <input type="radio" name="enabled"  id="modExchnRateEnabledY" value="Y">사용
	                                                <input type="radio" name="enabled"  id="modExchnRateEnabledN" value="N">미사용
	                                              </td>
	                                            </tr>
	                                        </tbody>
	                                    </table>

                              		</form>
                                </div>
                                </div>
                            </div>
                                 <div class="user_in_modal_footer_wrap">
	                                    <button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" id="exchnRateModBtn">저장</button>
	                             	     <button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" id="" data-bs-dismiss="modal">닫기</button>
	                            </div>
                            
                          </div>
                        </div>
                    </div>
                </div>
              <!--  -->
              <div class="st_wrap st_mv_wrap">
	             <form id="exchnRateSearchForm" name="exchnRateSearchForm" method="post" class="form-horizontal"> 
	                <div>
	                  리스트 출력 갯수 :
	                    <select class="search_select" id="perPageNum" name="perPageNum" onchange="exchnRateperPageNum();">	                      
	                      <option value="10">10</option>
	                      <option value="15">15</option>
	                      <option value="20">20</option>
	                    </select>
	                </div>
	             </form> 
              </div>
              <div class="mb-0">
                <div class="card-body">
                  <!--  -->
                  <div class="custom_btn_wrap">
                     <button class="custom_btn btn_in_wrap_header" data-bs-toggle="modal" data-bs-target="#DelModal1">선택삭제</button>
                     <button class="custom_btn btn_in_wrap_header" data-bs-toggle="modal" data-bs-target="#TagModal-11">환율등록</button>
                  </div>
                  <!--  -->
                  <div class="table-responsive">
                    <table class="table mb-0">
                      <thead>
                        <tr class="tr_bgc">
                          <th><input type="checkbox" id="allCheck" value="" onchange="agreeAllCheck();"></th>
                          <th>번호</th>
                          <th>제공자이름</th>
                          <th>제공주소</th>
<!--                           <th>순서</th> -->
                          <th>등록자</th>
                          <th>등록일자</th>
                          <th>수정자</th>
                          <th>사용여부</th>
                          <th>수정</th>
                        </tr>
                      </thead>
                      <tbody>
	                     <c:forEach var="exchnRateList" items="${exchnRateList}">
	                        <tr>
	                          <td>
	                            <input type="checkbox" name="group_seqList" class="check_temp" name="" id="" value="${exchnRateList.exchange_rate_idx}">
	                          </td>
	                          <td>${perPageNum + 1 - exchnRateList.rnum}</td>
	                          <td>${exchnRateList.provider_nm}
<!-- 	                            <div class="search_img_wrap"> -->
<!-- 	                              <img src="" alt=""> -->
<!-- 	                            </div> -->
	                          </td>
	                          <td>${exchnRateList.service_url }</td>
<%-- 	                          <td>${exchnRateList.seq }</td> --%>
	                          <td>${exchnRateList.reg_user }</td>
	                          <td>${exchnRateList.reg_date }</td>
	                          <td>${exchnRateList.mod_user }</td>
	                          <td>${exchnRateList.enabled }</td>
	                          <td><button class="custom_btn btn_edit" data-bs-toggle="modal" data-bs-target="#TagModal-22" type="button" onclick="exchnRateModPopup('${exchnRateList.exchange_rate_idx}');">수정</button></td>
	                        </tr>
						</c:forEach>
                      </tbody>
                    </table>
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
                  </div>
                </div>
              </div>
              <!--  -->
            </div>
            <script>
    		
	    		<%-- 환율정보 수정 사용 여부 체크박스 단일선택 --%>
// 	    		$('input[type="checkbox"][name="enabled"]').click(function(){
// 	    			  if($(this).prop('checked')){
	    			 
// 	    			     $('input[type="checkbox"][name="enabled"]').prop('checked',false);
	    			 
// 	    			     $(this).prop('checked',true);
	    			 
// 	    			    }
	    			  
// 	    		});
	    		
	    		$('input[type="text"]').keydown(function() {
		  			  if (event.keyCode === 13) {
		  			    event.preventDefault();
		  			  };
	  			});
	    		
	    		<%-- 환율정보 페이지 이동 --%>
	    		function goPage(value) {
	    			var perPageNum = $('#perPageNum').val();

	    			var page = value;
	    			$.ajax({
	    				type : 'POST',                 
	    				url : '/exchnRateListAjax.do',   
	    				data:{
	    					perPageNum : perPageNum,
	    					page : page
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
	    		}
	    		
	    		<%-- 환율정보 리스트 출력 갯수 --%>
	    		function exchnRateperPageNum() {
	    			var perPageNum = $('#perPageNum').val();

	    			$.ajax({
	    				type : 'POST',                 
	    				url : '/exchnRateListAjax.do',   
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
            </script>