<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>환경설정-로그관리 | 국립항공박물관</title>
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
    <!-- 커스텀 css -->
    <link href="assets/css/custom.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="assets/css/custom_data_review.css">
    <script src="assets/libs/jquery/jquery-3.6.3.min.js"></script>
    <script type="text/javascript">
		$(function() {
			
			// 첫 페이지
			$('#dataHistory').attr('aria-selected', 'true').addClass('active');
			
			$.ajax({
				type : 'POST',                
				url : '/dataHistoryAjax.do',    
				dataType : "html",           
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {          
					alert('통신실패!');
				},
				success : function(data) {  
					$('#tab-content').empty().append(data);
				}
			});
			
			// 자료내역로그 tab operation
			$('#dataHistory').click(function() {
				$.ajax({
					type : 'POST',                
					url : '/dataHistoryAjax.do',    
					dataType : "html",           
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {          
						alert('통신실패!');
					},
					success : function(data) {  
						$('#tab-content').empty().append(data);
						$("#ExcelForm").clearForm();
					}
				});
			});
			
			// 사용자 접속로그 tab operation
			$('#userAccess').click(function() {
				$.ajax({
					type : 'POST',                 
					url : '/userAccessAjax.do',   				
					dataType : "html",           
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {        
						alert('통신실패!');
					},
					success : function(data) {  
						$('#tab-content').empty().append(data);
						$("#ExcelForm").clearForm();
					}
				});
			});
		
			// 전문정보 등록로그 tab operation
			$('#specialityRegister').click(function() {
				$.ajax({
					type : 'POST',                 
					url : '/specialityRegisterAjax.do',   				
					dataType : "html",           
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {        
						alert('통신실패!');
					},
					success : function(data) {  
						$('#tab-content').empty().append(data);
						$("#ExcelForm").clearForm();
					}
				});
			});		
			
			// 이동사항 내역로그 tab operation
			$('#movementHistory').click(function() {
				$.ajax({
					type : 'POST',                 
					url : '/movementHistoryAjax.do',   				
					dataType : "html",           
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {        
						alert('통신실패!');
					},
					success : function(data) {  
						$('#tab-content').empty().append(data);
						$("#ExcelForm").clearForm();
					}
				});
			});		
			
			// 권한로그 tab operation
			$('#authority').click(function() {
				$.ajax({
					type : 'POST',                 
					url : '/authorityAjax.do',   				
					dataType : "html",           
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {        
						alert('통신실패!');
					},
					success : function(data) {  
						$('#tab-content').empty().append(data);
						$("#ExcelForm").clearForm();
					}
				});
			});		

			$.fn.clearForm = function () {
				  return this.each(function () {
				    var type = this.type,
				      tag = this.tagName.toLowerCase();
				    if (tag === 'form') {
				      return $(':input', this).clearForm();
				    }
				    if (
				      type === 'text' ||
				      type === 'password' ||
				      type === 'hidden' ||
				      tag === 'textarea'
				    ) {
				      this.value = '';
				    } else if (type === 'checkbox' || type === 'radio') {
				      this.checked = false;
				    } else if (tag === 'select') {
				      this.selectedIndex = -1;
				    }
				  });
			};
		});


    </script>
  </head>

  <body data-sidebar="dark">
	<jsp:include page="../../common/inc/headerContent.jsp" />
      <!-- ============================================================== -->
      <div class="main-content">
        <!-- 구입물품 심사 시작 -->
        <div class="page-content">
          <div class="tap_text">
            <h2>환경설정</h2>
            <p>환경설정 > <span>로그관리</span></p>
          </div>
          <!-- 탭 -->
          <ul class="nav nav-tabs" role="tablist" style="max-width: 759px;">
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#datareview_1" role="tab" id="dataHistory">
                    <span class="d-block d-sm-none"><i class="far fa-user"></i></span>
                    <span class="d-none d-sm-block">자료내역로그</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#datareview_2" role="tab" id="userAccess">
                    <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span>
                    <span class="d-none d-sm-block">사용자 접속로그</span>
                </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-bs-toggle="tab" href="#datareview_3" role="tab" id="specialityRegister">
                  <span class="d-block d-sm-none"><i class="far fa-user"></i></span>
                  <span class="d-none d-sm-block">전문정보 등록로그</span>
              </a>
          </li>
          <li class="nav-item">
              <a class="nav-link" data-bs-toggle="tab" href="#datareview_4" role="tab" id="movementHistory">
                  <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span>
                  <span class="d-none d-sm-block">이동사항 내역로그</span>
              </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="tab" href="#datareview_5" role="tab" id="authority">
                <span class="d-block d-sm-none"><i class="far fa-user"></i></span>
                <span class="d-none d-sm-block">권한로그</span>
            </a>
        </li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content p-3 text-muted" id="tab-content">



 
 
        <!-- <button>저장</button> -->
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
      	<form id="ExcelForm" name="ExcelForm" method="post" class="form-horizontal">
		 	   <input type="hidden" name="org_nm" id="search_org_nm" />
          	   <input type="hidden" name="possession_nm" id="search_possession_nm" />			  
			   <input type="hidden" name="item_no" id="search_item_no" />                
               <input type="hidden" name="item_detail_no" id="search_item_detail_no" />                   
               <input type="hidden" name="start_reg_date" id="search_start_reg_date" />   
               <input type="hidden" name="end_reg_date" id="search_end_reg_date" />  
               <input type="hidden" name="search_type" id="search_search_type" />  
               <input type="hidden" name="search_word" id="search_search_word" />  
               <input type="hidden" name="access_type" id="search_access_type" />
               <input type="hidden" name="page" id="search_page"/> 	         
		</form>

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
    <script src="assets/js/pages/ecommerce-product-detail.init.js"></script>
  </body>
</html>