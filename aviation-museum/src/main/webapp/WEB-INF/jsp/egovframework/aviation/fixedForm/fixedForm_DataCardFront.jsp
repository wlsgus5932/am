<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         
          <!-- 자료카드 (앞) -->
            <div class="tab-pane" id="tap-1" role="tabpanel" style="display:block;">
              <div class="fr_wrap">
                <div class="mb-3 row fr_1">
                	<form id="dataCardFrontSearchForm" name="dataCardFrontSearchForm" method="post" class="form-horizontal">           
	                  <div class="col-md-10">
	                 		<label class="col-md-2 col-form-label">등록상태</label>
	                 		<select class="search_select custom_search_input_2" name="reg_state" id="reg_state">
	                 			<option value="">전체</option>
	                 			<option value="Y">등록</option>
	                 			<option value="N">가등록</option>
	                 		</select>
	               	        <label class="col-md-2 col-form-label">자료구분</label>
	                         <select class="search_select" name="org_nm" id="org_nm" onChange="orgCodeChange();">
	                         	<option value="">전체</option>
	                             <c:forEach var="getOrgList" items="${getOrgList}">
	                            		 <option value="${getOrgList.org_nm}">${getOrgList.org_nm}</option>
	                      	    </c:forEach>
	                         </select>
	                       <select class="search_select" name="possession_nm" id="possession_select">
	                           	<c:forEach var="getPosSessionList" items="${getPosSessionList}">
	                           		<option value="${getPosSessionList.possession_nm}">${getPosSessionList.possession_nm}</option>        
	                           	</c:forEach>                     
	                       </select>
	                      <label class="col-md-2 col-form-label">자료 번호</label>
	                      <!-- <div class="col-md-10"> -->
	                        <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="exampleDataList" placeholder=""  name="start_item_no">
	                        <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="exampleDataList" placeholder=""  name="start_detail_item_no">
	                        ~
	                        <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="exampleDataList" placeholder="" name="end_item_no">
	                        <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="exampleDataList" placeholder="" name="end_detail_item_no">
	                        <button class="custom_btn btn_707070" type="button" onClick="dataCardFrontSearchList();">검색</button>
	                  </div>
                  </form>
                </div>
              </div>
              <!--  -->
              <div class="fr_wrap">
                <div class="mb-3 row fr_1">
                  <div class="col-md-10">
                    <label class="col-md-2 col-form-label">자료 건수</label>
                    <input class="custom_search_input" type="text" placeholder="10" readonly="readonly" value="${dataCardFrontListTotal}">
                      <label class="col-md-2 col-form-label">페이지 이동</label>
                      <!-- <div class="col-md-10"> -->
                        <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="firstItemNo" placeholder="" readonly="readonly" value="${firstItemNo}">
                        <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="firstItemDetailNo" placeholder="" readonly="readonly" value="${firstDetailItemNo}">
                        <button class="custom_btn btn_707070" type="button" onclick="pageBtn('prev')">이전</button>
                        <div class="page_current_num" id="page_current_num">1</div>
                        /
                        <div class="page_total_num" id="page_total_num">${dataCardFrontListTotal}</div>
                        <button class="custom_btn btn_707070" type="button" onclick="pageBtn('next')">다음</button>
                        <button class="custom_btn btn_707070" onclick="content_print()">인쇄</button>
                  </div>
                </div>
              </div>
              <!--  -->
              <div id="dataDiv">
	              <c:forEach var="dataCardFrontList" items="${dataCardFrontList}" varStatus="varStatus">
		              <div class="mb-0 dataDiv" id="${varStatus.count}" style="page-break-before:always">
		              <input type="hidden" id="item_no" value="${dataCardFrontList.item_no}"/>
	              	  <input type="hidden" id="item_detail_no" value="${dataCardFrontList.item_detail_no}"/>
		                <div class="card-body">
		                  <div class="form_preview_wrap">양식 미리보기</div>
		                  <div class="main_text">자 료 카 드(앞면)</div>
		                  <div class="print_photo_wrap">
                              		<c:choose>
	                             		<c:when test="${dataCardFrontList.thumbnail_nm ne null}">
	                             		 	 <img src="<c:url value='${dataCardFrontList.image_path}thumbnails/${dataCardFrontList.thumbnail_nm}'/>" alt="이미지" onerror="this.onerror=null; this.src='/assets/images/no_image.png';"/>
	                            		</c:when>
	                            		<c:otherwise>
	                            			<img src="/assets/images/no_image.png" alt="이미지">
	                            		</c:otherwise>
	                            	</c:choose>
		                  </div>
		                  <table>
		                    <tbody>
		                      <tr>
		                        <td></td>
		                        <td>재&nbsp;&nbsp;질</td>
		                        <td>${dataCardFrontList.material1_nm}/${dataCardFrontList.material2_nm}/${dataCardFrontList.material_detail}</td>
		                        <td>시&nbsp;&nbsp;대</td>
		                        <td>${dataCardFrontList.era_nm}/${dataCardFrontList.detail_year}</td>
		                      </tr>
		                      <tr>
		                        <td rowspan="1" style="width: 15%;">수장연유</td>
		                        <td colspan="4">${dataCardFrontList.obtainment_nm}</td>
		                      </tr>
		                      <tr>
		                        <td rowspan="2">크기</td>
		                        <td colspan="4">${dataCardFrontList.measurement_nm}/${dataCardFrontList.measurement_value}${dataCardFrontList.measurement_unit_nm}</td>
		                      </tr>
		                      <tr>
		                        <td colspan="4"></td>
		                      </tr>
		                      <tr>
		                        <td rowspan="1">특징</td>
		                        <td colspan="4">${dataCardFrontList.feature}</td>
		                      </tr>

		                      <tr>
		                        <td>사진번호</td>
		                        <td colspan="4">${dataCardFrontList.image_nm}</td>
		                      </tr>
		                    </tbody>
		                  </table>
		              </div>
		            </div>
		          </c:forEach>
	          </div>
            </div>
            
            <script>
            $(function() {
            	var current_num = Number($('#page_current_num').html());
            	// 자료구분 선택
            	$('#org_nm').val('${sessionScope.userSessionOrgCodeNm}');
            	orgCodeChange();
            	////////////
            	$('.dataDiv').css('display', 'none');
            	$('#'+current_num).css('display', 'block');
				
            })
            function pageBtn(value) {
            	var type = value;
            	var dataCardFrontListTotal = Number(${dataCardFrontListTotal});
				var current_num = Number($('#page_current_num').html());
				
				if(type == 'prev'){
					var prev_num = current_num-1;
					
					if(current_num == 1){
						alert('첫 페이지입니다.');
					}else{
						$('#page_current_num').html(current_num-1);
						$('.dataDiv').css('display', 'none');
						$('#'+prev_num).css('display', 'block');
						$('#firstItemNo').val($('#'+prev_num).find('#item_no').val());
						$('#firstItemDetailNo').val($('#'+prev_num).find('#item_detail_no').val());
					}
            	}else{
            		var next_num = current_num+1;
            		
            		if(current_num == dataCardFrontListTotal){
						alert('마지막 페이지입니다.')
					}else{
						$('#page_current_num').html(next_num);
						$('.dataDiv').css('display', 'none');
						$('#'+next_num).css('display', 'block');	
						$('#firstItemNo').val($('#'+next_num).find('#item_no').val());
						$('#firstItemDetailNo').val($('#'+next_num).find('#item_detail_no').val());
					} 
            	}
            }
            function orgCodeChange() {
				
    			var queryString = $("form[name=dataCardFrontSearchForm]").serialize();
    			
				$.ajax({
					type : 'post',
					url : '/requestHistoryPossessionAjax.do',
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
            
    		<%-- 자료카드(앞) 조건 검색 --%>
    		function dataCardFrontSearchList(){

    			// 태그 조건 검색			
    			var queryString = $("form[name=dataCardFrontSearchForm]").serialize();

    				$.ajax({
    					type : 'post',
    					url : '/dataCardFrontListAjax.do',
    					data : queryString,
    					dataType : 'html',
    					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
    					error: function(xhr, status, error){
    						alert(error);
    					},
    					success : function(data){
    						$('#tab-content').empty().append(data);
    						$('#possession_select').empty()

    					}
    				});
    		}
    		    		     
    	
            </script>