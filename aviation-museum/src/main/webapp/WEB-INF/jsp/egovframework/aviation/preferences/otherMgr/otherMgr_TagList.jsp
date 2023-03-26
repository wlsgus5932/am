<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
        <!-- 태그관리 탭 -->
            <div class="tab-pane" id="home" role="tabpanel" style="display:block;">
              <!-- 선택삭제 모달 -->
              <div id="DelModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-modal="true" role="dialog">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <p>N건의 관심자료를 삭제하시겠습니까?</p>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-primary waves-effect waves-light" id="tagDelBtn">확인</button>
                      <button type="button" class="btn btn-secondary waves-effect" data-bs-dismiss="modal" id="tagDelBtnClose">취소</button>
                    </div>
                  </div>
                </div>
              </div>
              <!-- 태그등록 모달 -->
              <div id="TagModal-1" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
                <div class="modal-dialog user-modal preferences_deit_modal_wrap_2">
                    <div class="modal-content">
                        <div class="modal-header mv-modal-header">
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="tagInsBtnClose"></button>
                        </div>
                        <div class="modal-body mv-modal-body">
                            <div class="mb-0 user-wrap">
                              <div class="st_wrap">
                                <label class="col-md-2 col-form-label st_title">태그 등록</label>
                              </div>
                              <div class="card-body">
                                <div class="table-responsive">
                                   <form action="/tagInsert.do" method="post" name="tagInsertForm">
	                                    <table class="table mb-0">
	                                        <tbody>
	                                            <tr>
	                                              <td>태그</td>
	                                                <td>
	                                                  <input class="custom_search_input tag_in_modal_input" type="text" name="tag_nm" id="insTagNm" oninput="tagInsInputChange();"><button class="custom_btn btn_707070 btn_707070_7040" type="button" id="tagInsCheck" tagInsCheck="" onclick="tagDuplicateCheck();">중복체크</button>
	                                                </td>
	                                            </tr>
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
		                             <button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" id="tagInsBtn">저장</button>
	                             	 <button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" id="" data-bs-dismiss="modal">닫기</button>
	                              </div>                            
                            
                          </div>
                        </div>
                    </div>
                </div>
              <!-- 태그 수정 모달 -->
              <div id="TagModal-2" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
                <div class="modal-dialog user-modal preferences_deit_modal_wrap_2">
                    <div class="modal-content">
                        <div class="modal-header mv-modal-header">
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="tagModBtnClose"></button>
                        </div>
                        <div class="modal-body mv-modal-body">
                            <div class="mb-0 user-wrap">
                              <div class="st_wrap">
                                <label class="col-md-2 col-form-label st_title">태그 수정</label>
                              </div>
                              <div class="card-body">
                                <div class="table-responsive">
                               		<form action="" method="post" name="tagUpdateForm">
                               			<input type="hidden" name="tag_idx" id="modTagIdx"/>
                               			<input type="hidden" name="tag_nm_first" id="modTagNmFirst"/>
	                                    <table class="table mb-0">
	                                        <tbody>
	                                            <tr>
	                                              <td>태그</td>
	                                                <td>
	                                                  <input class="custom_search_input tag_in_modal_input" type="text" name="tag_nm" id="modTagNm" oninput="tagModInputChange();"><button class="custom_btn btn_707070 btn_707070_7040" type="button" id="tagModCheck" tagModCheck=""  onclick="tagModDuplicateCheck();">중복체크</button>
	                                                </td>
	                                            </tr>
	                                            <tr>
	                                              <td>사용 여부</td>
	                                              <td>
	                                                  <input type="radio" name="enabled" id="modTagEnabledY" value="Y">사용
	                                      			  <input type="radio" name="enabled" id="modTagEnabledN" value="N">미사용
	                                              </td>
	                                            </tr>
	                                        </tbody>
	                                    </table>
	                                    
                                    </form>
                                </div>
                                </div>
                            </div>
     							<div class="user_in_modal_footer_wrap">
		                             	 <button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" id="tagModBtn">저장</button>
	                             	     <button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" id="" data-bs-dismiss="modal">닫기</button>
	                            </div>                       
                            
                            
                          </div>
                        </div>
                    </div>
                </div>
              <!--  -->
              <div class="custom_prefernces_header_wrap">
                <form id="tagSearchForm" name="tagSearchForm" method="post" class="form-horizontal" onsubmit="return false">
	                <div class="custom_prefernces_header_wrap_in_wrap">
	                  리스트 출력 갯수 :
	                    <select class="search_select" id="perPageNum" name="perPageNum">	                      
	                      <option value="10">10</option>
	                      <option value="15">15</option>
	                      <option value="20">20</option>
	                    </select>
	                </div>
	                  <div class="user_top_wrap">
	                    <span>검색</span>
	                    <select class="search_select" id="search_type" name="search_type">
	                        <option value="">전체</option>
				            <option value="tag_nm">태그명</option>
					        <option value="reg_user">등록자</option>
					        <option value="mod_user">수정자</option>
					        <option value="enabled">사용여부</option>
	                    </select>
	                      <input class="custom_search_input" type="text" id="search_word" name="search_word" onkeypress="if( event.keyCode == 13 ){tagSearchList();}">
	                      <button class="custom_btn btn_inquiry" type="button" onClick="tagSearchList();">조회</button>
	                  </div>
                  </form>
              </div>
              <div class="mb-0">
                <div class="card-body">
                  <!--  -->
                  <div class="custom_btn_wrap">
                      <button class="custom_btn btn_in_wrap_header" data-bs-toggle="modal" data-bs-target="#DelModal">선택삭제</button>
                     <button class="custom_btn btn_in_wrap_header" data-bs-toggle="modal" data-bs-target="#TagModal-1">태그등록</button>
                  </div>
                  <!--  -->
                  <div class="table-responsive">
                    <table class="table mb-0">
                      <thead>
                        <tr class="tr_bgc">
                          <th><input type="checkbox" id="allCheck" value="" onchange="agreeAllCheck();"></th>
                          <th>번호</th>
                          <th>태그명</th>
                          <th>등록자</th>
                          <th>등록일자</th>
                          <th>수정자</th>
                          <th>사용여부</th>
                          <th>수정</th>
                        </tr>
                      </thead>
                      <tbody>
	                     <c:forEach var="tagList" items="${tagList}">
	                        <tr>
	                          <td>
	                            <input type="checkbox" name="group_seqList" class="check_temp" name="" id="" value="${tagList.tag_idx}">
	                          </td>
	                          <td>${perPageNum + 1 - tagList.rnum}</td>
	                          <td>
	                          	  ${tagList.tag_nm }
