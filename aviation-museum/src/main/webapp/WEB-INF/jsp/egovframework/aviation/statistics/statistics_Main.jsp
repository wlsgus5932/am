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
    <script type="text/javascript">
    $(function() {
    	
		// 첫 페이지
		$('#museum').attr('aria-selected', 'true').addClass('active');
		
		$.ajax({
			type : 'POST',                
			url : '/statisticsMuseumAjax.do',    
			dataType : "html",           
			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
			error : function() {          
				alert('통신실패!');
			},
			success : function(data) {  
				$('#tab-content').empty().append(data);
			}
		});
    
		// 박물관 tab operation
		$('#museum').click(function() {
			$.ajax({
				type : 'POST',                
				url : '/statisticsMuseumAjax.do',    
				dataType : "html",           
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {          
					alert('통신실패!');
				},
				success : function(data) {  
					$('#tab-content').empty().append(data);
//						$('.tap_text').find('span').text('그룹관리 권한');
				}
			});
		});
		
		// 이미지 tab operation
		$('#images').click(function() {
			$.ajax({
				type : 'POST',                
				url : '/statisticsImagesAjax.do',    
				dataType : "html",           
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {          
					alert('통신실패!');
				},
				success : function(data) {  
					$('#tab-content').empty().append(data);
//						$('.tap_text').find('span').text('그룹관리 권한');
				}
			});
		});
		
		// 전문정보 tab operation
		$('#speciality').click(function() {
			$.ajax({
				type : 'POST',                
				url : '/statisticsSpecialityAjax.do',    
				dataType : "html",           
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {          
					alert('통신실패!');
				},
				success : function(data) {  
					$('#tab-content').empty().append(data);
//						$('.tap_text').find('span').text('그룹관리 권한');
				}
			});
		});
    });

    </script>
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
                <a class="nav-link" data-bs-toggle="tab" href="#tap-1" role="tab" id="museum">
                    <span class="d-block d-sm-none"><i class="far fa-user"></i></span>
                    <span class="d-none d-sm-block">박물관 등록현황</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#tap-2" role="tab" id="images">
                    <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span>
                    <span class="d-none d-sm-block">이미지 통계</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#tap-3" role="tab" id="speciality">
                    <span class="d-block d-sm-none"><i class="fas fa-cog"></i></span>
                    <span class="d-none d-sm-block">전문정보 등록현황</span>
                </a>
            </li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content p-3 text-muted" id="tab-content">



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