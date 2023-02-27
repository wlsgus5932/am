<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
          <!-- Tab panes -->
          <div class="tab-content p-3 text-muted">
            <!--  -->
            <!-- 상세검색 모달 내용 -->
<div id="TagModal-1" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none" aria-hidden="true">
  <div class="modal-dialog user-modal">
    <div class="modal-content">
      <div class="modal-header mv-modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body mv-modal-body">
        <div class="mb-0 user-wrap">
          <div class="st_wrap">
            <label class="col-md-2 col-form-label st_title">상세검색</label>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table mb-0">
                <tbody>
                  <tr>
                    <td>검색어</td>
                    <td>
                      <select class="form-select st_select img-select">
                        <option disabled="" selected="">전체</option>
                        <option>더미1</option>
                        <option>더미2</option>
                        <option>더미3</option>
                      </select>
                    </td>
                    <td>
                      <input type="text" name="" id="" />
                    </td>
                    <td>
                      <select class="form-select st_select img-select">
                        <option disabled="" selected="">복수검색</option>
                        <option>더미1</option>
                        <option>더미2</option>
                        <option>더미3</option>
                      </select>
                    </td>
                  </tr>
                  <tr>
                    <td>검색 범위</td>
                    <td>
                      <select class="form-select st_select img-select">
                        <option disabled="" selected="">정렬</option>
                        <option>더미1</option>
                        <option>더미2</option>
                        <option>더미3</option>
                      </select>
                    </td>
                    <td>자료번호</td>
                    <td><input type="text" /><input type="text" /></td>
                  </tr>
                  <tr>
                    <td colspan="4">검색옵션</td>
                  </tr>
                  <tr>
                    <td colspan="2"><input type="checkbox" name="" id="" />국적</td>
                    <td>
                      <input type="checkbox" name="" id="" />한국 <input type="checkbox" name="" id="" />중국 <input type="checkbox" name="" id="" />일본
                      <input type="checkbox" name="" id="" />아시아 <input type="checkbox" name="" id="" />중동 <input type="checkbox" name="" id="" />아프리카
                      <input type="checkbox" name="" id="" />유럽 <input type="checkbox" name="" id="" />아메리카
                      <input type="checkbox" name="" id="" />오세아니아 <input type="checkbox" name="" id="" />기타
                    </td>
                  </tr>
                  <tr>
                    <td colspan="2"><input type="checkbox" name="" id="" />재질</td>
                    <td>
                      <input type="checkbox" name="" id="" />금속 <input type="checkbox" name="" id="" />유리/보석 <input type="checkbox" name="" id="" />나무
                      <input type="checkbox" name="" id="" />지 <input type="checkbox" name="" id="" />피모 <input type="checkbox" name="" id="" />고무
                      <input type="checkbox" name="" id="" />합성재질 <input type="checkbox" name="" id="" />기타
                    </td>
                  </tr>
                </tbody>
              </table>
              <button class="">초기화</button>
              <button class="">검색</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!--  -->
            <div class="tab-pane" id="profile" role="tabpanel" style="display:block;">
              <!-- 리스트 출력~ 분류별 검색 입력 창 -->
              <form id="metaDataSearchListForm" name="metaDataSearchListForm" method="post" class="form-horizontal">
	              <div class="st_wrap st_mv_wrap search_input_wrap">
	                <div class="search_left">
	                  리스트 출력
	                  <select class="form-select" id="perPageNum" name="perPageNum">
	                      <option value="10">10</option>
	                      <option value="15">15</option>
	                      <option value="20">20</option>
	                  </select>
	                  결과내 재검색 <input type="checkbox" name="" id="" />
	                  <input class="form-control" list="datalistOptions" placeholder="검색어를 입력해 주세요." id="search_word" name="search_word" />
	                  <button type="button" onClick="metaDataSearchList();">검색</button>
	                  <button type="button" data-bs-toggle="modal" data-bs-target="#TagModal-1">상세검색</button>
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
              <div class="search_btn_wrap">
                <div class="search_btn_left">
                 <button data-bs-toggle="modal" data-bs-target="#LikeModal">관심자료등록</button
                  ><button>항목 추가 및 삭제</button>
                </div>
                <div class="search_btn_right"><button>사용자 지정양식 인쇄</button><button>목록 인쇄</button><button>엑셀파일</button></div>
              </div>
              <!-- 관심자료 모달창 -->
              <div id="LikeModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
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
              <div class="mb-0">
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
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table mb-0">
                      <thead>
                        <tr class="tr_bgc">
                          <th><input type="checkbox" id="allCheck" value="" onchange="agreeAllCheck();"></th>
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
                      <tbody>
	                       <c:forEach var="metaDataSearchList" items="${metaDataSearchList}">
		                        <tr>
		                          <td>
		                             <input type="checkbox" name="group_seqList" class="check_temp" name="" id="" value="${metaDataSearchList.item_idx}">
		                          </td>
		                          <td>${perPageNum + 1 - metaDataSearchList.rnum}</td>
		                          <td>
		                            <div class="search_img_wrap">
		                              <img src="${metaDataSearchList.image_path}" alt="${metaDataSearchList.image_path}" />
		                            </div>
		                          </td>
		                          <td onclick="quickView('${metaDataSearchList.item_idx}');">${metaDataSearchList.possession_nm}</td>
		                          <td>${metaDataSearchList.item_no}</td>
		                          <td>${metaDataSearchList.item_detail_no}</td>
		                          <td>${metaDataSearchList.item_nm}</td>
		                          <td>${metaDataSearchList.icao_nm}</td>
		                          <td>${metaDataSearchList.qty}</td>
		                        </tr>
		                    </c:forEach>
                      </tbody>
                    </table>
                    <ul class="btn-group pagination">
					    <c:if test="${pageMaker.prev }">
					    <li>
					        <a href='javascript:;' onclick="goPage('${pageMaker.startPage-1 }');"><i class="fa fa-chevron-left"></i></a>
					    </li>
					    </c:if>
					    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
					    <li>
					        <a href='javascript:;' onclick="goPage('${pageNum}');"><i class="fa">${pageNum }</i></a>
					    </li>
					    </c:forEach>
					    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
					    <li>
					        <a href="javascript:;" onclick="goPage('${pageMaker.endPage+1 }');"><i class="fa fa-chevron-right"></i></a>
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
            </div>
            
            <script type="text/javascript">
            <%-- 페이지 이동 --%>
    		function goPage(value) {
    			var perPageNum = $('#perPageNum').val();
    			var search_word = $('#search_word').val();
//     			var search_type = $('#search_type').val();
    			var page = value;
    			$.ajax({
    				type : 'POST',                 
    				url : '/metaDataSearchListAjax.do',   
    				data:{
    					perPageNum : perPageNum,
//     					search_type : search_type,
    					search_word : search_word,
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
						$('#search_word').val(search_word);
// 						$('#search_type').val(search_type);
    				}
    			});
    		}
    		
    		<%-- 조건 검색 --%>
    		function metaDataSearchList(){
    			var perPageNum = $('#perPageNum').val();
    			var search_word = $('#search_word').val();
//     			var search_type = $('#search_type').val();
    			// 태그 조건 검색			
    			var queryString = $("form[name=metaDataSearchListForm]").serialize();

    				$.ajax({
    					type : 'post',
    					url : '/metaDataSearchListAjax.do',
    					data : queryString,
    					dataType : 'html',
    					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
    					error: function(xhr, status, error){
    						alert(error);
    					},
    					success : function(data){
    						$('#tab-content').empty().append(data);
    						$('#perPageNum').val(perPageNum);
    						$('#search_word').val(search_word);
//     						$('#search_type').val(search_type);
    					}
    				});
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
    			console.log(group_seqList);
    			 
    			var $this = $(this);

    				$.ajax({
    					type : 'POST',                 
    					url : '/interestInsert.do',   
    					dataType : "json",         
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
            </script>
            