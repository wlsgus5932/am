<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    
          <!-- 자료카드 (뒤) 탭-->
          <div class="tab-pane" id="tap-2" role="tabpanel" style="display:block;">
             <div class="fr_wrap">
               <div class="mb-3 row fr_1">
               	<form id="dataCardBackSearchForm" name="dataCardBackSearchForm" method="post" class="form-horizontal">           
                  <div class="col-md-10">
               	        <label class="col-md-2 col-form-label">자료구분</label>
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
                      <label class="col-md-2 col-form-label">자료 번호</label>
                      <!-- <div class="col-md-10"> -->
                        <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="exampleDataList" placeholder=""  name="start_item_no">
                        <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="exampleDataList" placeholder=""  name="start_detail_item_no">
                        ~
                        <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="exampleDataList" placeholder="" name="end_item_no">
                        <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="exampleDataList" placeholder="" name="end_detail_item_no">
                        <button class="custom_btn btn_search" type="button" onClick="dataCardBackSearchList();">검색</button>
                  </div>
                 </form>
               </div>
             </div>
             <!--  -->
             <div class="fr_wrap">
               <div class="mb-3 row fr_1">
                 <div class="col-md-10">
                   <label class="col-md-2 col-form-label">자료 건수</label>
                   <input class="custom_search_input" type="text" placeholder="10" readonly="readonly" value="${dataCardBackListTotal}">
                     <label class="col-md-2 col-form-label">페이지 이동</label>
                     <!-- <div class="col-md-10"> -->
                       <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="firstItemNo" placeholder="" readonly="readonly" >
                       <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="firstItemDetailNo" placeholder="" readonly="readonly" >
                       <button class="custom_btn btn_search" type="button" onclick="pageBtn('prev')">이전</button>
                       <div class="page_current_num" id="page_current_num">1</div>
                       /
                       <div class="page_total_num" id="page_total_num">${dataCardBackListTotal}</div>
                       <button class="custom_btn btn_search" type="button" onclick="pageBtn('next')">다음</button>
                       <button class="custom_btn btn_search" onclick="content_print()">인쇄</button>
                 </div>
               </div>
             </div>
             <!--  -->
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
	          	   <c:forEach var="dataCardBackPList" items="${dataCardBackPList}" varStatus="varStatus">
		              <div class="card-body" id="${varStatus.count}">
		               <input type="hidden" id="item_no" value="${dataCardBackPList.item_no}"/>
	              	   <input type="hidden" id="item_detail_no" value="${dataCardBackPList.item_detail_no}"/>
		                <div class="form_preview_wrap">양식 미리보기</div>
		                <div class="main_text">자 료 카 드(뒷면)</div>
		                <table>
		                  <thead>
		                    <tr>
		                      <th colspan="10" class="print_header_text">자료이동현황</th>
		                    </tr>
		                    <tr>
		                      <th>년</th>
		                      <th>월</th>
		                      <th>일</th>
		                      <th>수량</th>
		                      <th>보관구분</th>
		                      <th colspan="3">격납처</th>
		                      <th>보관처</th>
		                      <th>현수량</th>
		                    </tr>
		                  </thead>
		                  <tbody>	                  	
		                  	<c:forEach var="dataCardBacktList" items="${dataCardBacktList}">
		                  		<c:if test="${dataCardBackPList.item_idx eq dataCardBacktList.item_idx}">
			                  	  <tr>
				                      <td>${dataCardBacktList.movement_year}</td>
				                      <td>${dataCardBacktList.movement_month}</td>
				                      <td>${dataCardBacktList.movement_day}</td>
				                      <td>${dataCardBacktList.qty}</td>
				                      <td>${dataCardBacktList.storage_type1_nm}/${dataCardBacktList.storage_type2_nm}</td>
				                      <td></td>
				                      <td></td>
				                      <td></td>
				                      <td>${dataCardBacktList.storage_nm}</td>
				                      <td>${dataCardBacktList.current_qty}</td>
				                    </tr>
			                    </c:if>
			                  </c:forEach>  
		                  </tbody>
		                </table>
		            </div>
	             </c:forEach>       
              </div>
          </div>
          </div>
          <script>
          
	          $(function() {
	          	var current_num = Number($('#page_current_num').html());
	          	
	          	$('.dataDiv').css('display', 'none');
	          	$('#'+current_num).css('display', 'block');

	          	$('#firstItemNo').val($('#'+current_num).find('#item_no').val());
				$('#firstItemDetailNo').val($('#'+current_num).find('#item_detail_no').val());		
	          })
	          function pageBtn(value) {
	          	var type = value;
	          	var dataCardBackListTotal = Number(${dataCardBackListTotal});
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
	          		
	          		if(current_num == dataCardBackListTotal){
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
					
	  			var queryString = $("form[name=dataCardBackSearchForm]").serialize();
	  			
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
	  		<%-- 자료카드(뒤) 조건 검색 --%>
			function dataCardBackSearchList(){
	
				// 태그 조건 검색			
				var queryString = $("form[name=dataCardBackSearchForm]").serialize();
	
					$.ajax({
						type : 'post',
						url : '/dataCardBackListAjax.do',
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