<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
          <!-- 이미지통계 탭 -->
          <div class="tab-pane" id="tap-2" role="tabpanel" style="display:block;">
            <div class="fr_wrap">
              <div class="mb-3 row fr_1">
                <div class="col-md-10">
                <form id="imagesSearchForm" name="imagesSearchForm" method="post" class="form-horizontal">                          
	                <div class="col-md-10">
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
	                      <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="start_item_no" placeholder="" name="start_item_no">
	                      <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="start_detail_item_no" placeholder="" name="start_detail_item_no">
	                      ~
	                      <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="end_item_no" placeholder="" name="end_item_no">
	                      <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="end_detail_item_no" placeholder="" name="end_detail_item_no">
	                     
	                     <label class="col-md-2 col-form-label">날짜</label>
	                     <input class="form-control in_date" type="date" id="start_reg_date" name="start_reg_date">
	                     <input class="form-control in_date" type="date" id="end_reg_date" name="end_reg_date">
	                   
	                      <button class="custom_btn btn_707070" type="button" onClick="imagesSearchList();">검색</button>
	                      <button class="custom_btn btn_ex" type="button" onClick="imagesExcelList();">엑셀파일</button>
	                </div>
                 </form>
                </div>
              </div>
            </div>
            <div class="mb-0">
              <div class="card-body">
                <div class="table-responsive">
                  <!--  -->
                  <table class="table mb-0">
                    <thead>
                      <tr class="tr_bgc">
                        <th>연번</th>
                        <th>이미지수량</th>
                        <th>합계</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach var="imagesList" items="${imagesList}" varStatus="varStatus">
	                      <tr>
	                        <td>${varStatus.count}</td>
	                        <td id="${varStatus.count}">${imagesList.imagecount}</td>
	                        <td>${imagesList.count} /
	                        	<c:choose>
		                        	<c:when test="${imagesList.sum ne null}">
		                        		${imagesList.sum}
		                        	</c:when>
		                        	<c:otherwise>
		                        		0
		                        	</c:otherwise>
	                        	</c:choose>
	                        </td>
                      	  </tr>
                      </c:forEach>
                      <tr>
                        <td colspan="2">합계</td>
                        <td id="totalCount"></td>
                      </tr>
                    </tbody>
                  </table>
                  <!--  -->
                </div>
            </div>
          </div>
          </div>
		  <script>
          $(function() {
            	// 자료구분 선택 //
            	$('#org_nm').val('${sessionScope.userSessionOrgCodeNm}');
            	orgCodeChange();
            	////////////////
  				
            	//   합계   //
            	var dataTotalCount = 0;
            	var ImagesTotalCount = 0;
	  			<c:forEach var="imagesList2" items="${imagesList}" varStatus="varStatus">
	  				<c:if test="${imagesList2.count ne null}">
	  					dataTotalCount += ${imagesList2.count};
	  				</c:if>
	  				<c:if test="${imagesList2.sum ne null}">
	  					ImagesTotalCount += ${imagesList2.sum};
	  				</c:if>
	  			</c:forEach>
	  			$('#totalCount').html(dataTotalCount+' / '+ImagesTotalCount);
            	/////////////
            })
            function orgCodeChange() {
  				
    			var queryString = $("form[name=imagesSearchForm]").serialize();
    			
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
  		function imagesSearchList(){

  			// 태그 조건 검색			
  			var queryString = $("form[name=imagesSearchForm]").serialize();

  				$.ajax({
  					type : 'post',
  					url : '/statisticsImagesAjax.do',
  					data : queryString,
  					dataType : 'html',
  					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
  					error: function(xhr, status, error){
  						alert(error);
  					},
  					success : function(data){
  						$('#search_org_nm').val($('#org_nm').val());
  						$('#search_possession_nm').val($('#possession_select').val());
  						$('#search_start_item_no').val($('#start_item_no').val());
  						$('#search_end_item_no').val($('#end_item_no').val());
  						$('#search_start_detail_item_no').val($('#start_detail_item_no').val());
  						$('#search_end_detail_item_no').val($('#end_detail_item_no').val());
  						$('#search_start_reg_date').val($('#start_reg_date').val());
  						$('#search_end_reg_date').val($('#end_reg_date').val());
  						$('#tab-content').empty().append(data);
  						$('#possession_select').empty()
  					}
  				});
  		}
  		function imagesExcelList() {
  			var $form = $('#specialityExcelForm');

  			$form.attr("action", "/statisticsImagesExcelDownload.do");
  			$form.submit();

  		}
		  </script>