<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>자료관리전환 | 국립항공박물관</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesbrand" name="author" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.ico" />
    <!-- Bootstrap Css -->
    <link href="<c:url value='/assets/css/bootstrap.min.css'/>" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="<c:url value='/assets/css/icons.min.css'/>" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="<c:url value='/assets/css/app.min.css'/>" id="app-style" rel="stylesheet" type="text/css" />
     <link href="<c:url value='/assets/css/viewer.css'/>" rel="stylesheet" type="text/css" />
    <!--  -->
    <link rel="stylesheet" href="<c:url value='/assets/libs/swiper/swiper-bundle.min.css'/>" />
    <!-- 커스텀 css -->
    <link href="assets/css/custom.css" rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="<c:url value='/assets/js/viewer.js'/>"></script>
    <script src="<c:url value='/dx5/dextuploadx5-configuration.js'/>"></script>
    <script src="<c:url value='/dx5/dextuploadx5.js'/>"></script>
    <script src="<c:url value='/assets/js/metadata/imageRegister.js'/>"></script>
   
  </head>

  <body data-sidebar="dark">
    <!-- <body data-layout="horizontal"> -->

    <!-- Begin page -->
    <div id="layout-wrapper">
    
     	<jsp:include page="../../common/inc/headerContent.jsp" />

      <!-- ============================================================== -->
      <div class="main-content">
        <!-- 자료 검색 시작 -->
        <div class="page-content">
          <!-- 자료 검색 셀렉트 -->
          <div class="tap_text">
            <h2>이미지 신규등록</h2>
            <p>자료 등록 > <span>이미지 신규등록</span></p>
          </div>
          <!-- 간략보기 창 -->
          <div class="mb-3 row fr_1">
              <div class="col-md-10">
              <form id="imageUpdateForm">
              <label class="col-md-2 col-form-label">자료 구분</label>
              <select class="form-select" name="org_code_idx" id="org_code_idx">
                    <option value="" selected>선택</option>
                    		<c:forEach var="list" items="${orgList}" varStatus="status">
		                           <option value="${list.org_code_idx}">${list.org_nm}</option>
		                     </c:forEach>
                </select>
                  <select class="form-select" name="possession_code_idx" id="possession_code_idx">
                      <option value="" selected>선택</option>
                      		<c:forEach var="list" items="${posSessionList}" varStatus="status">
		                           <option value="${list.possession_code_idx}">${list.possession_nm}</option>
		                     </c:forEach>
                  </select>
                
                
                <label class="col-md-2 col-form-label">자료 번호</label>
                  <!-- <div class="col-md-10"> -->
                    <input class="form-control" list="datalistOptions" id="item_no1" placeholder="자료 번호" name="item_no1">
                    <input class="form-control" list="datalistOptions" id="item_detail_no1" placeholder="세부" name="item_detail_no1">
                    ~ 
                    <input class="form-control" list="datalistOptions" id="item_no2" placeholder="자료 번호" name="item_no2">
                    <input class="form-control" list="datalistOptions" id="item_detail_no2" placeholder="세부" name="item_detail_no2">
                    <button type="button" class="btn btn-secondary waves-effect waves-light btn_ml" onclick="getImageUpdateList()">조회</button>
                    <!--  -->
                    </form>
            </div>
          </div>
          <!--  -->
          <div class="search_top_wrap">
            <ul class="nav nav-tabs" role="tablist">
              <li class="nav-item">
                <a class="nav-link active" data-bs-toggle="tab" href="#imageUpdateList" role="tab" id="imageUpdate">
                  <span class="d-block d-sm-none"><i class="far fa-user"></i></span>
                  <span class="d-none d-sm-block">이미지 리스트</span>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link " data-bs-toggle="tab" href="#addAllImage" role="tab" id="addAllImage">
                  <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span>
                  <span class="d-none d-sm-block">일괄등록</span>
                </a>
              </li>
            </ul>
            <div class="search_top_text">
              <label class="col-md-2 col-form-label st_title" id="totalNum"></label>
              <label class="col-md-2 col-form-label st_title" id="totalQty"></label>
              <label class="col-md-2 col-form-label st_title" id="currentQty" ></label>
            </div>
          </div>
          <!-- Tab panes -->
          <div class="tab-content p-3 text-muted" id="tab-content">
						 <div class="modal fade imageUploadModal" tabindex="-1" aria-labelledby="myExtraLargeModalLabel" style="display: none;" aria-hidden="true">
                        <div class="modal-dialog modal-xl">
                          <div class="modal-content pro-modal-content">
                            <div class="modal-header mv-modal-header">
                                <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body mv-modal-body">
                                <!-- 엑셀 모달 내용 -->
			                      	<div id="dext5-container" style="width:100%; height:300px;"></div>
			                      	<div id="dext5-btn" style="text-align: center; margin: 10px 10px 10px 10px;">
			                         	<button id="btn-add-files" type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2">파일추가</button>
			                    	 	<button id="btn-upload-auto" type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2">저장</button>
			                    	 </div>
                            </div>
                        </div>
                        </div>
                    </div>
          	<div class="tab-pane active" role="tabpanel" id="imageUpdateList">
          	<div class="mb-0">
                <div class="st_wrap">
                         <button type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" onclick="downloadImageChecked()">다운로드</button>
                         <button type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" onclick="deleteImageChecked()">선택삭제</button>
                <div id="imageUpdateZone">
                  <table class="table mb-0">
                        <thead>
                            <tr class="tr_bgc">
                                <th>선택</th>
                                <th>번호</th>
                                <th>소장구분</th>
                                <th>소장품번호</th>
                                <th>세부번호</th>
                                <th>이미지명</th>
                                <th>파일경로</th>
                                <th>대국민서비스</th>
                                <th>기능</th>
                            </tr>
                        </thead>
                        <tbody>
				 					<tr>
				 						<td colspan="9">조회결과가 없습니다.</td>
				                   </tr>
				            </tbody>
				           </table>
              </div>
            </div>
          </div>
          <!--  -->
        </div>
        <div class="tab-pane" role="tabpanel" id="addAllImage">
        <div class="mb-0">
        dd
        </div></div>
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
    <script src="<c:url value='/assets/libs/swiper/swiper-bundle.min.js'/>" defer></script>
    <script src="<c:url value='/assets/js/pages/ecommerce-product-detail.init.js'/>" defer></script>
    <script src="<c:url value='/assets/libs/apexcharts/apexcharts.min.js'/>" defer></script>
    <script src="<c:url value='/assets/js/app.js'/>" defer></script>
    <script src="<c:url value='/assets/js/pages/dashboard.init.js'/>" defer></script>
  </body>
</html>