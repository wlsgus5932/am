<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>환경설정-코드관리 | 국립항공박물관</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesbrand" name="author" />
    <!-- App favicon -->
	<script src="assets/libs/jquery/jquery-3.6.3.min.js"></script>
    <!-- Bootstrap Css -->
    <link href="assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />
    <!-- 커스텀 css -->
    <link href="assets/css/custom.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="assets/css/custom_user_control.css" />
    <link rel="stylesheet" href="assets/css/custom_setting.css" />
<!--     <link rel="stylesheet" href="assets/css/custom_view.css" /> -->
 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
  
  <script type="text/javascript">
  	
	$(function() {
		
		// 첫 페이지
		$('#orgPossessionMgr').attr('aria-selected', 'true').addClass('active');
		
		$.ajax({
			type : 'POST',                
			url : '/orgPossessionListAjax.do',    
			dataType : "html",           
			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
			error : function() {          
				alert('통신실패!');
			},
			success : function(data) {  
				$('#tab-content').empty().append(data);
			}
		});
	<!-- 탭 리스트 -->
		// 기관/소장구분코드 관리 tab operation
		$('#orgPossessionMgr').click(function() {
			$.ajax({
				type : 'POST',                
				url : '/orgPossessionListAjax.do',    
				dataType : "html",           
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {          
					alert('통신실패!');
				},
				success : function(data) {  
					$('#tab-content').empty().append(data);
				}
			});
		});
		
		// 분류체계코드 관리 tab operation
		$('#taxonomyMgr').click(function() {
			$.ajax({
				type : 'POST',                 
				url : '/taxonomyListAjax.do',   				
				dataType : "html",           
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {        
					alert('통신실패!');
				},
				success : function(data) {  
					$('#tab-content').empty().append(data);
				}
			});
		});
		
		// 국적/시대코드 관리 tab operation
		$('#countryEraMgr').click(function() {
			$.ajax({
				type : 'POST',                 
				url : '/countryEraListAjax.do',   				
				dataType : "html",           
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {        
					alert('통신실패!');
				},
				success : function(data) {  
					$('#tab-content').empty().append(data);
				}
			});
		});
		
		// 재질코드 관리 tab operation
		$('#materialMgr').click(function() {
			$.ajax({
				type : 'POST',                 
				url : '/materialListAjax.do',   				
				dataType : "html",           
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {        
					alert('통신실패!');
				},
				success : function(data) {  
					$('#tab-content').empty().append(data);
				}
			});
		});
		
		// 기본정보코드 관리 tab operation
		$('#basicInforMgr').click(function() {
			$.ajax({
				type : 'POST',                 
				url : '/basicInforListAjax.do',   				
				dataType : "html",           
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {        
					alert('통신실패!');
				},
				success : function(data) {  
					$('#tab-content').empty().append(data);
				}
			});
		});
		
		// 입수정보코드 관리 tab operation
		$('#obtainmentMgr').click(function() {
			$.ajax({
				type : 'POST',                 
				url : '/obtainmentListAjax.do',   				
				dataType : "html",           
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {        
					alert('통신실패!');
				},
				success : function(data) {  
					$('#tab-content').empty().append(data);
				}
			});
		});
		
		// 보관구분코드 관리 tab operation
		$('#storageTypeMgr').click(function() {
			$.ajax({
				type : 'POST',                 
				url : '/storageTypeListAjax.do',   				
				dataType : "html",           
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {        
					alert('통신실패!');
				},
				success : function(data) {  
					$('#tab-content').empty().append(data);
				}
			});
		});
		
		// 보관처코드 관리 tab operation
		$('#storageMgr').click(function() {
			$.ajax({
				type : 'POST',                 
				url : '/storageListAjax.do',   				
				dataType : "html",           
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {        
					alert('통신실패!');
				},
				success : function(data) {  
					$('#tab-content').empty().append(data);
					
					var icon = "";
	                var company = new Array();
	            	company[0] = {id : "root", parent : "#", text : "보관처", state : {opened:true}};
	            	
	            	$.ajax({
	                        type:'get',
	                        url:'/treelist.do',
	                        dataType:'json',
	                        success: function(data) {
	                                    // 데이터 받아옴
	                            $.each(data.storageCodeVOList, function(idx, item){
	                            	//상위 메뉴 없는경우 root로 부모 메뉴명 변경, 아이콘 설정
	            					if (item.parent_code == null || item.parent_code == '' || item.parent_code == 0){
	            						item.parent_code = "root";
	            						icon = 'jstree-folder';
	            					} else{
	            						icon = 'jstree-file';
	            					}
	                            	
	                                company[idx+1] = {id:item.storage_code_idx, parent:item.parent_code, text:item.storage_nm, icon:icon};
	                            });

	                                    // 트리 생성
	                            $('#tree').jstree({
	                                core: {
	                                                data: company    //데이터 연결
	                                    },
	                                    types: {
	                                           'default': {
	                                                'icon': 'jstree-folder'
	                                            }
	                                    },
	                                    plugins: ['wholerow', 'types']
	                             })
	                             .bind('loaded.jstree', function(event, data){
	                                    //트리 로딩 롼료 이벤트
	                             })
	                             .bind('select_node.jstree', function(event, data){
	                            	 var id = data.instance.get_node(data.selected).id; 
		                         		$.ajax({
		                        			type : 'POST',                
		                        			url : '/storageViewListAjax.do',    
		                    				data:{
		                    					parent_code : id
		                    				},
		                        			dataType : "html",           
		                        			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
		                        			error : function() {          
		                        				alert('통신실패!');
		                        			},
		                        			success : function(data) {  
		                        				$('.user_control_right').empty().append(data);
		                        				
		                        				if(id == "root"){
		                        					$('#subInsParentCode').val(0);
		                        					$('#subModParentCode').val(0);
		                        				}else{
		                        					$('#subInsParentCode').val(id);
		                        					$('#subModParentCode').val(id);
		                        				}
		                        				
		                        			}
		                                })
	                             })
	                             .bind("refresh.jstree", function(e,d) {
	                            		alert('refresh');
	                             })

	                        },
	                        error:function (data) {
	                            alert("에러");
	                        }
	                   });
				}
			});
		});
	<!-- 탭 리스트 end-->
	});
	
	// 코드 등록폼
	function insFormBtn(value){	
		var code = value;
		var type;
		if(code.indexOf('_')){
			type = code.replace('_', '-');
		}else{
			type = code;
		}
		if($('#insCode')){	
			$('#insCode').attr('name',code+'_code');
		}
		$('#insType').val(type);
		$('#insNm').attr('name',code+'_nm');
	}
	
	// 코드 등록
	$(document).on('click', '#insBtn', function(){
		
		var insType = $('#insType').val();
		var queryString = $("form[name=codeInsForm]").serialize();
		var check_submit = confirm('코드를 등록하시겠습니까?');
		var codeInsCheck = $('#codeInsCheck').attr('codeInsCheck');
		if(codeInsCheck == "" || codeInsCheck == "N"){alert('코드 중복체크를 해주세요'); $('#codeInsCheck').focus(); return;}
		
		if(check_submit){	
			if (codeInsValidation()) {
				$.ajax({
					type : 'post',
					url : '/codeInsertAjax.do/'+insType+'.do',
					data : queryString, 			
					dataType : 'json',
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error: function(xhr, status, error){
						alert(error);
					},
					success : function(success){
						alert('코드가 등록되었습니다.');
						$('#codeInsClose').click();
						var url;
						if(success.insType == 'org'){
							url = '/orgPossessionListAjax.do'
						}else if(success.insType == 'country'){
							url = '/countryEraListAjax.do'
						}else if(success.insType == 'material1'){
							url = '/materialListAjax.do'
						}else if(success.insType == 'storage-type1'){
							url = '/storageTypeListAjax.do'
						}else if(success.insType == 'icao' || success.insType =='class1' || success.insType =='class2' || success.insType =='class3'){
							url = '/taxonomyListAjax.do'
						}else if(success.insType == 'qty-unit' || success.insType =='existence' || success.insType =='measurement' || success.insType =='measurement-unit' || success.insType =='condition' || success.insType =='ranking' || success.insType =='ggnuri' || success.insType =='speciality'){
							url = '/basicInforListAjax.do'
						}else if(success.insType == 'obtainment' || success.insType =='price-unit' || success.insType =='measurement' || success.insType =='purchase1' || success.insType =='purchase2'){
							url = '/obtainmentListAjax.do'
						}
						$.ajax({
							type : 'POST',                 
							url : url,   
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
	
	<%-- 코드 등록 유효성체크 --%>
	var codeInsValidation = function() {

		var insNm = $('#insNm').val();				
		
		if($('#insCode').length){	
			var insCode = $('#insCode').val();			
			
			if (!Boolean(insCode)) {
				alert("코드를 입력해주세요.");
				$("#insCode").focus();
				return false;
			}	
		}
		
		if (!Boolean(insNm)) {
			alert("명칭을 입력해주세요.");
			$("#insNm").focus();
			return false;
		}		
		if (!$('#insCodeEnabledY').is(":checked") && !$('#insCodeEnabledN').is(":checked")) {
			alert("사용 여부를 체크해주세요.");
			return false;
		}

		return true;
	}

	//중복확인란 텍스트 변경 시 다시 중복확인 해야함
	function codeInsInputChange(){
		$('#codeInsCheck').attr('codeInsCheck','N');
	}
	
	// 코드 등록 중복체크
	$(document).on('click', '#codeInsCheck', function(){
		
		var insType = $('#insType').val();	
		var insCode = $('#insCode').val();
		var queryString = $("form[name=codeInsForm]").serialize();
		
		if (!Boolean(insCode)) {
			alert("코드를 입력해주세요.");
			$("#insCode").focus();
			return false;
		}	
		
				$.ajax({
					type : 'post',
					url : '/codeDuplicateCheck.do/'+insType+'.do',
					data : queryString, 			
					dataType : 'json',
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error: function(xhr, status, error){
						alert(error);
					},
					success : function(data){
							if(data.result == "success"){	
								alert('존재하는 코드입니다.');
								$('#codeInsCheck').attr('codeInsCheck','N');
							}else{
								alert('사용가능한 코드입니다.');
								$('#codeInsCheck').attr('codeInsCheck','Y');
							}
					}
				});
	});

	//중복확인란 텍스트 변경 시 다시 중복확인 해야함
	function subCodeInsInputChange(){
		$('#subCodeInsCheck').attr('subCodeInsCheck','N');
	}
	
	// 하위코드 등록 중복체크
	$(document).on('click', '#subCodeInsCheck', function(){
		
		var subInsType = $('#subInsType').val();	
		var subInsCode = $('#subInsCode').val();
		var queryString = $("form[name=subCodeInsForm]").serialize();
		
		if (!Boolean(subInsCode)) {
			alert("코드를 입력해주세요.");
			$("#subInsCode").focus();
			return false;
		}	
		
				$.ajax({
					type : 'post',
					url : '/codeDuplicateCheck.do/'+subInsType+'.do',
					data : queryString, 			
					dataType : 'json',
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error: function(xhr, status, error){
						alert(error);
					},
					success : function(data){
							if(data.result == "success"){	
								alert('존재하는 코드입니다.');
								$('#subCodeInsCheck').attr('subCodeInsCheck','N');
							}else{
								alert('사용가능한 코드입니다.');
								$('#subCodeInsCheck').attr('subCodeInsCheck','Y');
							}
					}
				});
	});
	
	// 하위코드 등록폼
	function insSubFormBtn(value){	
		var code = value;
		var type;
		if(code.indexOf('_')){
			type = code.replace('_', '-');
		}else{
			type = code;
		}
		if($('#subInsCode')){	
			$('#subInsCode').attr('name',code+'_code');
		}
		$('#subInsType').val(type);
		$('#subInsNm').attr('name',code+'_nm');
	}
	
	// 하위코드 등록
	$(document).on('click', '#subInsBtn', function(){
		if($('#subInsParentCode').length){	
			var subParentCode = $('#subInsParentCode').val();
		}
		if($('#subInsParentCodeHtml').length){	
			var subParentCodeHtml = $('#subInsParentCodeHtml').html();
		}
		var subInsType = $('#subInsType').val();
		var queryString = $("form[name=subCodeInsForm]").serialize();
		var check_submit = confirm('코드를 등록하시겠습니까?');
		var subCodeInsCheck = $('#subCodeInsCheck').attr('subCodeInsCheck');
		if(subCodeInsCheck == "" || subCodeInsCheck == "N"){alert('코드 중복체크를 해주세요'); $('#subCodeInsCheck').focus(); return;}
		
		if(check_submit){	
			if (subCodeInsValidation()) {
				$.ajax({
					type : 'post',
					url : '/codeInsertAjax.do/'+subInsType+'.do',
					data : queryString, 			
					dataType : 'json',
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error: function(xhr, status, error){
						alert(error);
					},
					success : function(success){
						alert('코드가 등록되었습니다.');
						$('#subCodeInsClose').click();
						var url;
						if(success.insType == 'possession'){
							url = '/orgPossessionListAjax.do'
						}else if(success.insType == 'era'){
							url = '/countryEraListAjax.do'
						}else if(success.insType == 'material2'){
							url = '/materialListAjax.do'
						}else if(success.insType == 'storage-type2'){
							url = '/storageTypeListAjax.do'
						}else if(success.insType == 'storage'){
							url = '/storageListAjax.do'
						}
						
						if(success.insType == 'storage'){
							$.ajax({
								type : 'POST',                 
								url : url,   
								data : queryString , 	
								dataType : "html",           
								contentType : "application/x-www-form-urlencoded;charset=UTF-8",
								error : function() {        
									alert('통신실패!');
								},
								success : function(data) {  
		 							$('#tab-content').empty().append(data);
			    	    			var icon = "";
					                var company = new Array();
					            	company[0] = {id : "root", parent : "#", text : "보관처", state : {opened:true}};
					            	
					            	$.ajax({
					                        type:'get',
					                        url:'/treelist.do',
					                        dataType:'json',
					                        success: function(data) {
					                                    // 데이터 받아옴
					                            $.each(data.storageCodeVOList, function(idx, item){
					                            	//상위 메뉴 없는경우 root로 부모 메뉴명 변경, 아이콘 설정
					            					if (item.parent_code == null || item.parent_code == '' || item.parent_code == 0){
					            						item.parent_code = "root";
					            						icon = 'jstree-folder';
					            					} else{
					            						icon = 'jstree-file';
					            					}
					                            	
					                                company[idx+1] = {id:item.storage_code_idx, parent:item.parent_code, text:item.storage_nm, icon:icon};
					                            });
					
					                                    // 트리 생성
					                            $('#tree').jstree({
					                                core: {
					                                                data: company    //데이터 연결
					                                    },
					                                    types: {
					                                           'default': {
					                                                'icon': 'jstree-folder'
					                                            }
					                                    },
					                                    plugins: ['wholerow', 'types']
					                             })
					                             .bind('loaded.jstree', function(event, data){
					                                    //트리 로딩 롼료 이벤트
// 					                            		$('#tree').jstree("close_all");
				                        				$('#tree').jstree("deselect_all");
// 				                        				$('#tree').jstree("open_node",subParentCode);
				                        				$('#tree').jstree(true)._open_to(subParentCode);
				                        				$('#'+subParentCode).children('div').addClass('jstree-wholerow-clicked');
				                        				$('#'+subParentCode).attr('aria-selected', true);
				                        				$('#'+subParentCode).children('a').addClass('jstree-clicked');
					                             })
					                             .bind('select_node.jstree', function(event, data){
					                            	 var id = data.instance.get_node(data.selected).id; 
						                         		$.ajax({
						                        			type : 'POST',                
						                        			url : '/storageViewListAjax.do',    
						                    				data:{
						                    					parent_code : id
						                    				},
						                        			dataType : "html",           
						                        			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
						                        			error : function() {          
						                        				alert('통신실패!');
						                        			},
						                        			success : function(data) {  
						                        				$('.user_control_right').empty().append(data);
						                        				
						                        				if(id == "root"){
						                        					$('#subInsParentCode').val(0);
						                        					$('#subModParentCode').val(0);
						                        				}else{
						                        					$('#subInsParentCode').val(id);
						                        					$('#subModParentCode').val(id);
						                        				}
						                        				
						                        			}
						                                })
					                             })
					                             .bind("refresh.jstree", function(e,d) {
					                            		alert('refresh');
					                             })
					
					                        },
					                        error:function (data) {
					                            alert("에러");
					                        }
					                   });
		                     		$.ajax({
		                    			type : 'POST',                
		                    			url : '/storageViewListAjax.do',    
		                				data:{
		                					parent_code : subParentCode
		                				},
		                    			dataType : "html",           
		                    			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
		                    			error : function() {          
		                    				alert('통신실패!');
		                    			},
		                    			success : function(data) {  
		                    				$('.user_control_right').empty().append(data);

		                    				if(subParentCode == "root"){
		                    					$('#subInsParentCode').val(0);
		                    					$('#subModParentCode').val(0);
		                    				}else{
		                    					$('#subInsParentCode').val(subParentCode);
		                    					$('#subModParentCode').val(subParentCode);
		                    				}
		                    				
		                    			}
		                            })
								}
							});
						}else{
							$.ajax({
								type : 'POST',                 
								url : url,   
								data : queryString , 	
								dataType : "html",           
								contentType : "application/x-www-form-urlencoded;charset=UTF-8",
								error : function() {        
									alert('통신실패!');
								},
								success : function(data) {  
									$('#tab-content').empty().append(data);
									if($('#subModParentCode').length){	
										$('#subModParentCode').val(subParentCode);
									}
									if($('#subInsParentCode').length){	
										$('#subInsParentCode').val(subParentCode);
									}
									if($('#subInsParentCodeHtml').length){	
										$('#subInsParentCodeHtml').html(subParentCodeHtml);
									}
									if($('#subModParentCodeHtml').length){	
										$('#subModParentCodeHtml').html(subParentCodeHtml);
									}
								}
							});
						}
					}
				});
			}
		}
	});
	
	<%-- 하위코드 등록 유효성체크 --%>
	var subCodeInsValidation = function() {

		var subInsNm = $('#subInsNm').val();				
		
		if($('#subInsCode').length){	
			var subInsCode = $('#subInsCode').val();			
			
			if (!Boolean(subInsCode)) {
				alert("코드를 입력해주세요.");
				$("#subInsCode").focus();
				return false;
			}	
		}
		
		if (!Boolean(subInsNm)) {
			alert("명칭을 입력해주세요.");
			$("#subInsNm").focus();
			return false;
		}		
		if (!$('#subInsCodeEnabledY').is(":checked") && !$('#subInsCodeEnabledN').is(":checked")) {
			alert("사용 여부를 체크해주세요.");
			return false;
		}

		return true;
	}

	
	
	// 코드 수정폼
	function modFormBtn(value, value2, value3, value4){	
		var code = value;
		var type;
		var idx = value2;
		var nm = value3;
		var enabled = value4;
		
		if(code.indexOf('_')){
			type = code.replace('_', '-');
		}else{
			type = code;
		}
		if($('#modCode')){	
			$('#modCode').attr('name',code+'_code');
		}
		$('#modType').val(type);
		$('#modNm').attr('name',code+'_nm');
		$('#modIdx').val(idx);
		$('#modIdx').attr('name',code+'_code_idx');
		$('#modNm').val(nm);
		if(enabled == 'Y'){
			$('#modCodeEnabledY').prop('checked',true);
			$('#modCodeEnabledN').prop('checked',false);
		}else{
			$('#modCodeEnabledN').prop('checked',true);
			$('#modCodeEnabledY').prop('checked',false);
		}
	}
	
	// 코드 수정
	$(document).on('click', '#modBtn', function(){
		
		var modType = $('#modType').val();
		var queryString = $("form[name=codeModForm]").serialize();
		var check_submit = confirm('코드를 수정하시겠습니까?');

		if(check_submit){	
			if (codeModValidation()) {
				$.ajax({
					type : 'post',
					url : '/codeModAjax.do/'+modType+'.do',
					data : queryString, 			
					dataType : 'json',
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error: function(xhr, status, error){
						alert(error);
					},
					success : function(success){
						alert('코드가 수정되었습니다.');
						$('#codeModClose').click();
						var url;
						if(success.modType == 'org'){
							url = '/orgPossessionListAjax.do'
						}else if(success.modType == 'country'){
							url = '/countryEraListAjax.do'
						}else if(success.modType == 'material1'){
							url = '/materialListAjax.do'
						}else if(success.modType == 'storage-type1'){
							url = '/storageTypeListAjax.do'
						}else if(success.modType == 'icao' || success.modType =='class1' || success.modType =='class2' || success.modType =='class3'){
							url = '/taxonomyListAjax.do'
						}else if(success.modType == 'qty-unit' || success.modType =='existence' || success.modType =='measurement' || success.modType =='measurement-unit' || success.modType =='condition' || success.modType =='ranking' || success.modType =='ggnuri' || success.modType =='speciality'){
							url = '/basicInforListAjax.do'
						}else if(success.modType == 'obtainment' || success.modType =='price-unit' || success.modType =='measurement' || success.modType =='purchase1' || success.modType =='purchase2'){
							url = '/obtainmentListAjax.do'
						}
						$.ajax({
							type : 'POST',                 
							url : url,   
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
	
	<%-- 코드 수정 유효성체크 --%>
	var codeModValidation = function() {

		var modNm = $('#modNm').val();				
		
		if($('#modCode').length){	
			var modCode = $('#modCode').val();			
			
			if (!Boolean(modCode)) {
				alert("코드를 입력해주세요.");
				$("#modCode").focus();
				return false;
			}	
		}
		
		if (!Boolean(modNm)) {
			alert("명칭을 입력해주세요.");
			$("#modNm").focus();
			return false;
		}		
		if (!$('#modCodeEnabledY').is(":checked") && !$('#modCodeEnabledN').is(":checked")) {
			alert("사용 여부를 체크해주세요.");
			return false;
		}

		return true;
	}
	
	
	// 하위코드 수정폼

	function modSubFormBtn(value, value2, value3, value4){	
		var code = value;
		var type;
		var idx = value2;
		var nm = value3;
		var enabled = value4;
		
		if(code.indexOf('_')){
			type = code.replace('_', '-');
		}else{
			type = code;
		}

		$('#subModType').val(type);
		$('#subModNm').attr('name',code+'_nm');
		$('#subModIdx').val(idx);
		
		$('#subModNm').val(nm);
		if(enabled == 'Y'){
			$('#subModCodeEnabledY').prop('checked',true);
			$('#subModCodeEnabledN').prop('checked',false);
		}else{
			$('#subModCodeEnabledN').prop('checked',true);
			$('#subModCodeEnabledY').prop('checked',false);
		}
	}
	
	// 국적/시대 하위코드 수정폼

	function modEraSubFormBtn(value, value2, value3, value4, value5, value6){	
		var code = value;
		var type;
		var idx = value2;
		var nm = value3;
		var enabled = value4;
		var start_year = value5;
		var end_year = value6;
		
		if(code.indexOf('_')){
			type = code.replace('_', '-');
		}else{
			type = code;
		}

		$('#subModType').val(type);
		$('#subModNm').attr('name',code+'_nm');
		$('#subModIdx').val(idx);
		$('#subModStart').val(start_year);
		$('#subModEnd').val(end_year);
		$('#subModNm').val(nm);
		if(enabled == 'Y'){
			$('#subModCodeEnabledY').prop('checked',true);
			$('#subModCodeEnabledN').prop('checked',false);
		}else{
			$('#subModCodeEnabledN').prop('checked',true);
			$('#subModCodeEnabledY').prop('checked',false);
		}
	}
	// 하위코드 수정
	$(document).on('click', '#subModBtn', function(){
		var subParentCode = $('#subModParentCode').val();
		var subParentCodeHtml = $('#subModParentCodeHtml').html();
		var subModIdx = $('#subModIdx').val();
		var subModType = $('#subModType').val();
		var queryString = $("form[name=subCodeModForm]").serialize();
		var check_submit = confirm('코드를 수정하시겠습니까?');

		if(check_submit){	
			if (subCodeModValidation()) {
				$.ajax({
					type : 'post',
					url : '/codeModAjax.do/'+subModType+'.do',
					data : queryString, 			
					dataType : 'json',
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error: function(xhr, status, error){
						alert(error);
					},
					success : function(success){
						alert('코드가 수정되었습니다.');
						$('#subModClose').click();
						var url;
						if(success.modType == 'possession'){
							url = '/orgPossessionListAjax.do'
						}else if(success.modType == 'era'){
							url = '/countryEraListAjax.do'
						}else if(success.modType == 'material2'){
							url = '/materialListAjax.do'
						}else if(success.modType == 'storage-type2'){
							url = '/storageTypeListAjax.do'
						}else if(success.modType == 'storage'){
							url = '/storageListAjax.do'
						}
						
						if(success.modType == 'storage'){
							$.ajax({
								type : 'POST',                 
								url : url,   
								data : queryString , 	
								dataType : "html",           
								contentType : "application/x-www-form-urlencoded;charset=UTF-8",
								error : function() {        
									alert('통신실패!');
								},
								success : function(data) {  
									$('#tab-content').empty().append(data);
									
									var icon = "";
					                var company = new Array();
					            	company[0] = {id : "root", parent : "#", text : "보관처", state : {opened:true}};
					            	
					            	$.ajax({
					                        type:'get',
					                        url:'/treelist.do',
					                        dataType:'json',
					                        success: function(data) {
					                                    // 데이터 받아옴
					                            $.each(data.storageCodeVOList, function(idx, item){
					                            	//상위 메뉴 없는경우 root로 부모 메뉴명 변경, 아이콘 설정
					            					if (item.parent_code == null || item.parent_code == '' || item.parent_code == 0){
					            						item.parent_code = "root";
					            						icon = 'jstree-folder';
					            					} else{
					            						icon = 'jstree-file';
					            					}
					                            	
					                                company[idx+1] = {id:item.storage_code_idx, parent:item.parent_code, text:item.storage_nm, icon:icon};
					                            });
					
					                                    // 트리 생성
					                            $('#tree').jstree({
					                                core: {
					                                                data: company    //데이터 연결
					                                    },
					                                    types: {
					                                           'default': {
					                                                'icon': 'jstree-folder'
					                                            }
					                                    },
					                                    plugins: ['wholerow', 'types']
					                             })
					                             .bind('loaded.jstree', function(event, data){
					                                    //트리 로딩 롼료 이벤트
					                            		$('#tree').jstree("close_all");
				                        				$('#tree').jstree("deselect_all");
				                        				$('#tree').jstree(true)._open_to(subModIdx);
				                        				$('#'+subParentCode).children('div').addClass('jstree-wholerow-clicked');
				                        				$('#'+subParentCode).attr('aria-selected', true);
				                        				$('#'+subParentCode).children('a').addClass('jstree-clicked');
					                             })
					                             .bind('select_node.jstree', function(event, data){
					                            	 var id = data.instance.get_node(data.selected).id; 
						                         		$.ajax({
						                        			type : 'POST',                
						                        			url : '/storageViewListAjax.do',    
						                    				data:{
						                    					parent_code : id
						                    				},
						                        			dataType : "html",           
						                        			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
						                        			error : function() {          
						                        				alert('통신실패!');
						                        			},
						                        			success : function(data) {  
						                        				$('.user_control_right').empty().append(data);
						                        				
						                        				if(id == "root"){
						                        					$('#subInsParentCode').val(0);
						                        					$('#subModParentCode').val(0);
						                        				}else{
						                        					$('#subInsParentCode').val(id);
						                        					$('#subModParentCode').val(id);
						                        				}
						                        				
						                        			}
						                                })
					                             })
					                             .bind("refresh.jstree", function(e,d) {
					                            		alert('refresh');
					                             })
					
					                        },
					                        error:function (data) {
					                            alert("에러");
					                        }
					                   });
					            	
		                     		$.ajax({
		                    			type : 'POST',                
		                    			url : '/storageViewListAjax.do',    
		                				data:{
		                					parent_code : subParentCode
		                				},
		                    			dataType : "html",           
		                    			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
		                    			error : function() {          
		                    				alert('통신실패!');
		                    			},
		                    			success : function(data) {  
		                    				$('.user_control_right').empty().append(data);
		                    				
		                    				if(subParentCode == "root"){
		                    					$('#subInsParentCode').val(0);
		                    					$('#subModParentCode').val(0);
		                    				}else{
		                    					$('#subInsParentCode').val(subParentCode);
		                    					$('#subModParentCode').val(subParentCode);
		                    				}
		                    				
		                    			}
		                            })
								}
							});
						}else{
							$.ajax({
								type : 'POST',                 
								url : url,   
								data : queryString , 	
								dataType : "html",           
								contentType : "application/x-www-form-urlencoded;charset=UTF-8",
								error : function() {        
									alert('통신실패!');
								},
								success : function(data) {  
									$('#tab-content').empty().append(data);
									$('#subModParentCode').val(subParentCode);
									$('#subInsParentCode').val(subParentCode);
			    	    			$('#subInsParentCodeHtml').html(subParentCodeHtml);
			    	    			$('#subModParentCodeHtml').html(subParentCodeHtml);
								}
							});
						}
					}
				});
			}
		}
	});
	
	<%-- 하위코드 수정 유효성체크 --%>
	var subCodeModValidation = function() {

		var subModNm = $('#subModNm').val();				
		
		if($('#subModCode').length){	
			var subModCode = $('#subModCode').val();			
			
			if (!Boolean(subModCode)) {
				alert("코드를 입력해주세요.");
				$("#subModCode").focus();
				return false;
			}	
		}
		
		if (!Boolean(subModNm)) {
			alert("명칭을 입력해주세요.");
			$("#subModNm").focus();
			return false;
		}		
		if (!$('#subModCodeEnabledN').is(":checked") && !$('#subModCodeEnabledY').is(":checked")) {
			alert("사용 여부를 체크해주세요.");
			return false;
		}

		return true;
	}
	
	<%-- 순서변경 --%>
	function updateSeq(value1, value2, value3, value4){

		var codeIdx = value1;
		var seq = value2;
		var updateType = value3;
		var modType = value4;
		
		if(modType.indexOf('_')){
			modType = modType.replace('_', '-');
		}else{
			modType = modType;
		}

		$('#seqModCodeIdx').attr('name',value4+'_code_idx');		
		$('#seqModCodeIdx').val(codeIdx);
		$('#seqModSeq').val(seq);
		$('#seqUpdateType').val(updateType);

		if(modType =='possession' || modType == 'era' || modType == 'material2' || modType == 'storage-type2' || modType == 'storage'){	
			var subParentCode = $('#subModParentCode').val();
			var subParentCodeHtml = $('#subModParentCodeHtml').html();
			
			$('#seqModParentCode').attr('name',$('#subModParentCode').attr('name'));
			$('#seqModParentCode').val(subParentCode);
		}else{
			$('#seqModParentCode').removeAttr('name');
		}
		var queryString = $("form[name=seqModForm]").serialize();
			
		if(codeIdx == 0){
			alert('순서를 변경할 수 없습니다.');
			return false;
		}
		
		$.ajax({
			type : 'post',
			url : '/updateSeqAjax/'+modType+'.do',
			data : queryString,
			dataType : 'json',
			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
			error: function(xhr, status, error){
				alert(error);
			},
			success : function(success){

				var url;
				if(success.modType == 'org' || success.modType == 'possession'){
					url = '/orgPossessionListAjax.do'
				}else if(success.modType == 'country' || success.modType == 'era'){
					url = '/countryEraListAjax.do'
				}else if(success.modType == 'material1' || success.modType == 'material2'){
					url = '/materialListAjax.do'
				}else if(success.modType == 'storage-type1' || success.modType == 'storage-type2'){
					url = '/storageTypeListAjax.do'
				}else if(success.modType == 'icao' || success.modType =='class1' || success.modType =='class2' || success.modType =='class3'){
					url = '/taxonomyListAjax.do'
				}else if(success.modType == 'qty-unit' || success.modType =='existence' || success.modType =='measurement' || success.modType =='measurement-unit' || success.modType =='condition' || success.modType =='ranking' || success.modType =='ggnuri' || success.modType =='speciality'){
					url = '/basicInforListAjax.do'
				}else if(success.modType == 'obtainment' || success.modType =='price-unit' || success.modType =='measurement' || success.modType =='purchase1' || success.modType =='purchase2'){
					url = '/obtainmentListAjax.do'
				}else if(success.modType == 'storage'){
					url = '/storageListAjax.do'
				}
				if(success.modType == 'possession' || success.modType == 'era' || success.modType == 'material2' || success.modType == 'storage-type2'){
					$.ajax({
						type : 'POST',                 
						url : url,   
						data : queryString , 	
						dataType : "html",           
						contentType : "application/x-www-form-urlencoded;charset=UTF-8",
						error : function() {        
							alert('통신실패!');
						},
						success : function(data) {  
							$('#tab-content').empty().append(data);
							$('#subModParentCode').val(subParentCode);
							$('#subInsParentCode').val(subParentCode);
	    	    			$('#subInsParentCodeHtml').html(subParentCodeHtml);
	    	    			$('#subModParentCodeHtml').html(subParentCodeHtml);
						}
					});
				}else if(success.modType == 'storage'){
					$.ajax({
						type : 'POST',                 
						url : url,   
						data : queryString , 	
						dataType : "html",           
						contentType : "application/x-www-form-urlencoded;charset=UTF-8",
						error : function() {        
							alert('통신실패!');
						},
						success : function(data) {  
							$('#tab-content').empty().append(data);
							var icon = "";
			                var company = new Array();
			            	company[0] = {id : "root", parent : "#", text : "보관처", state : {opened:true}};
			            	
			            	$.ajax({
			                        type:'get',
			                        url:'/treelist.do',
			                        dataType:'json',
			                        success: function(data) {
			                                    // 데이터 받아옴
			                            $.each(data.storageCodeVOList, function(idx, item){
			                            	//상위 메뉴 없는경우 root로 부모 메뉴명 변경, 아이콘 설정
			            					if (item.parent_code == null || item.parent_code == '' || item.parent_code == 0){
			            						item.parent_code = "root";
			            						icon = 'jstree-folder';
			            					} else{
			            						icon = 'jstree-file';
			            					}
			                            	
			                                company[idx+1] = {id:item.storage_code_idx, parent:item.parent_code, text:item.storage_nm, icon:icon};
			                            });
			
			                                    // 트리 생성
			                            $('#tree').jstree({
			                                core: {
			                                                data: company    //데이터 연결
			                                    },
			                                    types: {
			                                           'default': {
			                                                'icon': 'jstree-folder'
			                                            }
			                                    },
			                                    plugins: ['wholerow', 'types']
			                             })
			                             .bind('loaded.jstree', function(event, data){
			                                    //트리 로딩 롼료 이벤트
			                            		$('#tree').jstree("close_all");
		                        				$('#tree').jstree("deselect_all");
		                        				$('#tree').jstree(true)._open_to(codeIdx);
		                        				$('#'+subParentCode).children('div').addClass('jstree-wholerow-clicked');
		                        				$('#'+subParentCode).attr('aria-selected', true);
		                        				$('#'+subParentCode).children('a').addClass('jstree-clicked');
			                             })
			                             .bind('select_node.jstree', function(event, data){
			                            	 var id = data.instance.get_node(data.selected).id; 
				                         		$.ajax({
				                        			type : 'POST',                
				                        			url : '/storageViewListAjax.do',    
				                    				data:{
				                    					parent_code : id
				                    				},
				                        			dataType : "html",           
				                        			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				                        			error : function() {          
				                        				alert('통신실패!');
				                        			},
				                        			success : function(data) {  
				                        				$('.user_control_right').empty().append(data);
				                        				
				                        				if(id == "root"){
				                        					$('#subInsParentCode').val(0);
				                        					$('#subModParentCode').val(0);
				                        				}else{
				                        					$('#subInsParentCode').val(id);
				                        					$('#subModParentCode').val(id);
				                        				}
				                        				
				                        			}
				                                })
			                             })
			                             .bind("refresh.jstree", function(e,d) {
			                            		alert('refresh');
			                             })
			
			                        },
			                        error:function (data) {
			                            alert("에러");
			                        }
			                   });
                     		$.ajax({
                    			type : 'POST',                
                    			url : '/storageViewListAjax.do',    
                				data:{
                					parent_code : subParentCode
                				},
                    			dataType : "html",           
                    			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
                    			error : function() {          
                    				alert('통신실패!');
                    			},
                    			success : function(data) {  
                    				$('.user_control_right').empty().append(data);

                    				if(subParentCode == "root"){
                    					$('#subInsParentCode').val(0);
                    					$('#subModParentCode').val(0);
                    				}else{
                    					$('#subInsParentCode').val(subParentCode);
                    					$('#subModParentCode').val(subParentCode);
                    				}
                    				
                    			}
                            })
						}
					});
				}else{
					$.ajax({
						type : 'POST',                 
						url : url,   
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
			}
		});

	}
	
  </script>
  </head>

  <body data-sidebar="dark">
    <!-- <body data-layout="horizontal"> -->
	<form action="" method="post" name="seqModForm">
		<input type="hidden" name="" id="seqModCodeIdx"/>
		<input type="hidden" name="seq" id="seqModSeq"/>
		<input type="hidden" name="updateType" id="seqUpdateType"/>
		<input type="hidden" name="" id="seqModParentCode"/>
	</form>
    <!-- Begin page -->
    <div id="layout-wrapper">
 	
 	<jsp:include page="../../common/inc/headerContent.jsp" />
      <!-- ============================================================== -->
      <div class="main-content">
        <!-- 환경설정 코드관리 시작 -->
        <div class="page-content">
          <div class="tap_text">
            <h2>환경설정</h2>
            <p>환경설정 > <span>코드관리</span></p>
          </div>
          <div class="fr_wrap">
            <div class="mb-3 row fr_1"></div>
            <!--  -->
          </div>
          <!-- 내용물 -->
          <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
              <a class="nav-link" data-bs-toggle="tab" href="#code-tap-1" role="tab" id="orgPossessionMgr">
                <span class="d-block d-sm-none"><i class="far fa-user"></i></span>
                <span class="d-none d-sm-block">기관/소장구분코드</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-bs-toggle="tab" href="#code-tap-2" role="tab" id="taxonomyMgr">
                <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span>
                <span class="d-none d-sm-block">분류체계코드</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-bs-toggle="tab" href="#code-tap-3" role="tab" id="countryEraMgr">
                <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span>
                <span class="d-none d-sm-block">국적/시대코드</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-bs-toggle="tab" href="#code-tap-4" role="tab" id="materialMgr">
                <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span>
                <span class="d-none d-sm-block">재질코드</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-bs-toggle="tab" href="#code-tap-5" role="tab" id="basicInforMgr">
                <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span>
                <span class="d-none d-sm-block">기본정보코드</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-bs-toggle="tab" href="#code-tap-6" role="tab" id="obtainmentMgr">
                <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span>
                <span class="d-none d-sm-block">입수정보코드</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-bs-toggle="tab" href="#code-tap-7" role="tab" id="storageTypeMgr">
                <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span>
                <span class="d-none d-sm-block">보관구분코드</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-bs-toggle="tab" href="#code-tap-8" role="tab" id="storageMgr">
                <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span>
                <span class="d-none d-sm-block">보관처코드</span>
              </a>
            </li>
          </ul>
          <form>
          
          </form>
          <!-- Tab panes -->
          <div class="tab-content p-3 text-muted" id="tab-content">
            <!-- 코드등록 모달창 -->
            <div id="code_insert_modal-1" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none" aria-hidden="true">
              <div class="modal-dialog user-modal">
                <div class="modal-content">
                  <div class="modal-header mv-modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body mv-modal-body">
                    <div class="mb-0 user-wrap">
                      <div class="st_wrap">
                        <label class="col-md-2 col-form-label st_title">코드 등록</label>
                      </div>
                      <div class="card-body">
                        <div class="table-responsive">
                          <table class="table mb-0">
                            <tbody>
                              <tr>
                                <td>코드</td>
                                <td>
                                  <input type="text" />
                                  <button>중복체크</button>
                                </td>
                              </tr>
                              <tr>
                                <td>명칭</td>
                                <td>
                                  <input type="text" />
                                </td>
                              </tr>
                              <tr>
                                <td>사용여부</td>
                                <td><input type="checkbox" name="" id="" />사용 <input type="checkbox" name="" id="" />미사용</td>
                              </tr>
                            </tbody>
                          </table>
                          <button class="btn btn-secondary btn_save">저장</button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- 코드등록 모달창 2 -->
            <div id="code_insert_modal-2" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none" aria-hidden="true">
              <div class="modal-dialog user-modal">
                <div class="modal-content">
                  <div class="modal-header mv-modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body mv-modal-body">
                    <div class="mb-0 user-wrap">
                      <div class="st_wrap">
                        <label class="col-md-2 col-form-label st_title">코드 등록</label>
                      </div>
                      <div class="card-body">
                        <div class="table-responsive">
                          <table class="table mb-0">
                            <tbody>
                              <tr>
                                <td>상위코드</td>
                                <td>테스트</td>
                              </tr>
                              <tr>
                                <td>코드</td>
                                <td>
                                  <input type="text" />
                                  <button>중복체크</button>
                                </td>
                              </tr>
                              <tr>
                                <td>명칭</td>
                                <td>
                                  <input type="text" />
                                </td>
                              </tr>
                              <tr>
                                <td>사용여부</td>
                                <td><input type="checkbox" name="" id="" />사용 <input type="checkbox" name="" id="" />미사용</td>
                              </tr>
                            </tbody>
                          </table>
                          <button class="btn btn-secondary btn_save">저장</button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- 코드등록 모달창 3-1 (국적,재질,기본정보,입수정보,보관구분 1단계) -->
            <div id="code_insert_modal-3-1" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none" aria-hidden="true">
              <div class="modal-dialog user-modal">
                <div class="modal-content">
                  <div class="modal-header mv-modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body mv-modal-body">
                    <div class="mb-0 user-wrap">
                      <div class="st_wrap">
                        <label class="col-md-2 col-form-label st_title">코드 등록</label>
                      </div>
                      <div class="card-body">
                        <div class="table-responsive">
                          <table class="table mb-0">
                            <tbody>
                              <tr>
                                <td>명칭</td>
                                <td>
                                  <input type="text" />
                                </td>
                              </tr>
                              <tr>
                                <td>사용여부</td>
                                <td><input type="checkbox" name="" id="" />사용 <input type="checkbox" name="" id="" />미사용</td>
                              </tr>
                            </tbody>
                          </table>
                          <button class="btn btn-secondary btn_save">저장</button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- 코드등록 모달창 3-2 -->
            <div id="code_insert_modal-3-2" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none" aria-hidden="true">
              <div class="modal-dialog user-modal">
                <div class="modal-content">
                  <div class="modal-header mv-modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body mv-modal-body">
                    <div class="mb-0 user-wrap">
                      <div class="st_wrap">
                        <label class="col-md-2 col-form-label st_title">코드 등록</label>
                      </div>
                      <div class="card-body">
                        <div class="table-responsive">
                          <table class="table mb-0">
                            <tbody>
                              <tr>
                                <td>상위코드</td>
                                <td>테스트</td>
                              </tr>
                              <tr>
                                <td>명칭</td>
                                <td>
                                  <input type="text" />
                                </td>
                              </tr>
                              <tr>
                                <td>연도</td>
                                <td><input type="text" />~<input type="text" /></td>
                              </tr>
                              <tr>
                                <td>사용여부</td>
                                <td><input type="checkbox" name="" id="" />사용 <input type="checkbox" name="" id="" />미사용</td>
                              </tr>
                            </tbody>
                          </table>
                          <button class="btn btn-secondary btn_save">저장</button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>


 
 


 
 
          </div>
          <!--  -->
        </div>
        <!-- 모달창(팝업창) 모음 -->

        <!--  -->
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
<!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
  </body>
</html>
