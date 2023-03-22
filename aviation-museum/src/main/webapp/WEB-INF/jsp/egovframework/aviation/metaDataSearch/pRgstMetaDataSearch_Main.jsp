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
    <link href="assets/css/viewer.css" rel="stylesheet" type="text/css" />
	<script src="assets/js/viewer.js"></script>
    <script src="assets/libs/jquery/jquery-3.6.3.min.js"></script>
    <script src="assets/js/metadata/metadataList.js"></script> 
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
		
	    function getParameter(name) {
		    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
		        results = regex.exec(location.search);
		    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
		}
		
	    $(function() {
	    	
	    	$('#metaDataSearchList').attr('aria-selected', 'true').addClass('active');
	    	// 첫 페이지
	    	if('${all_search_word}' != ''){
				var all_search_word = '${all_search_word}';
				
				$.ajax({
					type : 'post',
					url : '/pRgstMetaDataSearchListAjax.do',
					data : {search_word : all_search_word},
					dataType : 'html',
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error: function(xhr, status, error){
						alert(error);
					},
					success : function(data){    	    		        
						$('#tab-content').empty().append(data);

					}
				});
			}else{	    						
				
				$.ajax({
					type : 'POST',                
					url : '/pRgstMetaDataSearchListAjax.do',    
					dataType : "html",           
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {          
						alert('통신실패!');
					},
					success : function(data) {  
						$('#tab-content').empty().append(data);
					}
				});
			}
			// 리스트 tab operation
			$('#metaDataSearchList').click(function() {
				$.ajax({
					type : 'POST',                
					url : '/pRgstMetaDataSearchListAjax.do',    
					dataType : "html",           
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {          
						alert('통신실패!');
					},
					success : function(data) {  
						$('#tab-content').empty().append(data);
						$('#simple_view_wrap').empty();
// 						$('.tap_text').find('span').text('그룹관리 권한');
					}
				});
			});
			
			// 이미지리스트 tab operation
			$('#metaDataSearchImageList').click(function() {
				$.ajax({
					type : 'POST',                
					url : '/pRgstMetaDataSearchImageListAjax.do',    
					dataType : "html",           
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {          
						alert('통신실패!');
					},
					success : function(data) {  
						$('#tab-content').empty().append(data);
						$('#simple_view_wrap').empty();
// 						$('.tap_text').find('span').text('그룹관리 권한');
					}
				});
			});
			
		});
	    
	    function quickView(value){
	    	var item_idx = value;
	    	var search_word;
	    	var searched_word;
	    	var research_word;
   		
	    	if($('#search_word').val()){
	    		search_word =$('#search_word').val();
   			}
	    	if($('#searched_word').val()){
	    		searched_word = $('#searched_word').val();
	    	}
			if($('#researched_word').val() == 'checked'){
				research_word = 'on';
				searched_word = $('#searched_word').val();
				researched_word = $('#researched_word').val(); 
			}
			/* 상세검색 */
   			var search_type = $('#search_type_temp').val();
   			var search_type2 = $('#search_type2_temp').val();
   			var search_type3 = $('#search_type3_temp').val();
   			var detail_search_word1 = $('#detail_search_word1_temp').val();
   			var detail_search_word2 = $('#detail_search_word2_temp').val();
   			var detail_search_word3 = $('#detail_search_word3_temp').val();
   			var searchOperator1 = $('#searchOperator1_temp').val();
   			var searchOperator2 = $('#searchOperator2_temp').val();
   			var search_range = $('#search_range_temp').val();
   			var start_item_no = $('#start_item_no_temp').val();
   			var end_item_no = $('#end_item_no_temp').val();
			var country = [];
			var material1 = [];
   			/*  */
			if($('#country_temp').val() != ''){
				country_temp_input = $('#country_temp').val();
				var country_temp = country_temp_input.split(',');
				 for(let i = 0; i <country_temp.length; i++){					
					 country.push(country_temp[i]);
					 }
			}
   			if($('#material1_temp').val() != ''){
   				material1_temp_input = $('#material1_temp').val();
       			var material1_temp = material1_temp_input.split(',');
       			for(let i = 0; i <material1_temp.length; i++){
       				material1.push(material1_temp[i]);
				}
   			}
  			
   			if(item_idx.length == 0){
	    		return;
	    	}

	    	$.ajax({
				type : 'POST',                
				url : '/pRgstMetaDataSearchQuickViewAjax.do',
				data : {
					search_word : search_word,
					searched_word : searched_word,
					research_word : research_word,
					search_type : search_type,
					search_type2 : search_type2,
					search_type3 : search_type3,
					detail_search_word1 : detail_search_word1,
					detail_search_word2 : detail_search_word2,
					detail_search_word3 : detail_search_word3,
					pSrchfAndOr1 : searchOperator1,
					pSrchfAndOr2 : searchOperator2,
					search_range : search_range,
					start_item_no : start_item_no,
					end_item_no : end_item_no,
					country : country,
 					material1 : material1,
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
	    	var search_word =$('#search_word').val();
	    	var searched_word;
	    	var research_word;
	    	
	    	if($('#search_word').val()){
	    		search_word =$('#search_word').val();
   			}
	    	if($('#searched_word').val()){
	    		searched_word = $('#searched_word').val();
	    	}
			if($('#researched_word').val() == 'checked'){
				research_word = 'on';
				searched_word = $('#searched_word').val();
				researched_word = $('#researched_word').val(); 
			}
			/* 상세검색 */
   			var search_type = $('#search_type_temp').val();
   			var search_type2 = $('#search_type2_temp').val();
   			var search_type3 = $('#search_type3_temp').val();
   			var detail_search_word1 = $('#detail_search_word1_temp').val();
   			var detail_search_word2 = $('#detail_search_word2_temp').val();
   			var detail_search_word3 = $('#detail_search_word3_temp').val();
   			var searchOperator1 = $('#searchOperator1_temp').val();
   			var searchOperator2 = $('#searchOperator2_temp').val();
   			var search_range = $('#search_range_temp').val();
   			var start_item_no = $('#start_item_no_temp').val();
   			var end_item_no = $('#end_item_no_temp').val();
			var country = [];
			var material1 = [];
   			/*  */
			if($('#country_temp').val() != ''){
				country_temp_input = $('#country_temp').val();
				var country_temp = country_temp_input.split(',');
				 for(let i = 0; i <country_temp.length; i++){					
					 country.push(country_temp[i]);
					 }
			}
   			if($('#material1_temp').val() != ''){
   				material1_temp_input = $('#material1_temp').val();
       			var material1_temp = material1_temp_input.split(',');
       			for(let i = 0; i <material1_temp.length; i++){
       				material1.push(material1_temp[i]);
				}
   			}
  			
   			if(image_idx.length == 0){
	    		return;
	    	}
	    	$.ajax({
				type : 'POST',                
				url : '/pRgstMetaDataSearchImageQuickViewAjax.do',
				data : {
					search_word : search_word,
					searched_word : searched_word,
					research_word : research_word,
					search_type : search_type,
					search_type2 : search_type2,
					search_type3 : search_type3,
					detail_search_word1 : detail_search_word1,
					detail_search_word2 : detail_search_word2,
					detail_search_word3 : detail_search_word3,
					pSrchfAndOr1 : searchOperator1,
					pSrchfAndOr2 : searchOperator2,
					search_range : search_range,
					start_item_no : start_item_no,
					end_item_no : end_item_no,
					country : country,
 					material1 : material1,
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
		
   		// 관심자료등록
		$(document).on('click', '#interestInsBtn', function(){

			if(!$('input:checkbox[name="group_seqList"]').is(':checked')){
				alert("선택하신 자료가 없습니다.");
				$('#interestInsBtnClose').click();

				return false;
			}
			var group_seqList = [];
			
			$('.check_temp:checked').each(function(i){
				group_seqList.push($(this).val());
			});
			 
			var $this = $(this);

				$.ajax({
					type : 'POST',                 
					url : '/pRgstInterestInsert.do',   
					dataType : "json",         
					traditional : true,
					data:{
						group_seqList : group_seqList
					},
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {          
						alert('통신실패!');
					},
					success : function(success) {   
						alert("관심자료가 등록되었습니다.");
						$('#interestInsBtnClose').click();
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
					}
				});
		});
		function content_print(){
			
			 let $container = $("#dataDiv").clone()    // 프린트 할 특정 영역 복사
			 	let cssText = ".pagination{ display:none !important;} #checkbox1{ display:none !important;} #checkbox2{ display:none !important;}"                            // 스타일 복사
				for (const node of $("style")) {
			        cssText += node.innerHTML
			    }
			    /** 팝업 */
			    let innerHtml = $container[0].innerHTML
			    console.log(innerHtml);
			    let popupWindow = window.open("가등록자료검색", "_blank", "width=650,height=600")
			    popupWindow.document.write("<!DOCTYPE html>"+
			      "<html>"+
			        "<head>"+
			        '<link href="assets/css/custom.css" rel="stylesheet" type="text/css" />'+
			        '<link rel="stylesheet" href="assets/css/custom_search.css" />'+
			        '<link href="assets/css/viewer.css" rel="stylesheet" type="text/css" />'+
			        '<link href="assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />'+
			        '<link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />'+
			        '<link href="assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />'+
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
    <!-- <body data-layout="horizontal"> -->

    <!-- Begin page -->
    <div id="layout-wrapper">
    
     	<jsp:include page="../common/inc/headerContent.jsp" />

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
              <label class="col-md-2 col-form-label st_title" id="totalNum"></label>
              <label class="col-md-2 col-form-label st_title" id="totalQty"></label>
              <label class="col-md-2 col-form-label st_title" id="currentQty" ></label>
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