<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     

          <!-- Tab panes -->
          <div class="tab-content p-3 text-muted">
            <!--  -->
            <!-- 상세검색 모달 내용 -->
<div id="TagModal-1" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none" aria-hidden="true">
  <div class="modal-dialog user-modal search_detail_modal">
    <div class="modal-content">
      <div class="modal-header mv-modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="metaDataDetailSearchListCloseBtn"></button>
      </div>
      <div class="modal-body mv-modal-body">
        <div class="mb-0 user-wrap">
          <div class="st_wrap">
            <label class="col-md-2 col-form-label st_title">상세검색</label>
          </div>
          <div class="card-body">
            <div class="table-responsive">             
               <form id="metaDataDetailSearchListForm" name="metaDataDetailSearchListForm" method="post" class="form-horizontal">            	
	              <table class="table mb-0">
	                <tbody>
	                  <tr id="keyword1">
	                    <td class="detail_search_modal_width_1">검색어</td>
	                    <td class="detail_search_modal_width_1">
	                      <select class="form-select st_select img-select" name="search_type" id="search_type">
	                        <option value="" selected>전체</option>
	                        <option value="item_nm">명칭</option>
	                        <option value="item_se_nm">이명칭</option>
	                        <option value="item_eng_nm">영문명칭</option>
	                        <option value="keyword">키워드</option>
	                      </select>
	                    </td>
	                    <td>
	                      <input class="form-control st_input" type="text" name="detail_search_word1" id="detail_search_word1" />
	                    </td>
	                    <td>
	                      <select class="form-select st_select img-select" id="searchOperator1" name="pSrchfAndOr1">
	                        <option value="" selected aria-label="복수검색">복수검색</option>
	                        <option value="AND" aria-label="AND">AND</option>
	                        <option value="OR" aria-label="OR">OR</option>
	                      </select>
	                    </td>
	                  </tr>
	                  <tr id="keyword2" style="display:none;">
	                    <td>검색어</td>
	                    <td>
	                      <select class="form-select st_select img-select" name="search_type2" id="search_type2">
	                        <option value="" selected>전체</option>
	                        <option value="item_nm">명칭</option>
	                        <option value="item_se_nm">이명칭</option>
	                        <option value="item_eng_nm">영문명칭</option>
	                        <option value="keyword">키워드</option>
	                      </select>
	                    </td>
	                    <td>
	                      <input class="form-control st_input" type="text" name="detail_search_word2" id="detail_search_word2" />
	                    </td>
	                    <td>
	                      <select class="form-select st_select img-select" id="searchOperator2" name="pSrchAndOr2">
	                        <option value="" selected aria-label="복수검색">복수검색</option>
	                        <option value="AND" aria-label="AND">AND</option>
	                        <option value="OR" aria-label="OR">OR</option>
	                      </select>
	                    </td>
	                  </tr>
	                  <tr id="keyword3" style="display:none;">
	                    <td>검색어</td>
	                    <td>
	                      <select class="form-select st_select img-select" name="search_type3" id="search_type3">
	                        <option value="" selected>전체</option>
	                        <option value="item_nm">명칭</option>
	                        <option value="item_se_nm">이명칭</option>
	                        <option value="item_eng_nm">영문명칭</option>
	                        <option value="keyword">키워드</option>
	                      </select>
	                    </td>
	                    <td>
	                      <input type="text" name="detail_search_word3" id="detail_search_word3" />
	                    </td>
	                    <td>
	                    </td>
	                  </tr>
	                  <tr>
	                    <td>검색 범위</td>
	                    <td>
	                      <select class="form-select st_select img-select" name="search_range" id="search_range">
	                        <option value="" selected>전체</option>
	                        <c:forEach var="possesionList" items="${possesionList}">
	                        	<option value="${possesionList.possession_code_idx }">${possesionList.possession_nm }</option>
	                        </c:forEach>
	                      </select>
	                    </td>
	                    <td>자료번호</td>
	                    <td class="table_2nd_row_wrap"><input class="form-control st_input" type="text" name="start_item_no" id="start_item_no" /><input class="form-control st_input" type="text" name="end_item_no" id="end_item_no" /></td>
	                  </tr>
	                  <tr>
	                    <td colspan="1">검색옵션</td>
	                    <td colspan="3"></td>
	                  </tr>
	                  <tr>
	                    <td colspan="1">
	                    	<input type="checkbox" name="country" id="country" />국적
	                    </td>
	                    <td colspan="3">
	                    	<c:forEach var="countryList" items="${countryList}">
	                      		<input type="checkbox" class="country" name="country" id="c${countryList.country_code_idx}" value="${countryList.country_code_idx}"/>${countryList.country_nm}
	                    	</c:forEach>
	                    </td>
	                  </tr>
	                  <tr>
	                    <td colspan="1">
	                    	<input type="checkbox" name="material1" id="material1" />재질
	                    </td>
	                    <td colspan="3">
	                    	<c:forEach var="material1List" items="${material1List}">
	                      		<input type="checkbox" class="material1" name="material1" id="m${material1List.material1_code_idx}" value="${material1List.material1_code_idx}" />${material1List.material1_nm}
	                 		</c:forEach>
	                    </td>
	                  </tr>
	                </tbody>
	              </table>
              	</form>      
            </div>
          </div>
        </div>
               <div class="user_in_modal_footer_wrap">
                  <input class="custom_btn btn_707070 user_in_modal_footer_btn" type="reset" class=""></input>
                  <button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" onClick="metaDataDetailSearchList();" id="search">검색</button>
               </div>
      </div>
    </div>
  </div>