<!-- 	                            <div class="search_img_wrap"> -->
<!-- 	                              <img src="" alt=""> -->
<!-- 	                            </div> -->
	                          </td>
	                          <td>${tagList.reg_user }</td>
	                          <td>${tagList.reg_date }</td>
	                          <td>${tagList.mod_user }</td>
	                          <td>${tagList.enabled }</td>
	                          <td><button class="custom_btn btn_edit" type="button" data-bs-toggle="modal" data-bs-target="#TagModal-2" onclick="tagModPopup('${tagList.tag_idx}');">수정</button></td>
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
    		
	    		<%-- 태그 수정 사용 여부 체크박스 단일선택 --%>
	    		$('input[type="checkbox"][name="enabled"]').click(function(){
	    			  if($(this).prop('checked')){
	    			 
	    			     $('input[type="checkbox"][name="enabled"]').prop('checked',false);
	    			 
	    			     $(this).prop('checked',true);
	    			 
	    			    }
	    			  
	    		});
	    		
	    		<%-- 태그 조건 검색 --%>
	    		function tagSearchList(){
	    			var perPageNum = $('#perPageNum').val();
	    			var search_word = $('#search_word').val();
	    			var search_type = $('#search_type').val();
	    			// 태그 조건 검색			
	    			var queryString = $("form[name=tagSearchForm]").serialize();

	    				$.ajax({
	    					type : 'post',
	    					url : '/tagListAjax.do',
	    					data : queryString,
	    					dataType : 'html',
	    					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
	    					error: function(xhr, status, error){
	    						alert(error);
	    					},
	    					success : function(data){
	    						$('#tab-content').empty().append(data);
	    						$('#perPageNum').val(perPageNum);
	    						$('#search_word').val(search_word);
	    						$('#search_type').val(search_type);
	    						$('#search_word').focus();
	    					}
	    				});
	    		}
	    		
// 	    		$('input[type="text"]').keydown(function() {
// 		  			  if (event.keyCode === 13) {
// 		  			    event.preventDefault();
// 		  			  };
// 	  			});
	    		
	    		<%-- 태그 페이지 이동 --%>
	    		function goPage(value) {
	    			var perPageNum = $('#perPageNum').val();
	    			var search_word = $('#search_word').val();
	    			var search_type = $('#search_type').val();
	    			var page = value;
	    			$.ajax({
	    				type : 'POST',                 
	    				url : '/tagListAjax.do',   
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
    						$('#perPageNum').val(perPageNum);
    						$('#search_word').val(search_word);
    						$('#search_type').val(search_type);
	    				}
	    			});
	    		}
            </script>