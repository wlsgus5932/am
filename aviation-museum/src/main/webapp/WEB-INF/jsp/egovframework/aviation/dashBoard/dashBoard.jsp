<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>대시보드-관리자(관리자) | 국립항공박물관</title>
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
  <link rel="stylesheet" href="assets/css/custom_view.css">
  <link rel="stylesheet" href="assets/css/custom_my.css">
  <link rel="stylesheet" href="assets/css/custom_dashboard.css">
</head>

<body data-sidebar="dark">

<%--  <c:choose> --%>
<%--     <c:when test="${null eq session}"> --%>
<%-- 		<button onclick="location.href='<c:url value='/login.do' />' ">login</button> --%>
<%--     </c:when> --%>
<%--     <c:otherwise> --%>
<!--     	<button onclick="logoutProcess();">logout</button> -->
<%--     </c:otherwise> --%>
<%-- </c:choose> --%>

    <!-- <body data-layout="horizontal"> -->

    <!-- Begin page -->
    <div id="layout-wrapper">
      <jsp:include page="../common/inc/headerContent.jsp" />
      <!-- ============================================================== -->
      <div class="main-content">
        <!-- 대시보드 시작 -->
        <div class="page-content">
          <div class="container-fluid">

              <div class="row">
                <!--  -->
                <div class="col-xxl-3">

                  <div class="user-sidebar">
                      <div class="card dash_main_frist_wrap">
                          <div class="card-body p-0">
                              <div class="user-profile-img">
                                  <img src="" class="profile-img profile-foreground-img rounded-top" style="height: 120px;" alt="">
                                  <div class="overlay-content rounded-top">
                                      <div>
                                      </div>
                                  </div>
                              </div>
                              <!-- end user-profile-img -->

                              <div class="mt-n5 position-relative">
                                  <div class="text-center">
                                      <img src="" alt="" class="avatar-xl rounded-circle img-thumbnail">

                                      <div class="mt-3">
                                          <h5 class="mb-1"><span class="dash_main_name">${userSessionId}</span>님</h5>
<!--                                           <p class="text-muted">자료관리팀</p> -->
                                      </div>
                                  </div>
                              </div>
                              <!-- 팀공지 -->
                              <div class="d-flex align-items-start dash_main_frist_text_margin">
                                <div class="flex-grow-1">
                                    <h5 class="card-title mb-3 dash_text_bar_wrap">팀공지</h5>
                                </div>
<!--                                 <div class="dash_text_bar"></div> -->
                                <div class="flex-shrink-0">
                                    <div class="dropdown">
                                        <a class="dropdown-toggle text-muted" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" class="eva eva-more-horizontal-outline fill-muted"><g data-name="Layer 2"><g data-name="more-horizotnal"><rect width="24" height="24" opacity="0"></rect><circle cx="12" cy="12" r="2"></circle><circle cx="19" cy="12" r="2"></circle><circle cx="5" cy="12" r="2"></circle></g></g></svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                              <!-- 프로필, 팀공지 테이블 -->
                              <div class="table-responsive">
                                <table class="table mb-0 dash_main_frist_table">
                                  <colgroup>
	                                  <col style="width:20%;">
	                                  <col style="width:30%;">
                                  </colgroup>
                                  <thead>
                                    <tr class="tr_bgc dash_main_wrap">
                                      <th>작성자</th>
                                      <th>날짜</th>
                                      <th>제목</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td>김항공</td>
                                      <td>2022.12.7</td>
                                      <td>국립123항국립항공박물관국립항공박물관공박물관 공지 예시</td>
                                    </tr>
                                    <tr>
                                      <td>김항공</td>
                                      <td>2022.12.7</td>
                                      <td>국립항공박물관 공지 예시</td>
                                    </tr>
                                    <tr>
                                      <td>김항공</td>
                                      <td>2022.12.7</td>
                                      <td>국립항공박물관 공지 예시</td>
                                    </tr>
                                    <tr>
                                      <td>김항공</td>
                                      <td>2022.12.7</td>
                                      <td>국립항공박물관 공지 예시</td>
                                    </tr>
                                    <tr>
                                      <td>김항공</td>
                                      <td>2022.12.7</td>
                                      <td>국립항공박물관 공지 예시</td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>
                              <!--  -->
                              <div class="d-flex align-items-start dash_main_frist_text_margin">
                                <div class="flex-grow-1 flex-grow-1_custom">
                                    <h5 class="card-title mb-3 dash_text_bar_wrap">작업자별 작업량</h5>
