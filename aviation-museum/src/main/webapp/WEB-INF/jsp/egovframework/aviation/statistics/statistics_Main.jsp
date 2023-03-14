<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>자료통계-통계 | 국립항공박물관</title>
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
    <script src="assets/libs/jquery/jquery-3.6.3.min.js"></script>
  </head>
<body data-sidebar="dark">

   <div id="layout-wrapper">
 	<jsp:include page="../common/inc/headerContent.jsp" />
      <!-- ============================================================== -->
      <div class="main-content">
        <div class="page-content">
          <div class="tap_text">
            <h2>자료통계</h2>
            <p>자료통계 > <span>통계</span></p>
          </div>
          <!-- 탭 -->
          <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#tap-1" role="tab">
                    <span class="d-block d-sm-none"><i class="far fa-user"></i></span>
                    <span class="d-none d-sm-block">박물관 등록현황</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#tap-2" role="tab">
                    <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span>
                    <span class="d-none d-sm-block">이미지 통계</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#tap-3" role="tab">
                    <span class="d-block d-sm-none"><i class="fas fa-cog"></i></span>
                    <span class="d-none d-sm-block">전문정보 등록현황</span>
                </a>
            </li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content p-3 text-muted">
          <!-- 박물관 등록현황 -->
            <div class="tab-pane" id="tap-1" role="tabpanel">
              <div class="fr_wrap">
                <div class="mb-3 row fr_1">
                  <div class="col-md-10">
                    <label class="col-md-2 col-form-label">자료 구분</label>
                      <select class="search_select search_select_2">
                          <option disabled selected>국립항공박물관</option>
                          <option>더미1</option>
                          <option>더미2</option>
                          <option>더미3</option>
                      </select>
                    <select class="search_select search_select_2">
                        <option disabled selected>선택</option>
                        <option>더미1</option>
                        <option>더미2</option>
                        <option>더미3</option>
                    </select>
                      <label class="col-md-2 col-form-label">자료 번호</label>
                      <!-- <div class="col-md-10"> -->
                        <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="exampleDataList" placeholder="">
                        <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="exampleDataList" placeholder="">
                        ~
                        <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="exampleDataList" placeholder="">
                        <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="exampleDataList" placeholder="">
                        <button class="custom_btn btn_search">검색</button>
                        <button class="custom_btn btn_excel">엑셀파일</button>
                  </div>
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
                    <!--  -->
                    <table class="table mb-0">
                      <thead>
                        <tr class="tr_bgc">
                          <th>번호</th>
                          <th>구분</th>
                          <th>지역</th>
                          <th>기관명</th>
                          <th colspan="2">등록수량
                            <br>
                            <div style="display: flex; justify-content: space-around;">
                              <div>건</div>
                              <div>점</div>
                            </div>
                          </th>
                          <th colspan="2">대국민서비스
                            <br>
                            <div style="display: flex; justify-content: space-around;">
                              <div>건</div>
                              <div>점</div>
                            </div>
                          </th>
                          <th>사진자료등록수량</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>1</td>
                          <td>국립2</td>
                          <td>서울특별시</td>
                          <td>국립항공박물관</td>
                          <td>1</td>
                          <td>1</td>
                          <td>1</td>
                          <td>1</td>
                          <td>1</td>
                        </tr>
                        <tr>
                          <td>1</td>
                          <td>국립2</td>
                          <td>서울특별시</td>
                          <td>국립항공박물관</td>
                          <td>1</td>
                          <td>1</td>
                          <td>1</td>
                          <td>1</td>
                          <td>1</td>
                        </tr>
                      </tbody>
                      <thead>
                        <tr class="tr_bgc">
                          <th>총합</th>
                          <th></th>
                          <th></th>
                          <th></th>
                          <th>1</th>
                          <th>1</th>
                          <th>1</th>
                          <th>1</th>
                          <th>1</th>
                        </tr>
                      </thead>
                    </table>
                    <!--  -->
                  </div>
              </div>
            </div>
            </div>
          <!-- 이미지통계 탭 -->
          <div class="tab-pane" id="tap-2" role="tabpanel">
            <div class="fr_wrap">
              <div class="mb-3 row fr_1">
                <div class="col-md-10">
                  <label class="col-md-2 col-form-label">자료 구분</label>
                    <select class="search_select search_select_2">
                        <option disabled selected>국립항공박물관</option>
                        <option>더미1</option>
                        <option>더미2</option>
                        <option>더미3</option>
                    </select>
                  <select class="search_select search_select_2">
                      <option disabled selected>선택</option>
                      <option>더미1</option>
                      <option>더미2</option>
                      <option>더미3</option>
                  </select>
                    <label class="col-md-2 col-form-label">자료 번호</label>
                    <!-- <div class="col-md-10"> -->
                      <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="exampleDataList" placeholder="">
                      <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="exampleDataList" placeholder="">
                      ~
                      <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="exampleDataList" placeholder="">
                      <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="exampleDataList" placeholder="">
                      <button class="custom_btn btn_search">검색</button>
                      <button class="custom_btn btn_excel">엑셀파일</button>
                </div>
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
                  <!--  -->
                  <table class="table mb-0">
                    <thead>
                      <tr class="tr_bgc">
                        <th>연번</th>
                        <th>이미지수량</th>
                        <th>합계</th>
                        <th>국립항공박물관</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>1</td>
                        <td>이미지 없음</td>
                        <td>0 / null</td>
                        <td>0 / 0</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>이미지 없음</td>
                        <td>0 / null</td>
                        <td>0 / 0</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>이미지 없음</td>
                        <td>0 / null</td>
                        <td>0 / 0</td>
                      </tr>
                      <tr>
                        <td colspan="2">합계</td>
                        <td>1</td>
                        <td>1</td>
                      </tr>
                    </tbody>
                  </table>
                  <!--  -->
                </div>
            </div>
          </div>
          </div>

          <!-- 전문정보 등록현황 탭 -->
          <div class="tab-pane" id="tap-3" role="tabpanel">
            <div class="fr_wrap">
              <div class="mb-3 row fr_1">
                <div class="col-md-10">
                  <label class="col-md-2 col-form-label">자료 구분</label>
                    <select class="search_select search_select_2">
                        <option disabled selected>국립항공박물관</option>
                        <option>더미1</option>
                        <option>더미2</option>
                        <option>더미3</option>
                    </select>
                  <select class="search_select search_select_2">
                      <option disabled selected>선택</option>
                      <option>더미1</option>
                      <option>더미2</option>
                      <option>더미3</option>
                  </select>
                    <label class="col-md-2 col-form-label">자료 번호</label>
                    <!-- <div class="col-md-10"> -->
                      <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="exampleDataList" placeholder="">
                      <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="exampleDataList" placeholder="">
                      ~
                      <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="exampleDataList" placeholder="">
                      <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="exampleDataList" placeholder="">
                      <button class="custom_btn btn_search">검색</button>
                      <button class="custom_btn btn_excel">엑셀파일</button>
                </div>
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
                  <!--  -->
                  <table class="table mb-0">
                    <thead>
                      <tr class="tr_bgc">
                        <th>번호</th>
                        <th>기관</th>
                        <th>작성자</th>
                        <th>작성자ID</th>
                        <th>등록수량</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>1</td>
                        <td>국립항공박물관</td>
                        <td>이진형</td>
                        <td>Astron1004</td>
                        <td>1</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>국립항공박물관</td>
                        <td>이진형</td>
                        <td>Astron1004</td>
                        <td>1</td>
                      </tr>
                      <tr>
                        <td colspan="4">합계</td>
                        <td>1</td>
                      </tr>
                    </tbody>
                  </table>
                  <!--  -->
                </div>
            </div>
          </div>
          </div>
          <!--  -->
        <!-- End Page-content -->
        </div>
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