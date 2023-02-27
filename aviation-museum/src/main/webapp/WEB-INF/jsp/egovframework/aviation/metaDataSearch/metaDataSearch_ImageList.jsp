<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
          <!-- Tab panes -->
          <div class="tab-content p-3 text-muted">

            <div class="tab-pane" id="messages" role="tabpanel" style="display:block;">
              <!-- 리스트 출력~ 분류별 검색 입력 창 -->
<!--               <div class="st_wrap st_mv_wrap search_input_wrap"> -->
<!--                 <div class="search_left"> -->
<!--                   리스트 출력 -->
<!--                   <select class="form-select"> -->
<!--                     <option disabled="" selected="">자료 전체</option> -->
<!--                     <option>더미1</option> -->
<!--                     <option>더미2</option> -->
<!--                     <option>더미3</option> -->
<!--                   </select> -->
<!--                   결과내 재검색 <input type="checkbox" name="" id="" /> -->
<!--                   <input class="form-control" list="datalistOptions" id="exampleDataList" placeholder="검색어를 입력해 주세요." /> -->
<!--                   <button>검색</button> -->
<!--                 </div> -->
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
<!--               </div> -->
              <!--  -->
              <div class="search_btn_wrap">
                <div class="search_btn_left">
                  <button>전체선택</button><button>선택해지</button><button data-bs-toggle="modal" data-bs-target="#Like2Modal">관심자료등록</button
                  ><button>항목 추가 및 삭제</button>
                </div>
                <div class="search_btn_right"><button>사용자 지정양식 인쇄</button><button>목록 인쇄</button><button>엑셀파일</button></div>
              </div>
              <!-- 관심사료 모달창 -->
              <div id="Like2Modal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <p>선택 자료를 관심자료 등록 하시겠습니까?</p>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-primary waves-effect waves-light">확인</button>
                      <button type="button" class="btn btn-secondary waves-effect" data-bs-dismiss="modal">취소</button>
                    </div>
                  </div>
                </div>
              </div>
              <!--  -->
              <div class="mb-0">
                <!--  -->
                <div class="st_wrap st_mv_wrap">
                  <!--  -->
                  <div class="img-btn">
                    리스트 출력 갯수 :
                    <select class="form-select st_select img-select">
                      <option disabled="" selected="">선택</option>
                      <option>더미1</option>
                      <option>더미2</option>
                      <option>더미3</option>
                    </select>
                    <button>업로드</button>
                    <button>다운로드</button>
                    <button>전체선택</button>
                    <button>선택해지</button>
                    <button>선택삭제</button>
                    <button>엑셀파일</button>
                  </div>
                </div>
                <!--  -->
                <div class="tab-content" id="pills-tabContent">
                                          <!-- 이미지 설명 등록모달  -->
                          <div
                            class="modal fade bs-example-modal-xll"
                            tabindex="-1"
                            aria-labelledby="myExtraLargeModalLabel"
                            style="display: none"
                            aria-hidden="true"
                          >
                            <div class="modal-dialog modal-xl">
                              <div class="modal-content pro-modal-content">
                                <div class="modal-header mv-modal-header">
                                  <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
                                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body mv-modal-body">
                                  <!-- 이미지 설명 모달 내용 -->
                                  <div class="mb-0 move-wrap pro-wrap">
                                    <div class="st_wrap">
                                      <label class="col-md-2 col-form-label st_title">이미지 설명 등록 및 수정</label>
                                    </div>
                                    <div class="card-body">
                                      <input type="text" />
                                    </div>
                                  </div>
                                  <button class="btn btn-secondary btn_save">저장</button>
                                </div>
                              </div>
                            </div>
                          </div>
                          <!--  -->
                   <!--  -->
                  <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                    <table class="table mb-0">
                      <thead>
                        <tr class="tr_bgc">
                          <th>선택</th>
                          <th>번호</th>
                          <th>이미지명</th>
                          <th>파일정보</th>
                          <th>파일경로</th>
                          <th>대표이미지</th>
                          <th>대국민서비스</th>
                          <th>기능</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td><input type="checkbox" /></td>
                          <td>1</td>
                          <td>이미지명</td>
                          <td>000x000</td>
                          <td>파일경로</td>
                          <td>
                            <input type="checkbox" />
                          </td>
                          <td>
                            <input type="checkbox" />
                          </td>
                          <td>
                            <button>원본보기</button>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <!--  -->
                  <div class="tab-pane fade active show" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                    <div class="container text-center">
                      <div class="row row-cols-auto img-row">
                        
                        <c:forEach var="metaDataSearchImageList" items="${metaDataSearchImageList}">
	                        <div class="col img-col">
	                          <div class="img-col-header">
	                             <input type="checkbox" name="group_seqList" class="check_temp" name="" id="" value="${metaDataSearchImageList.image_idx}">
	                            ${metaDataSearchImageList.image_nm}
	                          </div>
	                          <div class="img-col-img-wrap">
	                            <a href="#">
	                              <div class="img-hover-info">
	                                <h4>이미지 설명</h4>
	                                <p>설명없음</p>
	                              </div>
	                              <img src="${metaDataSearchImageList.image_path}" alt="이미지" />
	                            </a>
	                          </div>
	                          <div class="img-col-info">
	                            <dl onclick="imageQuickView('${metaDataSearchImageList.image_idx}');">
	                              <dt>명칭:</dt>
	                              <dd>${metaDataSearchImageList.item_nm}</dd>
	                            </dl>
	                            <dl>
	                              <dt>시간:</dt>
	                              <dd>${metaDataSearchImageList.reg_date}</dd>
	                            </dl>
	                            <dl>
	                              <dt>사이즈:</dt>
	                              <dd>${metaDataSearchImageList.image_width}×${metaDataSearchImageList.image_height}</dd>
	                            </dl>
	                            <dl>
	                              <dt>태그:</dt>
	                              <dd>
	                                <button class="img-tag"><a href="#">${metaDataSearchImageList.tag_nm}</a></button>
	                              </dd>
	                            </dl>
	                            <dl>
	                              <dt><input type="checkbox" name="" id="" /></dt>
	                              <dd>대표</dd>
	                              <dt><input type="checkbox" name="" id="" /></dt>
	                              <dd>대국민 서비스</dd>
	                            </dl>
	                            <dl>
	                              <button class="img-info_btn" data-bs-toggle="modal" data-bs-target=".bs-example-modal-xll">설명등록</button>
	                              <button class="img-info_btn">원문보기</button>
	                            </dl>
	                          </div>
	                        </div>
	                        <!--  -->
						</c:forEach>
                      </div>
                    </div>
                  </div>

                </div>
              </div>
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
              <!-- 그룹 수정 모달 -->
              <div id="GroupModal-2" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none" aria-hidden="true">
                <div class="modal-dialog user-modal">
                  <div class="modal-content">
                    <div class="modal-header mv-modal-header">
                      <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body mv-modal-body">
                      <!-- 그룹 수정 모달 내용 -->
                      <div class="mb-0 user-wrap">
                        <div class="st_wrap">
                          <label class="col-md-2 col-form-label st_title">그룹 수정</label>
                        </div>
                        <div class="card-body">
                          <div class="table-responsive">
                            <table class="table mb-0">
                              <tbody>
                                <tr>
                                  <td>그룹명</td>
                                  <td>
                                    <input type="text" />
                                  </td>
                                </tr>
                                <tr>
                                  <td>비고</td>
                                  <td>
                                    <input type="text" />
                                  </td>
                                </tr>
                                <tr>
                                  <td>관리자 여부</td>
                                  <td><input type="checkbox" />관리자 <input type="checkbox" />일반</td>
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
            </div>
          </div>
          <!--  -->
          <script type="text/javascript">
	            <%-- 페이지 이동 --%>
	    		function goPage(value) {
	    			var perPageNum = $('#perPageNum').val();
	    			var search_word = $('#search_word').val();
	//     			var search_type = $('#search_type').val();
	    			var page = value;
	    			$.ajax({
	    				type : 'POST',                 
	    				url : '/metaDataSearchImageListAjax.do',   
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
    		</script>