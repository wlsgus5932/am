<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>환경설정-승인관리 | 국립항공박물관</title>
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
   
    function orgCodeChange() {
		
		var queryString = $("form[name=searchForm]").serialize();
		
		$.ajax({
			type : 'post',
			url : '/approvalPossessionAjax.do',
			data : queryString,
			dataType : 'html',
			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
			error: function(xhr, status, error){
				alert(error);
			},
			success : function(data){
				$('#possession_select').empty().append(data);
			}
		});
	}
    
    $(function() {
		
		// 첫 페이지
		$('#erasureMgr').attr('aria-selected', 'true').addClass('active');
		
		$.ajax({
			type : 'POST',                
			url : '/erasureListAjax.do',    
			dataType : "html",           
			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
			error : function() {          
				alert('통신실패!');
			},
			success : function(data) {  
				$('#tab-content').empty().append(data);
			}
		});
		
		// 삭제 신청 tab operation
		$('#erasureMgr').click(function() {
			$.ajax({
				type : 'POST',                
				url : '/erasureListAjax.do',    
				dataType : "html",           
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {          
					alert('통신실패!');
				},
				success : function(data) {  
					$('#tab-content').empty().append(data);
					$('#searchKeyword').val('erasure');
				}
			});
		});
		
		// 키워드 신청 tab operation
		$('#keywordMgr').click(function() {
			$.ajax({
				type : 'POST',                 
				url : '/keywordListAjax.do',   				
				dataType : "html",           
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {        
					alert('통신실패!');
				},
				success : function(data) {  
					$('#tab-content').empty().append(data);
					$('#searchKeyword').val('keyword');
				}
			});
		});
		
	});
	
	<%-- 조건 검색 --%>
	function searchList(){

		// 조건 검색			
		var queryString = $("form[name=searchForm]").serialize();
		if($('#searchKeyword').val() == 'erasure'){
			$.ajax({
				type : 'post',
				url : '/erasureListAjax.do',
				data : queryString,
				dataType : 'html',
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error: function(xhr, status, error){
					alert(error);
				},
				success : function(data){
					$('#tab-content').empty().append(data);
// 					$('#possession_select').empty()
//						$('#speciality_code_idx2').val(speciality_code_idx);
//						$('#search_word2').val(search_word);
//						$('#search_type2').val(search_type);
				}
			});
		}else{
			$.ajax({
				type : 'post',
				url : '/keywordListAjax.do',
				data : queryString,
				dataType : 'html',
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error: function(xhr, status, error){
					alert(error);
				},
				success : function(data){
					$('#tab-content').empty().append(data);
// 					$('#possession_select').empty()
//						$('#speciality_code_idx2').val(speciality_code_idx);
//						$('#search_word2').val(search_word);
//						$('#search_type2').val(search_type);
				}
			});
		}
	}
    </script>
  </head>
<body data-sidebar="dark">
<jsp:include page="../../common/inc/headerContent.jsp" />

      <!-- ============================================================== -->
      <div class="main-content">
        <!-- 신규자료 자동등록 시작 -->
        <div class="page-content">
          <div class="tap_text">
            <h2>신규자료 자동등록</h2>
            <p>환경설정 > <span>승인관리</span></p>
          </div>
          <!-- 자료 구분 셀렉트 -->
          <form id="searchForm" name="searchForm" method="post" class="form-horizontal">
          	  <input type="hidden" id="searchKeyword" name="keyword" value="erasure" />
	          <div class="fr_wrap">
	            <div class="mb-3 row fr_1">
	              <div class="col-md-10">
	                <label class="col-md-2 col-form-label">승인여부</label>
	                <select class="form-select" name="approval_state">
	                  <option value>전체</option>
	                  <option value="Y">승인</option>
	                  <option value="F">미승인</option>
	                  <option value="N">반려</option>
	                </select>
	                <label class="col-md-2 col-form-label">자료 구분</label>
	                  <select class="form-select" name="org_nm" onChange="orgCodeChange();">
                       	   <option value="">전체</option>
                           <c:forEach var="getOrgList" items="${getOrgList}">
                          		<option value="${getOrgList.org_nm}">${getOrgList.org_nm}</option>
                    	   </c:forEach>
                       </select>
                       <select class="form-select" name="possession_nm" id="possession_select">
                           	<c:forEach var="getPosSessionList" items="${getPosSessionList}">
                           		<option value="${getPosSessionList.possession_nm}">${getPosSessionList.possession_nm}</option>        
                           	</c:forEach>                     
                       </select>
	              </div>
	            </div>
	            <div class="mb-3 row fr_1">
	              <div class="col-md-10">
	                <label class="col-md-2 col-form-label">요청일자</label>
	                <input class="form-control" list="datalistOptions" id="exampleDataList" placeholder="" name="start_date">
	                ~
	                <input class="form-control" list="datalistOptions" id="exampleDataList" placeholder="" name="end_date">
	
	                  <label class="col-md-2 col-form-label">자료 번호</label>
	                  <!-- <div class="col-md-10"> -->
	                    <input class="form-control" list="datalistOptions" id="exampleDataList" placeholder="" name="start_item_no">
	                    ~
	                    <input class="form-control" list="datalistOptions" id="exampleDataList" placeholder="" name="end_item_no">
	                    <button class="btn btn-secondary waves-effect waves-light btn_ml" type="button" onClick="searchList();">조회</button>
	              </div>
	            </div>
	          </div>
          </form>
          <!-- 탭 -->
          <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#profile" role="tab" id="erasureMgr">
                    <span class="d-block d-sm-none"><i class="far fa-user"></i></span>
                    <span class="d-none d-sm-block">삭제 신청</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#messages" role="tab" id="keywordMgr">
                    <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span>
                    <span class="d-none d-sm-block">키워드 신청</span>
                </a>
            </li>
        </ul>
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