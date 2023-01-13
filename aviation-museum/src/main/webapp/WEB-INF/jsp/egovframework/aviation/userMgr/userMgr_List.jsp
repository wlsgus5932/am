<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

     <div class="tab-pane" id="profile" role="tabpanel" style="display:block;">
     <form id="userSearchForm" name="userSearchForm" method="post" class="form-horizontal">
	      <div class="user_top_wrap">
	          <span>검색</span>
	          <select class="form-select st_select" id="search_type" name="search_type">
	            <option value="">전체</option>
	            <option value="member_id">사용자 ID</option>
		        <option value="member_nm">사용자명</option>
		        <option value="group_nm">그룹명</option>
		        <option value="remark">비고</option>
		        <option value="enabled">사용여부</option>
	          </select>
	            <input type="text" id="search_word" name="search_word" >
	            <button type="button" onClick="userSearchList();">조회</button>
	      </div>
      </form>
      <div class="st_wrap st_mv_wrap">
        <div class="st_title_wrap">
          <button class="btn btn-secondary waves-effect waves-light btn_ml" id="userListEnabledBtn">선택 미사용</button>
        </div>
        <div class="user_btn">
          <button type="button" class="btn btn-primary waves-effect waves-light btn_ml btn_wh btn_ex" data-bs-toggle="modal" data-bs-target="#myModal">사용자등록</button>
        </div>
      </div>
      <div class="mb-0">
        <!-- 사용자 등록 모달 -->
        <div id="myModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
          <div class="modal-dialog user-modal">
              <div class="modal-content">
                  <div class="modal-header mv-modal-header">
                      <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body mv-modal-body">
                      <!-- 사용자 등록 모달 내용 -->
                      <div class="mb-0 user-wrap">
                        <div class="st_wrap">
                          <label class="col-md-2 col-form-label st_title">사용자 등록</label>
                        </div>
                        <div class="card-body">
                          <div class="table-responsive">
                       	 	  <form action="/userinsert.do" method="post" name="userinsertform">                          
	                              <table class="table mb-0">
	                                  <tbody>
	                                      <tr>
	                                        <td>사용자ID</td>
	                                          <td>
	                                            <input type="text" name="member_id" id="insUserId">
	                                            <button type="button" onclick="duplicateCheck();">중복체크</button>
	                                          </td>
	                                      </tr>
	                                      <tr>
	                                        <td>비밀번호</td>
	                                          <td>
	                                            <input type="password" name="member_pw" id="insUserPw">
	                                          </td>
	                                      </tr>
	                                      <tr>
	                                        <td>사용자명</td>
	                                        <td>
	                                          <input type="text" name="member_nm" id="insUserNm">
	                                        </td>
	                                      </tr>
	                                      <tr>
	                                        <td>그룹명</td>
	                                        <td>
	                                          <select class="form-select st_select" name="group_idx">
<!-- 	                                            <option disabled selected>그룹 없음</option> -->
		                                            <c:forEach var="groupList" items="${groupList}">
			                                          <option value="${groupList.group_idx}">${groupList.group_nm}</option>
			                                 	  	</c:forEach>
	                                          </select>
	                                        </td>
	                                      </tr>
	                                      <tr>
	                                        <td>비고</td>
	                                        <td>
	                                          <input type="text" name="remark" id="insUserRemark">
	                                        </td>
	                                      </tr>
	                                  </tbody>
	                              </table>
	                              <button class="btn btn-secondary btn_save" type="button" id="userInsBtn">저장</button>
                              </form>
                          </div>
                      </div>
                    </div>
                    <!--  -->
                  </div>
              </div>
          </div>
      </div>
      <!-- 사용자 수정 모달 -->
      <div id="UserModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
        <div class="modal-dialog user-modal">
            <div class="modal-content">
                <div class="modal-header mv-modal-header">
                    <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body mv-modal-body">
                    <!-- 사용자 등록 모달 내용 -->
                    <div class="mb-0 user-wrap">
                      <div class="st_wrap">
                        <label class="col-md-2 col-form-label st_title">사용자 수정</label>
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
                          <th>사용자 ID</th>
                          <th>사용자명</th>
                          <th>그룹명</th>
                          <th>국립항공박물관 권한 관리 그룹명</th>
                          <th>비고</th>
                          <th>사용 여부</th>
                          <th>수정</th>
                          <th>PW초기화</th>
                      </tr>
                  </thead>
                  <tbody>
                      <c:forEach var="userList" items="${userList}">
	                      <tr>
	                          <td>
	                            <input type="checkbox" name="user_seqList" id="" class="check_temp" value="${userList.member_idx}">
	                          </td>
	                          <td>
	                          	${perPageNum + 1 - userList.rnum}
	                          </td>
	                          <td>
	                            ${userList.member_id}
	                           </td>
	                           <td>
	                            ${userList.member_nm}
	                           </td>
	                           <td>
	                            ${userList.group_nm}
	                           </td>
	                           <td>
	                            
	                           </td>
	                           <td>
	                            ${userList.remark}
	                           </td>
	                           <td>
	                           	${userList.enabled}
	                           </td>
	                           <td>
	                            <button type="button" class="btn btn-primary waves-effect waves-light btn_ml btn_wh btn_ex" data-bs-toggle="modal" data-bs-target="#UserModal" onclick="userModPopup('${userList.member_idx}');">수정</button>
	                          </td>
	                           <td>
	                            <button class="btn btn-secondary waves-effect waves-light btn_ml btn_wh">초기화</button>
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
		function userSearchList(){
			// 사용자 조건 검색			
			var queryString = $("form[name=userSearchForm]").serialize();

				$.ajax({
					type : 'post',
					url : '/usermgr/userListAjax.do',
					data : queryString,
					dataType : 'html',
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error: function(xhr, status, error){
						alert(error);
					},
					success : function(data){
						$('#tab-content').empty().append(data);
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
			var page = value;
			$.ajax({
				type : 'POST',                 
				url : '/usermgr/userListAjax.do',   
				data:{
					page : page
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