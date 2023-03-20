<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

          <!-- 관심자료관리 탭 시작 -->
            <div class="tab-pane" id="home" role="tabpanel" style="display:block">
              <!-- 선택삭제 모달 -->
              <div id="DelModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-modal="true" role="dialog">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <p>N건의 관심자료를 삭제하시겠습니까?</p>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-primary waves-effect waves-light" id="interestDelBtn">확인</button>
                      <button type="button" class="btn btn-secondary waves-effect" data-bs-dismiss="modal" id="interestDelBtnClose">취소</button>
                    </div>
                  </div>
                </div>
              </div>
              <!--  -->
              	<!-- 수정 모달창 -->
	            <div id="interest_update_modal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none" aria-hidden="true">
	              <div class="modal-dialog user-modal">
	                <div class="modal-content">
	                  <div class="modal-header mv-modal-header">
	                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="interestModBtnClose"></button>
	                  </div>
	                  <div class="modal-body mv-modal-body">
	                    <div class="mb-0 user-wrap">
	                      <div class="st_wrap">
	                        <label class="col-md-2 col-form-label st_title">수정</label>
	                      </div>
	                       <form id="interestModForm" name="interestModForm" method="post" class="form-horizontal">
		                      <input type="hidden" id="interest_idx" name="interest_idx" value="" />
		                      <div class="card-body">
		                        <div class="table-responsive">
		                          <table class="table mb-0">
		                            <tbody>
		                              <tr>
		                                <td id="">설명</td>
		                                <td><input type="text" id="expl" name="expl"/></td>
		                              </tr>
		                            </tbody>
		                          </table>
		                          <button class="btn btn-secondary btn_save" id="interestModBtn" type="button" onClick="interestMod()">저장</button>
		                        </div>
		                      </div>
	                     	</form>
	                    </div>
	                  </div>
	                </div>
	              </div>
	            </div>
                <!--  -->
              <form id="sForm" name="sForm" method="post" class="form-horizontal">
              <div class="st_wrap st_mv_wrap">
                <div class="auto_btn_left">
                  <button data-bs-toggle="modal" data-bs-target="#DelModal" type="button" class="custom_btn btn_707070">선택삭제</button>
                </div>
                <!--  -->
                <div class="img-btn">
                  리스트 출력 갯수 :
                    <select class="search_select" id="perPageNum" name="perPageNum" onchange="interestPageNum();">
                      <option value="10">10</option>
                      <option value="15">15</option>
                      <option value="20">20</option>
                    </select>
<!--                   <button class="custom_btn btn_707070" >항목 추가 및 삭제</button> -->
<!--                   <button class="custom_btn btn_707070" >사용자 지정양식 인쇄</button> -->
                  <button class="custom_btn btn_ex"  type="button" onClick="interestExcelList();">엑셀파일</button>
                </div>
              </div>
              <div class="mb-0">
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
                          <th>설명</th>
                          <th>주수량</th>
                          <th>수정</th>
                        </tr>
                      </thead>
                      <tbody id="gallery">
                        <c:forEach var="interestList" items="${interestList}">
	                        <tr>
	                          <td>
	                            <input type="checkbox" name="group_seqList" class="check_temp" name="" id="" value="${interestList.interest_idx}">
	                          </td>
	                          <td>${perPageNum + 1 - interestList.rnum}</td>
	                          <td>
	                            <div class="search_img_wrap">
	                              <img src="${interestList.image_path}" alt="${interestList.image_path}">
	                            </div>
	                          </td>
	                          <td>${interestList.possession_nm}</td>
	                          <td>${interestList.item_no}</td>
	                          <td>${interestList.item_detail_no}</td>
	                          <td onclick="metaDataListView('${interestList.possession_code_idx}','${interestList.org_code_idx}','${interestList.item_no}','${interestList.item_detail_no}','${interestList.reg_state}')">${interestList.item_nm}</td>
	                          <td>${interestList.expl}</td>
	                          <td>${interestList.qty}</td>
	                          <td><button  data-bs-toggle="modal" data-bs-target="#interest_update_modal" class="custom_btn btn_edit" type="button" onClick="interestModFormBtn('${interestList.interest_idx}','${interestList.expl}')">수정</button></td>
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
              </form>
            <form action="" name="metaDataListViewForm" id="metaDataListViewForm" method="post">
				<input type="hidden" name="possession_code_idx" id="possession_code_idx" />
				<input type="hidden" name="org_code_idx" id="org_code_idx" />
				<input type="hidden" name="item_no" id="item_no" />
				<input type="hidden" name="item_detail_no" id="item_detail_no" />
				<input type="hidden" name="reg_state" id="reg_state" />
			</form>
              <!--  -->
            </div>
            <script>
            const gallery = new Viewer(document.getElementById('gallery'));
	    		<%-- 관심자료 리스트 출력 갯수 --%>
	    		function interestPageNum() {
	    			var perPageNum = $('#perPageNum').val();

	    			$.ajax({
	    				type : 'POST',
	    				url : '/interestAjax.do',
	    				data:{
	    					perPageNum : perPageNum
	    				},
	    				dataType : "html",
	    				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
	    				error : function() {
	    					alert('통신실패!');
	    				},
	    				success : function(data) {
	    					$('#tab-content').empty().append(data);
							$('#perPageNum').val(perPageNum);

	    				}
	    			});

	    		};

	    		function interestExcelList() {
	    			var $form = $('#sForm');

	    				$form.attr("action", "/interestExcelDownload.do");
	    				$form.submit();
	    		}

	    		<%-- 관심자료 페이지 이동 --%>
	    		function goPage(value) {
	    			var perPageNum = $('#perPageNum').val();
	    			var search_word = $('#search_word').val();
	    			var search_type = $('#search_type').val();
	    			var page = value;
	    			$.ajax({
	    				type : 'POST',
	    				url : '/interestAjax.do',
	    				data:{
	    					perPageNum : perPageNum,
	    					search_type : search_type,
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
//     						$('#perPageNum').val(perPageNum);
//     						$('#search_word').val(search_word);
//     						$('#search_type').val(search_type);
	    				}
	    			});
	    		}

				function interestModFormBtn(value1, value2){

	    			var interest_idx = value1;
	    			var expl = value2;
	    			$('#interest_idx').val(interest_idx);
	    			$('#expl').val(expl);

	    		}

	    		function interestMod(){

	    			var queryString = $("form[name=interestModForm]").serialize();

	    				$.ajax({
	    					type : 'post',
	    					url : '/interestModAjax.do',
	    					data : queryString,
	    					dataType : 'json',
	    					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
	    					error: function(xhr, status, error){
	    						alert(error);
	    					},
	    					success : function(data){
	    						alert("수정되었습니다.");
	    						$('#interestModBtnClose').click();
		    						$.ajax({
		    							type : 'POST',
		    							url : '/interestAjax.do',
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
            </script>