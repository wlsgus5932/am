<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <!-- 등록 전문정보 탭 -->
            <div class="tab-pane" id="messages" role="tabpanel" style="display:block;">
                  <div class="st_wrap">
                    <label class="col-md-2 col-form-label st_title">전문정보검색</label>
                    <form id="rgstrSpecialitySearchForm" name="rgstrSpecialitySearchForm" method="post" class="form-horizontal" style="display: inline;" onsubmit="return false">
	                    <select class="search_select" id="speciality_code_idx" name=speciality_code_idx>
	                       <option value="">전체</option>
	                       <c:forEach var="specialityCodeList" items="${specialityCodeList}">
	                     	 	<option value="${specialityCodeList.speciality_code_idx}">${specialityCodeList.speciality_nm}</option>
	                       </c:forEach>
	                    </select>
	                    <select class="search_select" id="search_type" name="search_type">
	                      <option value="">전체</option>
	                      <option value="item_no">자료번호</option>
	                      <option value="item_detail_no">세부번호</option>
	                      <option value="item_nm">명칭</option>
	                    </select>
	                    <input type="text" class="custom_search_input" list="datalistOptions" placeholder="내용을 입력해 주세요." id="search_word" name="search_word"  onkeypress="if( event.keyCode == 13 ){rgstrSpecialitySearchList();}">
	                    <button class="custom_btn btn_707070" type="button" onClick="rgstrSpecialitySearchList();">조회</button>
                    </form>
                    <button class="custom_btn btn_ex" type="button" onClick="rgstrSpecialityExcelList();">엑셀파일</button>
                </div>              
              
                <div class="mb-0">
                  <!--  -->

                <!--  -->
                
                <!-- 설명 등록모달  -->
                <div id="bs-example-modal-xll" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
                  <div class="modal-dialog user-modal">
	                <div class="modal-content">
	                   <div class="modal-header mv-modal-header">
		                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="interestModBtnClose"></button>
		               </div>
                       <div class="modal-body mv-modal-body">
	                   		 <div class="mb-0 user-wrap">  
                                  <div class="st_wrap">
                                    <label class="col-md-2 col-form-label st_title">전문정보 등록 및 수정</label>
                                  </div>
                                  <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table mb-0">
                                            <tbody>
                                                <tr>
                                                  <td>구분</td>
                                                    <td id="speciality_nm">
                                                    </td>
                                                   <td>제목</td>  
                                                    <td id="title">
                                                    </td>
                                                </tr>
                                                <tr>
                                                  <td>첨부파일</td>
                                                    <td>
	                                                    <a id="file_path">
	                                                    </a>   
	                                                </td>                                                 
                                                </tr>
                                                <tr>
                                                  <td>저작권자</td>
                                                  <td id="copyright">
                                                  </td>
                                                </tr>
                                                <tr>
                                                  <td>내용</td>
                                                  <td id="content">
                                                  </td>
                                                </tr>
                                            </tbody>
                                        </table>
<!--                                         <button type="button" class="btn btn-secondary btn_save" id="spc-add-btn" onclick="submitSpc()">저장</button> -->
<!--                                         <button type="button" class="btn btn-secondary btn_save" id="spc-update-btn" onclick="updateSpeciality()">수정</button> -->
                                    </div>
                                </div>
                              </div>
		             	   </div>
		                </div>
	                </div>
                </div>
                
                <!--  -->
                
                <form id="sForm" name="sForm" method="post" class="form-horizontal">
                	<input type="hidden" id="speciality_code_idx2" name="speciality_code_idx" value="" />
                	<input type="hidden" id="search_type2" name="search_type" value="" />
                	<input type="hidden" id="search_word2" name="search_word" value="" />
	                <div class="card-body">
	                  <div class="table-responsive">
	                    <table class="table mb-0">
	                      <thead>
	                        <tr class="tr_bgc">
	                          <th>번호</th>
	                          <th>일자</th>
	                          <th>소장구분</th>
	                          <th>자료번호</th>
	                          <th>세부번호</th>
	                          <th>명칭</th>
	                          <th>구분</th>
	                          <th>제목</th>
	                        </tr>
	                      </thead>
	                      <tbody>
	                      	<c:forEach var="specialityList" items="${specialityList}">
		                        <tr>
		                          <td>${perPageNum + 1 - specialityList.rnum}</td>
		                          <td>${specialityList.reg_date}</td>
		                          <td>${specialityList.possession_nm}</td>
		                          <td>${specialityList.item_no}</td>
		                          <td>${specialityList.item_detail_no}</td>
		                          <td onclick="rgstrSpecialityListView('${specialityList.speciality_nm}','${specialityList.title}','${specialityList.file_nm}','${specialityList.file_path}','${specialityList.copyright}','${specialityList.content}');">${specialityList.item_nm}</button></td>
		                          <td>${specialityList.speciality_nm}</td>
		                          <td>${specialityList.title}</td>
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
	            </form>  
                <!--  -->
                <button data-bs-toggle="modal" data-bs-target="#bs-example-modal-xll" class="btn btn-secondary waves-effect waves-light btn_ml btn_wh" type="button" style="display:none;" id="rgstrBtn"></button>
                </div>
            </div>
            
            <script>
