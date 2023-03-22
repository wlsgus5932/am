<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

     <div class="tab-pane" id="profile" role="tabpanel" style="display:block;">
     <form id="faqSearchForm" name="faqSearchForm" method="post" class="form-horizontal">
	      <div class="user_top_wrap" style="margin-top:20px;">
	          <span>검색</span>
	          <select class="search_select" id="search_type" name="search_type">
	            <option value="">전체</option>
	            <option value="faq_content">질문</option>
		        <option value="answer_contents">답변</option>
	          </select>
	            <input class="custom_search_input" type="text" id="search_word" name="search_word" >
	            <button class="custom_btn btn_inquiry"  type="button" onClick="faqSearchList();">조회</button>
	      </div>
      </form>
      <div style="margin-top: 15px;">
      	  <label class="custom_btn btn_no_select"><input type="checkbox" id="checkAll" onchange="checkAll()"style="display:none;">전체 선택</label>
<!--           <button class="custom_btn btn_no_select" id="allCheck" onclick="allCheck()">전체 선택</button> -->
          <button class="custom_btn btn_no_select" id="faqListDeleteBtn">선택 삭제</button>
          <button type="button" class="custom_btn btn_user_registration" data-bs-toggle="modal" data-bs-target="#myModal" style="float: right;">FAQ 등록</button>
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
      <div class="mb-0 faq_main_wrap">
        <!-- 공지사항 등록 모달 -->
        <div id="myModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
          <div class="modal-dialog user-modal faq_edit_modal_wrap">
              <div class="modal-content">
                  <div class="modal-header mv-modal-header">
                      <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="faqInsInputClose"></button>
                  </div>
                  <div class="modal-body mv-modal-body">
                      <!-- 공지사항 등록 모달 내용 -->
                      <div class="mb-0 user-wrap">
                        <div class="st_wrap">
                          <label class="col-md-2 col-form-label st_title">FAQ 등록</label>
                        </div>
                        <div class="card-body">
                          <div class="table-responsive">
                       	 	  <form action="/faqinsert.do" method="post" name="faqinsertform">
	                              <table class="table mb-0">
	                                  <tbody>
	                                      <tr>
	                                        <td>질문</td>
	                                          <td>
	                                            <textarea style="height: 80px;" class="custom_search_input user_in_modal_input" name="faq_content" id="insFaqContent" cols="70" rows="3" required></textarea>
	                                      	  </td>
	                                      </tr>
	                                      <tr>
	                                        <td>답변</td>
	                                          <td>
	                                          	<textarea style="height: 80px;" class="custom_search_input user_in_modal_input" name="answer_contents" id="insAnswerContents" cols="70" rows="3" required></textarea>
	                                          </td>
	                                      </tr>
	                                  </tbody>
	                              </table>

                              </form>
                          </div>
                      </div>
                    </div>
                    
            						<div class="user_in_modal_footer_wrap">
	                              		 <button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" id="faqInsBtn">저장</button>
	                             	     <button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" id="">닫기</button>
	                              </div>        
                    
                    
                    <!--  -->
                  </div>
              </div>
          </div>
      </div>
       <div class="st_wrap st_mv_wrap" style="border-bottom: 2px solid; padding-bottom: 1%; margin: auto;">
                <div>
                    <select class="search_select" id="perPageNum" name="perPageNum" onchange="changePerPageNum(value);">
                     	<option value="10" <c:if test="${pageMaker.cri.perPageNum == 10}">selected</c:if>>10개씩 보기</option>
                        <option value="20" <c:if test="${pageMaker.cri.perPageNum == 20}">selected</c:if>>20개씩 보기</option>
                        <option value="30" <c:if test="${pageMaker.cri.perPageNum == 30}">selected</c:if>>30개씩 보기</option>
                    </select>
                </div>
       </div>

      <!-- FAQ 수정 모달 -->
      <div id="FaqModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
        <div class="modal-dialog notice-modal faq_edit_modal_wrap">
            <div class="modal-content">
                <div class="modal-header mv-modal-header">
                    <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="faqModInputClose"></button>
                </div>
                <div class="modal-body mv-modal-body">
                    <!-- FAQ 등록 모달 내용 -->
                    <div class="mb-0 user-wrap">
                      <div class="st_wrap">
                        <label class="col-md-2 col-form-label st_title">FAQ 수정</label>
                      </div>
                      <div class="card-body">
                        <div class="table-responsive">
	                       	<form name="faqupdateform">
								<input type="hidden" name="faq_idx" id="modFaqIdx"/>
	                            <table class="table mb-0">
	                                <tbody>
	                                    <tr>
	                                      <td>질문</td>
	                                        <td>
	                                          <textarea style="height: 80px;" class="custom_search_input user_in_modal_input" name="faq_content" id="modFaqContent" cols="70" rows="3" required></textarea>
	                                        </td>
	                                    </tr>

	                                    <tr>
	                                      <td>답변</td>
	                                      <td>
	                                      	<textarea style="height: 80px;" class="custom_search_input user_in_modal_input" name="answer_contents" id="modAnswerContents" cols="70" rows="3" required></textarea>
	                                      </td>
	                                    </tr>
	                                </tbody>
	                            </table>

                      		</form>
                        </div>
                    </div>
                  </div>
						<div class="user_in_modal_footer_wrap">
	                            <button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" id="faqModBtn">저장</button>
	                            <button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" id="">닫기</button>
	                    </div>
                  <!--  -->
                </div>
            </div>
        </div>
    </div>
      <!-- FAQ 목록 -->
        <div class="card-body">
          <div class="table-responsive">
              <table class="table mb-0 faq_table">

                  <tbody>
                      <c:forEach var="faqList" items="${faqList}">
	                      <tr style="border-bottom: 2px solid #d9d9d9;">
	                          <td style="width: 5%;">
	                            <input type="checkbox" name="faq_seqList" id="" class="check_temp" value="${faqList.faq_idx}">
	                          </td>
	                          <td style="width: 5%;">
	                          	${perPageNum + 1 - faqList.rnum}
	                          </td>
	                          <td style="width: 80%;">
	                            <span class="q_wrap"><div class="faq_icon">Q</div>${faqList.faq_content}</span>
	                            <span class="a_warp"><div class="faq_icon">A</div>${faqList.answer_contents}</span>
                          	  </td>
	                          <td style="width: 10%;">
	                            <button type="button" class="custom_btn btn_edit" data-bs-toggle="modal" data-bs-target="#FaqModal" onclick="faqModPopup('${faqList.faq_idx}');">수정</button>
	                          </td>
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

		<%-- FAQ 조건 검색 --%>
		function faqSearchList(){
			// 사용자 조건 검색
			var queryString = $("form[name=faqSearchForm]").serialize();
			var search_word = $('#search_word').val();
			var search_type = $('#search_type').val();
				$.ajax({
					type : 'post',
					url : '/faq/faqListAjax.do',
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

		<%-- FAQ 페이지 이동 --%>
		function goPage(value) {
			var search_word = $('#search_word').val();
			var search_type = $('#search_type').val();
			var page = value;
			$.ajax({
				type : 'POST',
				url : '/faq/faqListAjax.do',
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
				url : '/faq/faqListAjax.do',
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