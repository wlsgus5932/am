<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>자료구입 관리-자료심의 | 국립항공박물관</title>
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
			$('#dataPurchaseMgrSellReceiver').attr('aria-selected', 'true').addClass('active');
			
			$.ajax({
				type : 'POST',                
				url : '/dataPurchaseMgrSellReceiver.do',    
				dataType : "html",           
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {          
					alert('통신실패!');
				},
				success : function(data) {  
					$('#tab-content').empty().append(data);
				}
			});
			
			// 자료카드(앞) tab operation
			$('#dataPurchaseMgrSellReceiver').click(function() {
				$.ajax({
					type : 'POST',                
					url : '/dataPurchaseMgrSellReceiver.do',    
					dataType : "html",           
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {          
						alert('통신실패!');
					},
					success : function(data) {  
						$('#tab-content').empty().append(data);
//						$('#searchKeyword').val('erasure');
					}
				});
			});
			
			// 자료카드(뒤) tab operation
			$('#dataPurchaseMgrSellData').click(function() {
				$.ajax({
					type : 'POST',                 
					url : '/dataPurchaseMgrSellData.do',   				
					dataType : "html",           
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {        
						alert('통신실패!');
					},
					success : function(data) {  
						$('#tab-content').empty().append(data);
//						$('#searchKeyword').val('keyword');
					}
				});
			});
			
			// 자료대장 tab operation
			$('#dataPurchaseMgrPracticalReview').click(function() {
				$.ajax({
					type : 'POST',                 
					url : '/dataPurchaseMgrPracticalReview.do',   				
					dataType : "html",           
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {        
						alert('통신실패!');
					},
					success : function(data) {  
						$('#tab-content').empty().append(data);
//						$('#searchKeyword').val('keyword');
					}
				});
			});
			
			// 자료대장 tab operation
			$('#dataPurchaseMgrDataReception').click(function() {
				$.ajax({
					type : 'POST',                 
					url : '/dataPurchaseMgrDataReception.do',   				
					dataType : "html",           
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {        
						alert('통신실패!');
					},
					success : function(data) {  
						$('#tab-content').empty().append(data);
//						$('#searchKeyword').val('keyword');
					}
				});
			});
			
			// 자료대장 tab operation
			$('#dataPurchaseMgrPurchaseAppraaisal').click(function() {
				$.ajax({
					type : 'POST',                 
					url : '/dataPurchaseMgrPurchaseAppraaisal.do',   				
					dataType : "html",           
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {        
						alert('통신실패!');
					},
					success : function(data) {  
						$('#tab-content').empty().append(data);
//						$('#searchKeyword').val('keyword');
					}
				});
			});
			
			// 자료대장 tab operation
			$('#dataPurchaseMgrPurchaseReview').click(function() {
				$.ajax({
					type : 'POST',                 
					url : '/dataPurchaseMgrPurchaseReview.do',   				
					dataType : "html",           
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {        
						alert('통신실패!');
					},
					success : function(data) {  
						$('#tab-content').empty().append(data);
//						$('#searchKeyword').val('keyword');
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
            <p>자료심의 > <span>자료구입 관리</span></p>
          </div>
          <!-- 셀렉트 -->
          <div class="fr_wrap">
            <div class="mb-3 row fr_1">
              <div class="col-md-10 fr_1_inwrap">
                <label class="col-md-2 col-form-label">회차선택</label>
                <select class="form-select">
                  <option disabled selected>전체</option>
                  <option>심사대기</option>
                  <option>심사중</option>
                </select>
                <label class="col-md-2 col-form-label">구분</label>
                <select class="form-select">
                  <option disabled selected>전체</option>
                  <option>심사대기</option>
                  <option>심사중</option>
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
          <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#datareview_1" role="tab" id="dataPurchaseMgrSellReceiver">
                    <span class="d-block d-sm-none"><i class="far fa-user"></i></span>
                    <span class="d-none d-sm-block">매도신청<br>(접수자별 N건)</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#datareview_2" role="tab" id="dataPurchaseMgrSellData">
                    <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span>
                    <span class="d-none d-sm-block">매도신청<br>(자료별 N건)</span>
                </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-bs-toggle="tab" href="#datareview_3" role="tab" id="dataPurchaseMgrPracticalReview">
                  <span class="d-block d-sm-none"><i class="far fa-user"></i></span>
                  <span class="d-none d-sm-block">실무검토<br>(N건)</span>
              </a>
          </li>
          <li class="nav-item">
              <a class="nav-link" data-bs-toggle="tab" href="#datareview_4" role="tab" id="dataPurchaseMgrDataReception">
                  <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span>
                  <span class="d-none d-sm-block">자료접수<br>(N건)</span>
              </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="tab" href="#datareview_5" role="tab" id="dataPurchaseMgrPurchaseAppraaisal">
                <span class="d-block d-sm-none"><i class="far fa-user"></i></span>
                <span class="d-none d-sm-block">구입감정<br>(N건)</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-bs-toggle="tab" href="#datareview_6" role="tab" id="dataPurchaseMgrPurchaseReview">
                <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span>
                <span class="d-none d-sm-block">구입심의<br>(N건)</span>
            </a>
        </li>
        </ul>
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