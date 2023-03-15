<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>구입감정 심의-자료심의 | 국립항공박물관</title>
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
    <link href="assets/css/custom.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="assets/css/custom_data_review.css">
    <script src="assets/libs/jquery/jquery-3.6.3.min.js"></script>
    <script type="text/javascript">
    $(function() {
		
		// 첫 페이지
		$('#purchaseAppraisalReview').attr('aria-selected', 'true').addClass('active');
		
		$.ajax({
			type : 'POST',                
			url : '/purchaseAppraisalReviewList.do',    
			dataType : "html",           
			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
			error : function() {          
				alert('통신실패!');
			},
			success : function(data) {  
				$('#tab-content').empty().append(data);
			}
		});
		
		// 구입감정심의 tab operation
		$('#purchaseAppraisalReview').click(function() {
			$.ajax({
				type : 'POST',                
				url : '/purchaseAppraisalReviewList.do',    
				dataType : "html",           
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {          
					alert('통신실패!');
				},
				success : function(data) {  
					$('#tab-content').empty().append(data);
//					$('#searchKeyword').val('erasure');
				}
			});
		});
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
            <h2>자료심의</h2>
            <p>자료심의 > <span>구입감정 심의</span></p>
          </div>
          <!-- 셀렉트 -->
          <div class="fr_wrap">
            <div class="mb-3 row fr_1">
              <div class="col-md-10 fr_1_inwrap">
                <label class="col-md-2 col-form-label">처리상태</label>
                <select class="form-select">
                  <option disabled selected>전체보기</option>
                  <option>미완료</option>
                  <option>완료</option>
                </select>
              </div>
              <div class="col-md-10 fr_1_inwrap">
                <label class="col-md-2 col-form-label">검색</label>
                <select class="form-select">
                  <option disabled selected>전체</option>
                  <option>더미1</option>
                  <option>더미2</option>
                  <option>더미3</option>
                </select>
                <input class="form-control" list="datalistOptions" id="exampleDataList" placeholder="">
                <button class="btn btn-secondary waves-effect waves-light btn_ml">조회</button>
              </div>
            </div>
          </div>
          <!-- 탭 -->
          <div class="wr_header_wrap">
            <ul class="nav nav-tabs" role="tablist">
              <li class="nav-item">
                  <a class="nav-link" data-bs-toggle="tab" href="#datareview_1" role="tab" id="purchaseAppraisalReview">
                      <span class="d-block d-sm-none"><i class="far fa-user"></i></span>
                      <span class="d-none d-sm-block">구입감정 심의</span>
                  </a>
              </li>
            </ul>
            <div class="wr_rigth_btn_wrap" ><button data-bs-toggle="modal" data-bs-target="#practical_review_modal_2">구입감정확인서 서명하기</button></div>
          </div>
          <!-- 구입감정확인서 서명하기 모달 -->
          <div id="practical_review_modal_2" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header mv-modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                    <div class="modal-body mv-modal-body">
                      <div class="st_wrap">
                        <label class="col-md-2 col-form-label st_title">실무검토서 - 자료명</label>
                      </div>
                      <!--  -->
                      <div class="mb-0 user-wrap">
                        <div class="card-body">
                          <div class="table-responsive">
                            <table class="table mb-0">
                              <thead>
                                  <tr class="tr_bgc">
                                    <th>자료명칭</th>
                                    <th>심의결과</th>
                                    <th>비고</th>
                                  </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <td>비행지도 외 336건</td>
                                  <td>
                                    감정완료 <button onclick="window.open('구입감정 심의-레이어팝업.html')">상세보기</button>
                                  </td>
                                  <td><input type="text" name="" id="" /></td>
                                </tr>
                                <tr style="border-top: 1px solid;">
                                  <td colspan="4">합계 : 336건, 3,085점</td>
                                </tr>
                              </tbody>
                          </table>
                          </div>
                        </div>
                      </div>
                      <!--  -->
                      <div class="practical_review_modal_text">
                        2023년 02월 15일<br>
                        위와 같이 심의/의결 합니다.<br>
                        <br>
                        <span>국립항공박물관 자료수집심의위원회</span>
                      </div>
                      <!--  -->
                      <div class="mb-0 user-wrap">
                        <div class="container practical_review_modal_stamp">
                          <div class="row">
                            <div class="col prms_wrap">
                              <div class="prms_wrap_header">위원</div>
                              <div class="prms_wrap_inbox">
                                <div class="pass_mark">승인</div>
                              </div>
                            </div>
                            <div class="col prms_wrap">
                              <div class="prms_wrap_header">위원</div>
                              <div class="prms_wrap_inbox">
                                <button>승인</button>
                              </div>
                            </div>
                            <div class="col prms_wrap">
                              <div class="prms_wrap_header">위원</div>
                              <div class="prms_wrap_inbox">
                                <button>승인</button>
                              </div>
                            </div>
                            <div class="col prms_wrap">
                              <div class="prms_wrap_header">위원</div>
                              <div class="prms_wrap_inbox">
                                <button>승인</button>
                              </div>
                            </div>
                            <div class="col prms_wrap">
                              <div class="prms_wrap_header">위원</div>
                              <div class="prms_wrap_inbox">
                                <button>승인</button>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!--  -->
                      <div class="custom_modal_footer">
                        <button>심의완료</button>
                        <br>
                        <br>
                        <p>박물관 자료관리 규정 포함</p>
                    </div>
                  </div>
                    </div>
                </div>
                <!-- 심사승인 모달 창 -->
                <div id="contemplation_modal_1" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header mv-modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body mv-modal-body">
                        <div class="st_wrap">
                          <label class="col-md-2 col-form-label st_title">심사승인</label>
                        </div>
                        <div class="mb-0 user-wrap">
                          본 자료의 심사를 적정 처리 하시겠습니까?
                          <div class="card-body">
                            <div class="table-responsive">
                              <table class="table mb-0">
                                <tbody>
                                  <tr>
                                    <td>접수 예정일</td>
                                    <td><input type="date" /></td>
                                  </tr>
                                  <tr>
                                    <td>심사완료 예정일</td>
                                    <td><input type="date" /></td>
                                  </tr>
                                </tbody>
                              </table>
                            </div>
                          </div>
                        </div>
                        <div>
                          <button>확인</button>
                          <button>취소</button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- 심사승인 모달 창 2 -->
                <div id="contemplation_modal_2" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header mv-modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body mv-modal-body">
                        <div class="st_wrap">
                          <label class="col-md-2 col-form-label st_title">심사승인</label>
                        </div>
                        <div class="mb-0 user-wrap">
                          심사 완료 시 매도자에게 실물접수 안내문이 발송됩니다.
                          <div class="card-body">
                            <div class="table-responsive">
                              <table class="table mb-0">
                                <tbody>
                                  <tr>
                                    <td>접수 예정일</td>
                                    <td><input type="date" /></td>
                                  </tr>
                                  <tr>
                                    <td>심사완료 예정일</td>
                                    <td><input type="date" /></td>
                                  </tr>
                                </tbody>
                              </table>
                            </div>
                          </div>
                        </div>
                        <div>
                          <button>확인</button>
                          <button>취소</button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- 반려사유 모달 2 -->
                <div id="contemplation_modal_3" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header mv-modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body mv-modal-body">
                        <div class="st_wrap">
                          <label class="col-md-2 col-form-label st_title">반려사유</label>
                        </div>
                        <div class="mb-0 user-wrap">
                          본 자료의 심사를 부적정 처리 하시겠습니까?
                          <br>
                          부적정사유를 입력해주세요.
                        </div>
                        <div>
                          <button>확인</button>
                          <button>취소</button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
            </div>
          <!--  -->
        <!-- Tab panes -->
        <div class="tab-content p-3 text-muted" id="tab-content">
 
          <!--  -->
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