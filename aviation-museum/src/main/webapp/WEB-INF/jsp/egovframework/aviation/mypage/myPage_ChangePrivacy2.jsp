<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
  <!-- 개인정보 변경 탭 -->
            <div class="tab-pane" id="settings" role="tabpanel" style="display:block;">
              <div class="mb-0">
              	<form action="/userPwChangeAjax.do" method="post" name="userPwChangeForm">  
              		<input type="hidden" name="member_idx" value="${sessionScope.userSessionIdx}">
	                <div class="id_check_wrap">
	                  <div class="id_check_main_text">개인정보 변경</div>
	                  <div class="id_check_text_wrap">			             
		                    <dl>
		                      <dt>사용자ID</dt>
		                      <dd>${sessionScope.userSessionId}</dd>
		                    </dl>
		                    <dl>
		                      <dt>사용자명</dt>
		                      <dd>${sessionScope.userSessionNm}</dd>
		                    </dl>
		                    <dl>
		                      <dt>비밀번호 변경<span>*</span></dt>
		                      <dd><input type="password" placeholder="비밀번호 입력" name="member_pw" id="member_pw"></dd>
		                    </dl>
		                    <dl>
		                      <dt>비밀번호 변경 확인<span>*</span></dt>
		                      <dd><input type="password" placeholder="비밀번호 입력" id="member_pw_confirm"></dd>
		                    </dl>
		                    <dl>
		                      <dt>비밀번호 변경일</dt>
		                      <dd>${sessionScope.userSessionModDate}</dd>
		                    </dl>
	                  </div>
	                  <button type="button" id="userPwChangeBtn">저장</button>
	                </div>
                 </form>             
            </div>
          </div>
          <script>

	          $('input[type="text"]').keydown(function() {
	          	  if (event.keyCode === 13) {
	          	    event.preventDefault();
	          	  };
	          });
	          
         	 var userModValidation = function() {
        		var modMemberPw = $("#member_pw").val();
        		var modMemberPwConfirm = $("#member_pw_confirm").val();

        		if (!Boolean(modMemberPw)) {
        			alert("비밀번호를 입력해주세요.");
        			$("#member_pw").focus();
        			return false;
        		}
        		
        		if (!Boolean(modMemberPwConfirm)) {
        			alert("비밀번호 확인을 입력해주세요.");
        			$("#member_pw_confirm").focus();
        			return false;
        		}
        		
        		if(modMemberPw != modMemberPwConfirm){
        			alert("비밀번호 확인이 일치하지 않습니다.");
        			$("#member_pw_confirm").focus();
        			return false;
        		}

        		return true;
        	}
          </script>