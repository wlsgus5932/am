<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
          <!-- 자료대장 탭 -->
          <div class="tab-pane" id="tap-3" role="tabpanel" style="display:block;">
            <div class="fr_wrap">
              <div class="mb-3 row fr_1">
               	<form id="dataLedgerSearchForm" name="dataLedgerSearchForm" method="post" class="form-horizontal">           
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
                        <button class="custom_btn btn_707070" type="button" onClick="dataLedgerSearchList();">검색</button>
                  </div>
                 </form>
              </div>
            </div>

              <!--  -->
              <div class="fr_wrap">
                <div class="mb-3 row fr_1">
                  <div class="col-md-10">
                    <label class="col-md-2 col-form-label">자료 건수</label>
                    <input class="custom_search_input" type="text" placeholder="10" readonly="readonly" value="${dataLedgerListTotal}" id="page_total_num2">
                      <label class="col-md-2 col-form-label">페이지 이동</label>
                      <!-- <div class="col-md-10"> -->
                        <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="exampleDataList" placeholder="" readonly="readonly">
                        <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="exampleDataList" placeholder="" readonly="readonly">
                        <button class="custom_btn btn_707070" type="button" onclick="pageBtn('prev')">이전</button>
                        <div class="page_current_num" id="page_current_num">1</div>
                        /
                        <div class="page_total_num" id="page_total_num"></div>
                        <button class="custom_btn btn_707070" type="button" onclick="pageBtn('next')">다음</button>
                        <button class="custom_btn btn_707070" onclick="ledger_print()">인쇄</button>
                  </div>
                </div>
              </div>


            <div class="mb-0">
              <!-- 엑셀 모달 -->
              <div id="myModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header mv-modal-header">
                            <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body mv-modal-body">
                            <!-- 엑셀 모달 내용 -->
                            <div class="mb-0 move-wrap">
                              <div class="st_wrap">
                                <label class="col-md-2 col-form-label st_title">이동사항 등록 및 수정</label>
                              </div>
                              <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table mb-0">
                                        <tbody>
                                            <tr>
                                              <td>이동일자</td>
                                                <td>
                                                  <select class="form-select st_select">
                                                    <option disabled selected>선택</option>
                                                    <option>더미1</option>
                                                    <option>더미2</option>
                                                    <option>더미3</option>
                                                  </select>
                                                </td>
                                            </tr>
                                            <tr>
                                              <td>보관구분</td>
                                                <td>
                                                  <select class="form-select st_select">
                                                    <option disabled selected>선택</option>
                                                    <option>더미1</option>
                                                    <option>더미2</option>
                                                    <option>더미3</option>
                                                  </select>
                                                </td>
                                                <td>
                                                  <select class="form-select st_select">
                                                    <option disabled selected>선택</option>
                                                    <option>더미1</option>
                                                    <option>더미2</option>
                                                    <option>더미3</option>
                                                  </select>
                                                </td>
                                            </tr>
                                            <tr>
                                              <td>보관처</td>
                                              <td>
                                                <select class="form-select st_select">
                                                  <option disabled selected>선택</option>
                                                  <option>더미1</option>
                                                  <option>더미2</option>
                                                  <option>더미3</option>
                                                </select>
                                              </td>
                                            </tr>
                                            <tr>
                                              <td>반입처</td>
                                              <td>
                                                <select class="form-select st_select">
                                                  <option disabled selected>선택</option>
                                                  <option>더미1</option>
                                                  <option>더미2</option>
                                                  <option>더미3</option>
                                                </select>
                                              </td>
                                            </tr>
                                            <tr>
                                              <td>이동수량</td>
                                              <td>
                                                <select class="form-select st_select">
                                                  <option disabled selected>선택</option>
                                                  <option>더미1</option>
                                                  <option>더미2</option>
                                                  <option>더미3</option>
                                                </select>
                                              </td>
                                              <td>현수량</td>
                                              <td>
                                                <select class="form-select st_select">
                                                  <option disabled selected>선택</option>
                                                  <option>더미1</option>
                                                  <option>더미2</option>
                                                  <option>더미3</option>
                                                </select>
                                              </td>
                                            </tr>
                                            <tr>
                                              <td>격납요청자</td>
                                              <td>
                                                <input class="form-control st_input" type="text" name="" id="">
                                              </td>
                                              <td>실제전시여부</td>
                                              <td> <input type="checkbox" name="" id=""> </td>
                                            </tr>
                                            <tr>
                                              <td>비고</td>
                                              <td>
                                                <input class="form-control st_input" type="text" name="" id="">
                                              </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <button class="btn btn-secondary btn_save">저장</button>
                                </div>
                            </div>
                          </div>
                          <!--  -->
                          <div class="mb-0 move-wrap">
                            <div class="st_wrap">
                              <label class="col-md-2 col-form-label st_title">과거 이동처 코드</label>
                            </div>
                            <div class="card-body">
                              <div class="table-responsive">
                                  <table class="table mb-0">
                                      <thead>
                                          <tr class="tr_bgc">
                                              <th>번호</th>
                                              <th>과거이동처</th>
                                              <th>현수량</th>
                                              <th>입력값선택</th>
                                          </tr>
                                      </thead>
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
                                                  <option disabled selected>선택</option>
                                                  <option>더미1</option>
                                                  <option>더미2</option>
                                                  <option>더미3</option>
                                                </select>
                                              </td>
                                          </tr>
                                      </tbody>
                                  </table>
                              </div>
                          </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
	          <div id="dataDiv">
	          <div class="form_preview_wrap">양식 미리보기</div>
			  <div class="main_text">자 료 대 장</div>   
	            
	              
