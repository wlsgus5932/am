/**
 * Supported Browser : MSIE, Chrome , FireFox
 * 
 * 파일명    : jquery.ajax.js
 * 설명      : ajax 통신을 위한 모듈
 * 작성자    : 이진건
 * 작성일    : 2015. 09. 04
 * 버전      : 1.0
 * 
 * 변경이력
 * 날짜						작성자			설명
 * ==========	========	===========================
 * 2015. 01. 13     		이진건			최초 생성
 */

(function($) {
    
    var defaultTargetAreaID = "changeDiv";
    var defaultAjaxErrorMessage = "일시적인 시스템장애로 요청하신 페이지에 접근하실 수 없습니다.";
    var defaultAjax404ErrorMessage = "페이지를 찾을수 없습니다.";
    var defaultContentType = "application/x-www-form-urlencoded;charset=UTF-8";
    var defaultAjaxErrorTitle = "에러";
    var defaultReturnUrl = "/";
    
  //----------------------------------------------------------------------------------
    // validate set Defaults
    //----------------------------------------------------------------------------------
//    jQuery.validator.setDefaults(
//			{
//				 onkeyup:false
//				, onclick:false
//				, onfocusout:false
//				, ignoreTitle: true
//				, ignore: []
//				, showErrors:function(errorMap, errorList){
//					if(this.numberOfInvalids() && errorList[0] !=null) { // 에러가 있을 때만..
//						var el = $(errorList[0].element);
//						var message = undefined != el.attr("data-label") 
//											&& "" != el.attr("data-label") 
//											&& null != el.attr("data-label") ? "[" + el.attr("data-label") +"] " + errorList[0].message : errorList[0].message ;
//						alert(message);
//						
//						if(undefined != el.attr("data-focus") && "" != el.attr("data-focus") && null != el.attr("data-focus") ){
//							
//							if(0 < oEditors.length && oEditors.getById[el.attr("data-focus")]){
//								oEditors.getById[el.attr("data-focus")].exec("FOCUS"); 
//								return false;
//							}
//							$("#"+el.attr("data-focus")).focus();
//						} else {
//							
//							if(0 < oEditors.length && oEditors.getById[el.attr("id")]){
//								oEditors.getById[el.attr("id")].exec("FOCUS"); 
//								return false;
//							}
//							$("#"+el.attr("id")).focus();
//						}
//			        }
//				}
//			}
//	);
    
    //----------------------------------------------------------------------------------
    // ajaxCall Object 생성
    //----------------------------------------------------------------------------------
    $.ajaxCall = {

        //----------------------------------------------------------------------------------
        // post + html 방식
        //----------------------------------------------------------------------------------    
        post: function(url, formName, targetAreaID, successHandler, validHandler, errorHandler, completeHandler) {
        	startLoading();	//로딩바 시작
        	
            if (!(targetAreaID == undefined || targetAreaID == null || targetAreaID == "")) {
                defaultTargetAreaID = targetAreaID;
            }
            /*
            if ( !(formName == undefined || formName == null || formName == "") ) {
            	if(!$("#" + formName).valid()){
            		endLoading();	//로딩바 중지
            		return false;
            	}
            	
            	//사용자 정의 validate 처리 - 개별처리 할것
    			if (!(validHandler == undefined || validHandler == "" || validHandler == null)) {
    				//validHandler 이 함수일 경우
                	if(typeof(validHandler) == 'function'){
                		if(!validHandler()){
                			endLoading();	//로딩바 중지
                			return false;
                		}
                	//validHandler 명이 string 으로 왔을경우 	
                	}else{
                		if(!window[validHandler]()){
                			endLoading();	//로딩바 중지
                			return false;
                		}
                	}                							
                }
            }
            */
          
			
            var ajaxParam = $("#" + formName).serialize();
            
            console.log("### ajaxCall._ajaxHtml ###");
            $.ajaxCall._ajaxHtml(url, ajaxParam, defaultTargetAreaID, successHandler, errorHandler, completeHandler);
        },
                
        //----------------------------------------------------------------------------------
        // get + html 방식
        //----------------------------------------------------------------------------------    
        get : function(urlData, targetAreaID,successHandler, errorHandler, completeHandler) {
        	
        	startLoading();	//로딩바 시작
           
        	if (!(targetAreaID == undefined || targetAreaID == null || targetAreaID == "")) {
                defaultTargetAreaID = targetAreaID;
            }
            
            var idx = urlData.indexOf('?');
            var url = '';
            var ajaxParam = '';
            if(idx > 0){
                ajaxParam = urlData.substring(idx+1, urlData.length);        
                url = urlData.substring(0, idx);        
            }else{
                ajaxParam = '';
                url = urlData;
            }
            
            $.ajaxCall._ajaxHtml(url, ajaxParam, defaultTargetAreaID,successHandler,errorHandler, completeHandler);
        },

        //----------------------------------------------------------------------------------
        // post + json 방식
        //----------------------------------------------------------------------------------    
        jsonPost: function(url, formName, callback, validHandler, exceptionCallback) {
        	
        	startLoading();	//로딩바 시작
        	
        	/*
        	 if ( !(formName == undefined || formName == null || formName == "") ) {
             	if(!$("#" + formName).valid()){
             		endLoading();	//로딩바 중지
             		return false;
             	}
             	
             	//사용자 정의 validate 처리 - 개별처리 할것
     			if (!(validHandler == undefined || validHandler == "" || validHandler == null)) {
     				//validHandler 이 함수일 경우
                	if(typeof(validHandler) == 'function'){
                		if(!validHandler()){
                			endLoading();	//로딩바 중지
                			return false;
                		}
                	//validHandler 명이 string 으로 왔을경우 	
                	}else{
                		if(!window[validHandler]()){
                			endLoading();	//로딩바 중지
                			return false;
                		}
                	}               							
                 }
             }
        	 */
            var ajaxParam = $("#" + formName).serialize();
            
            $.ajaxCall._ajaxJson(url, ajaxParam, callback, exceptionCallback);
        },
        
        //----------------------------------------------------------------------------------
        // post + json 방식
        //----------------------------------------------------------------------------------    
        json: function(url, data, callback, exceptionCallback) {
        	
        	startLoading();	//로딩바 시작
           
        	$.ajaxCall._ajaxJson(url, data, callback, exceptionCallback);
        },
        
        //----------------------------------------------------------------------------------
        // MultiPart Html 방식
        //----------------------------------------------------------------------------------    
        multiPartHtml: function(url, formName, targetAreaID, successHandler, validHandler, errorHandler, completeHandler) {
        	
        	startLoading();	//로딩바 시작
        	
            if (!(targetAreaID == undefined || targetAreaID == null || targetAreaID == "")) {
                defaultTargetAreaID = targetAreaID;
            }
            /*
            if ( !(formName == undefined || formName == null || formName == "") ) {
            	if(!$("#" + formName).valid()){
            		endLoading();	//로딩바 중지
            		return false;
            	}
            	
            	//사용자 정의 validate 처리 - 개별처리 할것
    			if (!(validHandler == undefined || validHandler == "" || validHandler == null)) {
    				//validHandler 이 함수일 경우
                	if(typeof(validHandler) == 'function'){
                		if(!validHandler()){
                			endLoading();	//로딩바 중지
                			return false;
                		}
                	//validHandler 명이 string 으로 왔을경우 	
                	}else{
                		if(!window[validHandler]()){
                			endLoading();	//로딩바 중지
                			return false;
                		}
                	}                							
                }
            }
            */
            
            $.ajaxCall._ajaxMultiPartHtml(url, formName, defaultTargetAreaID, successHandler, errorHandler, completeHandler);
        },
        
        //----------------------------------------------------------------------------------
        // MultiPart Json 방식
        //----------------------------------------------------------------------------------    
        multiPartJson: function(url, formName, callback, validHandler, exceptionCallback) {
        	
        	startLoading();	//로딩바 시작
        	/*
        	 if ( !(formName == undefined || formName == null || formName == "") ) {
             	if(!$("#" + formName).valid()){
             		endLoading();	//로딩바 중지
             		return false;
             	}
             	
             	//사용자 정의 validate 처리 - 개별처리 할것
     			if (!(validHandler == undefined || validHandler == "" || validHandler == null)) {
     				//validHandler 이 함수일 경우
                	if(typeof(validHandler) == 'function'){
                		if(!validHandler()){
                			endLoading();	//로딩바 중지
                			return false;
                		}
                	//validHandler 명이 string 으로 왔을경우 	
                	}else{
                		if(!window[validHandler]()){
                			endLoading();	//로딩바 중지
                			return false;
                		}
                	}               							
                 }
             }
        	*/
        	$.ajaxCall._ajaxMultiPartJson(url, formName, callback, exceptionCallback);
        },

        //----------------------------------------------------------------------------------
        // html 데이터방식의 실질 함수
        //----------------------------------------------------------------------------------    
        _ajaxHtml : function( url , data, targetAreaID, successHandler, errorHandler, completeHandler){
            $.ajax({
                type            :   "POST",
                url             :   url ,
                dataType        :   "html",
                contentType     :   defaultContentType,
                data            :   data,   
                success         :   successHandler || function(htmlString){
                						endLoading();	//로딩바 중지
                						
                                        //----------------------------------------------------------------------------------
                                        // ajax html 방식은 에러시 에러페이지가 그대로 로딩됨
                                        //----------------------------------------------------------------------------------
                						
                                        $("#" + targetAreaID).empty().append(htmlString);
                                    },
                error           :   function(xhr, ajaxOptions, thrownError){
                						var error_result = null;
                						
                						endLoading();	//로딩바 중지
                						
                						try{
                							error_result = JSON.parse(xhr.responseText);
                						}catch(e){
                							
                							// 404 error 시 JSON.parse 오류남.
                    						if( '404' == xhr.status ){
                    							alert(defaultAjax404ErrorMessage);
                    						} else {
                    							alert(defaultAjaxErrorMessage);
                    						}
                							
                							return false;
                						}
                						
                						var exceptionMessage = !(error_result.exceptionMessage == undefined 
                													|| error_result.exceptionMessage == "" 
                													|| error_result.exceptionMessage == null) ? error_result.exceptionMessage : defaultAjaxErrorMessage;
                						
                						var exceptionRetrunUrl = !(error_result.exceptionReturnUrl == undefined 
                											|| error_result.exceptionReturnUrl == "" 
                											|| error_result.exceptionReturnUrl == null) ? error_result.exceptionReturnUrl : defaultReturnUrl;
                						
                						
                						
                						// 사용자 정의 Error 처리 - 개별처리 할것
                						if (!(errorHandler == undefined || errorHandler == "" || errorHandler == null)) {
                							//errorHandler 가 함수일 경우
                                        	if(typeof(errorHandler) == 'function'){
                                        		errorHandler(error_result);	
                                        	// errorHandler 명이 string 으로 왔을경우
                                        	}else{
                                        		window[errorHandler](error_result);
                                        	}
                						//default Error 처리
                						}else{
                							// 로그인 세션 만료 시 
                    						if('common.00002' == error_result.exceptionCode){	
                    							alert(exceptionMessage);
                    							window.location.href= exceptionRetrunUrl;
                    							return false;
                    						} 
                							alert(exceptionMessage);
                							return false;
                						}
                						
                                    },
                complete        :   completeHandler || function(){
                							endLoading();	//로딩바 중지
                }
            });
        },
                
        //----------------------------------------------------------------------------------
        // json 데이터방식의 실질 함수
        //----------------------------------------------------------------------------------    
        _ajaxJson : function( url, data, callback, exceptionCallback,completeHandler  ){
        	
        	startLoading();	//로딩바 시작
        	
            $.ajax({
                type            :   "POST",
                url             :   url ,
                dataType        :   "json",
                contentType     :   defaultContentType,
                data            :   data,   
                success         :   function(response,status,request){
                	
                							endLoading();	//로딩바 중지
                							
                							var result = JSON.parse(request.responseText);
	                                        // callback 함수가 있을경우
	                                        if (!(callback == undefined || callback == "" || callback == null)) {
	                                            //callback 이 함수일 경우
	                                        	if(typeof(callback) == 'function'){
	                                        		callback(result)
	                                        	//callback 명이 string 으로 왔을경우
	                                        	}else{ 
	                                        		window[callback](result);
	                                        	}
	                                        //callback 함수가 없을경우	
	                                        }else{
	                                            //alert(result.page_Num);
	                                        }
                                    },
                error           :  function(xhr, ajaxOptions, thrownError){
                						var error_result = null;
                						
                						endLoading();	//로딩바 중지
                						
                						try{
                							error_result = JSON.parse(xhr.responseText);
                						}catch(e){
                							
                							// 404 error 시 JSON.parse 오류남.
                    						if( '404' == xhr.status ){
                    							alert(defaultAjax404ErrorMessage);
                    						} else {
                    							alert(defaultAjaxErrorMessage);
                    						}
                							
                							return false;
                						}
                						
                						var exceptionMessage = !(error_result.exceptionMessage == undefined 
                													|| error_result.exceptionMessage == "" 
                													|| error_result.exceptionMessage == null) ? error_result.exceptionMessage : defaultAjaxErrorMessage;
                						
                						
                						var exceptionRetrunUrl = !(error_result.exceptionReturnUrl == undefined 
    											|| error_result.exceptionReturnUrl == "" 
    											|| error_result.exceptionReturnUrl == null) ? error_result.exceptionReturnUrl : defaultReturnUrl;
                						
                		
                                        //사용자 정의 Error 처리 - 개별처리 할것
                						if (!(exceptionCallback == undefined || exceptionCallback == "" || exceptionCallback == null)) {
                							//exceptionCallback 이 함수일 경우
                                        	if(typeof(exceptionCallback) == 'function'){
                                        		exceptionCallback(error_result)
                                        	//callback 명이 string 으로 왔을경우 	
                                        	}else{
                                        		window[exceptionCallback](error_result);
                                        	}                							
                                        //default Error 처리    	
                                        }else{
                                        	// 로그인 세션 만료 시 
                    						if('common.00002' == error_result.exceptionCode){	
                    							alert(exceptionMessage);
                    							window.location.href= exceptionRetrunUrl;
                    							return false;
                    						}
                                        	alert(exceptionMessage);
                                        	return false;
                                        }
                },
                complete        :   completeHandler || function(){
                								endLoading();	//로딩바 중지
                }
            });
        },
        
        //----------------------------------------------------------------------------------
        // MultiPart html 데이터방식의 실질 함수
        //----------------------------------------------------------------------------------    
        _ajaxMultiPartHtml : function( url , formName, targetAreaID, successHandler, errorHandler, completeHandler){
        	
        	$("#" + formName).ajaxSubmit({
        		type            :   "POST",
        		url             :   url ,
        		dataType        :   "html",
        		success         :   successHandler || function(htmlString){
                	
					endLoading();	//로딩바 중지
					
                    //----------------------------------------------------------------------------------
                    // ajax html 방식은 에러시 에러페이지가 그대로 로딩됨
                    //----------------------------------------------------------------------------------                                                
                    $("#" + targetAreaID).empty().append(htmlString);
                },
                error           :   function(xhr, ajaxOptions, thrownError){
					var error_result = null;
					
					endLoading();	//로딩바 중지
					
					try{
						error_result = JSON.parse(xhr.responseText);
					}catch(e){
						
						// 404 error 시 JSON.parse 오류남.
						if( '404' == xhr.status ){
							alert(defaultAjax404ErrorMessage);
						} else {
							alert(defaultAjaxErrorMessage);
						}
						
						return false;
					}
					
					var exceptionMessage = !(error_result.exceptionMessage == undefined 
												|| error_result.exceptionMessage == "" 
												|| error_result.exceptionMessage == null) ? error_result.exceptionMessage : defaultAjaxErrorMessage;
					
					var exceptionRetrunUrl = !(error_result.exceptionReturnUrl == undefined 
										|| error_result.exceptionReturnUrl == "" 
										|| error_result.exceptionReturnUrl == null) ? error_result.exceptionReturnUrl : defaultReturnUrl;
					
					
					
					
					// 사용자 정의 Error 처리 - 개별처리 할것
					if (!(errorHandler == undefined || errorHandler == "" || errorHandler == null)) {
						//errorHandler 가 함수일 경우
                    	if(typeof(errorHandler) == 'function'){
                    		errorHandler(error_result);	
                    	// errorHandler 명이 string 으로 왔을경우
                    	}else{
                    		window[errorHandler](error_result);
                    	}
					//default Error 처리
					}else{
						// 로그인 세션 만료 시 
//						if('common.00002' == error_result.exceptionCode){	
//							alert(exceptionMessage);
//							window.location.href= exceptionRetrunUrl;
//							return false;
//						} 
						alert(exceptionMessage);
						return false;
					}
					
                }
        	});
        },
        
        //----------------------------------------------------------------------------------
        // MultiPart Json 데이터방식의 실질 함수
        //----------------------------------------------------------------------------------    
        _ajaxMultiPartJson : function( url, formName, callback, exceptionCallback,completeHandler  ){
        	startLoading();	//로딩바 시작
        	
        	
        	$("#" + formName).ajaxSubmit({
        		type            :   "POST",
        		url             :   url ,
        		dataType        :   "json",
        		success         :   function(response,status,request){
    			
	    			endLoading();	//로딩바 중지
	    			
	    			var result = JSON.parse(request.responseText);
	    			// callback 함수가 있을경우
	    			if (!(callback == undefined || callback == "" || callback == null)) {
	    				//callback 이 함수일 경우
	    				if(typeof(callback) == 'function'){
	    					callback(result)
	    					//callback 명이 string 으로 왔을경우
	    				}else{ 
	    					window[callback](result);
	    				}
	    				//callback 함수가 없을경우	
	    			}else{
	    				//alert(result.page_Num);
	    			}
	    		},
	    		error           :  function(xhr, ajaxOptions, thrownError){
					var error_result = null;
					
					endLoading();	//로딩바 중지
					
					try{
						//console.log("test=="+xhr.responseText);
						//console.log("test2=="+JSON.parse(xhr.responseText));
						error_result = JSON.parse(xhr.responseText);
					}catch(e){

						// 404 error 시 JSON.parse 오류남.
						if( '404' == xhr.status ){
							alert(defaultAjax404ErrorMessage);
						} else {
							//alert(defaultAjaxErrorMessage);
						}
						
						return false;
					}
					
					var exceptionMessage = !(error_result.exceptionMessage == undefined 
												|| error_result.exceptionMessage == "" 
												|| error_result.exceptionMessage == null) ? error_result.exceptionMessage : defaultAjaxErrorMessage;
					
					
					var exceptionRetrunUrl = !(error_result.exceptionReturnUrl == undefined 
							|| error_result.exceptionReturnUrl == "" 
							|| error_result.exceptionReturnUrl == null) ? error_result.exceptionReturnUrl : defaultReturnUrl;
					
					
					
	
	                //사용자 정의 Error 처리 - 개별처리 할것
					if (!(exceptionCallback == undefined || exceptionCallback == "" || exceptionCallback == null)) {
						//exceptionCallback 이 함수일 경우
	                	if(typeof(exceptionCallback) == 'function'){
	                		exceptionCallback(error_result)
	                	//callback 명이 string 으로 왔을경우 	
	                	}else{
	                		window[exceptionCallback](error_result);
	                	}                							
	                //default Error 처리    	
	                }else{
	                	// 로그인 세션 만료 시 
						if('common.00002' == error_result.exceptionCode){	
							//alert(exceptionMessage+"222"+exceptionRetrunUrl);
							//window.location.href= exceptionRetrunUrl;
							return false;
						} 
	                	alert(exceptionMessage);
	                	return false;
	                }
	    		}
        	});
        }
        
    },
    
    //----------------------------------------------------------------------------------
    // wrapper 함수들
    //----------------------------------------------------------------------------------    
    ajaxCallPost = function(url, formName, targetAreaID, successHandler, validHandler, errorHandler, completeHandler) {
        $.ajaxCall.post(url, formName, targetAreaID, successHandler, validHandler, errorHandler, completeHandler);
    };
    
    ajaxCallGet = function(urlData, targetAreaID,successHandler,errorHandler, completeHandler) {
        $.ajaxCall.get(urlData, targetAreaID,successHandler,errorHandler, completeHandler);
    };
    
    ajaxCallJsonPost = function(url, formName, callback, validHandler, exceptionCallback) {
        $.ajaxCall.jsonPost(url, formName, callback, validHandler, exceptionCallback);
    };

    ajaxCallJson = function(url, data, callback, exceptionCallback) {
        $.ajaxCall.json(url, data, callback, exceptionCallback);
    };
    
    ajaxMultiPartHtml = function(url, formName, targetAreaID, successHandler, validHandler, errorHandler, completeHandler) {
        $.ajaxCall.multiPartHtml(url, formName, targetAreaID, successHandler, validHandler, errorHandler, completeHandler);
    };
    
    ajaxMultiPartJson = function(url, formName, callback, validHandler,exceptionCallback) {
    	$.ajaxCall.multiPartJson(url, formName, callback, validHandler, exceptionCallback);
    };

    //----------------------------------------------------------------------------------
    // private 함수들
    //----------------------------------------------------------------------------------
    //function makeAjaxErrorMessage (defaultAjaxErrorMessage, xhr, ajaxOptions, thrownError){
    //   return defaultAjaxErrorMessage;
    //}
    
    
})(jQuery);