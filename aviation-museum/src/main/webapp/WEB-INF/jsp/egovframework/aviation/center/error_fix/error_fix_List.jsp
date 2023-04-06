<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
     <div class="tab-pane" id="profile" role="tabpanel" style="display:block;">
     <form id="errorFixSearchForm" name="errorFixSearchForm" method="post" class="form-horizontal">
	      <div class="user_top_wrap" style="margin-top:20px;">
	          <span>검색</span>
	          <select class="search_select" id="search_type" name="search_type">
	            <option value="">전체</option>
	            <option value="error_fix_org_nm">기관명</option>
	            <option value="board_type">구분</option>
		        <option value="reg_user">등록자</option>
	          </select>
	            <input class="custom_search_input" type="text" id="search_word" name="search_word" >
	            <button class="custom_btn btn_inquiry"  type="button" onClick="errorFixSearchList();">조회</button>
	      </div>
      </form>
      <div class="custom_btn_wrap" style="margin-top: 10px;">
          <button class="custom_btn btn_no_select" id="errorFixListDeleteBtn">선택 삭제</button>
          <button type="button" class="custom_btn btn_user_registration" data-bs-toggle="modal" data-bs-target="#myModal">오류신고 / 개선사항등록</button>
      </div>
<!--       <div id="DelModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-modal="true" role="dialog"> -->
<!--                 <div class="modal-dialog modal-dialog-centered"> -->
<!--                   <div class="modal-content"> -->
<!--                     <div class="modal-header"> -->
<!--                       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
<!--                     </div> -->
<%--                     <c:choose> --%>
<%--                     	<c:when test="${fn:length(notice_seqList) eq 0}"> --%>
<!--                     		<div class="modal-body"> -->
<!-- 		                      <p>선택한 공지사항이 없습니다.</p> -->
<!-- 		                    </div> -->
<%--                     	</c:when> --%>
<%--                     	<c:otherwise> --%>
<!--                     		<div class="modal-body"> -->
<!-- 		                      <p>선택한 공지사항을 삭제 처리하시겠습니까?</p> -->
<!-- 		                    </div> -->
<!-- 		                    <div class="modal-footer"> -->
<!-- 		                      <button type="button" class="btn btn-primary waves-effect waves-light" id="noticeListDeleteBtn">확인</button> -->
<!-- 		                      <button type="button" class="btn btn-secondary waves-effect" data-bs-dismiss="modal">취소</button> -->
<!-- 		                    </div> -->
<%--                     	</c:otherwise> --%>
<%--                     </c:choose> --%>
<!--                   </div> -->
<!--                 </div> -->
<!--       </div> -->
      <div class="mb-0">
        <!-- 오류신고 & 개선사항 등록 모달 -->
        <div id="myModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
          <div class="modal-dialog user-modal faq_edit_modal_wrap">
              <div class="modal-content">
                  <div class="modal-header mv-modal-header">
                      <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="errorFixInsInputClose"></button>
                  </div>
                  <div class="modal-body mv-modal-body">
                      <!-- 오류신고&개선사항 등록 모달 내용 -->
                      <div class="mb-0 user-wrap">
                        <div class="st_wrap">
                          <label class="col-md-2 col-form-label st_title">오류신고&개선사항 등록</label>
                        </div>
                        <div class="card-body">
                          <div class="table-responsive">
                       	 	  <form action="/errorFixinsert.do" method="post" name="errorFixinsertform">                 
	                              <table class="table mb-0">
	                                  <tbody>
	                                  	  <tr>
	                                        <td>구분</td>
	                                        <td>
	                                        	<select class="search_select user_in_modal_input" name="board_type" id="BoardType">
							                     	<option value="E">오류신고</option>
							                        <option value="F">개선사항</option>
                    							</select>
	                                        </td>
	                                      </tr>
	                                      <tr>
	                                        <td>기관명</td>
	                                          <td>
	                                            <input class="custom_search_input user_in_modal_input" type="text" name="error_fix_org_nm" id="insErrorFixOrgNm">
	                                      	  </td>
	                                      </tr>
	                                      <tr>
	                                        <td>제목</td>
	                                          <td>
	                                            <input class="custom_search_input user_in_modal_input" type="text" name="error_fix_title" id="insErrorFixTitle">
	                                      	  </td>
	                                      </tr>
	                                      <tr>
	                                        <td>내용</td>
	                                          <td>
	                                          <textarea style="height: 100px;" class="custom_search_input user_in_modal_input" name="error_fix_content" id="insErrorFixContent" cols="70" rows="10"></textarea>
	                                          </td>
	                                      </tr>
	                                  </tbody>
	                              </table>
	                              
                              </form>
                          </div>
                      </div>
                    </div>
						<div class="user_in_modal_footer_wrap">
                    		<button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" id="errorFixInsBtn">저장</button>
	                        <button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" id="" data-bs-dismiss="modal">닫기</button>
	                    </div>                    
                    <!--  -->
                  </div>
              </div>
          </div>
      </div>
       <div class="st_wrap st_mv_wrap">
                <div>
                    <select class="search_select" id="perPageNum" name="perPageNum" onchange="changePerPageNum(value);">
                     	<option value="10" <c:if test="${pageMaker.cri.perPageNum == 10}">selected</c:if>>10개씩 보기</option>
                        <option value="20" <c:if test="${pageMaker.cri.perPageNum == 20}">selected</c:if>>20개씩 보기</option>
                        <option value="30" <c:if test="${pageMaker.cri.perPageNum == 30}">selected</c:if>>30개씩 보기</option>
                    </select>
                </div>
       </div>
       
       <!--  공지사항 상세보기 -->
       <div id="myModal2" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
          <div class="modal-dialog user-modal preferences_deit_modal_wrap_2">
              <div class="modal-content">
                  <div class="modal-header mv-modal-header">
                      <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="errorFixInsInputClose"></button>
                  </div>
                  <div class="modal-body mv-modal-body">
                      <!-- 공지사항 등록 모달 내용 -->
                      <div class="mb-0 user-wrap">
                        <div class="st_wrap">
                          <label class="col-md-2 col-form-label st_title">오류신고&개선사항 상세보기</label>
                        </div>
                        <div class="card-body">
                          <div class="table-responsive">
	                              <table class="table mb-0">
	                                  <tbody>
	                                  	  <tr>
	                                        <td style="width: 15%;">구분</td>
	                                          <td>
	                                            <input class="custom_search_input user_in_modal_input" type="text" name="board_type" id="boardType" readOnly>
	                                      	  </td>
	                                      </tr>
	                                      <tr>
	                                        <td>기관명</td>
	                                          <td>
	                                            <input class="custom_search_input user_in_modal_input" type="text" name="error_fix_org_nm" id="errorFixOrgNm" readOnly>
	                                      	  </td>
	                                      </tr>
	                                      <tr>
	                                        <td>제목</td>
	                                          <td>
	                                            <input class="custom_search_input user_in_modal_input" type="text" name="error_fix_title" id="errorFixTitle" readOnly>
	                                      	  </td>
	                                      </tr>
	                                      <tr>
	                                        <td>내용</td>
	                                          <td>
	                                          <textarea class="custom_textarea_wrap" name="error_fix_content" id="errorFixContent" cols="70" rows="10" readOnly></textarea>
	                                          </td>
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
      
      <!-- 오류신고 개선센터 수정 모달 -->
      <div id="ErrorFixModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
        <div class="modal-dialog notice-modal faq_edit_modal_wrap">
            <div class="modal-content">
                <div class="modal-header mv-modal-header">
                    <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="errorFixModInputClose"></button>
                </div>
                <div class="modal-body mv-modal-body">
                    <!-- 사용자 등록 모달 내용 -->
                    <div class="mb-0 user-wrap">
                      <div class="st_wrap">
                        <label class="col-md-2 col-form-label st_title">오류신고&개선센터 수정</label>
                      </div>
                      <div class="card-body">
                        <div class="table-responsive">
	                       	<form name="errorFixupdateform">
								<input type="hidden" name="error_fix_idx" id="modErrorFixIdx"/>
	                            <table class="table mb-0">
	                                <tbody>
	                                	<tr>
	                                      <td>구분</td>
	                                        <td>
	                                        	<select class="search_select user_in_modal_input" name="board_type" id="modBoardType">
							                     	<option value="E">오류신고</option>
							                        <option value="F">개선사항</option>
                    							</select>
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                      <td>기관명</td>
	                                        <td>
	                                          <input class="custom_search_input user_in_modal_input" type="text" name="error_fix_org_nm" id="modErrorFixOrgNm">
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                      <td>제목</td>
	                                        <td>
	                                          <input class="custom_search_input user_in_modal_input" type="text" name="error_fix_title" id="modErrorFixTitle">
	                                        </td>
	                                    </tr>
	
	                                    <tr>
	                                      <td>내용</td>
	                                      <td>
	                                      	<textarea class="custom_search_input user_in_modal_input" style="height: 100px;" name="error_fix_content" id="modErrorFixContent" cols="70" rows="10"></textarea>
	                                      </td>
	                                    </tr>
	                                </tbody>
	                            </table>

                      		</form>
                        </div>
                    </div>
                  </div>
						<div class="user_in_modal_footer_wrap">
		                              <button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" id="errorFixModBtn">저장</button>
	                             	  <button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" id="" data-bs-dismiss="modal">닫기</button>
	                    </div>                       
                  <!--  -->
                </div>
            </div>
        </div>
    </div>
      <!-- 사용자 목록 -->
        <div class="card-body">
          <div class="table-responsive">
              <table class="table mb-0">
                  <thead>
                      <tr class="tr_bgc">
                          <th><input type="checkbox" id="allCheck" value="" onchange="agreeAllCheck();"></th>
                          <th>번호</th>
                          <th>구분</th>
                          <th>제목</th> 
                          <th>기관명</th> 
                          <th>등록자</th>
                          <th>등록일시</th>
                          <th>수정자</th>
                          <th>수정일시</th>
                          <th>조회수</th>
                          <th>수정</th>
                      </tr>
                  </thead>
                  <tbody>
                      <c:forEach var="errorFixList" items="${errorFixList}">
	                      <tr>
	                          <td>
	                            <input type="checkbox" name="error_fix_seqList" id="" class="check_temp" value="${errorFixList.error_fix_idx}">
	                          </td>
	                          <td>
	                          	${perPageNum + 1 - errorFixList.rnum}
	                          </td>
	                           <td>
	                            ${errorFixList.board_type eq "E" or "e" ? "오류신고" : "개선사항"}
	                           </td>
	                          <td>
		                          <a class="errorFixDetail" href="#myModal2" data-bs-toggle="modal" data-id="${errorFixList.error_fix_idx}">
	                                ${errorFixList.error_fix_title}
	                              </a>
                           	  </td>
                           	  <td>
	                            ${errorFixList.error_fix_org_nm}
	                           </td>
	                           <td>
	                            ${errorFixList.reg_user}
	                           </td>
	                           <td>
	                            ${errorFixList.reg_date}
	                           </td>
	                           <td>
	                            ${errorFixList.mod_user}
	                           </td>
	                           <td>
	                            ${errorFixList.mod_date}
	                           </td>
	                           <td>
	                            ${errorFixList.count}
	                           </td>
	                           <td>
	                            <button type="button" class="custom_btn btn_edit" data-bs-toggle="modal" data-bs-target="#ErrorFixModal" onclick="errorFixModPopup('${errorFixList.error_fix_idx}');">수정</button>
	                          </td>
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
    </div>	
	
	<script>	
		<%-- 오류신고/개선사항 조건 검색 --%>
		function errorFixSearchList(){
			// 오류신고/개선사항 조건 검색			
			var queryString = $("form[name=errorFixSearchForm]").serialize();
			var search_word = $('#search_word').val();
			var search_type = $('#search_type').val();
				$.ajax({
					type : 'post',
					url : '/errorFix/errorFixListAjax.do',
					data : queryString,
					dataType : 'html',
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error: function(xhr, status, error){
						alert(error);
					},
					success : function(data){
						$('#tab-content').empty().append(data);
						$('#search_word').val(search_word);
						$('#search_type').val(search_type);
					}
				});
		}
		
		$('input[type="text"]').keydown(function() {
			  if (event.keyCode === 13) {
			    event.preventDefault();
			  };
		});
		
		function goPage(value) {
			var search_word = $('#search_word').val();
			var search_type = $('#search_type').val();
			var page = value;
			$.ajax({
				type : 'POST',                 
				url : '/errorFix/errorFixListAjax.do',   
				data:{
					search_word : search_word,
					search_type : search_type,
					page : page
				},
				dataType : "html",           
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {        
					alert('통신실패!');
				},
				success : function(data) {  
					$('#tab-content').empty().append(data);
					$('#search_word').val(search_word);
					$('#search_type').val(search_type);
				}
			});
	}
		
		function changePerPageNum(value) {
			$.ajax({
				type : 'POST',                
				url : '/errorFix/errorFixListAjax.do',
				data : {
					perPageNum : value
				},
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
	</script>