<%-- 	              <c:if test="${varStatus.index % 5 == 0}"> --%>
	              <div class="dataDiv" id="" >
	             	<c:forEach var="dataLedgerList" items="${dataLedgerList}" varStatus="varStatus"> 
		              <div class="card-body" id="${varStatus.count}">	               			                					                	  	
			                <table>                  
			                    <tr>
			                      <td rowspan="4" style="width: 15%;">자료번호 : ${dataLedgerList.item_no}</td>
			                      <td>명칭</td>
			                      <td>${dataLedgerList.item_nm}</td>
			                      <td style="width:10%;">수량</td>
			                      <td>${dataLedgerList.qty}</td>
			                      <td class="data_ledger_img_wrap" colspan="5" rowspan="7" style="padding: 0;">
                              		<c:choose>
	                             		<c:when test="${dataLedgerList.thumbnail_nm ne null}">
	                             		 	 <img src="<c:url value='${dataLedgerList.image_path}thumbnails/${dataLedgerList.thumbnail_nm}'/>" alt="이미지" onerror="this.onerror=null; this.src='/assets/images/no_image.png';"/>
	                            		</c:when>
	                            		<c:otherwise>
	                            			<img src="/assets/images/no_image.png" alt="이미지">
	                            		</c:otherwise>
	                            	</c:choose>
								  </td>
			                    </tr>
			                    <tr>
			                      <td>국적/시대</td>
			                      <td>${dataLedgerList.country_nm}/${dataLedgerList.era_nm}${dataLedgerList.detail_year}</td>
			                      <td>재질</td>
			                      <td>${dataLedgerList.material1_nm}/${dataLedgerList.material2_nm}/${dataLedgerList.material_detail}</td>
			                    </tr>
			                    <tr>
			                      <td style="width: 25%;">입수일자/연유/처/가격</td>
			                      <td colspan="3">${dataLedgerList.obtainment_date}/${dataLedgerList.obtainment_nm}/${dataLedgerList.obtainment_place}/${dataLedgerList.obtainment_price}</td>
			                    </tr>
			                    <tr>
			                      <td>크기</td>
			                      <td colspan="3">${dataLedgerList.measurement_nm}/${dataLedgerList.measurement_value}${dataLedgerList.measurement_unit_nm}</td>
			                    </tr>
			                    <tr>
			                      <td>특 징</td>
			                      <td colspan="4">${dataLedgerList.feature}</td>
			                    </tr>
		                </table>
		              </div>
		              	 <c:if test="${varStatus.count % 5 == 0 and varStatus.count != 1}">
		              	 	</div><div class="dataDiv" id="" style="page-break-before:always"> 
		              	 </c:if>
		               </c:forEach>
	              </div>