</div>
<!--  -->
			<form id="excelForm" name="excelForm" method="post" class="form-horizontal">
			   <input type="hidden" name="search_type" id="search_type_temp" />
           	   <input type="hidden" name="search_type2" id="search_type2_temp" />
           	   <input type="hidden" name="search_type3" id="search_type3_temp" />
           	   <input type="hidden" name="detail_search_word1" id="detail_search_word1_temp" />
           	   <input type="hidden" name="detail_search_word2" id="detail_search_word2_temp" />
           	   <input type="hidden" name="detail_search_word3" id="detail_search_word3_temp" />
           	   <input type="hidden" name="pSrchfAndOr1" id="searchOperator1_temp" />
           	   <input type="hidden" name="pSrchfAndOr2" id="searchOperator2_temp" />
           	   <input type="hidden" name="search_range" id="search_range_temp" />
 			   <input type="hidden" name="start_item_no" id="start_item_no_temp" />
               <input type="hidden" name="end_item_no" id="end_item_no_temp" />               	               
			</form>
               <input type="hidden" name="country" id="country_temp"/>
               <input type="hidden" name="material1" id="material1_temp"/>
               
            <div class="tab-pane" id="profile" role="tabpanel" style="display:block;">
              <!-- 리스트 출력~ 분류별 검색 입력 창 -->
              <form id="metaDataSearchListForm" name="metaDataSearchListForm" method="post" class="form-horizontal" onsubmit="return false">

	              <div class="st_wrap st_mv_wrap search_input_wrap">
	                <div class="search_left">
	                  리스트 출력
	                  <select class="search_select" id="perPageNum" name="perPageNum">
	                      <option value="10">10</option>
	                      <option value="15">15</option>
	                      <option value="20">20</option>
	                  </select>
	                  결과내 재검색 <input type="checkbox" id="research_word" name="research_word"/>
	                  <input type="hidden" id="researched_word" name="researched_word"/>
	                  <input class="custom_search_input" list="datalistOptions" placeholder="검색어를 입력해 주세요." id="search_word" name="search_word" onkeypress="if( event.keyCode == 13 ){metaDataSearchList();}"/>
	                  <input type="hidden" id="searched_word" name="searched_word"/>
	                  <button class="custom_btn btn_707070" type="button" onClick="metaDataSearchList();">검색</button>
	                  <button class="custom_btn btn_707070" type="button" data-bs-toggle="modal" data-bs-target="#TagModal-1">상세검색</button>
	                </div>
	<!--                 <div class="search_right"> -->
	<!--                   <select class="form-select"> -->
	<!--                     <option disabled="" selected="">자료 전체</option> -->
	<!--                     <option>더미1</option> -->
	<!--                     <option>더미2</option> -->
	<!--                     <option>더미3</option> -->
	<!--                   </select> -->
	<!--                   <select class="form-select"> -->
	<!--                     <option disabled="" selected="">정렬</option> -->
	<!--                     <option>더미1</option> -->
	<!--                     <option>더미2</option> -->
	<!--                     <option>더미3</option> -->
	<!--                   </select> -->
	<!--                   <button>분류별검색</button> -->
	<!--                 </div> -->
	              </div>
              </form>
              <!--  -->
              <div class="search_btn_wrap" style="width: 1200px;">
                <div class="search_btn_left">
                 <button class="custom_btn btn_c57283" type="button" data-bs-toggle="modal" data-bs-target="#LikeModal">관심자료등록</button>
