<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
     <div class="tab-pane" id="profile" role="tabpanel" style="display:inline-block;">
     <form id="noticeSearchForm" name="noticeSearchForm" method="post" class="form-horizontal">
	      <div class="user_top_wrap" style="margin-top:20px;">
	          <span>검색</span>
	          <select class="search_select" id="search_type" name="search_type">
	            <option value="">전체</option>
	            <option value="notice_title">제목</option>
		        <option value="reg_user">등록자</option>
	          </select>
	            <input class="custom_search_input" type="text" id="search_word" name="search_word" >
	            <button class="custom_btn btn_inquiry"  type="button" onClick="noticeSearchList();">조회</button>
	      </div>
      </form>
      <div class="custom_btn_wrap" style="margin-top: 50px;">
          <button class="custom_btn btn_no_select" id="noticeListDeleteBtn" data-bs-toggle="modal" data-bs-target="#DelModal">선택 삭제</button>
          <button type="button" class="custom_btn btn_user_registration" data-bs-toggle="modal" data-bs-target="#myModal">공지사항등록</button>
      </div>
      <div id="DelModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-modal="true" role="dialog">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <p>삭제하시겠습니까?</p>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-primary waves-effect waves-light">확인</button>
                      <button type="button" class="btn btn-secondary waves-effect" data-bs-dismiss="modal">취소</button>
                    </div>
                  </div>
                </div>
      </div>
      <div class="mb-0">
        <!-- 공지사항 등록 모달 -->
        <div id="myModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
          <div class="modal-dialog user-modal">
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
	                                            <input type="text" name="notice_title" id="insNoticeTitle" required>
	                                      	  </td>
	                                      </tr>
	                                      <tr>
	                                        <td>내용</td>
	                                          <td>
	                                          <textarea name="notice_content" id="insNoticeContent" cols="70" rows="10" required></textarea>
	                                          </td>
	                                      </tr>
	                                  </tbody>
	                              </table>
	                              <button class="btn btn-secondary btn_save" type="button" id="noticeInsBtn">저장</button>
                              </form>
                          </div>
                      </div>
                    </div>
                    <!--  -->
                  </div>
              </div>
          </div>
      </div>
       <div class="st_wrap st_mv_wrap">
                <div>
                    <select class="form-select st_select img-select" id="perPageNum" name="perPageNum" onchange="changePerPageNum(value);">
                     	<option value="10" <c:if test="${pageMaker.cri.perPageNum == 10}">selected</c:if>>10개씩 보기</option>
                        <option value="20" <c:if test="${pageMaker.cri.perPageNum == 20}">selected</c:if>>20개씩 보기</option>
                        <option value="30" <c:if test="${pageMaker.cri.perPageNum == 30}">selected</c:if>>30개씩 보기</option>
                    </select>
                </div>
       </div>
      
      <!-- 공지사항 수정 모달 -->
      <div id="NoticeModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
        <div class="modal-dialog notice-modal">
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
	                       	<form action="/userupdate.do" method="post" name="userupdateform">
								<input type="hidden" name="member_idx" id="modUserIdx"/>
	                            <table class="table mb-0">
	                                <tbody>
	                                    <tr>
	                                      <td>사용자ID</td>
	                                        <td>
	                                          <input type="text" name="member_id" id="modUserId">
	                                        </td>
	                                    </tr>
	
	                                    <tr>
	                                      <td>사용자명</td>
	                                      <td>
	                                        <input type="text" name="member_nm" id="modUserNm">
	                                      </td>
	                                    </tr>
	                                    <tr>
	                                      <td>그룹명</td>
	                                      <td>
	                                        <select class="form-select st_select" name="group_idx" id="modUserGroupidx">
<!-- 	                                          <option disabled selected>그룹 없음</option> -->
	                                           <c:forEach var="groupList" items="${groupList}">
				                                    <option value="${groupList.group_idx}">${groupList.group_nm}</option>
				                               </c:forEach>
	                                        </select>
	                                      </td>
	                                    </tr>
	                                    <tr>
	                                      <td>비고</td>
	                                      <td>
	                                        <input type="text" name="remark" id="modUserRemark">
	                                      </td>
	                                    </tr>
	                                    <tr>
	                                      <td>사용 여부</td>
	                                      <td>
	                                      	<input type="checkbox" name="enabled" id="modUserEnabledY" value="Y">사용
	                                        <input type="checkbox" name="enabled" id="modUserEnabledN" value="N">미사용
	                                      </td>
	                                    </tr>
	                                </tbody>
	                            </table>
	                            <button class="btn btn-secondary btn_save" type="button" id="userModBtn">저장</button>
                      		</form>
                        </div>
                    </div>
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
                          <th>등록일</th>
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
	                            ${noticeList.notice_title}
	                           </td>
	                           <td>
	                            ${noticeList.reg_user}
	                           </td>
	                           <td>
	                            ${noticeList.reg_date}
	                           </td>
	                           <td>
	                            ${noticeList.count}
	                           </td>
	                           <td>
	                            <button type="button" class="custom_btn btn_edit" data-bs-toggle="modal" data-bs-target="#NoticeModal" onclick="noticeModPopup('${userList.member_idx}');">수정</button>
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
		<%-- 사용자 등록 유효성체크 --%>
		var userInsValidation = function() {
			var insUserId = $("#insUserId").val();
			var insUserPw = $("#insUserPw").val();
			var insUserNm = $("#insUserNm").val();
			var insUserRemark = $("#insUserRemark").val();

			if (!Boolean(insUserId)) {
				alert("사용자ID를 입력해주세요.");
				$("#insUserId").focus();
				return false;
			}
			if (!Boolean(insUserPw)) {
				alert("비밀번호를 입력해주세요.");
				$("#insUserPw").focus();
				return false;
			}
			if (!Boolean(insUserNm)) {
				alert("사용자명을 입력해주세요.");
				$("#insUserNm").focus();
				return false;
			}
			if (!Boolean(insUserNm)) {
				alert("사용자명을 입력해주세요.");
				$("#insUserNm").focus();
				return false;
			}
			return true;
		}
		
		<%-- 사용자 수정 유효성체크 --%>
		var userModValidation = function() {
			var modUserId = $("#modUserId").val();
			var modUserNm = $("#modUserNm").val();

			if (!Boolean(modUserId)) {
				alert("사용자ID를 입력해주세요.");
				$("#modUserId").focus();
				return false;
			}
			if (!Boolean(modUserNm)) {
				alert("사용자명을 입력해주세요.");
				$("#modUserNm").focus();
				return false;
			}
			if (!$('input[type="checkbox"][name="enabled"]').is(":checked")) {
				alert("사용 여부를 체크해주세요.");
				return false;
			}
			return true;
		}
		
		<%-- 사용자 수정 사용 여부 체크박스 단일선택 --%>
		$('input[type="checkbox"][name="enabled"]').click(function(){
			  if($(this).prop('checked')){
			 
			     $('input[type="checkbox"][name="enabled"]').prop('checked',false);
			 
			     $(this).prop('checked',true);
			 
			    }
			  
		});
		
		<%-- 사용자 조건 검색 --%>
		function noticeSearchList(){
			// 사용자 조건 검색			
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
		
		$('input[type="text"]').keydown(function() {
			  if (event.keyCode === 13) {
			    event.preventDefault();
			  };
		});
		
		<%-- 사용자 페이지 이동 --%>
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