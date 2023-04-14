<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>신규자료 자동등록 | 국립항공박물관</title>
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
    <link rel="stylesheet" href="assets/css/custom_auto_upload.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  </head>
  
  <script>
  const uploadMetaDataExcel = () => {
	  let form = $('#uploadMetaDataExcelForm')[0];
	  let frmData = new FormData(form);

	    $.ajax({
	        enctype: 'multipart/form-data',
	        type: 'POST',
	        url: '/uploadMetaDataExcel.do',
	        processData: false,   
	        contentType: false,
	        cache: false,
	        data: frmData,
	        success: function(data) {
	            console.log(data);
	        },
	        error: function(e) {
	            console.log(e);
	            alert('파일업로드 실패');
	        }
	    });
  }
  </script>

  <body data-sidebar="dark">
    <!-- <body data-layout="horizontal"> -->

    <!-- Begin page -->
    <div id="layout-wrapper">
    <jsp:include page="../../common/inc/headerContent.jsp" />
    
      <!-- ============================================================== -->
      <div class="main-content">
        <!-- 신규자료 자동등록 시작 -->
        <div class="page-content">
          <div class="tap_text">
            <h2>신규자료 자동등록</h2>
            <p>자료 등록 > <span>신규자료 자동등록</span></p>
          </div>
          <!-- 자료 구분 셀렉트 -->
          <div class="fr_wrap">
            <div class="mb-3 row fr_1">
              <div class="col-md-10">
                <label class="col-md-2 col-form-label">검증</label>
                <select class="form-select">
                  <option disabled selected>선택</option>
                  <option>더미1</option>
                  <option>더미2</option>
                  <option>더미3</option>
              </select>
                <label class="col-md-2 col-form-label">자료 구분</label>
                  <select class="form-select">
                      <option disabled selected>선택</option>
                      <option>더미1</option>
                      <option>더미2</option>
                      <option>더미3</option>
                  </select>
                <select class="form-select">
                    <option disabled selected>국립항공박물관</option>
                    <option>더미1</option>
                    <option>더미2</option>
                    <option>더미3</option>
                </select>
                  <label class="col-md-2 col-form-label">자료 번호</label>
                  <!-- <div class="col-md-10"> -->
                    <input class="form-control" list="datalistOptions" id="exampleDataList" placeholder="">
                    <input class="form-control" list="datalistOptions" id="exampleDataList" placeholder="">
                    ~
                    <input class="form-control" list="datalistOptions" id="exampleDataList" placeholder="">
                    <input class="form-control" list="datalistOptions" id="exampleDataList" placeholder="">
                    <button class="btn btn-secondary waves-effect waves-light btn_ml">조회</button>
              </div>
            </div>
          </div>
          <!-- 탭 -->
          <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" data-bs-toggle="tab" href="#profile" role="tab">
                    <span class="d-block d-sm-none"><i class="far fa-user"></i></span>
                    <span class="d-none d-sm-block">기본 사항</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#settings" role="tab">
                    <span class="d-block d-sm-none"><i class="fas fa-cog"></i></span>
                    <span class="d-none d-sm-block">이동사항</span>
                </a>
            </li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content p-3 text-muted">
            <!-- 기본 사항 탭 -->
            <div class="tab-pane active" id="profile" role="tabpanel">
              <!-- 데이터 전환 모달 -->
              <div id="NomalModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <p>조회된 모든 소장품 데이터를 전환 하시겠습니까</p>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-primary waves-effect waves-light">확인</button>
                      <button type="button" class="btn btn-secondary waves-effect" data-bs-dismiss="modal">취소</button>
                    </div>
                  </div>
                </div>
              </div>
              <!-- -->
              <div class="st_wrap st_mv_wrap">
                <div class="auto_btn_left">
	                <button>선택 삭제</button>
	                <button>전체 삭제</button>
                </div>
                <div class="auto_btn_right">
	                <button>엑셀 양식 다운로드</button>
	                <form id="uploadMetaDataExcelForm" method="post" action="/uploadMetaDataExcel.do" enctype="multipart/form-data">
		                <input type="file" name="uploadExcel" onchange="uploadMetaDataExcel()" accept=".xlsx, .xls"/>
	                </form>
	                <button>양식업로드</button>
	                <button data-bs-toggle="modal" data-bs-target="#NomalModal">데이터전환</button>
                </div>
              </div>
              <div class="mb-0">
                <!-- 엑셀 모달 -->
                <div id="myModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
                  <div class="modal-dialog">
                      <div class="modal-content">
                          <div class="modal-header mv-modal-header">
                              <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <div class="modal-body mv-modal-body">
                              <!-- 엑셀 모달 내용 -->
                              <div class="mb-0 move-wrap">
                                <div class="st_wrap">
                                  <label class="col-md-2 col-form-label st_title">이동사항 등록 및 수정</label>
                                </div>
                                <div class="card-body">
                                  <div class="table-responsive">
                                      <table class="table mb-0">
                                          <tbody>
                                              <tr>
                                                <td>이동일자</td>
                                                  <td>
                                                    <select class="form-select st_select">
                                                      <option disabled selected>선택</option>
                                                      <option>더미1</option>
                                                      <option>더미2</option>
                                                      <option>더미3</option>
                                                    </select>
                                                  </td>
                                              </tr>
                                              <tr>
                                                <td>보관구분</td>
                                                  <td>
                                                    <select class="form-select st_select">
                                                      <option disabled selected>선택</option>
                                                      <option>더미1</option>
                                                      <option>더미2</option>
                                                      <option>더미3</option>
                                                    </select>
                                                  </td>
                                                  <td>
                                                    <select class="form-select st_select">
                                                      <option disabled selected>선택</option>
                                                      <option>더미1</option>
                                                      <option>더미2</option>
                                                      <option>더미3</option>
                                                    </select>
                                                  </td>
                                              </tr>
                                              <tr>
                                                <td>보관처</td>
                                                <td>
                                                  <select class="form-select st_select">
                                                    <option disabled selected>선택</option>
                                                    <option>더미1</option>
                                                    <option>더미2</option>
                                                    <option>더미3</option>
                                                  </select>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td>반입처</td>
                                                <td>
                                                  <select class="form-select st_select">
                                                    <option disabled selected>선택</option>
                                                    <option>더미1</option>
                                                    <option>더미2</option>
                                                    <option>더미3</option>
                                                  </select>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td>이동수량</td>
                                                <td>
                                                  <select class="form-select st_select">
                                                    <option disabled selected>선택</option>
                                                    <option>더미1</option>
                                                    <option>더미2</option>
                                                    <option>더미3</option>
                                                  </select>
                                                </td>
                                                <td>현수량</td>
                                                <td>
                                                  <select class="form-select st_select">
                                                    <option disabled selected>선택</option>
                                                    <option>더미1</option>
                                                    <option>더미2</option>
                                                    <option>더미3</option>
                                                  </select>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td>격납요청자</td>
                                                <td>
                                                  <input class="form-control st_input" type="text" name="" id="">
                                                </td>
                                                <td>실제전시여부</td>
                                                <td> <input type="checkbox" name="" id=""> </td>
                                              </tr>
                                              <tr>
                                                <td>비고</td>
                                                <td>
                                                  <input class="form-control st_input" type="text" name="" id="">
                                                </td>
                                              </tr>
                                          </tbody>
                                      </table>
                                      <button class="btn btn-secondary btn_save">저장</button>
                                  </div>
                              </div>
                            </div>
                            <!--  -->
                            <div class="mb-0 move-wrap">
                              <div class="st_wrap">
                                <label class="col-md-2 col-form-label st_title">과거 이동처 코드</label>
                              </div>
                              <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table mb-0">
                                        <thead>
                                            <tr class="tr_bgc">
                                                <th>번호</th>
                                                <th>과거이동처</th>
                                                <th>현수량</th>
                                                <th>입력값선택</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th scope="row">1</th>
                                                <td>
                                                20200000
                                                </td>
                                                <td>
                                                  0
                                                </td>
                                                <td>
                                                  <select class="form-select st_select">
                                                    <option disabled selected>선택</option>
                                                    <option>더미1</option>
                                                    <option>더미2</option>
                                                    <option>더미3</option>
                                                  </select>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                          </div>
                          </div>
                      </div>
                  </div>
              </div>
                <div class="card-body">
                  <div class="table-responsive">
                      <table class="table mb-0">
                          <thead>
                              <tr class="tr_bgc">
                                  <th>선택</th>
                                  <th>번호</th>
                                  <th>자료구분코드C</th>
                                  <th>자료구분명</th>
                                  <th>자료번호</th>
                                  <th>세부번호</th>
                                  <th>주수량</th>
                                  <th>수량단위C</th>
                                  <th>주수량단위C_명칭</th>
                                  <th>명칭</th>
                                  <th>이명칭</th>
                                  <th>오류체크</th>
                                  <th>수정</th>
                              </tr>
                          </thead>
                          <tbody>
                              <tr>
                                  <td><input type="checkbox" name="" id=""></td>
                                  <td>1</td>
                                  <td>
                                    더미
                                  </td>
                                  <td>
                                    국립항공박물관 - ㅇㅇ - ㅇㅇ
                                   </td>
                                   <td>
                                    항공역사:물품:기체(더미)
                                   </td>
                                   <td>
                                    AHA01A001
                                   </td>
                                   <td>
                                    0000
                                   </td>
                                   <td>
                                    0
                                   </td>
                                   <td>
                                    -
                                   </td>
                                   <td>
                                    -
                                   </td>
                                   <td>
                                    -
                                   </td>
                                   <td>
                                    정상
                                   </td>
                                   <td>
                                    <button>수정</button>
                                   </td>
                              </tr>
                          </tbody>
                      </table>
                  </div>
              </div>
            </div>
            </div>
            <!-- 자연사 탭 시작 -->
            <div class="tab-pane" id="messages" role="tabpanel">
              <!-- 데이터 전환 모달 -->
              <div id="NatModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <p>조회된 모든 소장품 데이터를 전환 하시겠습니까</p>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-primary waves-effect waves-light">확인</button>
                      <button type="button" class="btn btn-secondary waves-effect" data-bs-dismiss="modal">취소</button>
                    </div>
                  </div>
                </div>
              </div>
              <!-- -->
              <div class="mb-0">
                <!-- 자연사 탭 내용 시작 -->
                <div class="st_wrap st_mv_wrap">
                  <div class="auto_btn_left">
	                  <button>선택 삭제</button>
	                  <button>전체 삭제</button>
                  </div>
                  <div class="auto_btn_right">
	                  <button>엑셀 양식 다운로드</button>
	                  <button>dddd</button>
	                  <input type="file"/>
	                  <button data-bs-toggle="modal" data-bs-target="#NatModal">데이터전환</button>
                  </div>
                </div>
                <div class="form-control card-body nat_form">
              </div>
            </div>
            </div>
            <!-- 이동사항 탭 시작 -->
            <div class="tab-pane" id="settings" role="tabpanel">
              <!-- 데이터 전환 모달 -->
              <div id="MoveModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <p>조회된 모든 소장품 데이터를 전환 하시겠습니까</p>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-primary waves-effect waves-light">확인</button>
                      <button type="button" class="btn btn-secondary waves-effect" data-bs-dismiss="modal">취소</button>
                    </div>
                  </div>
                </div>
              </div>
              <!-- -->
              <div class="st_wrap st_mv_wrap">
                <div class="auto_btn_left"><button>선택 삭제</button><button>전체 삭제</button></div>
                <div class="auto_btn_right"><button>엑셀 양식 다운로드</button><button>양식업로드</button><button data-bs-toggle="modal" data-bs-target="#MoveModal">데이터전환</button></div>
              </div>
              <div class="mb-0">
                <!-- 이동사항 탭 내용 시작 -->
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table mb-0">
                      <thead>
                        <tr class="tr_bgc">
                          <th>선택</th>
                          <th>번호</th>
                          <th>자료구분코드C</th>
                          <th>자료구분명</th>
                          <th>자료번호</th>
                          <th>세부번호</th>
                          <th>주수량</th>
                          <th>수량단위C</th>
                          <th>주수량단위C_명칭</th>
                          <th>명칭</th>
                          <th>이명칭</th>
                          <th>오류체크</th>
                          <th>수정</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td><input type="checkbox" name="" id="" /></td>
                          <td>1</td>
                          <td>더미</td>
                          <td>국립항공박물관 - ㅇㅇ - ㅇㅇ</td>
                          <td>항공역사:물품:기체(더미)</td>
                          <td>AHA01A001</td>
                          <td>0000</td>
                          <td>0</td>
                          <td>-</td>
                          <td>-</td>
                          <td>-</td>
                          <td>정상</td>
                          <td>
                            <button>수정</button>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
          </div>
          <!--  -->
        <button>저장</button>
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