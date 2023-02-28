<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>환경설정-기타관리 | 국립항공박물관</title>
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
		$('#tagMgr').attr('aria-selected', 'true').addClass('active');
		
		$.ajax({
			type : 'POST',                
			url : '/tagListAjax.do',    
			dataType : "html",           
			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
			error : function() {          
				alert('통신실패!');
			},
			success : function(data) {  
				$('#tab-content').empty().append(data);
			}
		});
		
		// 사용자 관리 tab operation
		$('#tagMgr').click(function() {
			$.ajax({
				type : 'POST',                
				url : '/tagListAjax.do',    
				dataType : "html",           
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {          
					alert('통신실패!');
				},
				success : function(data) {  
					$('#tab-content').empty().append(data);
// 					$('.tap_text').find('span').text('사용자 둥록');
				}
			});
		});
		
		// 그룹 관리 tab operation
		$('#exchnRateMgr').click(function() {
			$.ajax({
				type : 'POST',                 
				url : '/exchnRateListAjax.do',   				
				dataType : "html",           
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {        
					alert('통신실패!');
				},
				success : function(data) {  
					$('#tab-content').empty().append(data);
// 					$('.tap_text').find('span').text('그룹 관리');
				}
			});
		});
		
	});
	
	// 태그 등록
	$(document).on('click', '#tagInsBtn', function(){		
		
		var queryString = $("form[name=tagInsertForm]").serialize();
		var check_submit = confirm('태그를 등록하시겠습니까?');
		var tagInsCheck = $('#tagInsCheck').attr('tagInsCheck');
		if(tagInsCheck == "" || tagInsCheck == "N"){alert('태그 중복체크를 해주세요'); $('#tagInsCheck').focus(); return;}
		
		if(check_submit){	
			if (tagInsValidation()) {
				$.ajax({
					type : 'post',
					url : '/tagInsert.do',
					data : queryString,
					dataType : 'json',
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error: function(xhr, status, error){
						alert(error);
					},
					success : function(success){
						alert('태그가 등록되었습니다.');
						$('#tagInsBtnClose').click();
						$.ajax({
							type : 'POST',                 
							url : '/tagListAjax.do',   
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
			}
		}
	});
	
	<%-- 태그 등록 유효성체크 --%>
	var tagInsValidation = function() {

		var insTagNm = $('#insTagNm').val();				
		
		if (!Boolean(insTagNm)) {
			alert("태그를 입력해주세요.");
			$("#insTagNm").focus();
			return false;
		}			
		if (!$('input[type="checkbox"][name="enabled"]').is(":checked")) {
			alert("사용 여부를 체크해주세요.");
			return false;
		}

		return true;
	}
	
	// 태그 등록 중복체크 버튼
	var tagDuplicateCheck = function()  {	
			var $returnVal = false;
			var insTagNm = $('#insTagNm').val();	

			if (!Boolean(insTagNm)) {
				alert("태그를 입력해주세요.");
				$("#insTagNm").focus();
				return false;
			}	
		
			var queryString = $("form[name=tagInsertForm]").serialize();
			
			$.ajax({
				type : 'POST',                 
				url : '/tagDuplicateCheck.do',   
				data: queryString,
				dataType : "json",           
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {        
					alert('통신실패!');
				},
				success : function(data) {
					$.each(data, function(index, item) { // 데이터 =item
						if(item.result == "success"){	
							alert('존재하는 태그입니다.');
							$('#tagInsCheck').attr('tagInsCheck','N');
						}else{
							alert('사용가능한 태그입니다.');
							$('#tagInsCheck').attr('tagInsCheck','Y');
						}
					});
				}
			});

	}
	
	// 태그 수정 팝업 버튼
	function tagModPopup(value) {
			var tag_idx = value;
			$.ajax({
				type : 'POST',                 
				url : '/tagModPopupAjax.do',   
				data:{
					tag_idx : tag_idx
				},
				dataType : "json",           
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {        
					alert('통신실패!');
				},
				success : function(data) {  
						
					$.each(data, function(index, item) { // 데이터 =item
						
						$('#modTagIdx').val(value);
						$('#modTagNm').val(item.tag_nm);
						$('#modTagNmFirst').val(item.tag_nm);
						if(item.enabled == 'Y'){
							$('#modTagEnabledY').prop('checked',true);
							$('#modTagEnabledN').prop('checked',false);
						}else{
							$('#modTagEnabledN').prop('checked',true);
							$('#modTagEnabledY').prop('checked',false);
						}
					});
				}
			});
	}
	
	<%-- 태그 수정 유효성체크 --%>
	var tagModValidation = function() {

		var modTagNm = $('#modTagNm').val();				
		
		if (!Boolean(modTagNm)) {
			alert("태그를 입력해주세요.");
			$("#modTagNm").focus();
			return false;
		}			
		if (!$('input[type="checkbox"][name="enabled"]').is(":checked")) {
			alert("사용 여부를 체크해주세요.");
			return false;
		}

		return true;
	}
	
	// 태그 수정 중복체크 버튼
	function tagModDuplicateCheck()  {				
			var modTagNm = $('#modTagNm').val();				
			var modTagNmFisrt = $('#modTagNmFirst').val();				

			if (!Boolean(modTagNm)) {
				alert("태그를 입력해주세요.");
				$("#modTagNm").focus();
				return false;
			}			
			if (!$('input[type="checkbox"][name="enabled"]').is(":checked")) {
				alert("사용 여부를 체크해주세요.");
				return false;
			}
			var queryString = $("form[name=tagUpdateForm]").serialize();
			
			if(modTagNmFisrt != modTagNm){				

				$.ajax({
					type : 'POST',                 
					url : '/tagDuplicateCheck.do',   
					data: queryString,
					dataType : "json",           
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {        
						alert('통신실패!');
					},
					success : function(data) {
						$.each(data, function(index, item) { // 데이터 =item
							if(item.result == "success"){								
								alert('존재하는 태그입니다.');
								$('#tagModCheck').attr('tagModCheck','N');
								
							}else{
								alert('사용가능한 태그입니다.');
								$('#tagModCheck').attr('tagModCheck','Y');
							}
						});
					}
				});
			}else{
					alert('사용가능한 태그입니다.');
					$('#tagModCheck').attr('tagModCheck','Y');

			}
	}
	
	// 태그 수정
	$(document).on('click', '#tagModBtn', function(){

		var queryString = $("form[name=tagUpdateForm]").serialize();
		var check_submit = confirm('태그를 수정하시겠습니까?');
		var tagModCheck = $('#tagModCheck').attr('tagModCheck');
		if(tagModCheck == "" || tagModCheck == "N"){alert('태그 중복체크를 해주세요'); $('#tagModCheck').focus(); return;}
	
		if(check_submit){
			if (tagModValidation()) {
				$.ajax({
					type : 'post',
					url : '/tagUpdate.do',
					data : queryString,
					dataType : 'json',
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error: function(xhr, status, error){
						alert(error);
					},
					success : function(success){
						alert('태그가 수정되었습니다.');
						$('#tagModBtnClose').click();
						$.ajax({
							type : 'POST',                 
							url : '/tagListAjax.do',   
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
			}
		}
	});
	
	//중복확인란 텍스트 변경 시 다시 중복확인 해야함
	function tagModInputChange(){
		$('#tagModCheck').attr('tagModCheck','N');
	}
	//중복확인란 텍스트 변경 시 다시 중복확인 해야함
	function tagInsInputChange(){
		$('#tagInsCheck').attr('tagInsCheck','N');
	}
	
	// 태그 삭제
	$(document).on('click', '#tagDelBtn', function(){

		if(!$('input:checkbox[name="group_seqList"]').is(':checked')){
			alert("선택하신 태그가 없습니다.");
			$('#tagDelBtnClose').click();

			return false;
		}
		var group_seqList = [];
		
		$('.check_temp:checked').each(function(i){
			group_seqList.push($(this).val());
		});
		console.log(group_seqList);
		 
		var $this = $(this);

			$.ajax({
				type : 'POST',                 
				url : '/tagDelete.do',   
				dataType : "json",         
				data:{
					group_seqList : group_seqList
				},
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {          
					alert('통신실패!');
				},
				success : function(success) {   
					alert("태그가 삭제되었습니다.");
					$('#tagDelBtnClose').click();
					$.ajax({
						type : 'POST',                 
						url : '/tagListAjax.do',   
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
	
	// 환율정보 등록
	$(document).on('click', '#exchnRateInsBtn', function(){		
		
		var queryString = $("form[name=exchnRateInsertForm]").serialize();
		var check_submit = confirm('환율정보를 등록하시겠습니까?');

		if(check_submit){	
			if (exchnRateInsValidation()) {
				$.ajax({
					type : 'post',
					url : '/exchnRateInsert.do',
					data : queryString,
					dataType : 'json',
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error: function(xhr, status, error){
						alert(error);
					},
					success : function(success){
						alert('태그가 등록되었습니다.');
						$('#exchnRateInsBtnClose').click();
						$.ajax({
							type : 'POST',                 
							url : '/exchnRateListAjax.do',   
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
			}
		}
	});
	
	<%-- 환율정보 등록 유효성체크 --%>
	var exchnRateInsValidation = function() {

		var insExchnRateNm = $('#insExchnRateNm').val();			
		var insExchnRateServiceUrl = $('#insExchnRateServiceUrl').val();				
		var insExchnRateSeq = $('#insExchnRateSeq').val();	
		
		if (!Boolean(insExchnRateNm)) {
			alert("제공자이름을 입력해주세요.");
			$("#insExchnRateNm").focus();
			return false;
		}		
		if (!Boolean(insExchnRateServiceUrl)) {
			alert("제공주소를 입력해주세요.");
			$("#insExchnRateServiceUrl").focus();
			return false;
		}	
		if (!Boolean(insExchnRateSeq)) {
			alert("순서를 입력해주세요.");
			$("#insExchnRateSeq").focus();
			return false;
		}	
		if (!$('input[type="checkbox"][name="enabled"]').is(":checked")) {
			alert("사용 여부를 체크해주세요.");
			return false;
		}

		return true;
	}
	
	// 환율정보 수정 팝업 버튼
	function exchnRateModPopup(value) {
			var exchange_rate_idx = value;
			$.ajax({
				type : 'POST',                 
				url : '/exchnRateModPopupAjax.do',   
				data:{
					exchange_rate_idx : exchange_rate_idx
				},
				dataType : "json",           
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {        
					alert('통신실패!');
				},
				success : function(data) {  
						
					$.each(data, function(index, item) { // 데이터 =item
						$('#modExchnRateIdx').val(value);
						$('#modExchnRateNm').val(item.provider_nm);
						$('#modExchnRateServiceUrl').val(item.service_url);
						$('#modExchnRateSeq').val(item.seq);
						if(item.enabled == 'Y'){
							$('#modExchnRateEnabledY').prop('checked',true);
							$('#modExchnRateEnabledN').prop('checked',false);
						}else{
							$('#modExchnRateEnabledN').prop('checked',true);
							$('#modExchnRateEnabledY').prop('checked',false);
						}
					});
				}
			});
	}
	
	<%-- 환율정보 수정 유효성체크 --%>
	var exchnRateModValidation = function() {

		var modExchnRateNm = $('#modExchnRateNm').val();				
		var modExchnRateServiceUrl = $('#modExchnRateServiceUrl').val();				

		if (!Boolean(modExchnRateNm)) {
			alert("제공자이름을 입력해주세요.");
			$("#modExchnRateNm").focus();
			return false;
		}		
		if (!Boolean(modExchnRateServiceUrl)) {
			alert("제공주소를 입력해주세요.");
			$("#modExchnRateServiceUrl").focus();
			return false;
		}		
		if (!$('input[type="checkbox"][name="enabled"]').is(":checked")) {
			alert("사용 여부를 체크해주세요.");
			return false;
		}

		return true;
	}
	
	// 환율정보 수정
	$(document).on('click', '#exchnRateModBtn', function(){

		var queryString = $("form[name=exchnRateUpdateForm]").serialize();
		var check_submit = confirm('환율정보를 수정하시겠습니까?');

		if(check_submit){
			if (exchnRateModValidation()) {
				$.ajax({
					type : 'post',
					url : '/exchnRateUpdate.do',
					data : queryString,
					dataType : 'json',
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error: function(xhr, status, error){
						alert(error);
					},
					success : function(success){
						alert('환율정보가 수정되었습니다.');
						$('#exchnRateModBtnClose').click();
						$.ajax({
							type : 'POST',                 
							url : '/exchnRateListAjax.do',   
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
			}
		}
	});
	
	// 환율정보 삭제
	$(document).on('click', '#exchnRateDelBtn', function(){

		if(!$('input:checkbox[name="group_seqList"]').is(':checked')){
			alert("선택하신 환율정보가 없습니다.");
			$('#exchnRateDelBtnClose').click();

			return false;
		}
		var group_seqList = [];
		
		$('.check_temp:checked').each(function(i){
			group_seqList.push($(this).val());
		});
		console.log(group_seqList);
		 
		var $this = $(this);

			$.ajax({
				type : 'POST',                 
				url : '/exchnRateDelete.do',   
				dataType : "json",         
				data:{
					group_seqList : group_seqList
				},
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {          
					alert('통신실패!');
				},
				success : function(success) {   
					alert("환율정보가 삭제되었습니다.");
					$('#exchnRateDelBtnClose').click();
					$.ajax({
						type : 'POST',                 
						url : '/exchnRateListAjax.do',   
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
	
    </script>
  </head>

  <body data-sidebar="dark">
    <!-- <body data-layout="horizontal"> -->
 	<jsp:include page="../../common/inc/headerContent.jsp" />
        <div class="topnav">
          <div class="container-fluid">
            <nav class="navbar navbar-light navbar-expand-lg topnav-menu">
              <div class="collapse navbar-collapse" id="topnav-menu-content">
                <ul class="navbar-nav">
                  <li class="nav-item dropdown">
                    <a
                      class="nav-link dropdown-toggle arrow-none"
                      href="#"
                      id="topnav-dashboard"
                      role="button"
                      data-toggle="dropdown"
                      aria-haspopup="true"
                      aria-expanded="false"
                    >
                      <i class="icon nav-icon" data-eva="grid-outline"></i>
                      <span data-key="t-dashboards">Dashboards</span>
                      <div class="arrow-down"></div>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="topnav-dashboard">
                      <a href="index.html" class="dropdown-item" data-key="t-ecommerce">Ecommerce</a>
                      <a href="dashboard-saas.html" class="dropdown-item" data-key="t-saas">Saas</a>
                      <a href="dashboard-crypto.html" class="dropdown-item" data-key="t-crypto">Crypto</a>
                    </div>
                  </li>

                  <li class="nav-item dropdown">
                    <a
                      class="nav-link dropdown-toggle arrow-none"
                      href="#"
                      id="topnav-uielement"
                      role="button"
                      data-toggle="dropdown"
                      aria-haspopup="true"
                      aria-expanded="false"
                    >
                      <i class="icon nav-icon" data-eva="cube-outline"></i>
                      <span data-key="t-elements">Elements</span>
                      <div class="arrow-down"></div>
                    </a>

                    <div class="dropdown-menu mega-dropdown-menu px-2 dropdown-mega-menu-xl" aria-labelledby="topnav-uielement">
                      <div class="ps-2 p-lg-0">
                        <div class="row">
                          <div class="col-lg-12">
                            <div>
                              <div class="menu-title">Elements</div>
                              <div class="row g-0">
                                <div class="col-lg-4">
                                  <div>
                                    <a href="ui-alerts.html" class="dropdown-item" data-key="t-alerts">Alerts</a>
                                    <a href="ui-buttons.html" class="dropdown-item" data-key="t-buttons">Buttons</a>
                                    <a href="ui-cards.html" class="dropdown-item" data-key="t-cards">Cards</a>
                                    <a href="ui-carousel.html" class="dropdown-item" data-key="t-carousel">Carousel</a>
                                    <a href="ui-dropdowns.html" class="dropdown-item" data-key="t-dropdowns">Dropdowns</a>
                                    <a href="ui-grid.html" class="dropdown-item" data-key="t-grid">Grid</a>
                                    <a href="ui-images.html" class="dropdown-item" data-key="t-images">Images</a>
                                  </div>
                                </div>
                                <div class="col-lg-4">
                                  <div>
                                    <a href="ui-lightbox.html" class="dropdown-item" data-key="t-lightbox">Lightbox</a>
                                    <a href="ui-modals.html" class="dropdown-item" data-key="t-modals">Modals</a>
                                    <a href="ui-offcanvas.html" class="dropdown-item" data-key="t-offcanvas">Offcanvas</a>
                                    <a href="ui-rangeslider.html" class="dropdown-item" data-key="t-range-slider">Range Slider</a>
                                    <a href="ui-progressbars.html" class="dropdown-item" data-key="t-progress-bars">Progress Bars</a>
                                    <a href="ui-sweet-alert.html" class="dropdown-item" data-key="t-sweet-alert">Sweet-Alert</a>
                                    <a href="ui-tabs-accordions.html" class="dropdown-item" data-key="t-tabs-accordions">Tabs & Accordions</a>
                                  </div>
                                </div>
                                <div class="col-lg-4">
                                  <div>
                                    <a href="ui-typography.html" class="dropdown-item" data-key="t-typography">Typography</a>
                                    <a href="ui-video.html" class="dropdown-item" data-key="t-video">Video</a>
                                    <a href="ui-general.html" class="dropdown-item" data-key="t-general">General</a>
                                    <a href="ui-colors.html" class="dropdown-item" data-key="t-colors">Colors</a>
                                    <a href="ui-rating.html" class="dropdown-item" data-key="t-rating">Rating</a>
                                    <a href="ui-notifications.html" class="dropdown-item" data-key="t-notifications">Notifications</a>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </li>

                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle arrow-none" href="#" id="topnav-pages" role="button">
                      <i class="icon nav-icon" data-eva="archive-outline"></i>
                      <span data-key="t-apps">Apps</span>
                      <div class="arrow-down"></div>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="topnav-pages">
                      <a href="apps-calendar.html" class="dropdown-item" data-key="t-calendar">Calendar</a>
                      <a href="apps-chat.html" class="dropdown-item" data-key="t-chat">Chat</a>
                      <a href="apps-file-manager.html" class="dropdown-item" data-key="t-filemanager">File Manager</a>

                      <div class="dropdown">
                        <a class="dropdown-item dropdown-toggle arrow-none" href="#" id="topnav-ecommerce" role="button">
                          <span data-key="t-ecommerce">Ecommerce</span>
                          <div class="arrow-down"></div>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="topnav-ecommerce">
                          <a href="ecommerce-products.html" class="dropdown-item" data-key="t-products">Products</a>
                          <a href="ecommerce-product-detail.html" class="dropdown-item" data-key="t-product-detail">Product Detail</a>
                          <a href="ecommerce-orders.html" class="dropdown-item" data-key="t-orders">Orders</a>
                          <a href="ecommerce-customers.html" class="dropdown-item" data-key="t-customers">Customers</a>
                          <a href="ecommerce-cart.html" class="dropdown-item" data-key="t-cart">Cart</a>
                          <a href="ecommerce-checkout.html" class="dropdown-item" data-key="t-checkout">Checkout</a>
                          <a href="ecommerce-shops.html" class="dropdown-item" data-key="t-shops">Shops</a>
                          <a href="ecommerce-add-product.html" class="dropdown-item" data-key="t-add-product">Add Product</a>
                        </div>
                      </div>

                      <div class="dropdown">
                        <a class="dropdown-item dropdown-toggle arrow-none" href="#" id="topnav-email" role="button">
                          <span data-key="t-email">Email</span>
                          <div class="arrow-down"></div>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="topnav-email">
                          <a href="email-inbox.html" class="dropdown-item" data-key="t-inbox">Inbox</a>
                          <a href="email-read.html" class="dropdown-item" data-key="t-read-email">Read Email</a>
                          <div class="dropdown">
                            <a class="dropdown-item dropdown-toggle arrow-none" href="#" id="topnav-email-templates" role="button">
                              <span data-key="t-email-templates">Templates</span>
                              <div class="arrow-down"></div>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="topnav-email-templates">
                              <a href="email-template-basic.html" class="dropdown-item" data-key="t-basic-action">Basic Action</a>
                              <a href="email-template-alert.html" class="dropdown-item" data-key="t-alert-email">Alert Email</a>
                              <a href="email-template-billing.html" class="dropdown-item" data-key="t-bill-email">Billing Email</a>
                            </div>
                          </div>
                        </div>
                      </div>

                      <div class="dropdown">
                        <a class="dropdown-item dropdown-toggle arrow-none" href="#" id="topnav-invoices" role="button">
                          <span data-key="t-invoices">Invoices</span>
                          <div class="arrow-down"></div>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="topnav-invoices">
                          <a href="invoices-list.html" class="dropdown-item" data-key="t-invoice-list">Invoice List</a>
                          <a href="invoices-detail.html" class="dropdown-item" data-key="t-invoice-detail">Invoice Detail</a>
                        </div>
                      </div>

                      <div class="dropdown">
                        <a class="dropdown-item dropdown-toggle arrow-none" href="#" id="topnav-projects" role="button">
                          <span data-key="t-projects">Projects</span>
                          <div class="arrow-down"></div>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="topnav-projects">
                          <a href="projects-grid.html" class="dropdown-item" data-key="t-p-grid">Projects Grid</a>
                          <a href="projects-list.html" class="dropdown-item" data-key="t-p-list">Projects List</a>
                          <a href="projects-create.html" class="dropdown-item" data-key="t-create-new">Create New</a>
                        </div>
                      </div>

                      <div class="dropdown">
                        <a class="dropdown-item dropdown-toggle arrow-none" href="#" id="topnav-contact" role="button">
                          <span data-key="t-contacts">Contacts</span>
                          <div class="arrow-down"></div>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="topnav-contact">
                          <a href="contacts-grid.html" class="dropdown-item" data-key="t-user-grid">User Grid</a>
                          <a href="contacts-list.html" class="dropdown-item" data-key="t-user-list">User List</a>
                          <a href="contacts-profile.html" class="dropdown-item" data-key="t-user-profile">Profile</a>
                        </div>
                      </div>
                    </div>
                  </li>

                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle arrow-none" href="#" id="topnav-components" role="button">
                      <i class="icon nav-icon" data-eva="layers-outline"></i>
                      <span data-key="t-components">Components</span>
                      <div class="arrow-down"></div>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="topnav-components">
                      <div class="dropdown">
                        <a class="dropdown-item dropdown-toggle arrow-none" href="#" id="topnav-form" role="button">
                          <span data-key="t-forms">Forms</span>
                          <div class="arrow-down"></div>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="topnav-form">
                          <a href="form-elements.html" class="dropdown-item" data-key="t-form-elements">Form Elements</a>
                          <a href="form-layouts.html" class="dropdown-item" data-key="t-form-layouts">Form Layouts</a>
                          <a href="form-validation.html" class="dropdown-item" data-key="t-form-validation">Form Validation</a>
                          <a href="form-advanced.html" class="dropdown-item" data-key="t-form-advanced">Form Advanced</a>
                          <a href="form-editors.html" class="dropdown-item" data-key="t-form-editors">Form Editors</a>
                          <a href="form-uploads.html" class="dropdown-item" data-key="t-form-upload">Form File Upload</a>
                          <a href="form-wizard.html" class="dropdown-item" data-key="t-form-wizard">Form Wizard</a>
                          <a href="form-mask.html" class="dropdown-item" data-key="t-form-mask">Form Mask</a>
                        </div>
                      </div>
                      <div class="dropdown">
                        <a class="dropdown-item dropdown-toggle arrow-none" href="#" id="topnav-table" role="button">
                          <span data-key="t-tables">Tables</span>
                          <div class="arrow-down"></div>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="topnav-table">
                          <a href="tables-basic.html" class="dropdown-item" data-key="t-basic-tables">Basic Tables</a>
                          <a href="tables-advanced.html" class="dropdown-item" data-key="t-advanced-tables">Advance Tables</a>
                        </div>
                      </div>

                      <div class="dropdown">
                        <a class="dropdown-item dropdown-toggle arrow-none" href="#" id="topnav-charts" role="button">
                          <span data-key="t-charts">Charts</span>
                          <div class="arrow-down"></div>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="topnav-charts">
                          <div class="dropdown">
                            <a class="dropdown-item dropdown-toggle arrow-none" href="#" id="topnav-apex-charts" role="button">
                              <span data-key="t-apex-charts">Apex Charts</span>
                              <div class="arrow-down"></div>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="topnav-apex-charts">
                              <a href="charts-line.html" class="dropdown-item" data-key="t-line">Line</a>
                              <a href="charts-area.html" class="dropdown-item" data-key="t-area">Area</a>
                              <a href="charts-column.html" class="dropdown-item" data-key="t-column">Column</a>
                              <a href="charts-bar.html" class="dropdown-item" data-key="t-bar">Bar</a>
                              <a href="charts-mixed.html" class="dropdown-item" data-key="t-mixed">Mixed</a>
                              <a href="charts-timeline.html" class="dropdown-item" data-key="t-timeline">Timeline</a>
                              <a href="charts-candlestick.html" class="dropdown-item" data-key="t-candlestick">Candlestick</a>
                              <a href="charts-boxplot.html" class="dropdown-item" data-key="t-boxplot">Boxplot</a>
                              <a href="charts-bubble.html" class="dropdown-item" data-key="t-bubble">Bubble</a>
                              <a href="charts-scatter.html" class="dropdown-item" data-key="t-scatter">Scatter</a>
                              <a href="charts-heatmap.html" class="dropdown-item" data-key="t-heatmap">Heatmap</a>
                              <a href="charts-treemap.html" class="dropdown-item" data-key="t-treemap">Treemap</a>
                              <a href="charts-pie.html" class="dropdown-item" data-key="t-pie">Pie</a>
                              <a href="charts-radialbar.html" class="dropdown-item" data-key="t-radialbar">Radialbar</a>
                              <a href="charts-radar.html" class="dropdown-item" data-key="t-radar">Radar</a>
                              <a href="charts-polararea.html" class="dropdown-item" data-key="t-polararea">Polararea</a>
                            </div>
                          </div>
                          <a href="charts-echart.html" class="dropdown-item" data-key="t-e-charts">E Charts</a>
                          <a href="charts-chartjs.html" class="dropdown-item" data-key="t-chartjs-charts">Chartjs Charts</a>
                          <a href="charts-tui.html" class="dropdown-item" data-key="t-ui-charts">Toast UI Charts</a>
                        </div>
                      </div>

                      <div class="dropdown">
                        <a class="dropdown-item dropdown-toggle arrow-none" href="#" id="topnav-icons" role="button">
                          <span data-key="t-icons">Icons</span>
                          <div class="arrow-down"></div>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="topnav-icons">
                          <a href="icons-evaicons.html" class="dropdown-item" data-key="t-evaicons">Eva Icons</a>
                          <a href="icons-boxicons.html" class="dropdown-item" data-key="t-boxicons">Boxicons</a>
                          <a href="icons-materialdesign.html" class="dropdown-item" data-key="t-material-design">Material Design</a>
                          <a href="icons-fontawesome.html" class="dropdown-item" data-key="t-font-awesome">Font Awesome 5</a>
                        </div>
                      </div>
                      <div class="dropdown">
                        <a class="dropdown-item dropdown-toggle arrow-none" href="#" id="topnav-map" role="button">
                          <span data-key="t-maps">Maps</span>
                          <div class="arrow-down"></div>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="topnav-map">
                          <a href="maps-google.html" class="dropdown-item" data-key="t-google">Google</a>
                          <a href="maps-vector.html" class="dropdown-item" data-key="t-vector">Vector</a>
                          <a href="maps-leaflet.html" class="dropdown-item" data-key="t-leaflet">Leaflet</a>
                        </div>
                      </div>
                    </div>
                  </li>

                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle arrow-none" href="#" id="topnav-more" role="button">
                      <i class="icon nav-icon" data-eva="file-text-outline"></i>
                      <span data-key="t-pages">Pages</span>
                      <div class="arrow-down"></div>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="topnav-more">
                      <div class="dropdown">
                        <a class="dropdown-item dropdown-toggle arrow-none" href="#" id="topnav-authentication" role="button">
                          <span data-key="t-authentication">Authentication</span>
                          <div class="arrow-down"></div>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="topnav-authentication">
                          <a href="auth-login.html" class="dropdown-item" data-key="t-login">Login</a>
                          <a href="auth-register.html" class="dropdown-item" data-key="t-register">Register</a>
                          <a href="auth-recoverpw.html" class="dropdown-item" data-key="t-recover-password">Recover Password</a>
                          <a href="auth-lock-screen.html" class="dropdown-item" data-key="t-lock-screen">Lock Screen</a>
                          <a href="auth-logout.html" class="dropdown-item" data-key="t-logout">Logout</a>
                          <a href="auth-confirm-mail.html" class="dropdown-item" data-key="t-confirm-mail">Confirm Mail</a>
                          <a href="auth-email-verification.html" class="dropdown-item" data-key="t-email-verification">Email Verification</a>
                          <a href="auth-two-step-verification.html" class="dropdown-item" data-key="t-two-step-verification">Two Step Verification</a>
                        </div>
                      </div>

                      <div class="dropdown">
                        <a class="dropdown-item dropdown-toggle arrow-none" href="#" id="topnav-utility" role="button">
                          <span data-key="t-utility">Utility</span>
                          <div class="arrow-down"></div>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="topnav-utility">
                          <a href="pages-starter.html" class="dropdown-item" data-key="t-starter-page">Starter Page</a>
                          <a href="pages-maintenance.html" class="dropdown-item" data-key="t-maintenance">Maintenance</a>
                          <a href="pages-comingsoon.html" class="dropdown-item" data-key="t-coming-soon">Coming Soon</a>
                          <a href="pages-timeline.html" class="dropdown-item" data-key="t-timeline">Timeline</a>
                          <a href="pages-faqs.html" class="dropdown-item" data-key="t-faqs">FAQs</a>
                          <a href="pages-pricing.html" class="dropdown-item" data-key="t-pricing">Pricing</a>
                          <a href="pages-404.html" class="dropdown-item" data-key="t-error-404">Error 404</a>
                          <a href="pages-500.html" class="dropdown-item" data-key="t-error-500">Error 500</a>
                        </div>
                      </div>
                      <a href="layouts-horizontal.html" class="dropdown-item" data-key="t-horizontal">Horizontal</a>
                    </div>
                  </li>
                </ul>
              </div>
            </nav>
          </div>
        </div>
      </header>
      <!-- ============================================================== -->
      <div class="main-content">
        <!-- 환경설정 기타관리 시작 -->
        <div class="page-content">
          <div class="tap_text">
            <h2>환경설정</h2>
            <p>환경설정 > <span>기타관리</span></p>
          </div>
            <!--  -->
          </div>
          <!-- 내용물 -->
          <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" data-bs-toggle="tab" href="#home" role="tab" id="tagMgr">
                    <span class="d-block d-sm-none"><i class="fas fa-home"></i></span>
                    <span class="d-none d-sm-block">태그관리</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#profile" role="tab" id="exchnRateMgr">
                    <span class="d-block d-sm-none"><i class="far fa-user"></i></span>
                    <span class="d-none d-sm-block">환률정보관리</span>
                </a>
            </li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content p-3 text-muted" id="tab-content">
  

        </div>
          <!--  -->
<!--         <button>저장</button> -->

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
    <script src="assets/libs/swiper/swiper-bundle.min.js"></script>
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