<!--                  <button class="custom_btn btn_c28876" type="button">항목 추가 및 삭제</button> -->
                </div>
                <div class="search_btn_right">
                	<button type="button" class="custom_btn btn_707070" style="display:none;">사용자 지정양식 인쇄</button>
	                <button type="button" class="custom_btn btn_707070" onclick="content_print()">목록 인쇄</button>
	                <button class="custom_btn btn_ex" type="button" onClick="metaDataSearchListExcelList();">엑셀파일</button>
                </div>
              </div>
              <!-- 관심자료 모달창 -->
              <div id="LikeModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered user_in_modal_wrap">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <p>선택 자료를 관심자료로 등록 하시겠습니까?</p>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-primary waves-effect waves-light" id="interestInsBtn">확인</button>
                      <button type="button" class="btn btn-secondary waves-effect" data-bs-dismiss="modal" id="interestInsBtnClose">취소</button>
                    </div>
                  </div>
                </div>
              </div>
              <!--  -->
              <div class="mb-0" style="width: 1200px;">
                <div id="UserModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none" aria-hidden="true">
                  <div class="modal-dialog user-modal">
                    <div class="modal-content">
                      <div class="modal-header mv-modal-header">
                        <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body mv-modal-body">
                        <!-- 사용자 등록 모달 내용 -->
                        <div class="mb-0 user-wrap">
                          <div class="st_wrap">
                            <label class="col-md-2 col-form-label st_title">사용자 수정</label>
                          </div>
                          <div class="card-body">
                            <div class="table-responsive">
                              <table class="table mb-0">
                                <tbody>
                                  <tr>
                                    <td>사용자ID</td>
                                    <td>
                                      <input type="text" />
                                    </td>
                                  </tr>

                                  <tr>
                                    <td>사용자명</td>
                                    <td>
                                      <input type="text" />
                                    </td>
                                  </tr>
                                  <tr>
                                    <td>그룹명</td>
                                    <td>
                                      <select class="form-select st_select">
                                        <option disabled selected>그룹 없음</option>
                                        <option>더미1</option>
                                        <option>더미2</option>
                                        <option>더미3</option>
                                      </select>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td>비고</td>
                                    <td>
                                      <input type="text" />
                                    </td>
                                  </tr>
                                </tbody>
                              </table>
                              <button class="btn btn-secondary btn_save">저장</button>
                            </div>
                          </div>
                        </div>
                        <!--  -->
                      </div>
                    </div>
                  </div>
                </div>
                <!--  -->
                <div class="card-body" id="dataDiv">
                  <div class="table-responsive">
                    <table class="table mb-0 tbh">
                      <thead>
                        <tr class="tr_bgc">
                          <th id="checkbox1"><input type="checkbox" id="allCheck" value="" onchange="agreeAllCheck();"></th>
                          <th>번호</th>
                          <th>대표이미지</th>
                          <th>소장구분</th>
                          <th>자료번호</th>
                          <th>세부번호</th>
                          <th>명칭</th>
                          <th>ICAO</th>
                          <th>주수량</th>
                        </tr>
                      </thead>
                      <tbody id="gallery">
	                       <c:forEach var="metaDataSearchList" items="${metaDataSearchList}">
		                        <tr>
		                          <td id="checkbox2">
		                             <input type="checkbox" name="group_seqList" class="check_temp" id="" value="${metaDataSearchList.item_idx}">
		                          </td>
		                          <td>${perPageNum + 1 - metaDataSearchList.rnum}</td>
		                          <td>
		                            <div class="search_img_wrap">
		                              	<c:choose>
		                             		<c:when test="${metaDataSearchList.thumbnail_nm ne null}">
		                             		 	 <img src="<c:url value='${metaDataSearchList.image_path}thumbnails/${metaDataSearchList.thumbnail_nm}'/>" alt="이미지" onerror="this.onerror=null; this.src='/assets/images/no_image.png';"/>
		                            		</c:when>
		                            		<c:otherwise>
		                            			<img src="/assets/images/no_image.png" alt="이미지">
		                            		</c:otherwise>
		                            	</c:choose>
		                            </div>
		                          </td>
		                          <td onclick="quickView('${metaDataSearchList.item_idx}');">${metaDataSearchList.possession_nm}</td>
		                          <td>${metaDataSearchList.item_no}</td>
		                          <td>${metaDataSearchList.item_detail_no}</td>
		                          <td><a onclick="metaDataListView('${metaDataSearchList.possession_code_idx}','${metaDataSearchList.org_code_idx}','${metaDataSearchList.item_no}','${metaDataSearchList.item_detail_no}','Y')">${metaDataSearchList.item_nm}</a></td>
		                          <td>${metaDataSearchList.icao_nm}</td>
		                          <td>${metaDataSearchList.qty}</td>
		                        </tr>
		                    </c:forEach>
                      </tbody>
                    </table>
                    <ul class="btn-group pagination">
					    <c:if test="${pageMaker.prev }">
					    <li class="page-item">
					        <a class="page-link" href='javascript:;' onclick="goPage('${pageMaker.startPage-1 }');"><i class="fa fa-chevron-left"></i></a>
					    </li>
					    </c:if>
					    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
					    <li class="page-item">
					        <a class="page-link" href='javascript:;' onclick="goPage('${pageNum}');"><i class="fa">${pageNum }</i></a>
					    </li>
					    </c:forEach>
					    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
					    <li class="page-item">
					        <a class="page-link" href="javascript:;" onclick="goPage('${pageMaker.endPage+1 }');"><i class="fa fa-chevron-right"></i></a>
					    </li>
					    </c:if>
					</ul> 
                  </div>
                </div>
              </div>
              <!-- 숫자 버튼  -->
