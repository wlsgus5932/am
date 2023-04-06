<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
        <form id="museumExcelForm" name="museumExcelForm" method="post" class="form-horizontal">
		 	   <input type="hidden" name="org_nm" id="msearch_org_nm" />
          	   <input type="hidden" name="possession_nm" id="msearch_possession_nm" />			                              
               <input type="hidden" name="start_reg_date" id="msearch_start_reg_date" />   
               <input type="hidden" name="end_reg_date" id="msearch_end_reg_date" />  	
               <input type="hidden" name="start_reg_date2" id="msearch_start_reg_date2" />   
               <input type="hidden" name="end_reg_date2" id="msearch_end_reg_date2" />       
               <input type="hidden" name="chk_info" id="msearch_chk_info" />        
		</form>
          <!-- 박물관 등록현황 -->
            <div class="tab-pane" id="tap-1" role="tabpanel" style="display:block;">
              <div class="fr_wrap">
                <div class="mb-3 row fr_1">
 				 <form id="museumSearchForm" name="museumSearchForm" method="post" class="form-horizontal">                          
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
	                     
	                     <label class="col-md-2 col-form-label">날짜</label>
	                     <input type="radio" name="chk_info" value="reg_date" id="chk_reg_date">
					     
	                     <select id="select_year" onchange="javascript:lastday();" name="start_reg_date"></select>
						 <select id="select_month" onchange="javascript:lastday();" name="end_reg_date">
						 	<option value="01">01</option>
						 	<option value="02">02</option>
						 	<option value="03">03</option>
						 	<option value="04">04</option>
						 	<option value="05">05</option>
						 	<option value="06">06</option>
						 	<option value="07">07</option>
						 	<option value="08">08</option>
						 	<option value="09">09</option>
						 	<option value="10">10</option>
						 	<option value="11">11</option>
						 	<option value="12">12</option>
						 </select>

	                     <input type="radio" name="chk_info" value="reg_date2" id="chk_reg_date2">
	                     <input class="form-control in_date" type="date" id="start_reg_date2" name="start_reg_date2">
	                     <input class="form-control in_date" type="date" id="end_reg_date2" name="end_reg_date2">
	                   
	                      <button class="custom_btn btn_707070" type="button" onClick="museumSearchList();">검색</button>
	                      <button class="custom_btn btn_ex" type="button" onClick="museumExcelList();">엑셀파일</button>
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
                          <th>기관명</th>
                          <th>구분</th>
                          <th colspan="2">등록수량
                            <br>
                            <div style="display: flex; justify-content: space-around;">
                              <div>건</div>
                              <div>점</div>
                            </div>
                          </th>
                          <th colspan="2">대국민서비스
                            <br>
                            <div style="display: flex; justify-content: space-around;">
                              <div>건</div>
                              <div>점</div>
                            </div>
                          </th>
                          <th>사진자료등록수량</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach var="museumList" items="${museumList}" varStatus="varStatus">
	                        <tr>
	                          <td>${varStatus.count}</td>
	                          <td>${museumList.org_nm}</td>
	                          <td>${museumList.possession_nm}</td>
	                          <td>${museumList.cnt}</td>
	                          <td>${museumList.total}</td>
	                          <td>${museumList.p_cnt}</td>
	                          <td>${museumList.p_total}</td>
	                          <td>${museumList.i_cnt}</td>
	                        </tr>
                        </c:forEach>
                      </tbody>
                      <thead>
                        <tr class="tr_bgc">
                          <th>총합</th>
                          <th></th>
                          <th></th>
                          <th id="cnt"></th>
                          <th id="total"></th>
                          <th id="p_cnt"></th>
                          <th id="p_total"></th>
                          <th id="i_cnt"></th>
                        </tr>
                      </thead>
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
              	var cnt = 0;
              	var total = 0;
              	var p_cnt = 0;
              	var p_total = 0;
              	var i_cnt = 0;
              	
    			<c:forEach var="museumList2" items="${museumList}" varStatus="varStatus">
	    			<c:if test="${museumList2.cnt ne null}">
	    				cnt += ${museumList2.cnt};
					</c:if>
	    			<c:if test="${museumList2.total ne null}">
    					total += ${museumList2.total};
    				</c:if>
    				<c:if test="${museumList2.p_cnt ne null}">
    					p_cnt += ${museumList2.p_cnt};
					</c:if>
					<c:if test="${museumList2.p_total ne null}">
						p_total += ${museumList2.p_total};
					</c:if>
					<c:if test="${museumList2.i_cnt ne null}">
						i_cnt += ${museumList2.i_cnt};
					</c:if>
    			</c:forEach>
    			
    			$('#cnt').html(cnt);
    			$('#total').html(total);
    			$('#p_cnt').html(p_cnt);
    			$('#p_total').html(p_total);
    			$('#i_cnt').html(i_cnt);
              	/////////////
              	
              	
              	//  셀렉트  //
              	var start_year="2000";// 시작할 년도
              	var today = new Date();
              	var today_year= today.getFullYear();
              	var index=0;
              	for(var y=start_year; y<=today_year; y++){ //start_year ~ 현재 년도
              		document.getElementById('select_year').options[index] = new Option(y, y);
              		index++;
              	}
              	index=0;
//               	for(var m=1; m<=12; m++){
//               		document.getElementById('select_month').options[index] = new Option(m, m);
//               		index++;
//               	}
				/////////////
              })
        function orgCodeChange() {
				
  			var queryString = $("form[name=museumSearchForm]").serialize();
  			
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
		function museumSearchList(){
			var org_nm = $('#org_nm').val();
			var possession_select = $('#possession_select').val();
			var chk_info = $("input[name='chk_info']:checked").val();

			
			
			if($('#chk_reg_date').is(":checked")){
				var select_year = $('#select_year').val();
				var select_month = $('#select_month').val();
				var start_reg_date2 = null;
				var end_reg_date2 = null;
			}
			if($('#chk_reg_date2').is(":checked")){
				var start_reg_date2 = $('#start_reg_date2').val();
				var end_reg_date2 = $('#end_reg_date2').val();
				var select_year = null;
				var select_month = null;
			}
			// 태그 조건 검색			
			var queryString = $("form[name=museumSearchForm]").serialize();

				$.ajax({
					type : 'post',
					url : '/statisticsMuseumAjax.do',
					data : queryString,
					dataType : 'html',
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error: function(xhr, status, error){
						alert(error);
					},
					success : function(data){
						$('#tab-content').empty().append(data);
						$('#possession_select').empty();
						$('#msearch_org_nm').val(org_nm);
						$('#msearch_possession_nm').val(possession_select);
						$('#msearch_start_reg_date').val(select_year);
						$('#msearch_end_reg_date').val(select_month);
						$('#msearch_start_reg_date2').val(start_reg_date2);
						$('#msearch_end_reg_date2').val(end_reg_date2);
						$('#msearch_chk_info').val(chk_info);
					}
				});
		}
		function museumExcelList() {
			var $form = $('#museumExcelForm');

			$form.attr("action", "/statisticsMuseumExcelDownload.do");
			$form.submit();

	
		} 
	</script>
