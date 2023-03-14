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
    <title>고객센터 | 국립항공박물관</title>
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
    <link rel="stylesheet" href="<c:url value='/assets/css/custom_center.css'/>">
    <link rel="stylesheet" href="<c:url value='/assets/css/custom_view.css'/>">
<%--     <link rel="stylesheet" href="<c:url value='/assets/css/custom_user.css'/>"/> --%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script type="text/javascript">
		
	// 체크박스 전체선택 전체해제
	function checkAll(){
		var val = true;

		if(!$('#checkAll').is(":checked")){
			val = false;
		}
		
		var elems = document.getElementsByClassName("check_temp");
		for(var i=0; elems.length>i; i++){
			elems[i].checked = val;
		}
	}
		
		$(function() {
			// 첫 페이지
// 			$('#notice').attr('aria-selected', 'true').addClass('active');
			
			$.ajax({
				type : 'POST',                
				url : '/faq/faqListAjax.do',    
				dataType : "html",           
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {          
					alert('통신실패!');
				},
				success : function(data) {  
					$('#tab-content').empty().append(data);
				}
			});
		});
	
		// FAQ 등록
		$(document).on('click', '#faqInsBtn', function(){

			var queryString = $("form[name=faqinsertform]").serialize();
			var check_submit = confirm('FAQ을 등록하시겠습니까?');

				if(check_submit){
					$.ajax({
						type : 'post',
						url : '/faqinsert.do',
						data : queryString,
						dataType : 'json',
						contentType : "application/x-www-form-urlencoded;charset=UTF-8",
						error: function(xhr, status, error){
							alert(error);
						},
						success : function(success){
							alert('공지사항이 등록되었습니다.');
							$('#faqInsInputClose').click();
							location.reload();
						}
					});
				}
		});
		
		// FAQ 수정 팝업 버튼
		function faqModPopup(value) {
				var faq_idx = value;
				$.ajax({
					type : 'POST',                 
					url : '/faqPopupAjax.do',   
					data:{
						faq_idx : faq_idx
					},
					dataType : "json",           
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {        
						alert('통신실패!');
					},
					success : function(data) {  
							
						$.each(data, function(index, item) { // 데이터 =item
							
							$('#modFaqIdx').val(value);
							$('#modFaqContent').val(item.faq_content);
							$('#modAnswerContents').val(item.answer_contents);
						});
					}
				});
		}
		
		// FAQ 수정
		$(document).on('click', '#faqModBtn', function(){

			var queryString = $("form[name=faqupdateform]").serialize();
			var check_submit = confirm('FAQ를 수정하시겠습니까?');

			if(check_submit){
				$.ajax({
					type : 'post',
					url : '/faqupdate.do',
					data : queryString,
					dataType : 'json',
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error: function(xhr, status, error){
						alert(error);
					},
					success : function(success){
						alert('FAQ가 수정되었습니다.');
						$('#faqModInputClose').click();
						$.ajax({
							type : 'POST',                 
							url : '/faq/faqListAjax.do',   
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
		
		// FAQ 선택 삭제
		$(document).on('click', '#faqListDeleteBtn', function(){

			if(!$('input:checkbox[name="faq_seqList"]').is(':checked')){
				alert("선택한 FAQ가 없습니다.");
				return false;
			}
			var faq_seqList = [];
			
			$('.check_temp:checked').each(function(i){
				faq_seqList.push($(this).val());
			});
			 
			var $this = $(this);
			var answer = confirm('선택한 FAQ를 삭제 처리하시겠습니까?');
			$.ajax({
				type : 'POST',                 
				url : '/faqListDelete.do',   
				dataType : "json",         
				data:{
					faq_seqList : faq_seqList
				},
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {          
					alert('통신실패!');
				},
				success : function(success) {   
					alert("FAQ가 삭제 처리되었습니다.");
					
					$.ajax({
						type : 'POST',                 
						url : '/faq/faqListAjax.do',   
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
 
 	<jsp:include page="../../common/inc/headerContent.jsp" />
 
      <div class="main-content">
        <!-- 자료등록 시작 -->
        <div class="page-content">
          <!-- 자료구분 셀렉트 -->
          <div class="tap_text">
            <h2>고객센터</h2>
            <p>고객센터 > <span>FAQ</span></p>
          </div>
          <div class="fr_wrap">
            <div class="mb-3 row fr_1">

          </div>
          <!--  -->
          </div>
<!--           내용물 -->
<!--           <ul class="nav nav-tabs" role="tablist"> -->
<!--             <li class="nav-item"> -->
<!--                 <a class="nav-link" data-bs-toggle="tab" role="tab" href="javascript():;" id="notice"> -->
<!--                     <span class="d-block d-sm-none"><i class="fas fa-home"></i></span> -->
<!--                     <span class="d-none d-sm-block">공지사항</span> -->
<!--                 </a> -->
<!--             </li> -->
<!--             <li class="nav-item"> -->
<!--                 <a class="nav-link" data-bs-toggle="tab" role="tab" href="javascript():;" id="faq"> -->
<!--                     <span class="d-block d-sm-none"><i class="far fa-user"></i></span> -->
<!--                     <span class="d-none d-sm-block">FAQ</span> -->
<!--                 </a> -->
<!--             </li> -->
<!--             <li class="nav-item"> -->
<!--                 <a class="nav-link" data-bs-toggle="tab" role="tab" href="javascript():;" id="1234"> -->
<!--                     <span class="d-block d-sm-none"><i class="far fa-user"></i></span> -->
<!--                     <span class="d-none d-sm-block">오류신고 / 개선사항</span> -->
<!--                 </a> -->
<!--             </li> -->
<!--         </ul> -->
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