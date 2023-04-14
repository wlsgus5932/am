<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
			  
          <!-- 전문정보 등록현황 탭 -->
          <div class="tab-pane" id="tap-3" role="tabpanel" style="display:block;">
            <div class="fr_wrap">
              <div class="mb-3 row fr_1">
                <form id="specialitySearchForm" name="specialitySearchForm" method="post" class="form-horizontal">                          
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
	                   
	                      <button class="custom_btn btn_707070" type="button" onClick="specialitySearchList();">검색</button>
	                      <button class="custom_btn btn_ex" type="button" onClick="specialityExcelList();">엑셀파일</button>
	                </div>
                 </form>
              </div>
            </div>
            <div class="mb-0">
              <div class="card-body">
                <div class="table-responsive">
                  <!--  -->
                  <table class="table mb-0">
                    <thead>
                      <tr class="tr_bgc">
                        <th>번호</th>
                        <th>기관</th>
                        <th>작성자</th>
                        <th>작성자ID</th>
                        <th>등록수량</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach var="specialityList" items="${specialityList}" varStatus="varStatus">
	                      <tr>
	                        <td>${specialityList.rnum}</td>
	                        <td>${specialityList.org_nm}</td>
	                        <td>${specialityList.member_nm}</td>
	                        <td>${specialityList.reg_user}</td>
	                        <td>${specialityList.count}</td>
	                      </tr>
                      </c:forEach>
                      <tr class="tr_bgc">
                        <th colspan="4">합계</th>
                        <th id="totalCount"></th>
                      </tr>
                    </tbody>
                  </table>
                  <!--  -->
                </div>
            </div>
          </div>
          </div>
          <!--  -->
          <script>
          $(function() {
          	// 자료구분 선택 //
          	$('#org_nm').val('${sessionScope.userSessionOrgCodeNm}');
          	orgCodeChange();
          	////////////////
				
          	//   합계   //
          	var totalCount = 0;
			<c:forEach var="specialityList2" items="${specialityList}" varStatus="varStatus">
				<c:if test="${specialityList2.count ne null}">
					totalCount += ${specialityList2.count};
				</c:if>
			</c:forEach>
			$('#totalCount').html(totalCount);
          	/////////////
          })
          function orgCodeChange() {
				
  			var queryString = $("form[name=specialitySearchForm]").serialize();
  			
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
		function specialitySearchList(){

			// 태그 조건 검색			
			var queryString = $("form[name=specialitySearchForm]").serialize();

				$.ajax({
					type : 'post',
					url : '/statisticsSpecialityAjax.do',
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
		function specialityExcelList() {
			var $form = $('#specialityExcelForm');

			$form.attr("action", "/statisticsSpecialityExcelDownload.do");
			$form.submit();

		}
          </script>