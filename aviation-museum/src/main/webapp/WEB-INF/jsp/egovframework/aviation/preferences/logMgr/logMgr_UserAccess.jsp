<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
            <!-- 사용자 접속로그 -->
            <div class="tab-pane" id="datareview_2" role="tabpanel" style="display:block;">

              <div class="mb-0">
                <div class="fr_wrap">
                	<form id="userAccessLogSearchForm" name="userAccessLogSearchForm" method="post" class="form-horizontal">     
	                  <div class="mb-3 row fr_1">
	                    <div class="col-md-10">
	                      <label class="col-md-2 col-form-label">기간</label>
	                      <input class="search_select" type="date" name="start_reg_date" id="start_reg_date"> ~ <input class="search_select" type="date" name="end_reg_date" id="end_reg_date">
	                      <!--  -->
	                      <label class="col-md-2 col-form-label">상태</label>
	                      <select class="form-select" id="access_type" name="access_type">
	                        <option selected value="">전체</option>
	                        <option value="0">로그인 성공</option>
	                        <option value="1">로그인 실패</option>
	                        <option value="2">로그아웃</option>
	                      </select>
	                    </div>
	                    <div class="col-md-10">
	                      <label class="col-md-2 col-form-label">검색</label>
	                      <select class="form-select" id="search_type" name="search_type">
	                        <option selected value="">전체</option>
	                        <option value="member_nm">사용자명</option>
	                      </select>
	                      <input class="custom_search_input" type="text" id="search_word" name="search_word">
	                      <button class="custom_btn btn_707070" type="button" onClick="userAccessLogSearchList();">조회</button>
	                    </div>
	                  </div>
	                  
                </div>
              </div>
              <!-- -->
              <div class="st_wrap st_mv_wrap">
                <button class="custom_btn btn_ex" type="button" onclick="userAccessExcelList()">엑셀파일</button>
                <div class="all_number_text">총 건수: ${totalCount}건</div>
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
                <div class="card-body">
                  <div class="table-responsive">
                      <table class="table mb-0">
                          <thead>
                              <tr class="tr_bgc">
                                <th>접근일시</th>
                                <th>박물관</th>
                                <th>상태</th>
                                <th>수정자</th>
                                <th>사용자명</th>
                                <th>수정자IP</th>
                              </tr>
                          </thead>
                          <tbody>
                             <c:forEach var="getAccessLogList" items="${getAccessLogList}">
	                              <tr>
	                                <td>${getAccessLogList.access_date }</td>
	                                <td>${getAccessLogList.org_nm }</td>
	                                <td>
	                                	<c:choose>
		                                	<c:when test="${getAccessLogList.access_type eq 0}">
		                               			 로그인 성공
		                               		</c:when>
		                                	<c:when test="${getAccessLogList.access_type eq 1}">
		                               			 로그인 실패
		                               		</c:when>
		                                	<c:when test="${getAccessLogList.access_type eq 2}">
		                               			 로그아웃
		                               		</c:when>		                               				                               		
	                               		</c:choose>
	                                </td>
	                                <td>-</td>
	                                <td>${getAccessLogList.member_nm }</td>
	                                <td>${getAccessLogList.access_ip }</td>
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
            </div>
            <!--  -->
            
            <script>
    		<%-- 사용자 로그 조건 검색 --%>
    		function userAccessLogSearchList(){

    			var queryString = $("form[name=userAccessLogSearchForm]").serialize();
    			var start_reg_date = $('#start_reg_date').val();
    			var end_reg_date = $('#end_reg_date').val();
    			var search_word = $('#search_word').val();
    			var search_type = $('#search_type').val();
    				$.ajax({
    					type : 'post',
    					url : 'userAccessAjax.do',
    					data : queryString,
    					dataType : 'html',
    					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
    					error: function(xhr, status, error){
    						alert(error);
    					},
    					success : function(data){
      						$('#search_start_reg_date').val(start_reg_date);
      						$('#search_end_reg_date').val(end_reg_date);
      						$('#search_search_type').val(search_type);
      						$('#search_search_word').val(search_word);
      						
    						$('#tab-content').empty().append(data);
//     						$('#search_word').val(search_word);
//     						$('#search_type').val(search_type);
    						$('#search_word').focus();
    					}
    				});
    		}
    		<%-- 페이지 이동 --%>
    		function goPage(value) {
//     			var search_word = $('#search_word').val();
//     			var search_type = $('#search_type').val();
    			var page = value;
    			$('#search_page').val(value);
				var queryString = $("form[name=ExcelForm]").serialize();
    		
				$.ajax({
    				type : 'POST',                 
    				url : '/userAccessAjax.do',   
    				data: queryString,
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
    		
    		function userAccessExcelList() {
    			var $form = $('#ExcelForm');
    				$('#search_page').val(1);
    				
    				$form.attr("action", "/userAccessExcelDownload.do");
    				$form.submit();
    		}
            </script>