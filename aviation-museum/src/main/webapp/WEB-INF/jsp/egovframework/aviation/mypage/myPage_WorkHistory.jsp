<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
            <!-- 작업내역 탭 -->
            <div class="tab-pane" id="settings22" role="tabpanel" style="display:block;">
                <div class="mb-0">
                  <div class="st_wrap">
<!--                       <label class="col-md-2 col-form-label st_title">전문정보검색</label> -->
<!--                       <select class="form-select st_select pro_info"> -->
<!--                         <option disabled selected>구분</option> -->
<!--                         <option>더미1</option> -->
<!--                         <option>더미2</option> -->
<!--                         <option>더미3</option> -->
<!--                       </select> -->
<!--                       <select class="form-select st_select pro_info"> -->
<!--                         <option disabled selected>제목</option> -->
<!--                         <option>더미1</option> -->
<!--                         <option>더미2</option> -->
<!--                         <option>더미3</option> -->
<!--                       </select> -->
<!--                       <input class="form-control st_input pro_info" list="datalistOptions" id="exampleDataList" placeholder="내용을 입력해 주세요."> -->
<!--                       <button class="btn btn-secondary waves-effect waves-light btn_ml">조회</button> -->
<!--                       <button type="button" class="btn btn-primary waves-effect waves-light" data-bs-toggle="modal" data-bs-target=".bs-example-modal-xl">자료등록</button> -->
 						 <form id="workHistorySearchForm" name="workHistorySearchForm" method="post" class="form-horizontal">
 						 </form>
 						<button class="custom_btn btn_ex" type="button" onClick="workHistoryExcelList();">엑셀파일</button>
                  </div>
                  
                <!-- 수정 모달창 -->
	            <div id="workHistoryViewModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none" aria-hidden="true">
	            </div>
                <!--  -->
                
                 <button data-bs-toggle="modal" data-bs-target="#workHistoryViewModal" style="display:none;" id="workHistoryViewModalBtn"></button>
                  <div class="card-body">
                    <div class="table-responsive">
                        <table class="table mb-0">
                            <thead>
                                <tr class="tr_bgc">
                                    <th>번호</th>
                                    <th>기관이름</th>
                                    <th>소장구분이름</th>
                                    <th>자료명칭</th>
                                    <th>자료번호</th>
                                    <th>세부번호</th>
                                    <th>작업날짜</th>
                                    <th>보기</th>
                                </tr>
                            </thead>
                            <tbody>
                          	   <c:forEach var="workHistoryList" items="${workHistoryList}">
	                                <tr>
	                                    <th scope="row">${perPageNum + 1 - workHistoryList.rnum}</th>
	                                    <td>
	                                     ${workHistoryList.org_nm}
	                                    </td>
	                                    <td>
	                                      ${workHistoryList.possession_nm}
	                                     </td>
	                                     <td>
	                                      ${workHistoryList.item_nm}
	                                     </td>
	                                     <td>
	                                      ${workHistoryList.item_no}
	                                     </td>
	                                     <td>
	                                      ${workHistoryList.item_detail_no}
	                                     </td>
	                                     <td>
	                                      ${workHistoryList.reg_date}
	                                     </td>	                                                                         
	                                     <td>
	                                      <button class="btn btn-secondary waves-effect waves-light btn_ml btn_wh" onclick="workHistoryViewModal('${workHistoryList.item_idx}')">상세보기</button>
	                                     </td>
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
          </div>
          
          <script>
          		<%-- 페이지 이동 --%>
		  		function goPage(value) {
		  			var perPageNum = $('#perPageNum').val();
// 		  			var search_word = $('#search_word').val();
// 		  			var search_type = $('#search_type').val();
		  			var page = value;
		  			$.ajax({
		  				type : 'POST',                 
		  				url : '/workHistoryAjax.do',   
		  				data:{
		  					perPageNum : perPageNum,
// 		  					search_type : search_type,
// 		  					search_word : search_word,
		  					page : page
		  				},
		  				dataType : "html",           
		  				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
		  				error : function() {        
		  					alert('통신실패!');
		  				},
		  				success : function(data) {  
		  					$('#tab-content').empty().append(data);
		//						$('#perPageNum').val(perPageNum);
		//						$('#search_word').val(search_word);
		//						$('#search_type').val(search_type);
		  				}
		  			});
  				}
          		
          		<%-- 상세 페이지 이동 --%>
		  		function goViewPage(value) {
		  			var perPageNum = $('#perPageNum').val();
		  			var item_idx = $('#item_idx').val();
// 		  			var search_word = $('#search_word').val();
// 		  			var search_type = $('#search_type').val();
		  			var page = value;
		  			$.ajax({
		  				type : 'POST',                 
		  				url : '/workHistoryViewAjax.do',   
		  				data:{
		  					perPageNum : perPageNum,
		  					item_idx : item_idx,
// 		  					search_type : search_type,
// 		  					search_word : search_word,
		  					page : page
		  				},
		  				dataType : "html",           
		  				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
		  				error : function() {        
		  					alert('통신실패!');
		  				},
		  				success : function(data) {  
		  					$('#workHistoryViewModal').empty().append(data);
		  					$('#item_idx').val(item_idx);
		//						$('#perPageNum').val(perPageNum);
		//						$('#search_word').val(search_word);
		//						$('#search_type').val(search_type);
		  				}
		  			});
  				}
		  		
		  		function workHistoryViewModal(value){
		  			var item_idx = value;
		  			console.log(item_idx);
	    			
		  			$.ajax({
	    				type : 'POST',                 
	    				url : '/workHistoryViewAjax.do',   
	    				data:{
	    					item_idx : item_idx
	    				},
	    				dataType : "html",           
	    				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
	    				error : function() {        
	    					alert('통신실패!');
	    				},
	    				success : function(data) {  
	    					$('#workHistoryViewModal').empty().append(data);
	    					$('#item_idx').val(item_idx);
	    					$('#workHistoryViewModalBtn').click();
//     						$('#perPageNum').val(perPageNum);
//     						$('#search_word').val(search_word);
//     						$('#search_type').val(search_type);
	    				}
	    			});
		  		}
		  		
	    		function workHistoryExcelList() {
	    			var $form = $('#workHistorySearchForm');

    				$form.attr("action", "/workHistoryExcelDownload.do");
    				$form.submit();

	    		}
		  		
	    		function workHistoryViewExcelList() {
	    			var $form = $('#workHistoryViewSearchForm');

    				$form.attr("action", "/workHistoryViewExcelDownload.do");
    				$form.submit();

	    		}
          </script>