<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
     <div class="tab-pane" id="profile" role="tabpanel" style="display:block;">
     <form id="noticeSearchForm" name="noticeSearchForm" method="post" class="form-horizontal">
	      <div class="user_top_wrap" style="margin-top:20px;">
	          <span>검색</span>
	          <select class="search_select" id="search_type" name="search_type">
	            <option value="">전체</option>
	            <option value="notice_title">제목</option>
		        <option value="reg_user">등록자</option>
	          </select>
	            <input class="custom_search_input" type="text" id="search_word" name="search_word" style="width: 86.5%">
	            <button class="custom_btn btn_inquiry"  type="button" onClick="noticeSearchList();">조회</button>
	      </div>
      </form>
      <div class="custom_btn_wrap" style="margin-top: 10px;">
          <button class="custom_btn btn_no_select" id="noticeListDeleteBtn">선택 삭제</button>
          <button type="button" class="custom_btn btn_user_registration" data-bs-toggle="modal" data-bs-target="#myModal">공지사항등록</button>
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
        <!-- 공지사항 등록 모달 -->
        <div id="myModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
          <div class="modal-dialog user-modal notice_edit_modal_wrap">
              <div class="modal-content">
                  <div class="modal-header mv-modal-header">
                      <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="noticeInsInputClose"></button>
                  </div>
                  <div class="modal-body mv-modal-body">
                      <!-- 공지사항 등록 모달 내용 -->
                      <div class="mb-0 user-wrap">
                        <div class="st_wrap">
                          <label class="col-md-2 col-form-label st_title">공지사항 등록</label>
                        </div>
                        <div class="card-body">
                          <div class="table-responsive">
                       	 	  <form action="/noticeinsert.do" method="post" name="noticeinsertform">                 
	                              <table class="table mb-0">
	                                  <tbody>
	                                      <tr>
	                                        <td>제목</td>
	                                          <td>
	                                            <input class="custom_search_input user_in_modal_input" type="text" name="notice_title" id="insNoticeTitle" required>
	                                      	  </td>
	                                      </tr>
	                                      <tr>
	                                        <td>내용</td>
	                                          <td>
	                                          <textarea class="custom_search_input user_in_modal_input" name="notice_content" id="insNoticeContent" cols="70" rows="10" required style="height: 200px;"></textarea>
	                                          </td>
	                                      </tr>
	                                  </tbody>
	                              </table>
                              </form>
                          </div>
                      </div>
                    </div>
						<div class="user_in_modal_footer_wrap">
                    	   <button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" id="noticeInsBtn">저장</button>
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
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="noticeInsInputClose"></button>
                  </div>
                  <div class="modal-body mv-modal-body">
                      <!-- 공지사항 등록 모달 내용 -->
                      <div class="mb-0 user-wrap">
                        <div class="st_wrap">
                          <label class="col-md-2 col-form-label st_title">공지사항 상세보기</label>
                        </div>
                        <div class="card-body">
                          <div class="table-responsive">
	                              <table class="table mb-0">
	                                  <tbody>
	                                      <tr>
	                                        <td style="width: 15%;">제목</td>
	                                          <td>
	                                            <input class="custom_search_input user_in_modal_input" type="text" name="notice_title" id="noticeTitle" readOnly>
	                                      	  </td>
	                                      </tr>
	                                      <tr>
	                                        <td>내용</td>
	                                          <td>
	                                          <textarea class="custom_textarea_wrap"name="notice_content" id="noticeContent" cols="70" rows="10" readOnly></textarea>
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
      
      <!-- 공지사항 수정 모달 -->
      <div id="NoticeModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
        <div class="modal-dialog notice-modal notice_edit_modal_wrap">
            <div class="modal-content">
                <div class="modal-header mv-modal-header">
                    <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="noticeModInputClose"></button>
                </div>
                <div class="modal-body mv-modal-body">
                    <!-- 사용자 등록 모달 내용 -->
                    <div class="mb-0 user-wrap">
                      <div class="st_wrap">
                        <label class="col-md-2 col-form-label st_title">공지사항 수정</label>
                      </div>
                      <div class="card-body">
                        <div class="table-responsive">
	                       	<form name="noticeupdateform">
								<input type="hidden" name="notice_idx" id="modNoticeIdx"/>
	                            <table class="table mb-0">
	                                <tbody>
	                                    <tr>
	                                      <td>제목</td>
	                                        <td>
	                                          <input class="custom_search_input user_in_modal_input" type="text" name="notice_title" id="modNoticeTitle">
	                                        </td>
	                                    </tr>
	
	                                    <tr>
	                                      <td>내용</td>
	                                      <td>
	                                      	<textarea class="custom_search_input user_in_modal_input" name="notice_content" id="modNoticeContent" cols="70" rows="10" style="height: 200px;"></textarea>
	                                      </td>
	                                    </tr>
	                                </tbody>
	                            </table>
	                          
                      		</form>
                        </div>
                    </div>
                  </div>
					<div class="user_in_modal_footer_wrap">
                   	   <button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" id="noticeModBtn">저장</button>
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
                          <th>제목</th>
                          <th>등록자</th>
                          <th>등록일시</th>
                          <th>수정자</th>
                          <th>수정일시</th>
                          <th>조회수</th>
                          <th>수정</th>
                      </tr>
                  </thead>
                  <tbody>
                      <c:forEach var="noticeList" items="${noticeList}">
	                      <tr>
	                          <td>
	                            <input type="checkbox" name="notice_seqList" id="" class="check_temp" value="${noticeList.notice_idx}">
	                          </td>
	                          <td>
	                          	${perPageNum + 1 - noticeList.rnum}
	                          </td>
	                          <td>
		                          <a class="noticeDetail" href="#myModal2" data-bs-toggle="modal" data-id="${noticeList.notice_idx}">
	                                ${noticeList.notice_title}
	                              </a>
                           	  </td>
	                           <td>
	                            ${noticeList.reg_user}
	                           </td>
	                           <td>
	                            ${noticeList.reg_date}
	                           </td>
	                           <td>
	                            ${noticeList.mod_user}
	                           </td>
	                           <td>
	                            ${noticeList.mod_date}
	                           </td>
	                           <td>
	                            ${noticeList.count}
	                           </td>
	                           <td>
	                            <button type="button" class="custom_btn btn_edit" data-bs-toggle="modal" data-bs-target="#NoticeModal" onclick="noticeModPopup('${noticeList.notice_idx}');">수정</button>
	                          </td>
	                      </tr>
					</c:forEach>
                  </tbody>
              </table>
              