<!--               <nav aria-label="Page navigation example"> -->
<!--                 <ul class="pagination"> -->
<!--                   <li class="page-item"> -->
<!--                     <a class="page-link" href="#" aria-label="Previous"> -->
<!--                       <i class="mdi mdi-chevron-left"></i> -->
<!--                     </a> -->
<!--                   </li> -->
<!--                   <li class="page-item"><a class="page-link" href="#">1</a></li> -->
<!--                   <li class="page-item"><a class="page-link" href="#">2</a></li> -->
<!--                   <li class="page-item"><a class="page-link" href="#">3</a></li> -->
<!--                   <li class="page-item"> -->
<!--                     <a class="page-link" href="#" aria-label="Next"> -->
<!--                       <i class="mdi mdi-chevron-right"></i> -->
<!--                     </a> -->
<!--                   </li> -->
<!--                 </ul> -->
<!--               </nav> -->
			<form action="" name="metaDataListViewForm" id="metaDataListViewForm" method="post">
				<input type="hidden" name="possession_code_idx" id="possession_code_idx" />
				<input type="hidden" name="org_code_idx" id="org_code_idx" />
				<input type="hidden" name="item_no" id="item_no" />
				<input type="hidden" name="item_detail_no" id="item_detail_no" />
				<input type="hidden" name="reg_state" id="reg_state" value="Y"/>
			</form>
            </div>
            
            <script type="text/javascript">
            $(function(){
            	gallery = new Viewer(document.getElementById('gallery'));
            	qty();
            	$('#search_word').focus();
            })
            
            function qty(){
	            var totalQty = 0;
	            var currentQty = 0;
	            <c:forEach var="metaDataSearchList2" items="${metaDataSearchList2}" varStatus="varStatus">
	            	<c:if test="${!empty metaDataSearchList2.qty}"> 
	            		totalQty += ${metaDataSearchList2.qty};
	            	</c:if>
	            	<c:if test="${!empty metaDataSearchList2.current_qty}"> 
	            	 	currentQty += ${metaDataSearchList2.current_qty};
	            	</c:if>
	            </c:forEach>
	            $('#totalNum').html("| 총건수 : "+${perPageNum});
				$('#totalQty').html("| 총수량 : "+totalQty);
				$('#currentQty').html("| 현수량 : "+currentQty+" |");
            }
            <%-- 페이지 이동 --%>
    		function goPage(value) {
    			var perPageNum = $('#perPageNum').val();
    			var search_word = $('#search_word').val();
				var page = value;
    			var research_word;
    			var searched_word;
    			
//     	    	if($('#search_word').val()){
//     	    		search_word =$('#search_word').val();
//        			}
//     	    	if($('#searched_word').val()){
//     	    		searched_word = $('#searched_word').val();
//     	    	}
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
    			$.ajax({
    				type : 'POST',                 
    				url : '/metaDataSearchListAjax.do',   
    				data:{
    					perPageNum : perPageNum,
						searched_word : searched_word,
						research_word : research_word,
    					search_word : search_word,
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
    					page : page
    				},
    				dataType : "html",           
    				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
    				error : function() {        
    					alert('통신실패!');
    				},
    				success : function(data) {  
    					$('#tab-content').empty().append(data);
						$('#perPageNum').val(perPageNum);
						$('#searched_word').val(searched_word);
						$('#search_word').val(search_word);
						$('#researched_word').val(researched_word);
						$('#search_type_temp').val(search_type);
						$('#search_type2_temp').val(search_type2);
						$('#search_type3_temp').val(search_type3);
						$('#detail_search_word1_temp').val(detail_search_word1);
						$('#detail_search_word2_temp').val(detail_search_word2);
						$('#detail_search_word3_temp').val(detail_search_word3);
						$('#searchOperator1_temp').val(searchOperator1);
						$('#searchOperator2_temp').val(searchOperator2);
						$('#search_range_temp').val(search_range);
						$('#start_item_no_temp').val(start_item_no);
						$('#end_item_no_temp').val(end_item_no);
						$('#country_temp').val(country);
						$('#material1_temp').val(material1);
    				}
    			});
    		}
    		
    		<%-- 조건 검색 --%>
    		function metaDataSearchList(){
    			var perPageNum = $('#perPageNum').val();
    			var search_word = $('#search_word').val();
				var prevsearched_word;
				var researched_word = '';
				var searched_word;
				var research_word;
				
		        if($("#research_word").is(":checked")){
		        	research_word = 'on';
    				searched_word = $('#searched_word').val();
    				
		        	researched_word = 'checked';
		        	prevsearched_word = $('#searched_word').val();
		        	prevsearch_word = $('#search_word').val();
		        }else{
		        	researched_word = '';
		        }
		        
    			// 태그 조건 검색			
//     			var queryString = $("form[name=metaDataSearchListForm]").serialize();

    				$.ajax({
    					type : 'post',
    					url : '/metaDataSearchListAjax.do',
    					data : {
    						perPageNum : perPageNum,
    						search_word : search_word,
    						searched_word : searched_word,
    						research_word : research_word						
    					},
    					dataType : 'html',
    					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
    					error: function(xhr, status, error){
    						alert(error);
    					},
    					success : function(data){    	    		        
    						$('#tab-content').empty().append(data);
    						$('#perPageNum').val(perPageNum);
    						
    						$('#search_word').val(search_word);
    						if(researched_word != 'checked'){					
    							$('#searched_word').val(search_word);
    						}else{
    							$('#searched_word').val(prevsearched_word);
    							$('#search_word').val(prevsearch_word);
    						}
    						$('#simple_view_wrap').empty();   						
//     						$('#search_type').val(search_type);
    						$('#researched_word').val(researched_word);
    					}
    				});
    		}
    		    		
    		<%-- 상세 검색 --%>
    		function metaDataDetailSearchList(){
				var search_type = $('#search_type').val();
				var search_type2 = $('#search_type2').val();
				var search_type3 = $('#search_type3').val();
    			var detail_search_word1 = $('#detail_search_word1').val();
    			var detail_search_word2 = $('#detail_search_word2').val();
    			var detail_search_word3 = $('#detail_search_word3').val();
    			var searchOperator1 = $('#searchOperator1').val();
    			var searchOperator2 = $('#searchOperator2').val();
    			var search_range = $('#search_range').val();
    			var start_item_no = $('#start_item_no').val();
    			var end_item_no = $('#end_item_no').val();
    			var country = [];
    			var material1 = [];
    			$('.country:checked').each(function(i){
    				country.push($(this).val());
    			});
    			$('.material1:checked').each(function(i){
    				material1.push($(this).val());
    			});
    			
    				$.ajax({
    					type : 'post',
    					url : '/metaDataSearchListAjax.do',
        				data:{
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
       						material1 : material1
        				},
    					dataType : 'html',
    					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
    					error: function(xhr, status, error){
    						alert(error);
    					},
    					success : function(data){   						
    						$('#metaDataDetailSearchListCloseBtn').click();
    						$('#tab-content').empty().append(data);
    						$('#simple_view_wrap').empty();   	
    						$('#search_type_temp').val(search_type);
    						$('#search_type2_temp').val(search_type2);
    						$('#search_type3_temp').val(search_type3);
    						$('#detail_search_word1_temp').val(detail_search_word1);
    						$('#detail_search_word2_temp').val(detail_search_word2);
    						$('#detail_search_word3_temp').val(detail_search_word3);
    						$('#searchOperator1_temp').val(searchOperator1);
    						$('#searchOperator2_temp').val(searchOperator2);
    						$('#search_range_temp').val(search_range);
    						$('#start_item_no_temp').val(start_item_no);
    						$('#end_item_no_temp').val(end_item_no);
    						$('#country_temp').val(country);
    						$('#material1_temp').val(material1);
//     						for(let i = 0; i <country.length; i++){
//     							console.log(country[i])
//     							$('#c'+country[i]).prop('checked', true)
//     						}
//     						for(let i = 0; i <material1.length; i++){
//     							console.log(material1[i])
//     							$('#m'+material1[i]).prop('checked', true)
//     						}
    					}
    				});
    		}
    		function metaDataSearchListExcelList() {
				
    			var $form = $('#excelForm');
    			var research_word;
    			var searched_word;
    			if($('#researched_word').val() == 'checked'){
    				research_word = 'on';
    				 var example_1 = $('<input type="hidden" value="'+research_word+'" name="research_word">');
						 $form.append(example_1);
    			}
				if($('#search_word').val()){
		    		search_word =$('#search_word').val();
		    		 var example_1 = $('<input type="hidden" value="'+search_word+'" name="search_word">');
						 $form.append(example_1);
	   			}
		    	if($('#searched_word').val()){
		    		searched_word = $('#searched_word').val();
		    		var example_1 = $('<input type="hidden" value="'+searched_word+'" name="searched_word">');
						$form.append(example_1);
		    	}
		    	
				var country = [];
    			var material1 = [];
    			var c = 0;
    			var m = 0;
    			if($('#country_temp').val() != ''){
    				 country_temp_input = $('#country_temp').val();
    				 var country_temp = country_temp_input.split(',');
    				 for(let i = 0; i <country_temp.length; i++){					
    						 var example_1 = $('<input type="hidden" value="'+country_temp[i]+'" name="country['+c+']">');
    						 $form.append(example_1);
    						 c += 1;
  					 }

    			}
       			if($('#material1_temp').val() != ''){
	       			material1_temp_input = $('#material1_temp').val();
	       			var material1_temp = material1_temp_input.split(',');
	       			for(let i = 0; i <material1_temp.length; i++){
       						 var example_2 = $('<input type="hidden" value="'+material1_temp[i]+'" name="material1['+m+']">');
       						 $form.append(example_2);
       						 m += 1;
					}
	   			}  

				$form.attr("action", "/metaDataSearchListExcelDownload.do");
				$form.submit();
			
    		}
    		 
 			$('#searchOperator1').on("change", function(){
				$('#keyword2').css("display", "flex");
				
			})
			$('#searchOperator2').on("change", function(){
				$('#keyword3').css("display", "flex");
			})
			
			$('#country').click(function() {
 				var val = true;
 				
 				$('#country').toggleClass("checked");
 				
 				if(!$('#country').attr('class')){
 					val = false;
 				}
 				 $('input[name=country]').each(function() {
 		            this.checked = val;
 		            if(val == true){
 		           	 	$('#country').addClass('checked');
 		            }else{
 		            	$('#country').removeClass('checked');
 		            }
 		        });
		    });
 			
 			$('#material1').click(function() {
 				var val = true;
 				
 				$('#material1').toggleClass("checked");
 				
 				if(!$('#material1').attr('class')){
 					val = false;
 				}
 				 $('input[name=material1]').each(function() {
 		            this.checked = val;
 		            if(val == true){
 		           	 	$('#material1').addClass('checked');
 		            }else{
 		            	$('#material1').removeClass('checked');
 		            }
 		        });
		    });
            </script>
            