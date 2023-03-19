<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>마이페이지 | 국립항공박물관</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesbrand" name="author" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.ico" />
    <!-- Bootstrap Css -->
    <link href="assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />
    <!--  -->
    <link rel="stylesheet" href="assets/libs/swiper/swiper-bundle.min.css">
    <!-- 슬릭 슬라이더 -->
    <link rel="stylesheet" href="assets/libs/slick/slick.css">
    <link rel="stylesheet" href="assets/libs/slick/slick-theme.css">
    <script src="assets/libs/jquery/jquery-3.6.3.min.js"></script>
    <!-- 커스텀 css -->
    <link href="assets/css/custom.css" rel="stylesheet" type="text/css"/>
<!--     <link rel="stylesheet" href="assets/css/custom_view.css"> -->
    <link rel="stylesheet" href="assets/css/custom_my.css">
    <link href="assets/css/viewer.css" rel="stylesheet" type="text/css" />
	<script src="assets/js/viewer.js"></script>
    <script src="assets/js/metadata/metadataList.js"></script> 
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
			$('#interest').attr('aria-selected', 'true').addClass('active');
			
			$.ajax({
				type : 'POST',                
				url : '/interestAjax.do',    
				dataType : "html",           
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {          
					alert('통신실패!');
				},
				success : function(data) {  
					$('#tab-content').empty().append(data);
				}
			});
			
			// 관심자료관리 tab operation
			$('#interest').click(function() {
				$.ajax({
					type : 'POST',                
					url : '/interestAjax.do',    
					dataType : "html",           
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {          
						alert('통신실패!');
					},
					success : function(data) {  
						$('#tab-content').empty().append(data);
// 						$('.tap_text').find('span').text('그룹관리 권한');
					}
				});
			});
			
			// 요청내역조회 tab operation
			$('#requestHistory').click(function() {
				$.ajax({
					type : 'POST',                
					url : '/requestHistoryAjax.do',    
					dataType : "html",           
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {          
						alert('통신실패!');
					},
					success : function(data) {  
						$('#tab-content').empty().append(data);
// 						$('.tap_text').find('span').text('그룹관리 권한');
					}
				});
			});
			
			// 등록전문정보 tab operation
			$('#rgstrSpeciality').click(function() {
				$.ajax({
					type : 'POST',                
					url : '/rgstrSpecialityAjax.do',    
					dataType : "html",           
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {          
						alert('통신실패!');
					},
					success : function(data) {  
						$('#tab-content').empty().append(data);
// 						$('.tap_text').find('span').text('그룹관리 권한');
					}
				});
			});
			
			// 개인정보변경 tab operation
			$('#changePrivacy').click(function() {
				$.ajax({
					type : 'POST',                
					url : '/changePrivacyAjax.do',    
					dataType : "html",           
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {          
						alert('통신실패!');
					},
					success : function(data) {  
						$('#tab-content').empty().append(data);
// 						$('.tap_text').find('span').text('그룹관리 권한');
					}
				});
			});
			
			// 작업내역 tab operation
			$('#workHistory').click(function() {
				$.ajax({
					type : 'POST',                
					url : '/workHistoryAjax.do',    
					dataType : "html",           
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {          
						alert('통신실패!');
					},
					success : function(data) {  
						$('#tab-content').empty().append(data);
// 						$('.tap_text').find('span').text('그룹관리 권한');
					}
				});
			});
		});
	
    	// 계정 확인
		$(document).on('click', '#userConfirmBtn', function(){
	
			var queryString = $("form[name=userConfirmForm]").serialize();
	
				$.ajax({
					type : 'post',
					url : '/userConfirmAjax.do',
					data : queryString,
					dataType : 'json',
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error: function(xhr, status, error){
						alert(error);
					},
					success : function(data){
						console.log(data.userConfirm.length);
						if(data.userConfirm.length == 0){
							alert('비밀번호를 확인해주세요');
							$("#member_pw").focus();
						}else{							
							$.ajax({
								type : 'POST',                
								url : '/changePrivacyAjax2.do',    
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
					}
				});
		});
    	
    	// 비밀번호 변경
		$(document).on('click', '#userPwChangeBtn', function(){
	
			var queryString = $("form[name=userPwChangeForm]").serialize();
			var check_submit = confirm('비밀번호를 수정하시겠습니까?');
			if (userModValidation()) {
				if(check_submit){
					$.ajax({
						type : 'post',
						url : '/userPwChangeAjax.do',
						data : queryString,
						dataType : 'json',
						contentType : "application/x-www-form-urlencoded;charset=UTF-8",
						error: function(xhr, status, error){
							alert(error);
						},
						success : function(data){
							alert("비밀번호가 변경되었습니다");
								location.href = "logout.do";
// 								$.ajax({
// 									type : 'POST',                
// 									url : '/changePrivacyAjax.do',    
// 									dataType : "html",           
// 									contentType : "application/x-www-form-urlencoded;charset=UTF-8",
// 									error : function() {          
// 										alert('통신실패!');
// 									},
// 									success : function(data) {  
// 										$('#tab-content').empty().append(data);
// 									}
// 								});
						}
					});
				}
			}
		});
    	
		// 관심자료 삭제
		$(document).on('click', '#interestDelBtn', function(){

			if(!$('input:checkbox[name="group_seqList"]').is(':checked')){
				alert("선택하신 관심자료가 없습니다.");
				$('#interestDelBtnClose').click();

				return false;
			}
			var group_seqList = [];
			
			$('.check_temp:checked').each(function(i){
				group_seqList.push($(this).val());
			});
			console.log(group_seqList);
			 
			var $this = $(this);

				$.ajax({
					type : 'POST',                 
					url : '/interestDelete.do',   
					dataType : "json",         
					data:{
						group_seqList : group_seqList
					},
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {          
						alert('통신실패!');
					},
					success : function(success) {   
						alert("관심자료가 삭제되었습니다.");
						$('#interestDelBtnClose').click();
						$.ajax({
							type : 'POST',                 
							url : '/interestAjax.do',   
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
		});
		
    </script>
  </head>

  <body data-sidebar="dark">
    <!-- <body data-layout="horizontal"> -->

    <!-- Begin page -->
    <div id="layout-wrapper">

 	<jsp:include page="../common/inc/headerContent.jsp" />

      <!-- ============================================================== -->
      <div class="main-content">
        <!-- 자료등록 시작 -->
        <div class="page-content">
          <div class="tap_text">
            <h2>마이페이지</h2>
          </div>
            <!--  -->
          </div>
          <!-- 내용물 -->
          <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" data-bs-toggle="tab" href="#home" role="tab" id="interest">
                    <span class="d-block d-sm-none"><i class="fas fa-home"></i></span>
                    <span class="d-none d-sm-block">관심자료관리</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#profile" role="tab" id="requestHistory">
                    <span class="d-block d-sm-none"><i class="far fa-user"></i></span>
                    <span class="d-none d-sm-block">요청내역조회</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#messages" role="tab" id="rgstrSpeciality">
                    <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span>
                    <span class="d-none d-sm-block">등록 전문정보</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#settings" role="tab" id="changePrivacy">
                    <span class="d-block d-sm-none"><i class="fas fa-cog"></i></span>
                    <span class="d-none d-sm-block">개인정보 변경</span>
                </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-bs-toggle="tab" href="#settings22" role="tab" id="workHistory">
                  <span class="d-block d-sm-none"><i class="fas fa-cog"></i></span>
                  <span class="d-none d-sm-block">작업 내역</span>
              </a>
          </li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content p-3 text-muted" id="tab-content">



          

        </div>
          <!--  -->
<!--         <button>저장</button> -->

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
    <script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/libs/metismenujs/metismenujs.min.js"></script>
    <script src="assets/libs/simplebar/simplebar.min.js"></script>
    <script src="assets/libs/eva-icons/eva.min.js"></script>
    <!-- apexcharts -->
    <script src="assets/libs/apexcharts/apexcharts.min.js"></script>
    <script src="assets/js/pages/dashboard.init.js"></script>
    <script src="assets/js/app.js"></script>
    <!--  -->
    <script src="assets/libs/swiper/swiper-bundle.min.js"></script>
    <script src="assets/js/pages/ecommerce-product-detail.init.js"></script>
    <!-- 슬릭 슬라이드 -->
    <script src="assets/libs/slick/slick.js"></script>


  <!-- 스크립트 -->
    <script>
      $(function(){
        $('.img-slider').slick();
      });
    </script>
    <!--  -->
  </body>
</html>