<%-- 	             </c:if> --%>
	          
	        </div>
          </div>
         
          </div>
          <!--  -->
          <script>
         	 $(function() {
         		var cnt = ${dataLedgerListTotal};
         		var pageSize = 5;
         		var pageCount = parseInt(cnt/pageSize) +(cnt%pageSize==0?0:1);
         		
            	// 자료구분 선택
            	$('#org_nm').val('${sessionScope.userSessionOrgCodeNm}');
            	orgCodeChange();
            	////////////
         		
         		$('#page_total_num').html(pageCount);
         		
            	var current_num = Number($('#page_current_num').html());
            	var first_page = (current_num - 1) * pageSize + 1;
            
            	var current_num2 = first_page+1;
            	var current_num3 = first_page+2; 
            	var current_num4 = first_page+3;
            	var current_num5 = first_page+4;
            	
            	$('.card-body').css('display', 'none');
            	$('#'+current_num).css('display', 'block');            	
            	$('#'+current_num2).css('display', 'block');
            	$('#'+current_num3).css('display', 'block');
            	$('#'+current_num4).css('display', 'block');
            	$('#'+current_num5).css('display', 'block');
         	 })
         	 
         	 function pageBtn(value) {
            	var type = value;
            	var dataLedgerListTotal = Number($('#page_total_num').html());
				var current_num = Number($('#page_current_num').html());
				var pageSize = 5;
				
				if(type == 'prev'){
					var prev_num = current_num-1;
					var first_page = (prev_num - 1) * pageSize + 1;
					
                	var current_num2 = first_page+1;
                	var current_num3 = first_page+2; 
                	var current_num4 = first_page+3;
                	var current_num5 = first_page+4;
                	
					if(current_num == 1){
						alert('첫 페이지입니다.');
					}else{
						$('#page_current_num').html(current_num-1);
						$('.card-body').css('display', 'none');
						$('#'+first_page).css('display', 'block');
						$('#'+current_num2).css('display', 'block');
						$('#'+current_num3).css('display', 'block');
						$('#'+current_num4).css('display', 'block');
						$('#'+current_num5).css('display', 'block');						
					}
            	}else{
            		var next_num = current_num+1;
            		var first_page = (next_num - 1) * pageSize + 1;
                    
                	var current_num2 = first_page+1;
                	var current_num3 = first_page+2; 
                	var current_num4 = first_page+3;
                	var current_num5 = first_page+4;
                	
            		if(current_num == dataLedgerListTotal){
						alert('마지막 페이지입니다.')
					}else{
						$('#page_current_num').html(next_num);
						$('.card-body').css('display', 'none');
						$('#'+first_page).css('display', 'block');
						$('#'+current_num2).css('display', 'block');
						$('#'+current_num3).css('display', 'block');
						$('#'+current_num4).css('display', 'block');
						$('#'+current_num5).css('display', 'block');
					}
            	}
            }
            function orgCodeChange() {
				
    			var queryString = $("form[name=dataLedgerSearchForm]").serialize();
    			
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
            
    		<%-- 자료대장 조건 검색 --%>
    		function dataLedgerSearchList(){

    			// 태그 조건 검색			
    			var queryString = $("form[name=dataLedgerSearchForm]").serialize();

    				$.ajax({
    					type : 'post',
    					url : '/dataLedgerListAjax.do',
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