<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>사용자&그룹 관리 | 국립항공박물관</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesbrand" name="author" />
    <!-- App favicon -->

    <!-- Bootstrap Css -->
    <link href="<c:url value='/assets/css/bootstrap.min.css'/>" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="<c:url value='/assets/css/icons.min.css'/>" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="<c:url value='/assets/css/app.min.css'/>" id="app-style" rel="stylesheet" type="text/css" />
    <!-- 커스텀 css -->
    <link href="<c:url value='/assets/css/custom.css'/>" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="<c:url value='/assets/css/custom_user.css'/>"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script type="text/javascript">
	
		// 체크박스 전체선택 전체해제
		function agreeAllCheck(){
			var val = true;
	
			if(!$('#allCheck').is(":checked")){
				val = false;
			}
			
			var elems = document.getElementsByClassName("check_temp");
			for(var i=0; elems.length>i; i++){
				elems[i].checked = val;
			}
		}
		
		$(function() {
			// 첫 페이지
			$('#userMgr').attr('aria-selected', 'true').addClass('active');
			
			$.ajax({
				type : 'POST',                
				url : '/usermgr/userListAjax.do',    
				dataType : "html",           
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {          
					alert('통신실패!');
				},
				success : function(data) {  
					$('#tab-content').empty().append(data);
				}
			});
			
			// 사용자 관리 tab operation
			$('#userMgr').click(function() {
				$.ajax({
					type : 'POST',                
					url : '/usermgr/userListAjax.do',    
					dataType : "html",           
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {          
						alert('통신실패!');
					},
					success : function(data) {  
						$('#tab-content').empty().append(data);
						$('.tap_text').find('span').text('사용자 둥록');
					}
				});
			});
			
			// 그룹 관리 tab operation
			$('#groupMgr').click(function() {
				$.ajax({
					type : 'POST',                 
					url : '/groupListAjax.do',   				
					dataType : "html",           
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {        
						alert('통신실패!');
					},
					success : function(data) {  
						$('#tab-content').empty().append(data);
						$('.tap_text').find('span').text('그룹 관리');
					}
				});
			});
			
		});
	
		// 사용자 등록
		$(document).on('click', '#userInsBtn', function(){

			var queryString = $("form[name=userinsertform]").serialize();
			var check_submit = confirm('사용자를 등록하시겠습니까?');

			if (userInsValidation()) {
				if(check_submit){
					$.ajax({
						type : 'post',
						url : '/userinsert.do',
						data : queryString,
						dataType : 'json',
						contentType : "application/x-www-form-urlencoded;charset=UTF-8",
						error: function(xhr, status, error){
							alert(error);
						},
						success : function(success){
							alert('사용자가 등록되었습니다.');
							
							$.ajax({
								type : 'POST',                 
								url : '/usermgr/userListAjax.do',   
								dataType : "html",           
								contentType : "application/x-www-form-urlencoded;charset=UTF-8",
								error : function() {        
									alert('통신실패!');
								},
								success : function(data) {  
									$('#tab-content').empty().append(data);
									$('body').attr('class','').attr('style','');
									$('.modal-backdrop').remove();
								}
							});
						}
					});
				}
			}
		});
	
		// 사용자 등록 중복체크 버튼
		function duplicateCheck() {				
				var insUserId = $('#insUserId').val();				
					
				if (!Boolean(insUserId)) {
					alert("사용자ID를 입력해주세요.");
					$("#insUserId").focus();
					return false;
				}
				var queryString = $("form[name=userinsertform]").serialize();
				
				$.ajax({
					type : 'POST',                 
					url : '/duplicateCheck.do',   
					data: queryString,
					dataType : "json",           
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {        
						alert('통신실패!');
					},
					success : function(data) {
						console.log(data);
						$.each(data, function(index, item) { // 데이터 =item
							if(item.result == "success"){								
								alert('존재하는 아이디입니다.');
							}else{
								alert('사용가능한 아이디입니다.');

							}
						});
					}
				});
		}
		
		// 사용자 수정 팝업 버튼
		function userModPopup(value) {
				var member_idx = value;
				$.ajax({
					type : 'POST',                 
					url : '/userModPopupAjax.do',   
					data:{
						member_idx : member_idx
					},
					dataType : "json",           
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {        
						alert('통신실패!');
					},
					success : function(data) {  
						console.log(data);
							
						$.each(data, function(index, item) { // 데이터 =item
							
							$('#modUserIdx').val(value);
							$('#modUserId').val(item.member_id);
							$('#modUserNm').val(item.member_nm);
							$('#modUserGroupidx').val(item.group_idx);
							$('#modUserRemark').val(item.remark);
							if(item.enabled == 'Y'){
								$('#modUserEnabledY').prop('checked',true);
								$('#modUserEnabledN').prop('checked',false);
							}else{
								$('#modUserEnabledN').prop('checked',true);
								$('#modUserEnabledY').prop('checked',false);
							}
						});
					}
				});
		}
		
		// 사용자 수정
		$(document).on('click', '#userModBtn', function(){

			var queryString = $("form[name=userupdateform]").serialize();
			var check_submit = confirm('사용자를 수정하시겠습니까?');

			if (userModValidation()) {
				if(check_submit){
					$.ajax({
						type : 'post',
						url : '/userupdate.do',
						data : queryString,
						dataType : 'json',
						contentType : "application/x-www-form-urlencoded;charset=UTF-8",
						error: function(xhr, status, error){
							alert(error);
						},
						success : function(success){
							alert('사용자가 수정되었습니다.');
							
							$.ajax({
								type : 'POST',                 
								url : '/usermgr/userListAjax.do',   
								dataType : "html",           
								contentType : "application/x-www-form-urlencoded;charset=UTF-8",
								error : function() {        
									alert('통신실패!');
								},
								success : function(data) {  
									$('#tab-content').empty().append(data);
									$('body').attr('class','').attr('style','');
									$('.modal-backdrop').remove();
								}
							});
						}
					});
				}
			}
		});
		
		// 사용자 선택 미사용
		$(document).on('click', '#userListEnabledBtn', function(){

			if(!$('input:checkbox[name="user_seqList"]').is(':checked')){
				alert("선택하신 사용자가 없습니다.");
				return false;
			}
			var user_seqList = [];
			
			$('.check_temp:checked').each(function(i){
				user_seqList.push($(this).val());
			});
			console.log(user_seqList);
			 
			var $this = $(this);
			var answer = confirm('선택하신 사용자를 미사용 처리하시겠습니까?');
			if(answer){
				$.ajax({
					type : 'POST',                 
					url : '/userListEnabled.do',   
					dataType : "json",         
					data:{
						user_seqList : user_seqList
					},
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {          
						alert('통신실패!');
					},
					success : function(success) {   
						alert("사용자가 미사용 처리되었습니다.");
						
						$.ajax({
							type : 'POST',                 
							url : '/usermgr/userListAjax.do',   
							dataType : "html",           
							contentType : "application/x-www-form-urlencoded;charset=UTF-8",
							error : function() {        
								alert('통신실패!');
							},
							success : function(data) {  
								$('#tab-content').empty().append(data);
								$('body').attr('class','').attr('style','');
								$('.modal-backdrop').remove();
							}
						});
					}
				});
			}
		});
		// 그룹 등록
		$(document).on('click', '#groupInsBtn', function(){

			var queryString = $("form[name=groupinsertform]").serialize();
			var check_submit = confirm('그룹을 등록하시겠습니까?');

			if (groupInsValidation()) {
				if(check_submit){
					$.ajax({
						type : 'post',
						url : '/groupinsert.do',
						data : queryString,
						dataType : 'json',
						contentType : "application/x-www-form-urlencoded;charset=UTF-8",
						error: function(xhr, status, error){
							alert(error);
						},
						success : function(success){
							alert('그룹이 등록되었습니다.');
							
							$.ajax({
								type : 'POST',                 
								url : '/groupListAjax.do',   
								dataType : "html",           
								contentType : "application/x-www-form-urlencoded;charset=UTF-8",
								error : function() {        
									alert('통신실패!');
								},
								success : function(data) {  
									$('#tab-content').empty().append(data);
									$('body').attr('class','').attr('style','');
									$('.modal-backdrop').remove();
								}
							});
						}
					});
				}
			}
		});
		
		// 그룹 삭제
		$(document).on('click', '#groupDelBtn', function(){

			if(!$('input:checkbox[name="group_seqList"]').is(':checked')){
				alert("선택하신 그룹이 없습니다.");
				return false;
			}
			var group_seqList = [];
			
			$('.check_temp:checked').each(function(i){
				group_seqList.push($(this).val());
			});
			console.log(group_seqList);
			 
			var $this = $(this);
			var answer = confirm('선택하신 그룹을 삭제하시겠습니까?');
			if(answer){
				$.ajax({
					type : 'POST',                 
					url : '/groupdelete.do',   
					dataType : "json",         
					data:{
						group_seqList : group_seqList
					},
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {          
						alert('통신실패!');
					},
					success : function(success) {   
						alert("그룹이 삭제되었습니다.");
						
						$.ajax({
							type : 'POST',                 
							url : '/groupListAjax.do',   
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
		});
		
		// 그룹 수정 팝업 버튼
		function groupModPopup(value) {
				var group_idx = value;
				$.ajax({
					type : 'POST',                 
					url : '/groupModPopupAjax.do',   
					data:{
						group_idx : group_idx
					},
					dataType : "json",           
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {        
						alert('통신실패!');
					},
					success : function(data) {  
						console.log(data);

						$.each(data, function(index, item) { // 데이터 =item
							console.log(item.group_idx);
							console.log(item.group_nm);
							console.log(item.remark);
							console.log(item.admin);
							
							$('#modGroupIdx').val(value);
							$('#modGroupNm').val(item.group_nm);
							$('#modGroupRemark').val(item.remark);
							
							if(item.admin == 'Y'){
								$('#modGroupY').prop('checked',true);
								$('#modGroupN').prop('checked',false);
							}else{
								$('#modGroupN').prop('checked',true);
								$('#modGroupY').prop('checked',false);
							}
						});
					}
				});
		}
		
		// 그룹 수정
		$(document).on('click', '#groupModBtn', function(){

			var queryString = $("form[name=groupupdateform]").serialize();
			var check_submit = confirm('그룹을 수정하시겠습니까?');

			if (groupModValidation()) {
				if(check_submit){
					$.ajax({
						type : 'post',
						url : '/groupupdate.do',
						data : queryString,
						dataType : 'json',
						contentType : "application/x-www-form-urlencoded;charset=UTF-8",
						error: function(xhr, status, error){
							alert(error);
						},
						success : function(success){
							alert('그룹이 수정되었습니다.');
							
							$.ajax({
								type : 'POST',                 
								url : '/groupListAjax.do',   
								dataType : "html",           
								contentType : "application/x-www-form-urlencoded;charset=UTF-8",
								error : function() {        
									alert('통신실패!');
								},
								success : function(data) {  
									$('#tab-content').empty().append(data);
									$('body').attr('class','').attr('style','');
									$('.modal-backdrop').remove();
								}
							});
						}
					});
				}
			}
		});
	</script>
</head>
<body data-sidebar="dark">
  <!-- <body data-layout="horizontal"> -->

    <!-- Begin page -->
    <div id="layout-wrapper">
 
 	<jsp:include page="../common/inc/headerContent.jsp" />
 
      <div class="main-content">
        <!-- 자료등록 시작 -->
        <div class="page-content">
          <!-- 자료구분 셀렉트 -->
          <div class="tap_text">
            <h2>사용자 관리</h2>
            <p>사용자관리 > <span>사용자 등록</span></p>
          </div>
          <div class="fr_wrap">
            <div class="mb-3 row fr_1">

          </div>
          <!--  -->
          <!-- 퀵메뉴 -->
          <div class="accordion" id="accordionExample">

            <div class="accordion-item">
              <h2 class="accordion-header" id="headingOne">
                <button
                  class="accordion-button fw-medium"
                  type="button"
                  data-bs-toggle="collapse"
                  data-bs-target="#collapseOne"
                  aria-expanded="true"
                  aria-controls="collapseOne"
                >
                  퀵메뉴
                </button>
              </h2>
              <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                  <div class="text-muted">
                    <strong class="text-dark">
                      <ul>
                        <li><a href="#">저장</a></li>
                        <li><a href="#">자료 등록하기</a></li>
                        <li><a href="#">자료 정보 가져오기</a></li>
                        <li><a href="#">자료 정보 일괄 변경</a></li>
                        <li><a href="#">자료 정보 삭제 신청</a></li>
                        <li><a href="#">자료 번호 삽입</a></li>
                      </ul>
                  </div>
                </div>
              </div>
            </div>
            <div class="accordion-item">
              <h2 class="accordion-header" id="headingTwo">
                <button
                  class="accordion-button fw-medium collapsed"
                  type="button"
                  data-bs-toggle="collapse"
                  data-bs-target="#collapseTwo"
                  aria-expanded="false"
                  aria-controls="collapseTwo"
                >
                  고정메뉴
                </button>
              </h2>
              <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                  <div class="text-muted">
                    <strong class="text-dark">
                      <ul>
                        <li><a href="#">연표</a></li>
                        <li><a href="#">연호</a></li>
                        <li><a href="#">용어</a></li>
                        <li><a href="#">분류체계</a></li>
                      </ul>
                  </div>
                </div>
              </div>
            </div>
            <div class="accordion-item">
              <h2 class="accordion-header" id="headingThree">
                <button
                  class="accordion-button fw-medium collapsed"
                  type="button"
                  data-bs-toggle="collapse"
                  data-bs-target="#collapseThree"
                  aria-expanded="false"
                  aria-controls="collapseThree"
                >
                  등록메뉴얼
                </button>
              </h2>
              <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                </div>
              </div>
            </div>
          </xdiv>
            <!--  -->
          </div>
          <!-- 내용물 -->
          <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" role="tab" href="javascript():;" id="userMgr">
                    <span class="d-block d-sm-none"><i class="far fa-user"></i></span>
                    <span class="d-none d-sm-block">사용자 관리</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" role="tab" href="javascript():;" id="groupMgr">
                    <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span>
                    <span class="d-none d-sm-block">그룹 관리</span>
                </a>
            </li>
        </ul>
<!--         <div class="user_top_wrap"> -->
<!--           <span>검색</span> -->
<!--           <select class="form-select st_select"> -->
<!--             <option disabled selected>전체</option> -->
<!--             <option>더미1</option> -->
<!--             <option>더미2</option> -->
<!--             <option>더미3</option> -->
<!--           </select> -->
<!--             <input type="text"> -->
<!--             <button>조회</button> -->
<!--           </div> -->
        <!-- Tab panes -->
        <div class="tab-content p-3 text-muted" id="tab-content">
            <!--  -->
            <!-- 기본사항 끝 -->
            <!--  -->
            <!-- 이동 사항 -->


                </div>
          <!--  -->
            </div>
        <!-- End Page-content -->
        <footer class="footer">
          <div class="container-fluid">
            <div class="row">
              <div class="col-sm-12">
                <script>
                  document.write(new Date().getFullYear())
                </script>
                &copy; Borex. Design & Develop by Themesbrand
              </div>
            </div>
          </div>
        </footer>
      </div>
      <!-- end main content-->
    </div>
    <!-- END layout-wrapper -->

    <!-- Right Sidebar -->
    <div class="right-bar">
      <div data-simplebar class="h-100">
        <div class="rightbar-title d-flex align-items-center bg-dark p-3">
          <h5 class="m-0 me-2 text-white">Theme Customizer</h5>

          <a href="javascript:void(0);" class="right-bar-toggle-close ms-auto">
            <i class="mdi mdi-close noti-icon"></i>
          </a>
        </div>

        <!-- Settings -->
        <hr class="m-0" />

        <div class="p-4">
          <h6 class="mb-3">Layout</h6>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="layout" id="layout-vertical" value="vertical" />
            <label class="form-check-label" for="layout-vertical">Vertical</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="layout" id="layout-horizontal" value="horizontal" />
            <label class="form-check-label" for="layout-horizontal">Horizontal</label>
          </div>

          <h6 class="mt-4 mb-3">Layout Mode</h6>

          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="layout-mode" id="layout-mode-light" value="light" />
            <label class="form-check-label" for="layout-mode-light">Light</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="layout-mode" id="layout-mode-dark" value="dark" />
            <label class="form-check-label" for="layout-mode-dark">Dark</label>
          </div>

          <h6 class="mt-4 mb-3">Layout Width</h6>

          <div class="form-check form-check-inline">
            <input
              class="form-check-input"
              type="radio"
              name="layout-width"
              id="layout-width-fluid"
              value="fluid"
              onchange="document.body.setAttribute('data-layout-size', 'fluid')"
            />
            <label class="form-check-label" for="layout-width-fluid">Fluid</label>
          </div>
          <div class="form-check form-check-inline">
            <input
              class="form-check-input"
              type="radio"
              name="layout-width"
              id="layout-width-boxed"
              value="boxed"
              onchange="document.body.setAttribute('data-layout-size', 'boxed')"
            />
            <label class="form-check-label" for="layout-width-boxed">Boxed</label>
          </div>

          <h6 class="mt-4 mb-3">Layout Position</h6>

          <div class="form-check form-check-inline">
            <input
              class="form-check-input"
              type="radio"
              name="layout-position"
              id="layout-position-fixed"
              value="fixed"
              onchange="document.body.setAttribute('data-layout-scrollable', 'false')"
            />
            <label class="form-check-label" for="layout-position-fixed">Fixed</label>
          </div>
          <div class="form-check form-check-inline">
            <input
              class="form-check-input"
              type="radio"
              name="layout-position"
              id="layout-position-scrollable"
              value="scrollable"
              onchange="document.body.setAttribute('data-layout-scrollable', 'true')"
            />
            <label class="form-check-label" for="layout-position-scrollable">Scrollable</label>
          </div>

          <h6 class="mt-4 mb-3">Topbar Color</h6>

          <div class="form-check form-check-inline">
            <input
              class="form-check-input"
              type="radio"
              name="topbar-color"
              id="topbar-color-light"
              value="light"
              onchange="document.body.setAttribute('data-topbar', 'light')"
            />
            <label class="form-check-label" for="topbar-color-light">Light</label>
          </div>
          <div class="form-check form-check-inline">
            <input
              class="form-check-input"
              type="radio"
              name="topbar-color"
              id="topbar-color-dark"
              value="dark"
              onchange="document.body.setAttribute('data-topbar', 'dark')"
            />
            <label class="form-check-label" for="topbar-color-dark">Dark</label>
          </div>

          <div id="sidebar-setting">
            <h6 class="mt-4 mb-3 sidebar-setting">Sidebar Size</h6>

            <div class="form-check sidebar-setting">
              <input
                class="form-check-input"
                type="radio"
                name="sidebar-size"
                id="sidebar-size-default"
                value="default"
                onchange="document.body.setAttribute('data-sidebar-size', 'lg')"
              />
              <label class="form-check-label" for="sidebar-size-default">Default</label>
            </div>
            <div class="form-check sidebar-setting">
              <input
                class="form-check-input"
                type="radio"
                name="sidebar-size"
                id="sidebar-size-compact"
                value="compact"
                onchange="document.body.setAttribute('data-sidebar-size', 'md')"
              />
              <label class="form-check-label" for="sidebar-size-compact">Compact</label>
            </div>
            <div class="form-check sidebar-setting">
              <input
                class="form-check-input"
                type="radio"
                name="sidebar-size"
                id="sidebar-size-small"
                value="small"
                onchange="document.body.setAttribute('data-sidebar-size', 'sm')"
              />
              <label class="form-check-label" for="sidebar-size-small">Small (Icon View)</label>
            </div>

            <h6 class="mt-4 mb-3 sidebar-setting">Sidebar Color</h6>

            <div class="form-check sidebar-setting">
              <input
                class="form-check-input"
                type="radio"
                name="sidebar-color"
                id="sidebar-color-light"
                value="light"
                onchange="document.body.setAttribute('data-sidebar', 'light')"
              />
              <label class="form-check-label" for="sidebar-color-light">Light</label>
            </div>
            <div class="form-check sidebar-setting">
              <input
                class="form-check-input"
                type="radio"
                name="sidebar-color"
                id="sidebar-color-dark"
                value="dark"
                onchange="document.body.setAttribute('data-sidebar', 'dark')"
              />
              <label class="form-check-label" for="sidebar-color-dark">Dark</label>
            </div>
            <div class="form-check sidebar-setting">
              <input
                class="form-check-input"
                type="radio"
                name="sidebar-color"
                id="sidebar-color-brand"
                value="brand"
                onchange="document.body.setAttribute('data-sidebar', 'brand')"
              />
              <label class="form-check-label" for="sidebar-color-brand">Brand</label>
            </div>
          </div>

          <h6 class="mt-4 mb-3">Direction</h6>

          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="layout-direction" id="layout-direction-ltr" value="ltr" />
            <label class="form-check-label" for="layout-direction-ltr">LTR</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="layout-direction" id="layout-direction-rtl" value="rtl" />
            <label class="form-check-label" for="layout-direction-rtl">RTL</label>
          </div>
        </div>
      </div>
      <!-- end slimscroll-menu-->
    </div>
    <!-- /Right-bar -->

    <!-- Right bar overlay-->
    <div class="rightbar-overlay"></div>

    <!-- chat offcanvas -->
    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasActivity" aria-labelledby="offcanvasActivityLabel">
      <div class="offcanvas-header border-bottom">
        <h5 id="offcanvasActivityLabel">Offcanvas right</h5>
        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body">...</div>
    </div>


    <!-- JAVASCRIPT -->
    <script src="<c:url value='/assets/libs/bootstrap/js/bootstrap.bundle.min.js'/>" defer></script>
    <script src="<c:url value='/assets/libs/metismenujs/metismenujs.min.js'/>" defer></script>
    <script src="<c:url value='/assets/libs/simplebar/simplebar.min.js'/>" defer></script>
    <script src="<c:url value='/assets/libs/eva-icons/eva.min.js'/>" defer></script>
    <!-- apexcharts -->
    <script src="<c:url value='/assets/libs/apexcharts/apexcharts.min.js'/>" defer></script>
    <script src="<c:url value='/assets/js/pages/dashboard.init.js'/>" defer></script>
    <script src="<c:url value='/assets/js/app.js'/>" defer></script>
    <!--  -->
    <script src="<c:url value='/assets/js/pages/ecommerce-product-detail.init.js'/>" defer></script>
    
<!-- <div class="user_lists_Area" id="user_lists_Area"></div> -->

<!-- <form id="userForm" name="userForm" method="post"> -->
<!-- 	<input type="hidden" 	id="umember_id"				name="member_id" 			value="dd" /> -->
<!-- 	<input type="hidden" 	id="umember_nm" 			name="member_nm" 			value="dd" /> -->
<!-- <!-- 	<input type="hidden" 	id="ugroup_idx" 			name="group_idx"	 		value="" /> --> 
<!-- </form> -->
</body>
</html>