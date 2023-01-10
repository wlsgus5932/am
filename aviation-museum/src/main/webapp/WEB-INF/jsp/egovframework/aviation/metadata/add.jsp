<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Dashboard | Borex - Admin & Dashboard Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesbrand" name="author" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.ico" />

    <!-- Bootstrap Css -->
    <link href="<c:url value='/assets/css/bootstrap.min.css'/>" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="<c:url value='/assets/css/icons.min.css'/>" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="<c:url value='/assets/css/app.min.css'/>" id="app-style" rel="stylesheet" type="text/css" />
    <!-- 커스텀 css -->
    <link href="<c:url value='/assets/css/custom.css'/>" rel="stylesheet" type="text/css" />
    <!--  -->
    <link rel="stylesheet" href="<c:url value='/assets/libs/swiper/swiper-bundle.min.css'/>" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   
     <script type="text/javascript">
   	 
     /* $(document).ready(function() {
     }); */
     
     let count = 0;
     
     const submitForm = async () => {
    	let formData = new FormData(document.getElementById('add-form'));
    	
    	const form = await fetch('/metadata/add.do', {
    		method:'POST',
    		headers: {
                "Content-Type": "application/x-www-form-urlencoded",
            },
            body: new URLSearchParams(formData)
    	})
    	
    	const res = await form.text();
    	res == 'success' ? alert('등록완료') : alert('오류입니다');
     };
     
     const changeCountry = async(r, n) => {
    	 $('#era-select'+(n)).children('option:not(:first)').remove();
    	 const res = await fetch('/metadata/getEraData.do?country=' + r);
    	 
    	  if (res.status === 200) {
    	     const { eraList } = await res.json();
    	     eraList.forEach(e => {
    	    	 $('#era-select'+(n)).append("<option value="+e.era_code_idx+">"+e.era_nm+"</option>");	
    	     })
    	 }
     };
     
     const changeMaterial = async(r, n) => {
    	 $('#material2-select'+n).children('option:not(:first)').remove();
    	 const res = await fetch('/metadata/getMaterialData.do?material=' + r);
    	 
    	 if (res.status === 200) {
    	     const { material2List } = await res.json();
    	     material2List.forEach(e => {
    	    	 $('#material2-select'+n).append("<option value="+e.material2_code_idx+">"+e.material2_nm+"</option>");	
    	     })
    	 }
     };
     
     const addClassTd = (r, b) => {
    	 count = document.getElementById(r).querySelectorAll("th").length;
    	 let cell = '';
    	 switch (r) {
    	  case 'class-table':
    	  	 cell =  '<tr id="class-tr"><td><input type="checkbox" name="class-checkbox"></td>' +
			 '<th scope="row">'+(count+1)+'</th>' +
			 '<td><select class="form-select st_select" name="class1_code_idx"><option value="" selected>선택</option>' +
			 '<c:forEach var="list" items="${class1List}" varStatus="status"><option value="${list.class1_code_idx}">${list.class1_nm}</option></c:forEach></select></td>' +
			 '<td><select class="form-select st_select" name="class2_code_idx"><option value="" selected>선택</option>' +
			 '<c:forEach var="list" items="${class2List}" varStatus="status"><option value="${list.class2_code_idx}">${list.class2_nm}</option></c:forEach></select></td>' +
			 '<td><select class="form-select st_select" name="class3_code_idx"><option value="" selected>선택</option> ' +
			 '<c:forEach var="list" items="${class3List}" varStatus="status"><option value="${list.class3_code_idx}">${list.class3_nm}</option></c:forEach></select></td></tr>';
    	    break;
    	  case 'country-table':
    	    cell = '<tr><td><input type="checkbox" name="country-checkbox"></td>' +
    	    '<th scope="row">'+(count+1)+'</th>' +
            '<td><select class="form-select st_select" id="country-select" onchange="changeCountry(this.value, '+(count+1)+')" name="country_code_idx"><option value="" selected>선택</option>' +
            '<c:forEach var="list" items="${countryList}" varStatus="status"><option value="${list.country_code_idx}">${list.country_nm}</option></c:forEach></select></td>'+
            '<td><select class="form-select st_select" id="era-select'+(count+1)+'" name="era_code_idx"><option value="" selected>선택</option></select></td>' +
            '<td><input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="상세 시대를 입력해 주세요." name=detail_year></td></tr>';
    	    break;
    	    
    	  case 'material-table': 
    		  cell =  '<tr><td><input type="checkbox" name="material-checkbox"></td>' +
              '<th scope="row">'+(count+1)+'</th>' +
              '<td><select class="form-select st_select" onchange="changeMaterial(this.value, '+(count+1)+')" name="material1_code_idx"><option value="" selected>선택</option>' +
              '<c:forEach var="list" items="${material1List}" varStatus="status"><option value="${list.material1_code_idx}">${list.material1_nm}</option></c:forEach></select></td>' +
              '<td><select class="form-select st_select" id="material2-select'+(count+1)+'" name="material2_code_idx"><option value="" selected>선택</option></select></td>' +
              '<td><input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="상세 재질을 입력해 주세요." name="material_detail"></td></tr>';
              break;
              
    	  case 'measurement-table':
    		  cell = '<tr><td><input type="checkbox" name="measurement-checkbox"></td>' +
              '<th scope="row">'+(count+1)+'</th>' +
              '<td><input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="소장구분을 입력해 주세요." name="measurement_item_type"></td>' +
              '<td><select class="form-select st_select" name="measurement_code_idx"><option value="" selected>선택</option>' +
              '<c:forEach var="list" items="${measurementList}" varStatus="status"><option value="${list.measurement_code_idx}">${list.measurement_nm}</option></c:forEach></select></td>' +
              '<td><input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="실측치를 입력해 주세요." name="measurement_value"><td>' +
              '<select class="form-select st_select" name="measurement_unit_code_idx"><option value="" selected>선택</option>' +
              '<c:forEach var="list" items="${measurementUnitList}" varStatus="status"><option value="${list.measurement_unit_code_idx}">${list.measurement_unit_nm}</option></c:forEach>' +
              '</select></td></tr>';
    	  default:
    	    '';
    	}
    	 
    	 console.log(count);
    	 /* let cell =  '<tr id="class-tr"><td><input type="checkbox" name="class-checkbox" value="'+(count+1)+'"></td>' +
    	    			 '<th scope="row">'+(count+1)+'</th>' +
    	   				 '<td><select class="form-select st_select" name="class1_code_idx"><option value="" selected>선택</option>' +
            			 '<c:forEach var="list" items="${class1List}" varStatus="status"><option value="${list.class1_code_idx}">${list.class1_nm}</option></c:forEach></select></td>' +
    	    			 '<td><select class="form-select st_select" name="class2_code_idx"><option value="" selected>선택</option>' +
            			 '<c:forEach var="list" items="${class2List}" varStatus="status"><option value="${list.class2_code_idx}">${list.class2_nm}</option></c:forEach></select></td>' +
    	    			 '<td><select class="form-select st_select" name="class3_code_idx"><option value="" selected>선택</option> ' +
            			 '<c:forEach var="list" items="${class3List}" varStatus="status"><option value="${list.class3_code_idx}">${list.class3_nm}</option></c:forEach></select></td></tr>'; */
        $("#"+b).append(cell);
        count++;
     };
      
     const deleteClassTd = (e, v) => {
	    	const check = 'input[name='+v+']:checked';
	   		const selected = document.querySelectorAll(check);
	   		 
	        for(let i =0;i<selected.length;i++) {
	            selected[i].parentElement.parentElement.remove();
	        }
	    	count -= selected.length;
	    	sortNumber(e);
   };
   
   const sortNumber = e => {
	  let rows = document.getElementById(e).querySelectorAll("th");
	   for(let i = 1; i<=rows.length; i++) {
		   $(rows[i]).text((i+1));
	   }
   }
   
   const changeOrgCode = e => $("#invol_org_code_idx").val(e);
     
     
    </script>
    
  </head>

  <body data-sidebar="dark" onload="msg();">
    <!-- <body data-layout="horizontal"> -->

    <!-- Begin page -->
    <div id="layout-wrapper">
      <header id="page-topbar" class="isvertical-topbar">
        <div class="navbar-header">
          <div class="d-flex">
            <!-- LOGO -->
            <div class="navbar-brand-box">
              <a href="index.html" class="logo logo-dark">
                <span class="logo-sm">
                  <img src="<c:url value='assets/images/logo-dark-sm.png'/>" alt="" height="22" />
                </span>
                <span class="logo-lg">
                  <img src="assets/images/logo-dark-sm.png" alt="" height="22" />
                </span>
              </a>

              <a href="index.html" class="logo logo-light">
                <span class="logo-lg">
                  <img src="assets/images/logo-light.png" alt="" height="22" />
                </span>
                <span class="logo-sm">
                  <img src="assets/images/logo-light-sm.png" alt="" height="22" />
                </span>
              </a>
            </div>

            <button type="button" class="btn btn-sm px-3 font-size-16 header-item vertical-menu-btn topnav-hamburger">
              <span class="hamburger-icon open">
                <span></span>
                <span></span>
                <span></span>
              </span>
            </button>

            <div class="d-none d-sm-block ms-3 align-self-center">
              <!-- <h4 class="page-title">자료 신규등록</h4> -->
              <div class="dropdown">
                <button type="button" class="btn header-item" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="icon-sm" data-eva="search-outline"></i>
                </button>
                <div class="dropdown-menu dropdown-menu-end dropdown-menu-md p-0">
                  <form class="p-2">
                    <div class="search-box">
                      <div class="position-relative">
                        <input type="text" class="form-control bg-light border-0" placeholder="Search..." />
                        <i class="search-icon" data-eva="search-outline" data-eva-height="26" data-eva-width="26"></i>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>

          <div class="d-flex">
            <!-- <div class="dropdown">
              <button type="button" class="btn header-item" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="icon-sm" data-eva="search-outline"></i>
              </button>
              <div class="dropdown-menu dropdown-menu-end dropdown-menu-md p-0">
                <form class="p-2">
                  <div class="search-box">
                    <div class="position-relative">
                      <input type="text" class="form-control bg-light border-0" placeholder="Search..." />
                      <i class="search-icon" data-eva="search-outline" data-eva-height="26" data-eva-width="26"></i>
                    </div>
                  </div>
                </form>
              </div>
            </div> -->

            <div class="dropdown d-inline-block language-switch">
              <!-- <button type="button" class="btn header-item" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <img class="header-lang-img" src="assets/images/flags/us.jpg" alt="Header Language" height="16" />
              </button> -->
              <div class="dropdown-menu dropdown-menu-end">
                <!-- item-->
                <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="eng">
                  <img src="assets/images/flags/us.jpg" alt="user-image" class="me-1" height="12" /> <span class="align-middle">English</span>
                </a>

                <!-- item-->
                <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="sp">
                  <img src="assets/images/flags/spain.jpg" alt="user-image" class="me-1" height="12" /> <span class="align-middle">Spanish</span>
                </a>

                <!-- item-->
                <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="gr">
                  <img src="assets/images/flags/germany.jpg" alt="user-image" class="me-1" height="12" /> <span class="align-middle">German</span>
                </a>

                <!-- item-->
                <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="it">
                  <img src="assets/images/flags/italy.jpg" alt="user-image" class="me-1" height="12" /> <span class="align-middle">Italian</span>
                </a>

                <!-- item-->
                <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="ru">
                  <img src="assets/images/flags/russia.jpg" alt="user-image" class="me-1" height="12" /> <span class="align-middle">Russian</span>
                </a>
              </div>
            </div>

            <div class="dropdown d-none d-lg-inline-block">
              <!-- <button type="button" class="btn header-item noti-icon" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="icon-sm" data-eva="grid-outline"></i>
              </button> -->
              <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0">
                <div class="p-3">
                  <div class="row align-items-center">
                    <div class="col">
                      <h5 class="m-0 font-size-15">Web Apps</h5>
                    </div>
                    <div class="col-auto">
                      <a href="#!" class="small fw-semibold text-decoration-underline"> View All</a>
                    </div>
                  </div>
                </div>
                <div class="px-lg-2 pb-2">
                  <div class="row g-0">
                    <div class="col">
                      <a class="dropdown-icon-item" href="#!">
                        <img src="assets/images/brands/github.png" alt="Github" />
                        <span>GitHub</span>
                      </a>
                    </div>
                    <div class="col">
                      <a class="dropdown-icon-item" href="#!">
                        <img src="assets/images/brands/bitbucket.png" alt="bitbucket" />
                        <span>Bitbucket</span>
                      </a>
                    </div>
                    <div class="col">
                      <a class="dropdown-icon-item" href="#!">
                        <img src="assets/images/brands/dribbble.png" alt="dribbble" />
                        <span>Dribbble</span>
                      </a>
                    </div>
                  </div>

                  <div class="row g-0">
                    <div class="col">
                      <a class="dropdown-icon-item" href="#!">
                        <img src="assets/images/brands/dropbox.png" alt="dropbox" />
                        <span>Dropbox</span>
                      </a>
                    </div>
                    <div class="col">
                      <a class="dropdown-icon-item" href="#!">
                        <img src="assets/images/brands/mail_chimp.png" alt="mail_chimp" />
                        <span>Mail Chimp</span>
                      </a>
                    </div>
                    <div class="col">
                      <a class="dropdown-icon-item" href="#!">
                        <img src="assets/images/brands/slack.png" alt="slack" />
                        <span>Slack</span>
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>


            <div class="dropdown d-inline-block">
              <!-- <button
                type="button"
                class="btn header-item noti-icon"
                id="page-header-notifications-dropdown-v"
                data-bs-toggle="dropdown"
                aria-haspopup="true"
                aria-expanded="false"
              >
                <i class="icon-sm" data-eva="bell-outline"></i>
                <span class="noti-dot bg-danger rounded-pill">4</span>
              </button> -->
              <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0" aria-labelledby="page-header-notifications-dropdown-v">
                <div class="p-3">
                  <div class="row align-items-center">
                    <div class="col">
                      <h5 class="m-0 font-size-15">Notifications</h5>
                    </div>
                    <div class="col-auto">
                      <a href="#!" class="small fw-semibold text-decoration-underline"> Mark all as read</a>
                    </div>
                  </div>
                </div>
                <div data-simplebar style="max-height: 250px">
                  <a href="#!" class="text-reset notification-item">
                    <div class="d-flex">
                      <div class="flex-shrink-0 me-3">
                        <img src="assets/images/users/avatar-3.jpg" class="rounded-circle avatar-sm" alt="user-pic" />
                      </div>
                      <div class="flex-grow-1">
                        <h6 class="mb-1">James Lemire</h6>
                        <div class="font-size-13 text-muted">
                          <p class="mb-1">It will seem like simplified English.</p>
                          <p class="mb-0"><i class="mdi mdi-clock-outline"></i> <span>1 hour ago</span></p>
                        </div>
                      </div>
                    </div>
                  </a>
                  <a href="#!" class="text-reset notification-item">
                    <div class="d-flex">
                      <div class="flex-shrink-0 avatar-sm me-3">
                        <span class="avatar-title bg-primary rounded-circle font-size-16">
                          <i class="bx bx-cart"></i>
                        </span>
                      </div>
                      <div class="flex-grow-1">
                        <h6 class="mb-1">Your order is placed</h6>
                        <div class="font-size-13 text-muted">
                          <p class="mb-1">If several languages coalesce the grammar</p>
                          <p class="mb-0"><i class="mdi mdi-clock-outline"></i> <span>3 min ago</span></p>
                        </div>
                      </div>
                    </div>
                  </a>
                  <a href="#!" class="text-reset notification-item">
                    <div class="d-flex">
                      <div class="flex-shrink-0 avatar-sm me-3">
                        <span class="avatar-title bg-success rounded-circle font-size-16">
                          <i class="bx bx-badge-check"></i>
                        </span>
                      </div>
                      <div class="flex-grow-1">
                        <h6 class="mb-1">Your item is shipped</h6>
                        <div class="font-size-13 text-muted">
                          <p class="mb-1">If several languages coalesce the grammar</p>
                          <p class="mb-0"><i class="mdi mdi-clock-outline"></i> <span>3 min ago</span></p>
                        </div>
                      </div>
                    </div>
                  </a>

                  <a href="#!" class="text-reset notification-item">
                    <div class="d-flex">
                      <div class="flex-shrink-0 me-3">
                        <img src="assets/images/users/avatar-6.jpg" class="rounded-circle avatar-sm" alt="user-pic" />
                      </div>
                      <div class="flex-grow-1">
                        <h6 class="mb-1">Salena Layfield</h6>
                        <div class="font-size-13 text-muted">
                          <p class="mb-1">As a skeptical Cambridge friend of mine occidental.</p>
                          <p class="mb-0"><i class="mdi mdi-clock-outline"></i> <span>1 hour ago</span></p>
                        </div>
                      </div>
                    </div>
                  </a>
                </div>
                <div class="p-2 border-top d-grid">
                  <a class="btn btn-sm btn-link font-size-14 btn-block text-center" href="javascript:void(0)">
                    <i class="uil-arrow-circle-right me-1"></i> <span>View More..</span>
                  </a>
                </div>
              </div>
            </div>

            <div class="dropdown d-inline-block">
              <button type="button" class="btn header-item noti-icon right-bar-toggle" id="right-bar-toggle-v">
                <i class="icon-sm" data-eva="settings-outline"></i>
              </button>
            </div>

            <div class="dropdown d-inline-block">
              <!-- <button
                type="button"
                class="btn header-item user text-start d-flex align-items-center"
                id="page-header-user-dropdown-v"
                data-bs-toggle="dropdown"
                aria-haspopup="true"
                aria-expanded="false"
              >
                <img class="rounded-circle header-profile-user" src="assets/images/users/avatar-1.jpg" alt="Header Avatar" />
              </button> -->
              <div class="dropdown-menu dropdown-menu-end pt-0">
                <div class="p-3 border-bottom">
                  <h6 class="mb-0">Jennifer Bennett</h6>
                  <p class="mb-0 font-size-11 text-muted">jennifer.bennett@email.com</p>
                </div>
                <a class="dropdown-item" href="contacts-profile.html"
                  ><i class="mdi mdi-account-circle text-muted font-size-16 align-middle me-1"></i> <span class="align-middle">Profile</span></a
                >
                <a class="dropdown-item" href="apps-chat.html"
                  ><i class="mdi mdi-message-text-outline text-muted font-size-16 align-middle me-1"></i> <span class="align-middle">Messages</span></a
                >
                <a class="dropdown-item" href="pages-faqs.html"
                  ><i class="mdi mdi-lifebuoy text-muted font-size-16 align-middle me-1"></i> <span class="align-middle">Help</span></a
                >
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#"
                  ><i class="mdi mdi-wallet text-muted font-size-16 align-middle me-1"></i> <span class="align-middle">Balance : <b>$6951.02</b></span></a>
                <a class="dropdown-item d-flex align-items-center" href="#"
                  ><i class="mdi mdi-cog-outline text-muted font-size-16 align-middle me-1"></i> <span class="align-middle">Settings</span
                  ><span class="badge badge-soft-success ms-auto">New</span></a
                >
                <a class="dropdown-item" href="auth-lock-screen.html"
                  ><i class="mdi mdi-lock text-muted font-size-16 align-middle me-1"></i> <span class="align-middle">Lock screen</span></a
                >
                <a class="dropdown-item" href="auth-logout.html"
                  ><i class="mdi mdi-logout text-muted font-size-16 align-middle me-1"></i> <span class="align-middle">Logout</span></a
                >
              </div>
            </div>
          </div>
        </div>
      </header>
      <!-- ========== Left Sidebar Start ========== -->
      <div class="main_left_menu vertical-menu">
        <!-- LOGO -->
        <div class="navbar-brand-box">
          <a href="index.html" class="logo logo-dark">
            <span class="logo-sm">
              <img src="assets/custom_img/intro-logo.png" alt="" height="22" />
            </span>
            <span class="logo-lg">
              <img src="assets/custom_img/intro-logo.png" alt="" height="22" />
            </span>
          </a>

          <a href="index.html" class="logo logo-light">
            <span class="logo-lg">
              <img src="assets/custom_img/intro-logo.png" alt="" height="22" />
            </span>
            <span class="logo-sm">
              <img src="assets/images/logo-light-sm.png" alt="" height="22" />
            </span>
          </a>
        </div>

        <!-- <button type="button" class="btn btn-sm px-3 header-item vertical-menu-btn topnav-hamburger">
          <span class="hamburger-icon">
            <span></span>
            <span></span>
            <span></span>
          </span>
        </button> -->

        <div data-simplebar class="sidebar-menu-scroll">
          <!--- Sidemenu -->
          <div class="left_menu" id="sidebar-menu">
            <!-- Left Menu Start -->
            <ul class="metismenu list-unstyled" id="side-menu">
              <li class="dash_text menu-title" data-key="t-menu">Dashboard</li>

              <li>
                <a href="javascript: void(0);">
                  <span class="menu-item" data-key="t-dashboards">자료 검색</span>
                  <span class="badge rounded-pill bg-primary"></span>
                </a>
                <ul class="sub-menu" aria-expanded="false">
                  <li><a href="index.html" data-key="t-ecommerce">자료 정보조회</a></li>
                  <li><a href="dashboard-saas.html" data-key="t-saas">자료 검색</a></li>
                  <li><a href="dashboard-crypto.html" data-key="t-crypto">My페이지</a></li>
                </ul>
              </li>

              <li>
                <a href="javascript: void(0);" class="has-arrow">
                  <span class="menu-item" data-key="t-ecommerce">자료 통계</span>
                </a>
                <ul class="sub-menu" aria-expanded="false">
                  <li><a href="ecommerce-products.html" data-key="t-products">통계</a></li>
                  <li><a href="ecommerce-product-detail.html" data-key="t-product-detail">이미지 통계</a></li>
                  <li><a href="ecommerce-orders.html" data-key="t-orders">사용자 지정양식</a></li>
                  <li><a href="ecommerce-customers.html" data-key="t-customers">고정양식</a></li>
                </ul>
              </li>

              <li>
                <a href="javascript: void(0);" class="has-arrow">
                  <span class="menu-item" data-key="t-ecommerce">자료 관리</span>
                </a>
                <ul class="sub-menu" aria-expanded="false">
                  <li><a href="ecommerce-products.html" data-key="t-products">자료 정보수정</a></li>
                  <li><a href="ecommerce-product-detail.html" data-key="t-product-detail">이미지 수정</a></li>
                  <li><a href="ecommerce-orders.html" data-key="t-orders">등록자료 자동등록</a></li>
                </ul>
              </li>

              <li>
                <a href="javascript: void(0);" class="has-arrow">
                  <span class="menu-item" data-key="t-ecommerce">자료 공개</span>
                </a>
                <ul class="sub-menu" aria-expanded="false">
                  <li><a href="ecommerce-products.html" data-key="t-products">공개자료 정보조회</a></li>
                  <li><a href="ecommerce-product-detail.html" data-key="t-product-detail">공개자료 자동등록</a></li>
                  <li><a href="ecommerce-orders.html" data-key="t-orders">자료 공개설정</a></li>
                </ul>
              </li>

              <li>
                <a href="javascript: void(0);" class="has-arrow">
                  <span class="menu-item" data-key="t-ecommerce">자료 등록</span>
                </a>
                <ul class="sub-menu" aria-expanded="false">
                  <li><a href="ecommerce-products.html" data-key="t-products">자료 신규등록</a></li>
                  <li><a href="ecommerce-product-detail.html" data-key="t-product-detail">이미지 신규등록</a></li>
                  <li><a href="ecommerce-orders.html" data-key="t-orders">가등록품 정보조회</a></li>
                  <li><a href="ecommerce-customers.html" data-key="t-customers">가등록품 정보검색</a></li>
                  <li><a href="ecommerce-cart.html" data-key="t-cart">가등록품 통계</a></li>
                  <li><a href="ecommerce-checkout.html" data-key="t-checkout">가등록품 고정양식</a></li>
                  <li><a href="ecommerce-shops.html" data-key="t-shops">자료관리 전환(가등록→등록)</a></li>
                  <li><a href="ecommerce-add-product.html" data-key="t-add-product">자료 자동등록</a></li>
                </ul>
              </li>

              <li>
                <a href="javascript: void(0);" class="has-arrow">
                  <span class="menu-item" data-key="t-ecommerce">사용자 관리</span>
                </a>
                <ul class="sub-menu" aria-expanded="false">
                  <li><a href="ecommerce-products.html" data-key="t-products">사용자 등록</a></li>
                  <li><a href="ecommerce-product-detail.html" data-key="t-product-detail">사용자 권한관리</a></li>
                </ul>
              </li>

              <li>
                <a href="javascript: void(0);" class="has-arrow">
                  <span class="menu-item" data-key="t-ecommerce">환경설정</span>
                </a>
                <ul class="sub-menu" aria-expanded="false">
                  <li><a href="ecommerce-products.html" data-key="t-products">화면설정</a></li>
                  <li><a href="ecommerce-product-detail.html" data-key="t-product-detail">코드관리</a></li>
                  <li><a href="ecommerce-orders.html" data-key="t-orders">로그관리</a></li>
                  <li><a href="ecommerce-customers.html" data-key="t-customers">사전관리</a></li>
                  <li><a href="ecommerce-cart.html" data-key="t-cart">승인관리</a></li>
                </ul>
              </li>

              <li>
                <a href="javascript: void(0);" class="has-arrow">
                  <span class="menu-item" data-key="t-ecommerce">고객센터</span>
                </a>
                <ul class="sub-menu" aria-expanded="false">
                  <li><a href="ecommerce-products.html" data-key="t-products">공지사항</a></li>
                  <li><a href="ecommerce-orders.html" data-key="t-orders">FAQ</a></li>
                  <li><a href="ecommerce-customers.html" data-key="t-customers">오류신고센터</a></li>
                  <li><a href="ecommerce-cart.html" data-key="t-cart">개선사항</a></li>
                </ul>
              </li>
              <!-- 메뉴 끝 -->
            </ul>
          </div>
          <!-- Sidebar -->

          <!-- <div class="p-3 px-4 sidebar-footer">
            <p class="mb-1 main-title">
              <script>
                document.write(new Date().getFullYear())
              </script>
              &copy; Borex.
            </p>
            <p class="mb-0">Design & Develop by Themesbrand</p>
          </div> -->
        </div>
      </div>
      <!-- Left Sidebar End -->
      <header class="ishorizontal-topbar">
        <div class="navbar-header">
          <div class="d-flex">
            <!-- LOGO -->
            <div class="navbar-brand-box">
              <a href="index.html" class="logo logo-dark">
                <span class="logo-sm">
                  <img src="assets/images/logo-dark-sm.png" alt="" height="22" />
                </span>
                <span class="logo-lg">
                  <img src="assets/images/logo-dark.png" alt="" height="22" />
                </span>
              </a>

              <a href="index.html" class="logo logo-light">
                <span class="logo-sm">
                  <img src="assets/images/logo-light-sm.png" alt="" height="22" />
                </span>
                <span class="logo-lg">
                  <img src="assets/images/logo-light.png" alt="" height="22" />
                </span>
              </a>
            </div>

            <button type="button" class="btn btn-sm px-3 font-size-16 d-lg-none header-item" data-bs-toggle="collapse" data-bs-target="#topnav-menu-content">
              <i class="fa fa-fw fa-bars"></i>
            </button>

            <div class="d-none d-sm-block ms-2 align-self-center">
              <h4 class="page-title">Dashboard</h4>
            </div>
          </div>

          <div class="d-flex">
            <div class="dropdown">
              <button type="button" class="btn header-item" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="icon-sm" data-eva="search-outline"></i>
              </button>
              <div class="dropdown-menu dropdown-menu-end dropdown-menu-md p-0">
                <form class="p-2">
                  <div class="search-box">
                    <div class="position-relative">
                      <input type="text" class="form-control bg-light border-0" placeholder="Search..." />
                      <i class="search-icon" data-eva="search-outline" data-eva-height="26" data-eva-width="26"></i>
                    </div>
                  </div>
                </form>
              </div>
            </div>
              <div class="dropdown-menu dropdown-menu-end">
                <!-- item-->
                <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="eng">
                  <img src="assets/images/flags/us.jpg" alt="user-image" class="me-1" height="12" /> <span class="align-middle">English</span>
                </a>

                <!-- item-->
                <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="sp">
                  <img src="assets/images/flags/spain.jpg" alt="user-image" class="me-1" height="12" /> <span class="align-middle">Spanish</span>
                </a>

                <!-- item-->
                <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="gr">
                  <img src="assets/images/flags/germany.jpg" alt="user-image" class="me-1" height="12" /> <span class="align-middle">German</span>
                </a>

                <!-- item-->
                <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="it">
                  <img src="assets/images/flags/italy.jpg" alt="user-image" class="me-1" height="12" /> <span class="align-middle">Italian</span>
                </a>

                <!-- item-->
                <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="ru">
                  <img src="assets/images/flags/russia.jpg" alt="user-image" class="me-1" height="12" /> <span class="align-middle">Russian</span>
                </a>
              </div>
            </div>

            <div class="dropdown d-none d-lg-inline-block">
              <button type="button" class="btn header-item noti-icon" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="icon-sm" data-eva="grid-outline"></i>
              </button>
              <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0">
                <div class="p-3">
                  <div class="row align-items-center">
                    <div class="col">
                      <h5 class="m-0 font-size-15">Web Apps</h5>
                    </div>
                    <div class="col-auto">
                      <a href="#!" class="small fw-semibold text-decoration-underline"> View All</a>
                    </div>
                  </div>
                </div>
                <div class="px-lg-2 pb-2">
                  <div class="row g-0">
                    <div class="col">
                      <a class="dropdown-icon-item" href="#!">
                        <img src="assets/images/brands/github.png" alt="Github" />
                        <span>GitHub</span>
                      </a>
                    </div>
                    <div class="col">
                      <a class="dropdown-icon-item" href="#!">
                        <img src="assets/images/brands/bitbucket.png" alt="bitbucket" />
                        <span>Bitbucket</span>
                      </a>
                    </div>
                    <div class="col">
                      <a class="dropdown-icon-item" href="#!">
                        <img src="assets/images/brands/dribbble.png" alt="dribbble" />
                        <span>Dribbble</span>
                      </a>
                    </div>
                  </div>

                  <div class="row g-0">
                    <div class="col">
                      <a class="dropdown-icon-item" href="#!">
                        <img src="assets/images/brands/dropbox.png" alt="dropbox" />
                        <span>Dropbox</span>
                      </a>
                    </div>
                    <div class="col">
                      <a class="dropdown-icon-item" href="#!">
                        <img src="assets/images/brands/mail_chimp.png" alt="mail_chimp" />
                        <span>Mail Chimp</span>
                      </a>
                    </div>
                    <div class="col">
                      <a class="dropdown-icon-item" href="#!">
                        <img src="assets/images/brands/slack.png" alt="slack" />
                        <span>Slack</span>
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="dropdown d-inline-block">
              <button
                type="button"
                class="btn header-item noti-icon"
                id="page-header-notifications-dropdown"
                data-bs-toggle="dropdown"
                aria-haspopup="true"
                aria-expanded="false"
              >
                <i class="icon-sm" data-eva="bell-outline"></i>
                <span class="noti-dot bg-danger rounded-pill">4</span>
              </button>
              <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0" aria-labelledby="page-header-notifications-dropdown">
                <div class="p-3">
                  <div class="row align-items-center">
                    <div class="col">
                      <h5 class="m-0 font-size-15">Notifications</h5>
                    </div>
                    <div class="col-auto">
                      <a href="#!" class="small fw-semibold text-decoration-underline"> Mark all as read</a>
                    </div>
                  </div>
                </div>
                <div data-simplebar style="max-height: 250px">
                  <a href="#!" class="text-reset notification-item">
                    <div class="d-flex">
                      <div class="flex-shrink-0 me-3">
                        <img src="assets/images/users/avatar-3.jpg" class="rounded-circle avatar-sm" alt="user-pic" />
                      </div>
                      <div class="flex-grow-1">
                        <h6 class="mb-1">James Lemire</h6>
                        <div class="font-size-13 text-muted">
                          <p class="mb-1">It will seem like simplified English.</p>
                          <p class="mb-0"><i class="mdi mdi-clock-outline"></i> <span>1 hours ago</span></p>
                        </div>
                      </div>
                    </div>
                  </a>
                  <a href="#!" class="text-reset notification-item">
                    <div class="d-flex">
                      <div class="flex-shrink-0 avatar-sm me-3">
                        <span class="avatar-title bg-primary rounded-circle font-size-16">
                          <i class="bx bx-cart"></i>
                        </span>
                      </div>
                      <div class="flex-grow-1">
                        <h6 class="mb-1">Your order is placed</h6>
                        <div class="font-size-13 text-muted">
                          <p class="mb-1">If several languages coalesce the grammar</p>
                          <p class="mb-0"><i class="mdi mdi-clock-outline"></i> <span>3 min ago</span></p>
                        </div>
                      </div>
                    </div>
                  </a>
                  <a href="#!" class="text-reset notification-item">
                    <div class="d-flex">
                      <div class="flex-shrink-0 avatar-sm me-3">
                        <span class="avatar-title bg-success rounded-circle font-size-16">
                          <i class="bx bx-badge-check"></i>
                        </span>
                      </div>
                      <div class="flex-grow-1">
                        <h6 class="mb-1">Your item is shipped</h6>
                        <div class="font-size-13 text-muted">
                          <p class="mb-1">If several languages coalesce the grammar</p>
                          <p class="mb-0"><i class="mdi mdi-clock-outline"></i> <span>3 min ago</span></p>
                        </div>
                      </div>
                    </div>
                  </a>

                  <a href="#!" class="text-reset notification-item">
                    <div class="d-flex">
                      <div class="flex-shrink-0 me-3">
                        <img src="assets/images/users/avatar-6.jpg" class="rounded-circle avatar-sm" alt="user-pic" />
                      </div>
                      <div class="flex-grow-1">
                        <h6 class="mb-1">Salena Layfield</h6>
                        <div class="font-size-13 text-muted">
                          <p class="mb-1">As a skeptical Cambridge friend of mine occidental.</p>
                          <p class="mb-0"><i class="mdi mdi-clock-outline"></i> <span>1 hours ago</span></p>
                        </div>
                      </div>
                    </div>
                  </a>
                </div>
                <div class="p-2 border-top d-grid">
                  <a class="btn btn-sm btn-link font-size-14 btn-block text-center" href="javascript:void(0)">
                    <i class="uil-arrow-circle-right me-1"></i> <span>View More..</span>
                  </a>
                </div>
              </div>
            </div>

            <div class="dropdown d-inline-block">
              <button type="button" class="btn header-item noti-icon right-bar-toggle" id="right-bar-toggle">
                <i class="icon-sm" data-eva="settings-outline"></i>
              </button>
            </div>

            <div class="dropdown d-inline-block">
              <button
                type="button"
                class="btn header-item user text-start d-flex align-items-center"
                id="page-header-user-dropdown"
                data-bs-toggle="dropdown"
                aria-haspopup="true"
                aria-expanded="false"
              >
                <img class="rounded-circle header-profile-user" src="assets/images/users/avatar-1.jpg" alt="Header Avatar" />
              </button>
              <div class="dropdown-menu dropdown-menu-end pt-0">
                <div class="p-3 border-bottom">
                  <h6 class="mb-0">Jennifer Bennett</h6>
                  <p class="mb-0 font-size-11 text-muted">jennifer.bennett@email.com</p>
                </div>
                <a class="dropdown-item" href="contacts-profile.html"
                  ><i class="mdi mdi-account-circle text-muted font-size-16 align-middle me-1"></i> <span class="align-middle">Profile</span></a
                >
                <a class="dropdown-item" href="apps-chat.html"
                  ><i class="mdi mdi-message-text-outline text-muted font-size-16 align-middle me-1"></i> <span class="align-middle">Messages</span></a
                >
                <a class="dropdown-item" href="pages-faqs.html"
                  ><i class="mdi mdi-lifebuoy text-muted font-size-16 align-middle me-1"></i> <span class="align-middle">Help</span></a
                >
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#"
                  ><i class="mdi mdi-wallet text-muted font-size-16 align-middle me-1"></i> <span class="align-middle">Balance : <b>$6951.02</b></span></a
                >
                <a class="dropdown-item d-flex align-items-center" href="#"
                  ><i class="mdi mdi-cog-outline text-muted font-size-16 align-middle me-1"></i> <span class="align-middle">Settings</span
                  ><span class="badge badge-soft-success ms-auto">New</span></a
                >
                <a class="dropdown-item" href="auth-lock-screen.html"
                  ><i class="mdi mdi-lock text-muted font-size-16 align-middle me-1"></i> <span class="align-middle">Lock screen</span></a
                >
                <a class="dropdown-item" href="auth-logout.html"
                  ><i class="mdi mdi-logout text-muted font-size-16 align-middle me-1"></i> <span class="align-middle">Logout</span></a
                >
              </div>
            </div>
          </div>
        </div>
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
      <!-- Start right Content here -->
      <!-- ============================================================== -->
      <div class="main-content">
        <!-- 자료등록 시작 -->
        <div class="page-content">
        <div class="tap_text">
            <h2>자료 신규등록</h2>
            <p>자료 등록 > 자료 신규등록 > <span>기본 사항</span></p>
          </div>
          <!-- 자료구분 셀렉트 -->
          <form id="add-form">
          <div class="fr_wrap">
            <div class="mb-3 row fr_1">
            
              <div class="col-md-10">
              <label class="col-md-2 col-form-label">자료 구분</label>
                  <select class="form-select" name="possession_code_idx">
                      <option value="" selected>선택</option>
                      		<c:forEach var="list" items="${posSessionList}" varStatus="status">
		                           <option value="${list.possession_code_idx}">${list.possession_nm}</option>
		                     </c:forEach>
                  </select>
                <select class="form-select" name="org_code_idx" onchange="changeOrgCode(this.value)">
                    <option value="" selected>선택</option>
                    		<c:forEach var="list" items="${orgList}" varStatus="status">
		                           <option value="${list.org_code_idx}">${list.org_nm}</option>
		                     </c:forEach>
                </select>
                
                <label class="col-md-2 col-form-label">자료 번호</label>
                  <!-- <div class="col-md-10"> -->
                    <input class="form-control" list="datalistOptions" id="exampleDataList" placeholder="자료 번호">
                    <input class="form-control" list="datalistOptions" id="exampleDataList" placeholder="세부">
                    <button class="btn btn-secondary waves-effect waves-light btn_ml">조회</button>
                    <!--  -->
                    
                    <button class="btn btn-secondary waves-effect waves-light btn_ml">인쇄</button>
                    <select class="form-select fls kor_sl">
                      <option disabled selected>한글</option>
                      <option>더미1</option>
                      <option>더미2</option>
                      <option>더미3</option>
                  </select>
                   <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#"><<</a></li>
                    <li class="page-item"><a class="page-link" href="#"><</a></li>
                    <li class="page-item"><a class="page-link" href="#">상세</a></li>
                    <li class="page-item"><a class="page-link" href="#">></a></li>
                    <li class="page-item"><a class="page-link" href="#">>></a></li>
                </ul>
            </div>
          </div>
          <!--  -->
          <!-- 퀵메뉴 -->

          <div class="accordion" id="accordionExample">
          
            <div class="accordion-item">
              <h2 class="accordion-header" id="headingOne">
                <button
                  class="accordion-button fw-medium"
                  type="button"
                  data-bs-toggle="collapse"
                  data-bs-target="#collapseOne"
                  aria-expanded="true"
                  aria-controls="collapseOne"
                >
                  퀵메뉴
                </button>
              </h2>
              <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                  <div class="text-muted">
                    <strong class="text-dark">
                      <ul>
                        <li><a href="#">저장</a></li>
                        <li><a href="#">자료 등록하기</a></li>
                        <li><a href="#">자료 정보 가져오기</a></li>
                        <li><a href="#">자료 정보 일괄 변경</a></li>
                        <li><a href="#">자료 정보 삭제 신청</a></li>
                        <li><a href="#">자료 번호 삽입</a></li>
                      </ul>
                  </div>
                </div>
              </div>
            </div>
            <div class="accordion-item">
              <h2 class="accordion-header" id="headingTwo">
                <button
                  class="accordion-button fw-medium collapsed"
                  type="button"
                  data-bs-toggle="collapse"
                  data-bs-target="#collapseTwo"
                  aria-expanded="false"
                  aria-controls="collapseTwo"
                >
                  고정메뉴
                </button>
              </h2>
              <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                  <div class="text-muted">
                    <strong class="text-dark">
                      <ul>
                        <li><a href="#">연표</a></li>
                        <li><a href="#">연호</a></li>
                        <li><a href="#">용어</a></li>
                        <li><a href="#">분류체계</a></li>
                      </ul>
                  </div>
                </div>
              </div>
            </div>
            <div class="accordion-item">
              <h2 class="accordion-header" id="headingThree">
                <button
                  class="accordion-button fw-medium collapsed"
                  type="button"
                  data-bs-toggle="collapse"
                  data-bs-target="#collapseThree"
                  aria-expanded="false"
                  aria-controls="collapseThree"
                >
                  등록메뉴얼
                </button>
              </h2>
              <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                </div>
              </div>
            </div>
          </div>
          <!--  -->
          </div>
          <!-- 내용물 -->
          <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" data-bs-toggle="tab" href="#home" role="tab">
                    <span class="d-block d-sm-none"><i class="fas fa-home"></i></span>
                    <span class="d-none d-sm-block">기본 사항</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#profile" role="tab">
                    <span class="d-block d-sm-none"><i class="far fa-user"></i></span>
                    <span class="d-none d-sm-block">이동 사항(0)</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#messages" role="tab">
                    <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span>
                    <span class="d-none d-sm-block">이미지(0)</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#settings" role="tab">
                    <span class="d-block d-sm-none"><i class="fas fa-cog"></i></span>
                    <span class="d-none d-sm-block">보존처리(0)</span>
                </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-bs-toggle="tab" href="#settings22" role="tab">
                  <span class="d-block d-sm-none"><i class="fas fa-cog"></i></span>
                  <span class="d-none d-sm-block">전문정보(0)</span>
              </a>
          </li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content p-3 text-muted">
          <!-- 기본 사항 시작 -->
          <!--  -->
          <!-- 기본 사항 - 분류체계 시작 -->
            <div class="tab-pane active" id="home" role="tabpanel">
              <div class="mb-0">
                <div class="st_wrap">
                </div>
                <div class="card-body cd_df">
                  <div class="tr_left">
                  <!-- 이미지 슬라이드 -->
                      <div class="card-body">
                        <div class="slider_count_wrap">
                          1/10
                        </div>
                          <div class="card-title-desc">
                            <button>원본보기</button><button>다운로드</button>
                          </div>
                          <!--  -->
                          <div class="img-slider">
                            <div><img src="" alt="이미지1"></div>
                            <div><img src="" alt="이미지2"></div>
                            <div><img src="" alt="이미지3"></div>
                          </div>
                      </div>
                  </div>
                  <div class="table-responsive tr_right">
                      <table class="table mb-0">
                          <tbody>
                              <tr>
                                <td>
                                  명칭
                                </td>
                                  <td>
                                    <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="자료의 명칭을 입력해 주세요." name="item_nm">
                                  </td>
                                  <td>
                                    이명칭
                                  <td>
                                    <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="자료의 명칭을 입력해 주세요." name="item_se_nm">
                                  </td>
                              </tr>
                              <!-- 2  -->
                              <tr>
                                <td>
                                  영문 명칭
                                </td>
                                  <td>
                                    <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="자료의 영문 명칭을 입력해 주세요." name="item_eng_nm">
                                  </td>
                                  <td>
                                    작가
                                  <td>
                                    <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="작가의 이름을 입력해 주세요." name="author">
                                  </td>
                              </tr>
                              <!-- 3 -->
                              <tr>
                                <td>
                                  수량
                                </td>
                                  <td>
                                    <input class="form-control st_input pri" list="datalistOptions" id="exampleDataList" placeholder="수량을 입력해 주세요." name="qty">
                                    <select class="form-select st_select pri" name="qty_unit_code_idx">
                                      <option value="" selected>단위선택</option>
                                      	<c:forEach var="list" items="${qtyUnitList}" varStatus="status">
		                                    <option value="${list.qty_unit_code_idx}">${list.qty_unit_nm}</option>
		                                </c:forEach>
                                    </select>	
                                  </td>
                                  <td>
                                     ICAO
                                  </td>
                                  <td>
                                    <select class="form-select st_select" name="icao_code_idx">
                                      <option selected value="">선택안함</option>
                                      <c:forEach var="list" items="${IcaoList}" varStatus="status">
		                                    <option value="${list.icao_code_idx}">${list.icao_nm}</option>
		                                </c:forEach>
                                    </select>
                                  </td>
                              </tr>
                              <!-- 4 -->
                              <tr>
                                <td>
                                  현존여부
                                </td>
                                  <td>
                                    <select class="form-select st_select" name="existence_code_idx">
                                      <option selected value="">선택</option>
                                      <c:forEach var="list" items="${existenceList}" varStatus="status">
		                                    <option value="${list.existence_code_idx}">${list.existence_nm}</option>
		                               </c:forEach>
                                    </select>
                                  </td>
                                  <td>
                                    관리번호
                                  </td>
                                  <td>
                                    <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="관리번호를 입력해 주세요." name="management_no">
                                  </td>
                              </tr>
                              <!-- 5 -->
                              <tr>
                                <td>
                                  보존처리필요
                                </td>
                                  <td>
                                    <select class="form-select st_select" name="preservation_need">
                                      <option selected value="N">불필요</option>
                                      <option value="Y">필요</option>
                                    </select>
                                  </td>
                                  <td>
                                    보존처리자
                                  </td>
                                  <td>
                                    <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="보존처리 이력이 있을 경우만 이름을 나타냅니다.">
                                  </td>
                              </tr>
                          </tbody>
                      </table>
                  </div>
                  
              </div>
              </div>
                <div class="mb-0">
                  <div class="st_wrap">
                    <label class="col-md-2 col-form-label st_title">분류체계</label>
                    <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" type="button" >간편입력</button>
                    <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" type="button" onclick="deleteClassTd('class-table', 'class-checkbox')">선택삭제</button>
                    <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" type="button" onclick="addClassTd('class-table', 'class-tbody')">추가</button>
                  </div>
                  <div class="card-body">
                    <div class="table-responsive">
	                        <table class="table mb-0" id="class-table">
	                            <thead>
	                                <tr class="tr_bgc">
	                                    <td>#</td>
	                                    <td>번호</td>
	                                    <td>대분류</td>
	                                    <td>중분류</td>
	                                    <td>소분류</td>
	                                </tr>
	                            </thead>
	                            <tbody id="class-tbody">
	                                <tr id="class-tr">
	                                  <td></td>
	                                 <!--  <input type="checkbox" name="class-checkbox" id=""> -->
	                                    <th scope="row" id="row-number">1</th>
	                                    <td>
	                                      <select class="form-select st_select" name="class1_code_idx">
	                                        <option value="" selected>선택</option>
	                                        <c:forEach var="list" items="${class1List}" varStatus="status">
			                                    <option value="${list.class1_code_idx}">${list.class1_nm}</option>
			                                </c:forEach>
	                                      </select>
	                                    </td>
	                                    <td>
	                                      <select class="form-select st_select" name="class2_code_idx">
	                                        <option value="" selected>선택</option>
	                                        <c:forEach var="list" items="${class2List}" varStatus="status">
			                                    <option value="${list.class2_code_idx}">${list.class2_nm}</option>
			                                </c:forEach>
	                                      </select>
	                                    </td>
	                                    <td>
	                                      <select class="form-select st_select" name="class3_code_idx">
	                                        <option value="" selected>선택</option>
	                                        <c:forEach var="list" items="${class3List}" varStatus="status">
			                                    <option value="${list.class3_code_idx}">${list.class3_nm}</option>
			                                </c:forEach>
	                                      </select>
	                                    </td>
	                                </tr>
	                            </tbody>
	                        </table>
                    </div>
                </div>
              </div>
              
              
              <!-- ------------------------ddddddddddddddddddddmnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn -->
              <!-- 기본 사항 - 분류체계 끝 --> 
              <!-- 기본사항 - 국적 시작 -->
             
              <div class="mb-0">
                <div class="st_wrap">
                  <label class="col-md-2 col-form-label st_title">국적</label>
                  <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" type="button" >간편입력</button>
                  <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" type="button" onclick="deleteClassTd('country-table', 'country-checkbox')">선택삭제</button>
                  <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" type="button" onclick="addClassTd('country-table', 'country-tbody')">추가</button>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                      <table class="table mb-0" id="country-table">
                          <thead>
                              <tr class="tr_bgc">
                                  <td>#</td>
                                  <td>번호</td>
                                  <td>국적</td>
                                  <td>국적별 시대</td>
                                  <td>시대(상세)</td>
                              </tr>
                          </thead>
                          <tbody id="country-tbody">
                              <tr>
                                <td></td>
                                  <th scope="row">1</th>
                                  <td>
                                    <select class="form-select st_select" id="country-select" onchange="changeCountry(this.value, 1)" name="country_code_idx">
                                      <option value="" selected>선택</option>
		                               <c:forEach var="list" items="${countryList}" varStatus="status">
		                                    <option value="${list.country_code_idx}">${list.country_nm}</option>
		                                </c:forEach>
                                    </select>
                                  </td>
                                  <td>
                                    <select class="form-select st_select" id="era-select1" name="era_code_idx">
                                      <option value="" selected>선택</option>
                                      <%-- <c:forEach var="list" items="${eraList}" varStatus="status">
		                                    <option value="${list.era_code_idx}">${list.era_nm}</option>
		                                </c:forEach> --%>
                                    </select>
                                  </td>
                                  <td>
                                    <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="상세 시대를 입력해 주세요." name=detail_year>
                              </tr>
                          </tbody>
                      </table>
                     </div>
              </div>
            </div>
            <!-- 기본사항 - 국적 시작 끝 -->
            <!-- 기본사항 - 재질 시작 -->
            <div class="mb-0">
              <div class="st_wrap">
                <label class="col-md-2 col-form-label st_title">재질</label>
                <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" type="button" >간편입력</button>
                <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" type="button" onclick="deleteClassTd('material-table', 'material-checkbox')">선택삭제</button>
                <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" type="button" onclick="addClassTd('material-table', 'material-tbody')">추가</button>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                    <table class="table mb-0" id="material-table">
                        <thead>
                            <tr class="tr_bgc">
                                <td>#</td>
                                <td>번호</td>
                                <td>1단계</td>
                                <td>2단계</td>
                                <td>재질(상세)</td>
                            </tr>
                        </thead>
                        <tbody id="material-tbody">
                            <tr>
                              <td></td>
                                <th scope="row">1</th>
                                <td>
                                  <select class="form-select st_select" onchange="changeMaterial(this.value, 1)" name="material1_code_idx">
                                    <option value="" selected>선택</option>
                                    <c:forEach var="list" items="${material1List}" varStatus="status">
		                                    <option value="${list.material1_code_idx}">${list.material1_nm}</option>
		                                </c:forEach>
                                  </select>
                                </td>
                                <td>
                                  <select class="form-select st_select" id="material2-select1" name="material2_code_idx">
                                    <option value="" selected>선택</option>
                                  </select>
                                </td>
                                <td>
                                  <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="상세 재질을 입력해 주세요." name="material_detail">
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
          </div>
            <!-- 기본사항 - 재질 끝 -->
            <!-- 기본사항 - 크기 시작 -->
            <div class="mb-0">
              <div class="st_wrap">
                <label class="col-md-2 col-form-label st_title">크기</label>
                <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" type="button">간편입력</button>
                <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" type="button" onclick="deleteClassTd('measurement-table', 'measurement-checkbox')">선택삭제</button>
                <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" type="button" onclick="addClassTd('measurement-table', 'measurement-tbody')">추가</button>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                    <table class="table mb-0" id="measurement-table">
                        <thead>
                            <tr class="tr_bgc">
                                <td>#</td>
                                <td>번호</td>
                                <td>소장구분</td>
                                <td>실측부위</td>
                                <td>실측치</td>
                                <td>실단위</td>
                            </tr>
                        </thead>
                        <tbody id="measurement-tbody">
                            <tr>
                              <td></td>
                                <th scope="row">1</th>
                                <td>
                                  <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="소장구분을 입력해 주세요." name="measurement_item_type">
                                </td>
                                <td>
                                  <select class="form-select st_select" name="measurement_code_idx">
                                    <option value="" selected>선택</option>
                                    	<c:forEach var="list" items="${measurementList}" varStatus="status">
		                                    <option value="${list.measurement_code_idx}">${list.measurement_nm}</option>
		                                </c:forEach>
                                  </select>
                                </td>
                                <td>
                                  <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="실측치를 입력해 주세요." name="measurement_value">
                                <td>
                                  <select class="form-select st_select" name="measurement_unit_code_idx">
                                    <option value="" selected>선택</option>
                                   	 	<c:forEach var="list" items="${measurementUnitList}" varStatus="status">
		                                    <option value="${list.measurement_unit_code_idx}">${list.measurement_unit_nm}</option>
		                                </c:forEach>
                                  </select>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
          </div>
          <!-- 기본사항 - 크기 끝 -->
          <!--  -->
          <div class="mb-0">
            <div class="st_wrap">
              <label class="col-md-2 col-form-label st_title">입수정보</label>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                  <table class="table mb-0">
                      <tbody>
                          <tr>
                            <td>
                              입수일자
                              <td>
                                <input class="form-control in_date" type="date" name="obt_obtainment_date">
                              </td>
                              <td>
                                입수연유
                              <td>
                                <select class="form-select st_select" name="obt_obtainment_code_idx">
                                  <option value="" selected>선택</option>
                                  		<c:forEach var="list" items="${obtainmentList}" varStatus="status">
		                                    <option value="${list.obtainment_code_idx}">${list.obtainment_nm}</option>
		                                </c:forEach>
                                </select>
                              </td>
                          </tr>
                          <!-- 2  -->
                          <tr>
                            <td>
                              구입구분1
                              <td>
                                <select class="form-select st_select" name="obt_purchase1_code_idx">
                                  <option value="" selected>선택</option>
                                  		<c:forEach var="list" items="${purchase1List}" varStatus="status">
		                                    <option value="${list.purchase1_code_idx}">${list.purchase1_nm}</option>
		                                </c:forEach>
                                </select>
                              </td>
                              <td>
                                구입구분2
                              <td>
                                <select class="form-select st_select" name="obt_purchase2_code_idx">
                                  <option value="" selected>선택</option>
                                 		 <c:forEach var="list" items="${purchase2List}" varStatus="status">
		                                    <option value="${list.purchase2_code_idx}">${list.purchase2_nm}</option>
		                                </c:forEach>
                                </select>
                              </td>
                          </tr>
                          <!-- 3 -->
                          <tr>
                            <td>
                              가격
                              <td>
                                <input class="form-control st_input pri" list="datalistOptions" id="exampleDataList" placeholder="가격을 입력해 주세요." name="obt_obtainment_price">
                                <select class="form-select st_select pri" name="obt_price_unit_code_idx">
                                  <option value="" selected>선택</option>
                                  		<c:forEach var="list" items="${priceUnitList}" varStatus="status">
		                                    <option value="${list.price_unit_code_idx}">${list.price_unit_nm}</option>
		                                </c:forEach>
                                </select>
                              </td>
                              <td>
                                원화환산
                                <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2">환률정보</button>
                              </td>
                              <td>
                                <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="원화환산 입력에 관하여 환률정보 클릭 시 도움을 받을 수 있습니다." name="obt_won_exchange">
                              </td>
                          </tr>
                          <!-- 4 -->
                          <tr>
                            <td>
                              일괄구입번호
                              <td>
                                <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="일괄구입번호를 입력해 주세요." name="obt_obtainment_no">
                              </td>
                              <td>
                                입수처
                              </td>
                              <td>
                                <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="입수처를 입력해 주세요." name="obt_obtainment_place">
                              </td>
                          </tr>
                          <!-- 5 -->
                          <tr>
                            <td>
                              입수주소
                            </td>
                              <td>
                                <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="입수주소를 입력해 주세요." name="obt_obtainment_addr">
                              </td>
                              <td>
                                입수 내용
                              </td>
                              <td>
                                <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="연락처 외 기본사항을 입력 할 수 있습니다." name="obt_obtainment_detail">
                              </td>
                          </tr>
                          <!-- 6 -->
                          <tr>
                            <td>
                              등록일자
                            </td>
                              <td>
                                <input class="form-control in_date" type="date" name="obt_record_date">
                              </td>
                              <td>
                                문화재 지정
                                <input type="checkbox" name="" id="">
                              </td>
                              <td>
                                <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="문화재 지정 내용을 입력해 주세요." name="obt_designation">
                              </td>
                          </tr>
                          <!-- 7 -->
                          <tr>
                            <td>
                              문화재 환수
                              <input type="checkbox" name="" id="">
                            </td>
                              <td>
                                <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="환수 경로를 입력해 주세요." name="obt_redemption">
                              </td>
                              <td>
                                문화재 환수 국적
                              </td>
                              <td>
                                <select class="form-select st_select" name="obt_country_code_idx">
                                  <option value="" selected>선택</option>
                                  		<c:forEach var="list" items="${countryList}" varStatus="status">
		                                    <option value="${list.country_code_idx}">${list.country_nm}</option>
		                                </c:forEach>
                                </select>
                              </td>
                          </tr>
                          <!-- 8 -->
                          <tr>
                            <td>
                              문화재 환수 수량
                            </td>
                              <td>
                                <input class="form-control st_input pri" list="datalistOptions" id="exampleDataList" placeholder="환수 경로를 입력해 주세요." name="obt_qty">
                                <select class="form-select st_select pri" name="obt_qty_unit_code_idx">
                                  <option value="" selected>문화재 환수 단위</option>
                                  		<c:forEach var="list" items="${qtyUnitList}" varStatus="status">
		                                    <option value="${list.qty_unit_code_idx}">${list.qty_unit_nm}</option>
		                                </c:forEach>
                                </select>
                              </td>
                              <td>
                                문화재 환수 연도
                              </td>
                              <td>
                                <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="문화재 환수 연도를 입력해 주세요." name="obt_redemption_date">
                              </td>
                          </tr>
                      </tbody>
                  </table>
              </div>
          </div>
          </div>
          <!--  -->
          <!-- 기본사항 특징 시작 -->
          <div class="mb-0">
            <div class="st_wrap">
              <label class="col-md-2 col-form-label st_title">특징</label>
            </div>
              <input type="text" class="st_inp_tbox" placeholder="특징에 관하여 입력해 주세요." name="feature">
          </div>
          <!-- 기본사항 특징 끝 -->
          <!--  -->
          <!-- 기본사항 - 자료상태 및 전시순위 시작 -->
          <div class="mb-0">
            <div class="st_wrap">
              <label class="col-md-2 col-form-label st_title">자료상태 및 전시순위</label>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                  <table class="table mb-0">
                      <tbody>
                          <tr>
                            <td>
                              자료상태
                              <td>
                                <select class="form-select st_select"  name="condition_code_idx">
                                  <option value="" selected>선택</option>
                                  		<c:forEach var="list" items="${conditionList}" varStatus="status">
		                                    <option value="${list.condition_code_idx}">${list.condition_nm}</option>
		                                </c:forEach>
                                </select>
                              </td>
                              <td>
                                전시순위
                              <td>
                                <select class="form-select st_select" name="ranking_code_idx">
                                  <option value="" selected>선택</option>
                                  		<c:forEach var="list" items="${rankingList}" varStatus="status">
		                                    <option value="${list.ranking_code_idx}">${list.ranking_nm}</option>
		                                </c:forEach>
                                </select>
                              </td>
                          </tr>
                      </tbody>
                  </table>
              </div>
          </div>
          
          <input type="hidden" id="gameToken" name="reg_user" value="jinhyun">
          <input type="hidden" id="gameToken" name="reg_state" value="N">
        </div>
          <!-- 기본사항 - 자료상태 및 전시순위 끝 -->
          <!--  -->
          <!-- 기본사항 - 관련자료 시작 -->
          <div class="mb-0">
            <div class="st_wrap">
              <label class="col-md-2 col-form-label st_title">관련자료</label>
              <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2">선택삭제</button>
              <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2">추가</button>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                  <table class="table mb-0">
                      <thead>
                          <tr class="tr_bgc">
                              <th>#</th>
                              <th>번호</th>
                              <th>자료구분</th>
                              <th>자료번호</th>
                              <th>비고</th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr>
                          	<input type="hidden" name="invol_org_code_idx" id="invol_org_code_idx">
                            <td><input type="checkbox" name="" id=""></td>
                              <th scope="row">1</th>
                              <td>
                                <select class="form-select st_select" name="invol_possession_code_idx">
                                  <option value="" selected>선택</option>
                                  		<c:forEach var="list" items="${posSessionList}" varStatus="status">
		                                    <option value="${list.possession_code_idx}">${list.possession_nm}</option>
		                                </c:forEach>
                                </select>
                              </td>
                              <td>
                                <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="자료번호를 입력해 주세요." name="invol_item_no">
                              </td>
                              <td>
                                <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="참고사항을 입력해 주세요." name="invol_remark">
                              </td>
                          </tr>
                      </tbody>
                  </table>
              </div>
          </div>
        </div>
        <!-- 기본사항 - 관련자료 끝 -->
        <!--  -->
        <!--  -->
        <div class="mb-0">
          <div class="st_wrap">
            <label class="col-md-2 col-form-label st_title">보험 관계기록</label>
            <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2">선택삭제</button>
            <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2">추가</button>
          </div>
          <div class="card-body">
            <div class="table-responsive">
                <table class="table mb-0">
                    <thead>
                        <tr class="tr_bgc">
                            <th>#</th>
                            <th>번호</th>
                            <th>평가액</th>
                            <th>가격단위</th>
                            <th>대여기간</th>
                            <th>대여기관</th>
                            <th>비고</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                          <td><input type="checkbox" name="" id=""></td>
                            <th scope="row">1</th>
                            <td>
                              <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="평가액을 입력해 주세요." name="insu_agreed_value">

                            </td>
                            <td>
                              <select class="form-select st_select" name="insu_price_unit_code_idx">
                                <option value="" selected>선택</option>
                                		<c:forEach var="list" items="${priceUnitList}" varStatus="status">
		                                    <option value="${list.price_unit_code_idx}">${list.price_unit_nm}</option>
		                                </c:forEach>
                              </select>
                            </td>
                            <td>
                              <!-- 대여기간 캘린더 폼 -->
                              <input class="form-control" type="date" name="insu_start_date"> ~ <input class="form-control" type="date" name="insu_end_date">
                            </td>
                            <td>
                              <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="대여기관을 입력해 주세요." name="insu_rental_org">
                            </td>
                            <td>
                              <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="참고사항을 입력해 주세요." name="insu_remark">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
      </div>
        <!--  -->
        <!-- 기본사항 - 비고 시작 -->
        <div class="mb-0">
          <div class="st_wrap">
            <label class="col-md-2 col-form-label st_title">비고</label>
          </div>
            <input type="text" class="st_inp_tbox" placeholder="참고사항을 입력해 주세요." name="remark">
        </div>
        <!-- 기본사항 - 비고 끝 -->
        <!--  -->
        <!-- 기본사항 - 저작권 시작 -->
        <div class="mb-0">
          <div class="st_wrap">
            <label class="col-md-2 col-form-label st_title">저작권</label>
            <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2">선택삭제</button>
            <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2">추가</button>
          </div>
          <div class="card-body">
            <div class="table-responsive">
                <table class="table mb-0">
                    <thead>
                        <tr class="tr_bgc">
                            <th>#</th>
                            <th>번호</th>
                            <th>저작권</th>
                            <th>저작권 소유자</th>
                            <th>저작권만료일자</th>
                            <th>이용허락 여부</th>
                            <th>저작권 양도 여부</th>
                            <th>비고</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                          <td><input type="checkbox" name="" id=""></td>
                            <th scope="row">1</th>
                            <td>
                              <select class="form-select st_select" name="copy_copyright">
                                <option value="" selected>선택</option>
                                <option>Y</option>
                                <option>N</option>
                              </select>
                            </td>
                            <td>
                              <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="" name="copy_owner">
                            </td>
                            <td>
                              <!-- 대여기간 캘린더 폼 -->
                              <input class="form-control" type="date" name="copy_expiry_date">
                            </td>
                            <td>
                              <select class="form-select st_select" name="copy_usage_permission">
                                <option value="" selected>선택</option>
                                <option>Y</option>
                                <option>N</option>
                              </select>
                            </td>
                            <td>
                              <select class="form-select st_select" name="copy_copyright_transfer">
                                <option value="" selected>선택</option>
                                <option>Y</option>
                                <option>N</option>
                              </select>
                            </td>
                            <td>
                              <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="참고사항을 입력해 주세요." name="copy_remark">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
      </div>
        <!-- 기본사항 - 저작권 끝 -->
        <!--  -->
        <!-- 기본사항 - 대국민 서비스 시작 -->
        <div class="mb-0">
          <div class="st_wrap">
            <label class="col-md-2 col-form-label st_title">대국민 서비스</label>
            <select class="form-select st_select ser_sel" name="public_service">
              <optio value="" selected>선택</option>
              <option>Y</option>
              <option>N</option>
            </select>
          </div>
          <div class="card-body">
            <div class="table-responsive">
                <table class="table mb-0">
                    <thead>
                        <tr class="tr_bgc">
                            <th>서비스 불가 사유</th>
                            <th>공공누리 서비스 유형</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                              <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="서비스 불가 사유를 입력해 주세요." name="reason">
                            </td>
                            <td>
                              <select class="form-select st_select" name="ggnuri_code_idx">
                                <option value="" selected>선택</option>
                                		<c:forEach var="list" items="${ggnuriList}" varStatus="status">
		                                    <option value="${list.ggnuri_code_idx}">${list.ggnuri_nm}</option>
		                                </c:forEach>
                              </select>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
      </div>
        <!-- 기본사항 - 대국민 서비스 끝 -->

        <!--  -->
        <!-- 기본사항 - 자료정보변경이력 시작 -->
        <div class="mb-0">
          <div class="st_wrap">
            <label class="col-md-2 col-form-label st_title">자료정보변경이력</label>
          </div>
          <div class="card-body">
            <div class="table-responsive">
                <table class="table mb-0">
                    <thead>
                        <tr class="tr_bgc">
                            <th>번호</th>
                            <th>기록자</th>
                            <th>변경일</th>
                            <th>변경항목</th>
                            <th>변경내용</th>
                            <th>비고</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
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
                              -
                             </td>
                             <td>
                              -
                             </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </form>
        </div>
      </div>
      <!--  -->
      <div class="mb-0">
        <div class="st_wrap">
          <label class="col-md-2 col-form-label st_title">키워드</label>
        </div>
          <input type="text" class="st_inp_tbox" placeholder="키워드를 입력해 주세요. 콤마 단위로 입력해주세요." name="keyword">
      </div>
            </div>
        <!-- 기본사항 - 자료정보변경이력 끝 -->
        <!--  -->
        <!--  -->
            <!--  -->
            <!-- 기본사항 끝 -->
            <!--  -->
            <!-- 이동 사항 -->
            <div class="tab-pane" id="profile" role="tabpanel">
              <div class="mb-0">
                <!-- 엑셀 모달 -->
                <div id="myModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
                  <div class="modal-dialog">
                      <div class="modal-content">
                          <div class="modal-header">
                              <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <div class="modal-body">
                              <!-- 모달 내용 -->
                              <div class="mb-0">
                                <div class="st_wrap">
                                  <!-- <label class="col-md-2 col-form-label st_title"></label> -->
                                </div>
                                <div class="card-body cd_df">
                                  <div class="tr_left mv_modal">
                                    <table class="table mb-0">
                                      <tbody>
                                          <tr>
                                            <td>
                                              이동일자
                                            </td>
                                              <td>
                                                <input class="form-control" type="date">
                                          </tr>
                                          <!--  -->
                                          <tr>
                                            <td>
                                              보관 구분
                                            </td>
                                              <td>
                                                <select class="form-select st_select pri">
                                                  <option value="" selected="">선택</option>
                                                  <option>더미1</option>
                                                  <option>더미2</option>
                                                  <option>더미3</option>
                                                </select>
                                                <select class="form-select st_select pri">
                                                  <option value="" selected="">선택</option>
                                                  <option>더미1</option>
                                                  <option>더미2</option>
                                                  <option>더미3</option>
                                                </select>
                                              </td>
                                          </tr>
                                          <!--  -->
                                          <tr>
                                            <td>
                                              반입처
                                            </td>
                                              <td>
                                                <select class="form-select st_select pri">
                                                  <option value="" selected="">선택</option>
                                                  <option>더미1</option>
                                                  <option>더미2</option>
                                                  <option>더미3</option>
                                                </select>
                                              </td>
                                          </tr>
                                          <!--  -->
                                          <tr>
                                            <td>
                                              보관처
                                            </td>
                                              <td>
                                                <select class="form-select st_select pri">
                                                  <option value="" selected="">선택</option>
                                                  <option>더미1</option>
                                                  <option>더미2</option>
                                                  <option>더미3</option>
                                                </select>
                                              </td>

                                          </tr>
                                          <!--  -->
                                          <tr>
                                            <td>
                                              이동수량
                                            </td>
                                              <td>
                                                <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="">
                                              </td>
                                              <td>
                                                현수량
                                              </td>
                                              <td>
                                                <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="">
                                              </td>
                                          </tr>
                                          <!--  -->
                                          <tr>
                                            <td>
                                              격납요청자
                                            </td>
                                              <td>
                                                <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="">
                                              </td>
                                              <td>
                                                실제전시여부
                                              </td>
                                              <td>
                                                <input type="checkbox" name="" id="">
                                              </td>
                                          </tr>
                                          <tr>
                                            <td>비고</td>
                                            <td><input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder=""></td>
                                          </tr>
                                      </tbody>
                                      <!-- 이동사항 모달 오른쪽 영역 -->
                                      <table class="table mb-0">
                                        <thead>
                                          <tr class="tr_bgc">
                                              <th>번호</th>
                                              <th>과거이동처</th>
                                              <th>현수량</th>
                                              <th>입력값선택</th>
                                          </tr>
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
                                                    <option value="" selected="">선택</option>
                                                    <option>더미1</option>
                                                    <option>더미2</option>
                                                    <option>더미3</option>
                                                  </select>
                                            </td></tr>
                                        </tbody>
                                  </table>
                              </div>
                          </div>
                          </div>
                                    <!-- <div class="card-body">
                                                        <p class="card-title-desc">Adding in the previous and next controls:</p>

                                                        <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                                                            <div class="carousel-inner" role="listbox">
                                                                <div class="carousel-item">
                                                                    <img class="d-block img-fluid" src="assets/images/small/img-4.jpg" alt="First slide">
                                                                </div>
                                                                <div class="carousel-item active">
                                                                    <img class="d-block img-fluid" src="assets/images/small/img-5.jpg" alt="Second slide">
                                                                </div>
                                                                <div class="carousel-item">
                                                                    <img class="d-block img-fluid" src="assets/images/small/img-6.jpg" alt="Third slide">
                                                                </div>
                                                            </div>
                                                            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-bs-slide="prev">
                                                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                                <span class="sr-only">Previous</span>
                                                            </a>
                                                            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-bs-slide="next">
                                                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                                <span class="sr-only">Next</span>
                                                            </a>
                                                        </div>
                                                    </div> -->
                                  </div>
                                  <div class="table-responsive tr_right">

                              <!--  -->
                          </div>
                          <div class="modal-footer">
                              <!-- <button type="button" class="" data-bs-dismiss="modal">Close</button> -->
                              <!-- <button type="button" class="btn btn-secondary waves-effect">저장</button> -->
                          </div>
                      </div>
                  </div>
              </div>
                <!--  -->
                <div class="st_wrap st_mv_wrap">
                  <div class="st_title_wrap">
                    <label class="col-md-2 col-form-label st_title">이동사항 내역</label>
                    <label class="col-md-2 col-form-label st_sub_title">| 수주량 : 0</label>
                  </div>
                  <div class="move_btn">
                    <button type="button" class="btn btn-primary waves-effect waves-light btn_ml btn_wh btn_ex" data-bs-toggle="modal" data-bs-target="#myModal">엑셀파일</button>
                    <button class="btn btn-secondary waves-effect waves-light btn_ml">이동사항 등록</button>
                  </div>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                      <table class="table mb-0">
                          <thead>
                              <tr class="tr_bgc">
                                  <th>번호</th>
                                  <th>이동일자</th>
                                  <th>보관구분</th>
                                  <th>보관처</th>
                                  <th>반입처</th>
                                  <th>이동수량</th>
                                  <th>현수량</th>
                                  <th>비고</th>
                                  <th>격납요청자</th>
                                  <th>실제전시여부</th>
                                  <th></th>
                              </tr>
                          </thead>
                          <tbody>
                              <tr>
                                  <th scope="row">1</th>
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
                                    -
                                   </td>
                                   <td>
                                    0
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
                                    <button class="btn btn-secondary waves-effect waves-light btn_ml btn_wh">수정</button>
                                    <button class="btn btn-secondary waves-effect waves-light btn_ml btn_wh">삭제</button>
                                   </td>
                              </tr>
                              <tr>
                                <th scope="row">2</th>
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
                                  -
                                 </td>
                                 <td>
                                  0
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
                                  <button class="btn btn-secondary waves-effect waves-light btn_ml btn_wh">수정</button>
                                  <button class="btn btn-secondary waves-effect waves-light btn_ml btn_wh">삭제</button>
                                 </td>
                            </tr>
                          </tbody>
                      </table>
                  </div>
              </div>
            </div>
            </div>
            <!-- 이미지 -->
            <div class="tab-pane" id="messages" role="tabpanel">
                <p class="mb-0">
                  이미지1111
                </p>
            </div>
            <!-- 보존처리 -->
            <div class="tab-pane" id="settings" role="tabpanel">
              <div class="accordion-item">
                <h2 class="accordion-header" id="flush-headingOne">
                  <button class="accordion-button fw-medium ac_btn" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="true" aria-controls="flush-collapseOne">
                    버튼으로 수정 예정
                  </button>
                </h2>
                <div id="flush-collapseOne" class="accordion-collapse collapse show" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                  <div class="accordion-body text-muted">
                    <!--  -->
                    <div class="mb-0">
                      <div class="card-body">
                        <div class="table-responsive">
                            <table class="table mb-0">
                                <tbody>
                                    <tr>
                                      <td>처리기관</td>
                                        <td>
                                          <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="처리기관을 입력해 주세요.">
                                        </td>
                                        <td>
                                         처리자
                                        </td>
                                        <td>
                                          <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="처리자 명을 입력해 주세요.">
                                        <td>
                                          처리기간
                                        </td>
                                        <td>
                                          <!-- 대여기간 캘린더 폼 -->
                                          <input class="form-control" type="date"> ~ <input class="form-control" type="date">
                                        </td>
                                        <td>
                                          <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2">저장</button>
                                          <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2">삭제</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                  </div>
                    <div class="mb-0">
                      <div class="st_wrap">
                        <label class="col-md-2 col-form-label st_title">처리내용</label>
                      </div>
                        <input type="text" class="st_inp_tbox" placeholder="처리내용을 입력해 주세요.">
                    </div>
                    <div class="mb-0">
                      <div class="st_wrap">
                        <label class="col-md-2 col-form-label st_title">비고</label>
                      </div>
                        <input type="text" class="st_inp_tbox" placeholder="참고사항을 입력해 주세요.">
                    </div>
                    <!--  -->
                  </div>
                </div>
              </div>
              <div class="mb-0">
                <div class="st_wrap">
                  <label class="col-md-2 col-form-label st_title">처리결과</label>
                  <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2">업로드</button>
                </div>
            </div>
            <div class="mb-0">
              <div class="st_wrap">
                <label class="col-md-2 col-form-label st_title">보존처리 전 이미지</label>
                <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2">업로드</button>
                <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2">다운로드</button>
                <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2">전체선택</button>
                <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2">선택해지</button>
                <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2">선택삭제</button>
              </div>
            </div>
            <div class="mb-0">
              <div class="st_wrap">
                <label class="col-md-2 col-form-label st_title">보존처리 전 이미지</label>
                <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2">업로드</button>
                <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2">다운로드</button>
                <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2">전체선택</button>
                <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2">선택해지</button>
                <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2">선택삭제</button>
              </div>
            </div>
            <button class="mb-0">
              <div class="st_wrap">
                <label class="col-md-2 col-form-label st_title"> + 보존처리 추가</label>
              </div>
            </button>
          </div>
            <!-- 전문정보 -->
            <div class="tab-pane" id="settings22" role="tabpanel">
                <div class="mb-0">
                  <div class="st_wrap">
                      <label class="col-md-2 col-form-label st_title">전문정보검색</label>
                      <select class="form-select st_select pro_info">
                        <option disabled selected>구분</option>
                        <option>더미1</option>
                        <option>더미2</option>
                        <option>더미3</option>
                      </select>
                      <select class="form-select st_select pro_info">
                        <option disabled selected>제목</option>
                        <option>더미1</option>
                        <option>더미2</option>
                        <option>더미3</option>
                      </select>
                      <input class="form-control st_input pro_info" list="datalistOptions" id="exampleDataList" placeholder="내용을 입력해 주세요.">
                      <button class="btn btn-secondary waves-effect waves-light btn_ml">조회</button>
                      <button class="btn btn-secondary waves-effect waves-light btn_ex">자료등록</button>
                    <!-- <div class="move_btn">
                    </div> -->
                  </div>
                  <div class="card-body">
                    <div class="table-responsive">
                        <table class="table mb-0">
                            <thead>
                                <tr class="tr_bgc">
                                    <th>번호</th>
                                    <th>이동일자</th>
                                    <th>보관구분</th>
                                    <th>보관처</th>
                                    <th>반입처</th>
                                    <th>이동수량</th>
                                    <th>현수량</th>
                                    <th>비고</th>
                                    <th>격납요청자</th>
                                    <th>실제전시여부</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">1</th>
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
                                      -
                                     </td>
                                     <td>
                                      0
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
                                      <button class="btn btn-secondary waves-effect waves-light btn_ml btn_wh">수정</button>
                                      <button class="btn btn-secondary waves-effect waves-light btn_ml btn_wh">삭제</button>
                                     </td>
                                </tr>
                                <tr>
                                  <th scope="row">2</th>
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
                                    -
                                   </td>
                                   <td>
                                    0
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
                                    <button class="btn btn-secondary waves-effect waves-light btn_ml btn_wh">수정</button>
                                    <button class="btn btn-secondary waves-effect waves-light btn_ml btn_wh">삭제</button>
                                   </td>
                              </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
              </div>
          </div>
        </div>
          <!--  -->
        <div class="mb-0">
        <div class="st_wrap">
        	<button type="button" class="submit_btn" onclick="submitForm()">저장하기</button>
        	</div>
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
    <!-- 
    JAVASCRIPT
    <script src="./assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="./assets/libs/metismenujs/metismenujs.min.js"></script>
    <script src="./assets/libs/simplebar/simplebar.min.js"></script>
    <script src="./assets/libs/eva-icons/eva.min.js"></script>

    apexcharts
    <script src="./assets/libs/apexcharts/apexcharts.min.js"></script>
    <script src="./assets/js/pages/dashboard.init.js"></script>

    <script src="./assets/js/app.js"></script>
    
    <script src="./assets/libs/swiper/swiper-bundle.min.js"></script>
    <script src="./assets/js/pages/ecommerce-product-detail.init.js"></script> -->


   <!-- JAVASCRIPT -->
   	<script src="<c:url value='/assets/libs/bootstrap/js/bootstrap.bundle.min.js'/>" defer></script>
    <script src="<c:url value='/assets/libs/metismenujs/metismenujs.min.js'/>" defer></script>
    <script src="<c:url value='/assets/libs/simplebar/simplebar.min.js'/>" defer></script>
    <script src="<c:url value='/assets/libs/eva-icons/eva.min.js'/>" defer></script>
    <script src="<c:url value='/assets/libs/swiper/swiper-bundle.min.js'/>" defer></script>
    <script src="<c:url value='/assets/js/pages/ecommerce-product-detail.init.js'/>" defer></script>
    <script src="<c:url value='/assets/libs/apexcharts/apexcharts.min.js'/>" defer></script>
    <script src="<c:url value='/assets/js/app.js'/>" defer></script>
    <script src="<c:url value='/assets/js/pages/dashboard.init.js'/>" defer></script>
   
    
  </body>
</html>