// 	    		$('input[type="text"]').keydown(function() {
// 		  			  if (event.keyCode === 13) {
// 		  			    event.preventDefault();
// 		  			  };
// 				});
  				$(function(){
  					$('#search_word').focus();
  				})
	    		<%-- 등록전문 조건 검색 --%>
	    		function rgstrSpecialitySearchList(){
	    			var speciality_code_idx = $('#speciality_code_idx').val();
	    			var search_word = $('#search_word').val();
	    			var search_type = $('#search_type').val();
	    			// 태그 조건 검색			
	    			var queryString = $("form[name=rgstrSpecialitySearchForm]").serialize();
	
	    				$.ajax({
	    					type : 'post',
	    					url : '/rgstrSpecialityAjax.do',
	    					data : queryString,
	    					dataType : 'html',
	    					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
	    					error: function(xhr, status, error){
	    						alert(error);
	    					},
	    					success : function(data){
	    						$('#tab-content').empty().append(data);
// 	    						$('#speciality_code_idx').val(speciality_code_idx);
// 	    						$('#search_word').val(search_word);
// 	    						$('#search_type').val(search_type);
	    						$('#speciality_code_idx2').val(speciality_code_idx);
	    						$('#search_word2').val(search_word);
	    						$('#search_type2').val(search_type);
	    					}
	    				});
	    		}
	    		
	    		function rgstrSpecialityExcelList() {
	    			var $form = $('#sForm');

	    				$form.attr("action", "/rgstrExcelDownload.do");
	    				$form.submit();

	    		}
	    		
	    		<%-- 등록 전문정본 페이지 이동 --%>
	    		function goPage(value) {
	    			var perPageNum = $('#perPageNum').val();
	    			var speciality_code_idx = $('#speciality_code_idx2').val();
	    			var search_word = $('#search_word2').val();
	    			var search_type = $('#search_type2').val();
	    			var page = value;
	    			$.ajax({
	    				type : 'POST',                 
	    				url : '/rgstrSpecialityAjax.do',   
	    				data:{
	    					perPageNum : perPageNum,
	    					search_type : search_type,
	    					speciality_code_idx : speciality_code_idx,
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
//     						$('#speciality_code_idx').val(speciality_code_idx);
//     						$('#search_type').val(search_type);
//     						$('#search_word').val(search_word);
    						$('#speciality_code_idx2').val(speciality_code_idx);
    						$('#search_word2').val(search_word);
    						$('#search_type2').val(search_type);
	    				}
	    			});
	    		}
	    		
	    		function rgstrSpecialityListView(value1, value2, value3, value4, value5, value6){
	    			$('#speciality_nm').html(value1);
	    			$('#title').html(value2);
	    			$('#file_path').html(value3);
	    			$('#file_path').attr('onclick', "location.href='"+value4+value3+"'");
	    			$('#copyright').html(value5);
	    			$('#content').html(value6);
	    			
	    			$('#rgstrBtn').click();
	    		}
            </script>