<!--               <ul class="btn-group pagination"> -->
<%-- 			    <c:if test="${pageMaker.prev }"> --%>
<!-- 			    <li class="page-item"> -->
<%-- 			        <a class="page-link" href='javascript:;' onclick="goPage('${pageMaker.startPage-1 }');"><i class="fa fa-chevron-left"></i></a> --%>
<!-- 			    </li> -->
<%-- 			    </c:if> --%>
<%-- 			    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum"> --%>
<!-- 			    <li class="page-item"> -->
<%-- 			        <a class="page-link" href='javascript:;' onclick="goPage('${pageNum}');"><i class="fa">${pageNum }</i></a> --%>
<!-- 			    </li> -->
<%-- 			    </c:forEach> --%>
<%-- 			    <c:if test="${pageMaker.next && pageMaker.endPage >0 }"> --%>
<!-- 			    <li class="page-item"> -->
<%-- 			        <a class="page-link" href="javascript:;" onclick="goPage('${pageMaker.endPage+1 }');"><i class="fa fa-chevron-right"></i></a> --%>
<!-- 			    </li> -->
<%-- 			    </c:if> --%>
<!-- 			</ul>             -->
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
    </div>	
	
	<script>	
		<%-- 공지사항 조건 검색 --%>
		function noticeSearchList(){
			// 공지사항 조건 검색			
			var queryString = $("form[name=noticeSearchForm]").serialize();
			var search_word = $('#search_word').val();
			var search_type = $('#search_type').val();
				$.ajax({
					type : 'post',
					url : '/notice/noticeListAjax.do',
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
		
// 		$('input[type="text"]').keydown(function() {
// 			  if (event.keyCode === 13) {
// 			    event.preventDefault();
// 			  };
// 		});
		
		<%-- 공지사항 페이지 이동 --%>
		function goPage(value) {
			var search_word = $('#search_word').val();
			var search_type = $('#search_type').val();
			var page = value;
			$.ajax({
				type : 'POST',                 
				url : '/notice/noticeListAjax.do',   
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
				url : '/notice/noticeListAjax.do',
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