<!--                                     <div class="dash_text_bar"></div> -->
                                </div>
                                <div class="flex-shrink-0">
                                    <div class="dropdown">
                                        <a class="dropdown-toggle text-muted" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" class="eva eva-more-horizontal-outline fill-muted"><g data-name="Layer 2"><g data-name="more-horizotnal"><rect width="24" height="24" opacity="0"></rect><circle cx="12" cy="12" r="2"></circle><circle cx="19" cy="12" r="2"></circle><circle cx="5" cy="12" r="2"></circle></g></g></svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                              <!-- 프로필 그래프 -->
                              <div class="col-lg-6">
                                <div class="card" style="background: none; box-shadow: none;">
                                    <!-- <div class="card-header">
                                        <h4 class="card-title">작업자별 작업량</h4>
                                     </div> -->
                                    <div class="card-body">
                                        <div id="circle_radialbar" data-colors='["#3b76e1","#57c9eb","#f1734f","#63ad6f"]' class="apex-charts" dir="ltr"></div>
                                    </div>
                                </div>
                            </div>
                              <!-- 작업자별 작업량 -->
                              <div class="worker_main_text_wrap">
                                <div class="dash_bar"></div>
                              </div>
                              <!--  -->
                              <div class="table-responsive">                        
                                <table class="table mb-0 dash_main_frist_table dash_main_frist_table_last_border">
                                	<colgroup>
	                                 <col style="width:50%;">
	                                </colgroup>
                                  <thead>
                                    <tr class="tr_bgc dash_main_wrap">
                                      <th>작업자</th>
                                      <th>월</th>
                                      <th>주</th>
                                      <th>일간</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td>김항공</td>
                                      <td>00%</td>
                                      <td>00%</td>
                                      <td>00%</td>
                                    </tr>
                                    <tr>
                                      <td>김항공</td>
                                      <td>00%</td>
                                      <td>00%</td>
                                      <td>00%</td>
                                    </tr>
                                    <tr>
                                      <td>김항공</td>
                                      <td>00%</td>
                                      <td>00%</td>
                                      <td>00%</td>
                                    </tr>
                                    <tr>
                                      <td>김항공</td>
                                      <td>00%</td>
                                      <td>00%</td>
                                      <td>00%</td>
                                    </tr>
                                    <tr>
                                      <td>김항공</td>
                                      <td>00%</td>
                                      <td>00%</td>
                                      <td>00%</td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>
                              <!--  -->
                          </div>
                          <!-- end card body -->
                      </div>
                      <!-- end card -->
                  </div>
              </div>
                <!--  -->
                  <div class="col-xxl-9">
                      <div class="row">
                        <!-- 자료 현황 -->
                          <div class="col-xl-4 col-md-6">
                            <div class="card">
                                <div class="card-body" style="position: relative;">
                                    <div class="d-flex align-items-start">
                                        <div class="flex-grow-1">
                                            <h5 class="card-title mb-3">자료 현황</h5>
                                        </div>
                                        <div class="flex-shrink-0">
                                            <div class="dropdown">
                                                <a class="dropdown-toggle text-muted" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" class="eva eva-more-horizontal-outline fill-muted"><g data-name="Layer 2"><g data-name="more-horizotnal"><rect width="24" height="24" opacity="0"></rect><circle cx="12" cy="12" r="2"></circle><circle cx="19" cy="12" r="2"></circle><circle cx="5" cy="12" r="2"></circle></g></g></svg>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 그래프 들어올 공간 -->
                                    <div class="col-lg-6">
                                      <div class="card">
                                        <!-- end card header -->
                                        <div class="card-body">
                                          <div id="bar_chart" data-colors='["#63ad6f"]' class="apex-charts" dir="ltr"></div>
                                        </div>
                                      </div>
                                      <!--end card-->
                                    </div>
                                    <!--  -->
                                    <!-- 자료 현황 내용 텍스트 영역 -->
                                    <div class="data_info_text_wrap">
                                      <span>
                                        자료수량 : 2000
                                      </span>
                                      <br>
                                      <br>
                                      <span>
                                        증감현황 : 1000
                                      </span>
                                    </div>
                                    <!--  -->
                                <div class="resize-triggers"><div class="expand-trigger"><div style="width: 336px; height: 372px;"></div></div><div class="contract-trigger"></div></div></div>
                            </div>
                        </div>
                        <!--  -->
                        <!-- 전체 공지 -->
                        <div class="col-xl-4 col-md-6">
                          <div class="card">
                              <div class="card-body" style="position: relative;">
                                  <div class="d-flex align-items-start">
                                      <div class="flex-grow-1">
                                          <h5 class="card-title mb-3">전체 공지</h5>
                                      </div>
                                      <div class="flex-shrink-0">
                                          <div class="dropdown">
                                              <a class="dropdown-toggle text-muted" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                  <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" class="eva eva-more-horizontal-outline fill-muted"><g data-name="Layer 2"><g data-name="more-horizotnal"><rect width="24" height="24" opacity="0"></rect><circle cx="12" cy="12" r="2"></circle><circle cx="19" cy="12" r="2"></circle><circle cx="5" cy="12" r="2"></circle></g></g></svg>
                                              </a>
                                          </div>
                                      </div>
                                  </div>
                                  <div class="table-responsive">                                  
                                    <table class="table mb-0 dash_notice_border">
	                                  <colgroup>
		                                  <col style="width:20%;">
		                                  <col style="width:30%;">
	                                  </colgroup>                                    
                                      <thead>
                                        <tr class="tr_bgc">
                                          <th>작성자</th>
                                          <th>날짜</th>
                                          <th>제목</th>
                                        </tr>
                                      </thead>
                                      <tbody>
                                        <tr>
                                          <td>김항공</td>
                                          <td>2022.12.7</td>
                                          <td>국립항공박물관 공지 예시</td>
                                        </tr>
                                        <tr>
                                          <td>김항공</td>
                                          <td>2022.12.7</td>
                                          <td>국립항공박물관 공지 예시</td>
                                        </tr>
                                        <tr>
                                          <td>김항공</td>
                                          <td>2022.12.7</td>
                                          <td>국립항공박물관 공지 예시</td>
                                        </tr>
                                        <tr>
                                          <td>김항공</td>
                                          <td>2022.12.7</td>
                                          <td>국립항공박물관 공지 예시</td>
                                        </tr>
                                        <tr>
                                          <td>김항공</td>
                                          <td>2022.12.7</td>
                                          <td>국립항공박물관 공지 예시</td>
                                        </tr>
                                      </tbody>
                                    </table>
                                  </div>
                              <div class="resize-triggers"><div class="expand-trigger"><div style="width: 336px; height: 372px;"></div></div><div class="contract-trigger"></div></div></div>
                          </div>
                      </div>
                      </div>
                      <!--  -->
                      <div class="row">
                        <!-- 주제별 재질별 -->
                          <div class="col-xl-4 col-md-6">
                            <div class="card radialbar_wrap">
                                <div class="card-body" style="position: relative;">
                                    <div class="d-flex align-items-start">
                                        <div class="flex-grow-1">
                                            <h5 class="card-title mb-3">주제별</h5>
                                        </div>
                                        <div class="flex-shrink-0">
                                            <div class="dropdown">
                                                <a class="dropdown-toggle text-muted" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" class="eva eva-more-horizontal-outline fill-muted"><g data-name="Layer 2"><g data-name="more-horizotnal"><rect width="24" height="24" opacity="0"></rect><circle cx="12" cy="12" r="2"></circle><circle cx="19" cy="12" r="2"></circle><circle cx="5" cy="12" r="2"></circle></g></g></svg>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <!--주제별 그래프 -->
                                    <div class="col-lg-6">
                                      <div class="card">
                                          <div class="card-body">
                                              <div id="multiple_radialbar" data-colors='["#3b76e1","#63ad6f","#f9c256","#f56e6e"]' class="apex-charts" dir="ltr"></div>
                                          </div>
                                      </div>
                                  </div>
                                    <!-- 주제별 내용 텍스트 영역 -->
                                    <ul class="circel_info_inbox">
                                      <li>
                                        <span class="quantity_wrap">가등록 수량</span><br>
                                        <span class="quantity_wrap_number">0</span>
                                      </li>
                                      <li>
                                        <span class="quantity_wrap">등록 수량</span><br>
                                        <span class="quantity_wrap_number">0</span>
                                      </li>
                                      <li>
                                        <span class="quantity_wrap">보유 수량</span><br>
                                        <span class="quantity_wrap_number">0</span>
                                      </li>
                                    </ul>
                                    <!--  -->
                                <div class="resize-triggers"><div class="expand-trigger"><div style="width: 336px; height: 372px;"></div></div><div class="contract-trigger"></div></div></div>
                            </div>
                            <!--  -->
                            <div class="card radialbar_wrap">
                              <div class="card-body" style="position: relative;">
                                  <div class="d-flex align-items-start">
                                      <div class="flex-grow-1">
                                          <h5 class="card-title mb-3">재질별</h5>
                                      </div>
                                      <div class="flex-shrink-0">
                                          <div class="dropdown">
                                              <a class="dropdown-toggle text-muted" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                  <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" class="eva eva-more-horizontal-outline fill-muted"><g data-name="Layer 2"><g data-name="more-horizotnal"><rect width="24" height="24" opacity="0"></rect><circle cx="12" cy="12" r="2"></circle><circle cx="19" cy="12" r="2"></circle><circle cx="5" cy="12" r="2"></circle></g></g></svg>
                                              </a>
                                          </div>
                                      </div>
                                  </div>
                                    <!--재질별 그래프 -->
                                    <div class="col-lg-6">
                                      <div class="card">
                                          <div class="card-body">
                                              <div id="multiple_radialbar_2" data-colors='["#3b76e1","#63ad6f","#f9c256","#f56e6e"]' class="apex-charts" dir="ltr"></div>
                                          </div>
                                      </div>
                                  </div>
                                  <!-- 재질별 내용 텍스트 영역 -->
                                  <ul class="circel_info_inbox">
                                    <li>
                                      <span class="quantity_wrap">가등록 수량</span><br>
                                      <span class="quantity_wrap_number">0</span>
                                    </li>
                                    <li>
                                      <span class="quantity_wrap">등록 수량</span><br>
                                      <span class="quantity_wrap_number">0</span>
                                    </li>
                                    <li>
                                      <span class="quantity_wrap">보유 수량</span><br>
                                      <span class="quantity_wrap_number">0</span>
                                    </li>
                                  </ul>
                                  <!--  -->
                              <div class="resize-triggers"><div class="expand-trigger"><div style="width: 336px; height: 372px;"></div></div><div class="contract-trigger"></div></div></div>
                          </div>
                        </div>
                        <!--  -->
                        <!-- 문의사항 -->
                        <div class="col-xl-4 col-md-6">
                          <div class="card">
                              <div class="card-body" style="position: relative;">
                                  <div class="d-flex align-items-start">
                                      <div class="flex-grow-1">
                                          <h5 class="card-title mb-3">문의사항</h5>
                                      </div>
                                      <div class="flex-shrink-0">
                                          <div class="dropdown">
                                              <a class="dropdown-toggle text-muted" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                  <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" class="eva eva-more-horizontal-outline fill-muted"><g data-name="Layer 2"><g data-name="more-horizotnal"><rect width="24" height="24" opacity="0"></rect><circle cx="12" cy="12" r="2"></circle><circle cx="19" cy="12" r="2"></circle><circle cx="5" cy="12" r="2"></circle></g></g></svg>
                                              </a>
                                          </div>
                                      </div>
                                  </div>
                                  <div class="table-responsive">                                 
                                    <table class="table mb-0 dash_notice_border">
	                                  <colgroup>
		                                  <col style="width:20%;">
		                                  <col style="width:30%;">
	                                  </colgroup>                                    
                                      <thead>
                                        <tr class="tr_bgc">
                                          <th>작성자</th>
                                          <th>날짜</th>
                                          <th>제목</th>
                                        </tr>
                                      </thead>
                                      <tbody>
                                        <tr>
                                          <td>김항공</td>
                                          <td>2022.12.7</td>
                                          <td>국립항공박물관 공지 예시</td>
                                        </tr>
                                        <tr>
                                          <td>김항공</td>
                                          <td>2022.12.7</td>
                                          <td>국립항공박물관 공지 예시</td>
                                        </tr>
                                        <tr>
                                          <td>김항공</td>
                                          <td>2022.12.7</td>
                                          <td>국립항공박물관 공지 예시</td>
                                        </tr>
                                        <tr>
                                          <td>김항공</td>
                                          <td>2022.12.7</td>
                                          <td>국립항공박물관 공지 예시</td>
                                        </tr>
                                        <tr>
                                          <td>김항공</td>
                                          <td>2022.12.7</td>
                                          <td>국립항공박물관 공지 예시</td>
                                        </tr>
                                      </tbody>
                                    </table>
                                  </div>
                              <div class="resize-triggers"><div class="expand-trigger"><div style="width: 336px; height: 372px;"></div></div><div class="contract-trigger"></div></div></div>
                          </div>
                      </div>
                      </div>
                      <!--  -->
                      <!-- 최근 작업한 자료 ~ 대여,대출 -->
                      <div class="row">
                        <!-- 최근 작업한 자료 -->
                          <div class="col-xl-4 col-md-6">
                            <div class="card">
                                <div class="card-body" style="position: relative;">
                                    <div class="d-flex align-items-start">
                                        <div class="flex-grow-1">
                                            <h5 class="card-title mb-3">최근 작업한 자료</h5>
                                        </div>
                                        <div class="flex-shrink-0">
                                            <div class="dropdown">
                                                <a class="dropdown-toggle text-muted" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" class="eva eva-more-horizontal-outline fill-muted"><g data-name="Layer 2"><g data-name="more-horizotnal"><rect width="24" height="24" opacity="0"></rect><circle cx="12" cy="12" r="2"></circle><circle cx="19" cy="12" r="2"></circle><circle cx="5" cy="12" r="2"></circle></g></g></svg>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 최근 작업한 자료 슬라이드 영역 -->
                                    <div class="dash_img_slider_wrap">
                                      <div>
                                      	<img src="assets/custom_img/intro-logo.png" alt="이미지1">
                                      	<div class="dash_img_main_text">텍스트텍스트</div>
                                      </div>
                                      <div>
                                      	<img src="" alt="이미지2">
                                      	<div class="dash_img_main_text">텍스트텍스트</div>
                                      </div>
                                      <div>
                                      	<img src="" alt="이미지3">
                                      	<div class="dash_img_main_text">텍스트텍스트</div>
                                      </div>
                                      <div>
                                      	<img src="" alt="이미지4">
                                      	<div class="dash_img_main_text">텍스트텍스트</div>
                                      </div>      
                                      <div>
                                      	<img src="" alt="이미지5">
                                      	<div class="dash_img_main_text">텍스트텍스트</div>
                                      </div>
                                      <div>
                                      	<img src="" alt="이미지6">
                                      	<div class="dash_img_main_text">텍스트텍스트</div>
                                      </div>
                                      <div>
                                      	<img src="" alt="이미지7">
                                      	<div class="dash_img_main_text">텍스트텍스트</div>
                                      </div>
                                      <div>
                                      	<img src="" alt="이미지8">
                                      	<div class="dash_img_main_text">텍스트텍스트</div>
                                      </div> 
                                      <div>
                                      	<img src="" alt="이미지9">
                                      	<div class="dash_img_main_text">텍스트텍스트</div>
                                      </div>
                                      <div>
                                      	<img src="" alt="이미지10">
                                      	<div class="dash_img_main_text">텍스트텍스트</div>
                                      </div>
                                      <div>
                                      	<img src="" alt="이미지11">
                                      	<div class="dash_img_main_text">텍스트텍스트</div>
                                      </div>
                                      <div>
                                      	<img src="" alt="이미지12">
                                      	<div class="dash_img_main_text">텍스트텍스트</div>
                                      </div>                                                                                                                                                   
                                    </div>
                                    <!--  -->
                                    <div class="last_data_info_wrap">
                                      <div class="table-responsive last_data_info_inbox">
                                        <table class="table mb-0 dash_recent_work_table">
