<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
 <head>
    <meta charset="utf-8" />
    <title>자료통계-고정양식 | 국립항공박물관</title>
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
    <link rel="stylesheet" href="assets/css/custom_print.css">
    <script src="assets/libs/jquery/jquery-3.6.3.min.js"></script>
  	<script type="text/javascript">
	    $(function() {
			
			// 첫 페이지
			$('#dataCardFront').attr('aria-selected', 'true').addClass('active');
			
			$.ajax({
				type : 'POST',                
				url : '/dataCardFrontListAjax.do',    
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
			$('#dataCardFront').click(function() {
				$.ajax({
					type : 'POST',                
					url : '/dataCardFrontListAjax.do',    
					dataType : "html",           
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {          
						alert('통신실패!');
					},
					success : function(data) {  
						$('#tab-content').empty().append(data);
// 						$('#searchKeyword').val('erasure');
					}
				});
			});
			
			// 자료카드(뒤) tab operation
			$('#dataCardBack').click(function() {
				$.ajax({
					type : 'POST',                 
					url : '/dataCardBackListAjax.do',   				
					dataType : "html",           
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {        
						alert('통신실패!');
					},
					success : function(data) {  
						$('#tab-content').empty().append(data);
// 						$('#searchKeyword').val('keyword');
					}
				});
			});
			
			// 자료대장 tab operation
			$('#dataLedger').click(function() {
				$.ajax({
					type : 'POST',                 
					url : '/dataLedgerListAjax.do',   				
					dataType : "html",           
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {        
						alert('통신실패!');
					},
					success : function(data) {  
						$('#tab-content').empty().append(data);
// 						$('#searchKeyword').val('keyword');
					}
				});
			});
		});
		function content_print(){
			
 			 let $container = $("#dataDiv").clone()    // 프린트 할 특정 영역 복사
 			    let cssText = ".dataDiv{ display:block !important;}"                            // 스타일 복사
 			    for (const node of $("style")) {
 			        cssText += node.innerHTML
 			    }
 			    /** 팝업 */
 			    let innerHtml = $container[0].innerHTML
 			    console.log(innerHtml);
 			    let popupWindow = window.open("", "_blank", "width=650,height=600")
 			    popupWindow.document.write("<!DOCTYPE html>"+
 			      "<html>"+
 			        "<head>"+
 			        '<link href="assets/css/custom.css" rel="stylesheet" type="text/css" />'+
 			        '<link rel="stylesheet" href="assets/css/custom_auto_upload.css">'+
 			        '<link rel="stylesheet" href="assets/css/custom_print.css">'+
 			        "<style>"+cssText+"</style>"+
 			        "</head>"+
 			        "<body>"+innerHtml+"</body>"+
 			      "</html>")
			   
 			    popupWindow.document.close()
 			    popupWindow.focus()

 			    /** 1초 지연 */
 			    setTimeout(() => {
 			        popupWindow.print()         // 팝업의 프린트 도구 시작
 			        popupWindow.close()         // 프린트 도구 닫혔을 경우 팝업 닫기
 			    }, 1000)
		}  
		
		function ledger_print(){
			
			 let $container = $("#dataDiv").clone()    // 프린트 할 특정 영역 복사
			    let cssText = ".card-body{ display:block !important;}"                            // 스타일 복사
			    for (const node of $("style")) {
			        cssText += node.innerHTML
			    }
			    /** 팝업 */
			    let innerHtml = $container[0].innerHTML
			    console.log(innerHtml);
			    let popupWindow = window.open("", "_blank", "width=650,height=600")
			    popupWindow.document.write("<!DOCTYPE html>"+
			      "<html>"+
			        "<head>"+
			        '<link href="assets/css/custom.css" rel="stylesheet" type="text/css" />'+
			        '<link rel="stylesheet" href="assets/css/custom_auto_upload.css">'+
			        '<link rel="stylesheet" href="assets/css/custom_print.css">'+
			        "<style>"+cssText+"</style>"+
			        "</head>"+
			        "<body>"+innerHtml+"</body>"+
			      "</html>")
			   
			    popupWindow.document.close()
			    popupWindow.focus()

			    /** 1초 지연 */
			    setTimeout(() => {
			        popupWindow.print()         // 팝업의 프린트 도구 시작
			        popupWindow.close()         // 프린트 도구 닫혔을 경우 팝업 닫기
			    }, 1000)
		}  
  	</script>

  </head>
  
  <body data-sidebar="dark">
  <jsp:include page="../common/inc/headerContent.jsp" />
        <!-- ============================================================== -->
      <div class="main-content">
        <div class="page-content">
          <div class="tap_text">
            <h2>자료통계</h2>
            <p>자료통계 > <span>고정양식</span></p>
          </div>
          <!-- 탭 -->
          <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#tap-1" role="tab" id="dataCardFront">
                    <span class="d-block d-sm-none"><i class="far fa-user"></i></span>
                    <span class="d-none d-sm-block">자료카드(앞)</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#tap-2" role="tab" id="dataCardBack">
                    <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span>
                    <span class="d-none d-sm-block">자료카드(뒤)</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#tap-3" role="tab" id="dataLedger">
                    <span class="d-block d-sm-none"><i class="fas fa-cog"></i></span>
                    <span class="d-none d-sm-block">자료대장</span>
                </a>
            </li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content p-3 text-muted" id="tab-content">




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
