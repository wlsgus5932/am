<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>자료검색 | 국립항공박물관</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesbrand" name="author" />
    <!-- App favicon -->

    <!-- Bootstrap Css -->
    <link href="assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />
    <!-- 커스텀 css -->
    <link href="assets/css/custom.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="assets/css/custom_search.css" />
    <script src="assets/libs/jquery/jquery-3.6.3.min.js"></script>
    
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
			$('#metaDataSearchList').attr('aria-selected', 'true').addClass('active');
			
			$.ajax({
				type : 'POST',                
				url : '/metaDataSearchListAjax.do',    
				dataType : "html",           
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {          
					alert('통신실패!');
				},
				success : function(data) {  
					$('#tab-content').empty().append(data);
				}
			});
			
			// 리스트 tab operation
			$('#metaDataSearchList').click(function() {
				$.ajax({
					type : 'POST',                
					url : '/metaDataSearchListAjax.do',    
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
			
			// 이미지리스트 tab operation
			$('#metaDataSearchImageList').click(function() {
				$.ajax({
					type : 'POST',                
					url : '/metaDataSearchImageListAjax.do',    
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
	    
	    function quickView(value){
	    	var item_idx = value;
	    	if(item_idx.length == 0){
	    		return;
	    	}
	    	$.ajax({
				type : 'POST',                
				url : '/metaDataSearchQuickViewAjax.do',
				data : {
					item_idx : item_idx
				},
				dataType : "html",           
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {          
					alert('통신실패!');
				},
				success : function(data) {  
					$('#simple_view_wrap').empty().append(data);
//						$('.tap_text').find('span').text('그룹관리 권한');
				}
			});
	    }
	   
	    function imageQuickView(value){
	    	var image_idx = value;
	    	if(image_idx.length == 0){
	    		return;
	    	}
	    	$.ajax({
				type : 'POST',                
				url : '/metaDataSearchImageQuickViewAjax.do',
				data : {
					image_idx : image_idx
				},
				dataType : "html",           
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {          
					alert('통신실패!');
				},
				success : function(data) {  
					$('#simple_view_wrap').empty().append(data);
//						$('.tap_text').find('span').text('그룹관리 권한');
				}
			});
	    }
	    
		function quickViewCloseBtn(){
			$('#simple_view_wrap').empty();
		}
    </script>
  </head>

  <body data-sidebar="dark">
    <!-- <body data-layout="horizontal"> -->

    <!-- Begin page -->
    <div id="layout-wrapper">
    
     	<jsp:include page="../common/inc/headerContent.jsp" />
      <header id="page-topbar" class="isvertical-topbar">
        <div class="navbar-header">
          <div class="d-flex">
            <!-- LOGO -->
            <div class="navbar-brand-box">
              <a href="index.html" class="logo logo-dark">
                <span class="logo-sm">
                  <img src="assets/images/logo-dark-sm.png" alt="" height="22" />
                </span>
                <span class="logo-lg">
                  <img src="assets/images/logo-dark-sm.png" alt="" height="22" />
                </span>
              </a>

              <a href="index.html" class="logo logo-light">
                <span class="logo-lg">
                  <img src="assets/images/logo-light.png" alt="" height="22" />
                </span>
                <span class="logo-sm">
                  <img src="assets/images/logo-light-sm.png" alt="" height="22" />
                </span>
              </a>
            </div>

            <button type="button" class="btn btn-sm px-3 font-size-16 header-item vertical-menu-btn topnav-hamburger">
              <span class="hamburger-icon open">
                <span></span>
                <span></span>
                <span></span>
              </span>
            </button>

            <div class="d-none d-sm-block ms-3 align-self-center">
              <!-- <h4 class="page-title">자료 신규등록</h4> -->
              <div class="dropdown">
                <button type="button" class="btn header-item" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="icon-sm" data-eva="search-outline"></i>
                </button>
                <div class="dropdown-menu dropdown-menu-end dropdown-menu-md p-0">
                  <form class="p-2">
                    <div class="search-box">
                      <div class="position-relative">
                        <input type="text" class="form-control bg-light border-0" placeholder="Search..." />
                        <i class="search-icon" data-eva="search-outline" data-eva-height="26" data-eva-width="26"></i>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>

          <div class="d-flex">
            <!-- <div class="dropdown">
              <button type="button" class="btn header-item" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="icon-sm" data-eva="search-outline"></i>
              </button>
              <div class="dropdown-menu dropdown-menu-end dropdown-menu-md p-0">
                <form class="p-2">
                  <div class="search-box">
                    <div class="position-relative">
                      <input type="text" class="form-control bg-light border-0" placeholder="Search..." />
                      <i class="search-icon" data-eva="search-outline" data-eva-height="26" data-eva-width="26"></i>
                    </div>
                  </div>
                </form>
              </div>
            </div> -->

            <div class="dropdown d-inline-block language-switch">
              <!-- <button type="button" class="btn header-item" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <img class="header-lang-img" src="assets/images/flags/us.jpg" alt="Header Language" height="16" />
              </button> -->
              <div class="dropdown-menu dropdown-menu-end">
                <!-- item-->
                <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="eng">
                  <img src="assets/images/flags/us.jpg" alt="user-image" class="me-1" height="12" /> <span class="align-middle">English</span>
                </a>

                <!-- item-->
                <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="sp">
                  <img src="assets/images/flags/spain.jpg" alt="user-image" class="me-1" height="12" /> <span class="align-middle">Spanish</span>
                </a>

                <!-- item-->
                <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="gr">
                  <img src="assets/images/flags/germany.jpg" alt="user-image" class="me-1" height="12" /> <span class="align-middle">German</span>
                </a>

                <!-- item-->
                <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="it">
                  <img src="assets/images/flags/italy.jpg" alt="user-image" class="me-1" height="12" /> <span class="align-middle">Italian</span>
                </a>

                <!-- item-->
                <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="ru">
                  <img src="assets/images/flags/russia.jpg" alt="user-image" class="me-1" height="12" /> <span class="align-middle">Russian</span>
                </a>
              </div>
            </div>

            <div class="dropdown d-none d-lg-inline-block">
              <!-- <button type="button" class="btn header-item noti-icon" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="icon-sm" data-eva="grid-outline"></i>
              </button> -->
              <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0">
                <div class="p-3">
                  <div class="row align-items-center">
                    <div class="col">
                      <h5 class="m-0 font-size-15">Web Apps</h5>
                    </div>
                    <div class="col-auto">
                      <a href="#!" class="small fw-semibold text-decoration-underline"> View All</a>
                    </div>
                  </div>
                </div>
                <div class="px-lg-2 pb-2">
                  <div class="row g-0">
                    <div class="col">
                      <a class="dropdown-icon-item" href="#!">
                        <img src="assets/images/brands/github.png" alt="Github" />
                        <span>GitHub</span>
                      </a>
                    </div>
                    <div class="col">
                      <a class="dropdown-icon-item" href="#!">
                        <img src="assets/images/brands/bitbucket.png" alt="bitbucket" />
                        <span>Bitbucket</span>
                      </a>
                    </div>
                    <div class="col">
                      <a class="dropdown-icon-item" href="#!">
                        <img src="assets/images/brands/dribbble.png" alt="dribbble" />
                        <span>Dribbble</span>
                      </a>
                    </div>
                  </div>

                  <div class="row g-0">
                    <div class="col">
                      <a class="dropdown-icon-item" href="#!">
                        <img src="assets/images/brands/dropbox.png" alt="dropbox" />
                        <span>Dropbox</span>
                      </a>
                    </div>
                    <div class="col">
                      <a class="dropdown-icon-item" href="#!">
                        <img src="assets/images/brands/mail_chimp.png" alt="mail_chimp" />
                        <span>Mail Chimp</span>
                      </a>
                    </div>
                    <div class="col">
                      <a class="dropdown-icon-item" href="#!">
                        <img src="assets/images/brands/slack.png" alt="slack" />
                        <span>Slack</span>
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="dropdown d-inline-block">
              <!-- <button
                type="button"
                class="btn header-item noti-icon"
                id="page-header-notifications-dropdown-v"
                data-bs-toggle="dropdown"
                aria-haspopup="true"
                aria-expanded="false"
              >
                <i class="icon-sm" data-eva="bell-outline"></i>
                <span class="noti-dot bg-danger rounded-pill">4</span>
              </button> -->
              <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0" aria-labelledby="page-header-notifications-dropdown-v">
                <div class="p-3">
                  <div class="row align-items-center">
                    <div class="col">
                      <h5 class="m-0 font-size-15">Notifications</h5>
                    </div>
                    <div class="col-auto">
                      <a href="#!" class="small fw-semibold text-decoration-underline"> Mark all as read</a>
                    </div>
                  </div>
                </div>
                <div data-simplebar style="max-height: 250px">
                  <a href="#!" class="text-reset notification-item">
                    <div class="d-flex">
                      <div class="flex-shrink-0 me-3">
                        <img src="assets/images/users/avatar-3.jpg" class="rounded-circle avatar-sm" alt="user-pic" />
                      </div>
                      <div class="flex-grow-1">
                        <h6 class="mb-1">James Lemire</h6>
                        <div class="font-size-13 text-muted">
                          <p class="mb-1">It will seem like simplified English.</p>
                          <p class="mb-0"><i class="mdi mdi-clock-outline"></i> <span>1 hour ago</span></p>
                        </div>
                      </div>
                    </div>
                  </a>
                  <a href="#!" class="text-reset notification-item">
                    <div class="d-flex">
                      <div class="flex-shrink-0 avatar-sm me-3">
                        <span class="avatar-title bg-primary rounded-circle font-size-16">
                          <i class="bx bx-cart"></i>
                        </span>
                      </div>
                      <div class="flex-grow-1">
                        <h6 class="mb-1">Your order is placed</h6>
                        <div class="font-size-13 text-muted">
                          <p class="mb-1">If several languages coalesce the grammar</p>
                          <p class="mb-0"><i class="mdi mdi-clock-outline"></i> <span>3 min ago</span></p>
                        </div>
                      </div>
                    </div>
                  </a>
                  <a href="#!" class="text-reset notification-item">
                    <div class="d-flex">
                      <div class="flex-shrink-0 avatar-sm me-3">
                        <span class="avatar-title bg-success rounded-circle font-size-16">
                          <i class="bx bx-badge-check"></i>
                        </span>
                      </div>
                      <div class="flex-grow-1">
                        <h6 class="mb-1">Your item is shipped</h6>
                        <div class="font-size-13 text-muted">
                          <p class="mb-1">If several languages coalesce the grammar</p>
                          <p class="mb-0"><i class="mdi mdi-clock-outline"></i> <span>3 min ago</span></p>
                        </div>
                      </div>
                    </div>
                  </a>

                  <a href="#!" class="text-reset notification-item">
                    <div class="d-flex">
                      <div class="flex-shrink-0 me-3">
                        <img src="assets/images/users/avatar-6.jpg" class="rounded-circle avatar-sm" alt="user-pic" />
                      </div>
                      <div class="flex-grow-1">
                        <h6 class="mb-1">Salena Layfield</h6>
                        <div class="font-size-13 text-muted">
                          <p class="mb-1">As a skeptical Cambridge friend of mine occidental.</p>
                          <p class="mb-0"><i class="mdi mdi-clock-outline"></i> <span>1 hour ago</span></p>
                        </div>
                      </div>
                    </div>
                  </a>
                </div>
                <div class="p-2 border-top d-grid">
                  <a class="btn btn-sm btn-link font-size-14 btn-block text-center" href="javascript:void(0)">
                    <i class="uil-arrow-circle-right me-1"></i> <span>View More..</span>
                  </a>
                </div>
              </div>
            </div>

            <div class="dropdown d-inline-block">
              <button type="button" class="btn header-item noti-icon right-bar-toggle" id="right-bar-toggle-v">
                <i class="icon-sm" data-eva="settings-outline"></i>
              </button>
            </div>

            <div class="dropdown d-inline-block">
              <!-- <button
                type="button"
                class="btn header-item user text-start d-flex align-items-center"
                id="page-header-user-dropdown-v"
                data-bs-toggle="dropdown"
                aria-haspopup="true"
                aria-expanded="false"
              >
                <img class="rounded-circle header-profile-user" src="assets/images/users/avatar-1.jpg" alt="Header Avatar" />
              </button> -->
              <div class="dropdown-menu dropdown-menu-end pt-0">
                <div class="p-3 border-bottom">
                  <h6 class="mb-0">Jennifer Bennett</h6>
                  <p class="mb-0 font-size-11 text-muted">jennifer.bennett@email.com</p>
                </div>
                <a class="dropdown-item" href="contacts-profile.html"
                  ><i class="mdi mdi-account-circle text-muted font-size-16 align-middle me-1"></i> <span class="align-middle">Profile</span></a
                >
                <a class="dropdown-item" href="apps-chat.html"
                  ><i class="mdi mdi-message-text-outline text-muted font-size-16 align-middle me-1"></i> <span class="align-middle">Messages</span></a
                >
                <a class="dropdown-item" href="pages-faqs.html"
                  ><i class="mdi mdi-lifebuoy text-muted font-size-16 align-middle me-1"></i> <span class="align-middle">Help</span></a
                >
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#"
                  ><i class="mdi mdi-wallet text-muted font-size-16 align-middle me-1"></i> <span class="align-middle">Balance : <b>$6951.02</b></span></a
                >
                <a class="dropdown-item d-flex align-items-center" href="#"
                  ><i class="mdi mdi-cog-outline text-muted font-size-16 align-middle me-1"></i> <span class="align-middle">Settings</span
                  ><span class="badge badge-soft-success ms-auto">New</span></a
                >
                <a class="dropdown-item" href="auth-lock-screen.html"
                  ><i class="mdi mdi-lock text-muted font-size-16 align-middle me-1"></i> <span class="align-middle">Lock screen</span></a
                >
                <a class="dropdown-item" href="auth-logout.html"
                  ><i class="mdi mdi-logout text-muted font-size-16 align-middle me-1"></i> <span class="align-middle">Logout</span></a
                >
              </div>
            </div>
          </div>
        </div>
      </header>
  

      <!-- ============================================================== -->
      <div class="main-content">
        <!-- 자료 검색 시작 -->
        <div class="page-content">
          <!-- 자료 검색 셀렉트 -->
          <div class="tap_text">
            <h2>자료 검색</h2>
            <p>자료 검색 > <span>자료 검색</span></p>
          </div>
          <!-- 간략보기 창 -->
          <div class="simple_view_wrap" id="simple_view_wrap">

          </div>
          <!--  -->
          <div class="search_top_wrap">
            <ul class="nav nav-tabs" role="tablist">
              <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#profile" role="tab" id="metaDataSearchList">
                  <span class="d-block d-sm-none"><i class="far fa-user"></i></span>
                  <span class="d-none d-sm-block">검색결과 리스트</span>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#messages" role="tab" id="metaDataSearchImageList">
                  <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span>
                  <span class="d-none d-sm-block">검색결과 이미지 리스트</span>
                </a>
              </li>
            </ul>
            <div class="search_top_text">
              <label class="col-md-2 col-form-label st_title" id="totalNum">| 총건수: 0건</label>
              <label class="col-md-2 col-form-label st_title" id="totalQty">| 총수량 : 0건</label>
              <label class="col-md-2 col-form-label st_title" id="currentQty" >| 현수량 : 0건 |</label>
            </div>
          </div>
          <!-- Tab panes -->
          <div class="tab-content p-3 text-muted" id="tab-content">

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