<%-- 		                                  <colgroup> --%>
<%-- 			                                  <col style="width:20%;"> --%>
<%-- 			                                  <col style="width:30%;"> --%>
<%-- 		                                  </colgroup>                                         --%>
                                          <thead>
                                            <tr class="tr_bgc">
                                              <th>자료명</th>
                                              <th>번호</th>
                                              <th style="width: 50%">자료내용</th>
                                            </tr>
                                          </thead>
                                          <tbody>
                                            <tr>
                                              <td>항정</td>
                                              <td>0023</td>
                                              <td>이동사항 수정</td>
                                            </tr>
                                            <tr>
                                              <td>항정</td>
                                              <td>0023</td>
                                              <td>이동사항 수정</td>
                                            </tr>
                                            <tr>
                                              <td>항정</td>
                                              <td>0023</td>
                                              <td>이동사항 수정</td>
                                            </tr>
                                          </tbody>
                                        </table>
                                      </div>
                                      <div class="table-responsive last_data_info_inbox">
                                        <table class="table mb-0 dash_recent_work_table">
<%-- 		                                  <colgroup> --%>
<%-- 			                                  <col style="width:20%;"> --%>
<%-- 			                                  <col style="width:30%;"> --%>
<%-- 		                                  </colgroup>                                         --%>
                                          <thead>
                                            <tr class="tr_bgc">
                                              <th>자료명</th>
                                              <th>번호</th>
                                              <th style="width: 50%">자료내용</th>
                                            </tr>
                                          </thead>
                                          <tbody>
                                            <tr>
                                              <td>항정</td>
                                              <td>0023</td>
                                              <td>이동사항 수정</td>
                                            </tr>
                                            <tr>
                                              <td>항정</td>
                                              <td>0023</td>
                                              <td>이동사항 수정</td>
                                            </tr>
                                            <tr>
                                              <td>항정</td>
                                              <td>0023</td>
                                              <td>이동사항 수정</td>
                                            </tr>
                                          </tbody>
                                        </table>
                                      </div>
                                    </div>
                                    <!--  -->
                                <div class="resize-triggers"><div class="expand-trigger"><div style="width: 336px; height: 372px;"></div></div><div class="contract-trigger"></div></div></div>
                            </div>
                        </div>
                        <!--  -->
                        <!-- 대여 ~ 대출 -->
                        <div class="col-xl-4 col-md-6">
                          <div class="card">
                              <div class="card-body" style="position: relative;">
                                  <div class="d-flex align-items-start">
                                      <div class="flex-grow-1">
                                          <h5 class="card-title mb-3">대여(관외)</h5>
                                      </div>
                                      <div class="flex-shrink-0">
                                          <div class="dropdown">
                                              <a class="dropdown-toggle text-muted" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                  <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" class="eva eva-more-horizontal-outline fill-muted"><g data-name="Layer 2"><g data-name="more-horizotnal"><rect width="24" height="24" opacity="0"></rect><circle cx="12" cy="12" r="2"></circle><circle cx="19" cy="12" r="2"></circle><circle cx="5" cy="12" r="2"></circle></g></g></svg>
                                              </a>
                                          </div>
                                      </div>
                                  </div>
                                  <ul class="list-unstyled mb-0 dash_ul">
                                    <li class="py-2">
                                        <div class="d-flex align-items-start">
                                            <div class="flex-shrink-0 me-3">
                                                <div class="avatar-md h-auto p-1 py-2 bg-light rounded">
                                                    <div class="text-center">
                                                        <h5 class="mb-0 wrap_bgn">12월</h5>
                                                        <div>9일</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="flex-grow-1 pt-2 text-muted">
                                              <p class="mb-0 rental_li">제주항공우주박물관</p>
                                              <p class="mb-0 rental_li">OPPAV 외 6점</p>
                                            </div>
                                        </div>
                                    </li>

                                    <li class="py-2">
                                        <div class="d-flex align-items-start">
                                            <div class="flex-shrink-0 me-3">
                                                <div class="avatar-md h-auto p-1 py-2 bg-light rounded">
                                                    <div class="text-center">
                                                        <h5 class="mb-0 wrap_bgn">11월</h5>
                                                        <div>9일</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="flex-grow-1 pt-2 text-muted">
                                                <p class="mb-0 rental_li">전쟁기념관</p>
                                                <p class="mb-0 rental_li">F-51D 무스탕</p>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="py-2">
                                        <div class="d-flex align-items-start">
                                            <div class="flex-shrink-0 me-3">
                                                <div class="avatar-md h-auto p-1 py-2 bg-light rounded">
                                                    <div class="text-center">
                                                        <h5 class="mb-0 wrap_bgn">10월</h5>
                                                        <div>9일</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="flex-grow-1 pt-2 text-muted">
                                              <p class="mb-0 rental_li">제주항공우주박물관</p>
                                              <p class="mb-0 rental_li">OPPAV 외 6점</p>
                                            </div>
                                        </div>
                                    </li>

                                    <li class="py-2">
                                      <div class="d-flex align-items-start">
                                          <div class="flex-shrink-0 me-3">
                                              <div class="avatar-md h-auto p-1 py-2 bg-light rounded">
                                                  <div class="text-center">
                                                      <h5 class="mb-0 wrap_bgn">10월</h5>
                                                      <div>9일</div>
                                                  </div>
                                              </div>
                                          </div>
                                          <div class="flex-grow-1 pt-2 text-muted">
                                            <p class="mb-0 rental_li">제주항공우주박물관</p>
                                            <p class="mb-0 rental_li">OPPAV 외 6점</p>
                                          </div>
                                      </div>
                                  </li>

                                </ul>
                              <div class="resize-triggers"><div class="expand-trigger"><div style="width: 336px; height: 372px;"></div></div><div class="contract-trigger"></div></div></div>
                          </div>
                          <!--  -->
                          <div class="card">
                            <div class="card-body" style="position: relative;">
                                <div class="d-flex align-items-start">
                                    <div class="flex-grow-1">
                                        <h5 class="card-title mb-3">대여(관내)</h5>
                                    </div>
                                    <div class="flex-shrink-0">
                                        <div class="dropdown">
                                            <a class="dropdown-toggle text-muted" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" class="eva eva-more-horizontal-outline fill-muted"><g data-name="Layer 2"><g data-name="more-horizotnal"><rect width="24" height="24" opacity="0"></rect><circle cx="12" cy="12" r="2"></circle><circle cx="19" cy="12" r="2"></circle><circle cx="5" cy="12" r="2"></circle></g></g></svg>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <ul class="list-unstyled mb-0 dash_ul">
                                  <li class="py-2">
                                      <div class="d-flex align-items-start">
                                          <div class="flex-shrink-0 me-3">
                                              <div class="avatar-md h-auto p-1 py-2 bg-light rounded">
                                                  <div class="text-center">
                                                      <h5 class="mb-0 wrap_bgn">12월</h5>
                                                      <div>9일</div>
                                                  </div>
                                              </div>
                                          </div>
                                          <div class="flex-grow-1 pt-2 text-muted">
                                            <p class="mb-0 rental_li">제주항공우주박물관</p>
                                            <p class="mb-0 rental_li">MIG-19</p>
                                          </div>
                                      </div>
                                  </li>

                                  <li class="py-2">
                                      <div class="d-flex align-items-start">
                                          <div class="flex-shrink-0 me-3">
                                              <div class="avatar-md h-auto p-1 py-2 bg-light rounded">
                                                  <div class="text-center">
                                                      <h5 class="mb-0 wrap_bgn">11월</h5>
                                                      <div>9일</div>
                                                  </div>
                                              </div>
                                          </div>
                                          <div class="flex-grow-1 pt-2 text-muted">
                                              <p class="mb-0 rental_li">전쟁기념관</p>
                                              <p class="mb-0 rental_li">F-51D 무스탕</p>
                                          </div>
                                      </div>
                                  </li>
                                  <li class="py-2">
                                      <div class="d-flex align-items-start">
                                          <div class="flex-shrink-0 me-3">
                                              <div class="avatar-md h-auto p-1 py-2 bg-light rounded">
                                                  <div class="text-center">
                                                      <h5 class="mb-0 wrap_bgn">10월</h5>
                                                      <div>9일</div>
                                                  </div>
                                              </div>
                                          </div>
                                          <div class="flex-grow-1 pt-2 text-muted">
                                            <p class="mb-0 rental_li">제주항공우주박물관</p>
                                            <p class="mb-0 rental_li">OPPAV 외 6점</p>
                                          </div>
                                      </div>
                                  </li>

                                  <li class="py-2">
                                    <div class="d-flex align-items-start">
                                        <div class="flex-shrink-0 me-3">
                                            <div class="avatar-md h-auto p-1 py-2 bg-light rounded">
                                                <div class="text-center">
                                                    <h5 class="mb-0 wrap_bgn">10월</h5>
                                                    <div>9일</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="flex-grow-1 pt-2 text-muted">
                                          <p class="mb-0 rental_li">제주항공우주박물관</p>
                                          <p class="mb-0 rental_li">OPPAV 외 6점</p>
                                        </div>
                                    </div>
                                </li>

                              </ul>
                            <div class="resize-triggers"><div class="expand-trigger"><div style="width: 336px; height: 372px;"></div></div><div class="contract-trigger"></div></div></div>
                        </div>
                          <!--  -->
                      </div>
                      </div>
                      </div>
                      </div>
                  </div>
              </div>
              <!-- end row -->
          </div>
          <!-- container-fluid -->
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
    <script src="assets/js/pages/apexcharts-bar.init.js"></script>
    <script src="assets/js/pages/apexcharts-radialbar.init.js"></script>
    <!-- ↓ 재질별 원형 그래프 -->
    <script src="assets/js/pages/apexcharts-radialbar_2.init.js"></script>
    <!--  -->
    <script src="assets/libs/swiper/swiper-bundle.min.js"></script>
    <script src="assets/js/pages/ecommerce-product-detail.init.js"></script>
    <!-- 슬릭 슬라이드 -->
    <script src="assets/libs/slick/slick.js"></script>


  <!-- 스크립트 -->
<script>
  $(function(){
      $('.dash_img_slider_wrap').slick({
  infinite: false,
  speed: 400,
  slidesToShow: 3,
  slidesToScroll: 3,
  responsive: [
    {
      breakpoint: 1024,
      settings: {
        slidesToShow: 3,
        slidesToScroll: 3,
        infinite: true,
        dots: true
      }
    },
    {
      breakpoint: 600,
      settings: {
        slidesToShow: 2,
        slidesToScroll: 2
      }
    },
    {
      breakpoint: 480,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1
      }
    }
    // You can unslick at a given breakpoint now by adding:
    // settings: "unslick"
    // instead of a settings object
  ]
});
    });
  
	function logoutProcess(){
		sessionStorage.removeItem("loginId");
	    
	    location.href="/logout.do";
	}
</script>
    <!--  -->
    
</body>
</html>