<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

     <!--  -->
     <div class="tab-pane" id="messages" role="tabpanel" style="display : block;">
     <form id="groupSearchForm" name="groupSearchForm" method="post" class="form-horizontal" onsubmit="return false">
       <div class="user_top_wrap">
         <span>검색</span>
         <select class="search_select" id="search_type" name="search_type">
           <option value="">전체</option>
           <option value="group_nm">그룹명</option>
           <option value="remark">비고</option>
           <option value="admin">관리자 여부</option>
         </select>
           <input class="custom_search_input" type="text" id="search_word" name="search_word" onkeypress="if( event.keyCode == 13 ){groupSearchList();}" style="width: 65%;">
           <button class="custom_btn btn_inquiry" type="button" onClick="groupSearchList();">조회</button>
       </div>
      </form>
       <div class="custom_btn_wrap">
           <button class="custom_btn btn_no_select" id="groupDelBtn">선택삭제</button>
           <button type="button" class="custom_btn btn_707070" data-bs-toggle="modal" data-bs-target="#GroupModal">그룹등록</button>
       </div>
       <div class="mb-0">
         <div class="card-body">
           <div class="table-responsive">
               <table class="table mb-0">
                   <thead>
                       <tr class="tr_bgc">
                           <th> <input type="checkbox" name="" id="allCheck" onchange="agreeAllCheck();"></th>
                           <th>번호</th>
                           <th>그룹명</th>
                           <th>비고</th>
                           <th>관리자 여부</th>                    
                           <th>등록일자</th>
                           <th>수정</th>
                       </tr>
                   </thead>
                   <tbody>
                      <c:forEach var="groupList" items="${groupList}">
	                       <tr>
	                           <td>
		                           <input type="checkbox" name="group_seqList" id="${groupList.group_idx}" class="check_temp" value="${groupList.group_idx}"/>
	                           </td>
	                           <td>
	                             ${perPageNum + 1 - groupList.rnum}
	                           </td>
	                           <td>
	                             ${groupList.group_nm}
	                            </td>
	                            <td>
	                             ${groupList.remark}
	                            </td>
	                            <td>
	                             ${groupList.admin}
	                            </td>
	                            <td>
	                             ${groupList.reg_date}
	                           </td>
	                            <td>
	                             <c:choose>
		                           	 <c:when test="${groupList.group_idx eq 1}">
	                            		 <button type="button" class="custom_btn btn_edit">수정</button>
	                          		 </c:when>
		                             <c:otherwise>
		                             	<button type="button" class="custom_btn btn_edit" data-bs-toggle="modal" data-bs-target="#GroupModal-2" onclick="groupModPopup('${groupList.group_idx}');">수정</button>
		                             </c:otherwise>
	                             </c:choose>                       
	                            </td>
	                       </tr>
						</c:forEach>	
                   </tbody>
               </table>
<!--               <nav aria-label="Page navigation example"> -->
<!--                <ul class="btn-group pagination"> -->
<%-- 				    <c:if test="${pageMaker.prev }"> --%>
<!-- 				    <li class="page-item"> -->
<%-- 				        <a class="page-link" href='javascript:;' onclick="goPage('${pageMaker.startPage-1 }');"><i class="fa fa-chevron-left"></i></a> --%>
<!-- 				    </li> -->
<%-- 				    </c:if> --%>
<%-- 				    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum"> --%>
<!-- 				    <li class="page-item"> -->
<%-- 				        <a class="page-link" href='javascript:;' onclick="goPage('${pageNum}');"><i class="fa">${pageNum }</i></a> --%>
<!-- 				    </li> -->
<%-- 				    </c:forEach> --%>
<%-- 				    <c:if test="${pageMaker.next && pageMaker.endPage >0 }"> --%>
<!-- 				    <li class="page-item"> -->
<%-- 				        <a class="page-link" href="javascript:;" onclick="goPage('${pageMaker.endPage+1 }');"><i class="fa fa-chevron-right"></i></a> --%>
<!-- 				    </li> -->
<%-- 				    </c:if> --%>
<!-- 				</ul>    -->
<!-- 				</nav> -->
           </div>
       </div>
         <!-- 그룹 등록 모달 -->
         <div id="GroupModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
           <div class="modal-dialog user-modal group_in_modal_wrap">
               <div class="modal-content">
                   <div class="modal-header mv-modal-header">
                       <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
                       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="groupInsInputClose"></button>
                   </div>
                   <div class="modal-body mv-modal-body">
                       <!-- 그룹 등록 모달 내용 -->
                       <div class="mb-0 user-wrap">
                         <div class="st_wrap">
                           <label class="col-md-2 col-form-label st_title">그룹 등록</label>
                         </div>
                         <div class="card-body">
                           <div class="table-responsive">
                         	  <form action="/groupinsert.do" method="post" name="groupinsertform">                          
	                               <table class="table mb-0">
										<colgroup>
										  <col style="width:30%;">
										</colgroup>	                               
	                                   <tbody>
	                                       <tr>
	                                         <td>그룹명</td>
	                                           <td>
	                                             <input class="custom_search_input user_in_modal_input" type="text" name="group_nm" id="group_nm">
	                                           </td>
	                                       </tr>
	                                       <tr>
	                                         <td>비고</td>
	                                         <td>
	                                           <input class="custom_search_input user_in_modal_input" type="text" name="remark" id="remark">
	                                         </td>
	                                       </tr>
	                                       <tr>
	                                         <td>관리자 여부</td>
	                                         <td>
	                                           <input type="radio" name="admin" id="insGroupY"  value="Y">관리자
	                                           <input type="radio" name="admin" id="insGroupN"  value="N">일반
	                                         </td>
	                                       </tr>
	                                   </tbody>
	                               </table>
                              	   
                               </form>
                           </div>
                           </div>
                       </div>
	                              <div class="user_in_modal_footer_wrap">
	                              	 <button class="custom_btn btn_c58672 user_in_modal_footer_btn" id="groupInsBtn">저장</button>
	                             	 <button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" id="" data-bs-dismiss="modal">닫기</button>
	                              </div>                           
                     </div>
                     <!--  -->
                   </div>
               </div>
           </div>
       </div>
              <nav aria-label="Page navigation example">
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
				</nav>       
<!-- 			///cccc -->

       <!-- 그룹 수정 모달 -->
       <div id="GroupModal-2" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
         <div class="modal-dialog user-modal group_in_modal_wrap">
             <div class="modal-content">
                 <div class="modal-header mv-modal-header">
                     <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
                     <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="groupModInputClose"></button>
                 </div>
                 <div class="modal-body mv-modal-body">
                     <!-- 그룹 수정 모달 내용 -->
                     <div class="mb-0 user-wrap">
                       <div class="st_wrap">
                         <label class="col-md-2 col-form-label st_title">그룹 수정</label>
                       </div>
                       <div class="card-body">
                         <div class="table-responsive">
	                          <form action="/groupupdate.do" method="post" name="groupupdateform">
								<input type="hidden" id="modGroupIdx" name="group_idx" />
	                             <table class="table mb-0">
	                                 <tbody>
	                                     <tr>
	                                       <td>그룹명</td>
	                                         <td>
	                                           <input class="custom_search_input user_in_modal_input" type="text" name="group_nm" id="modGroupNm"></input>
	                                         </td>
	                                     </tr>
	                                     <tr>
	                                       <td>비고</td>
	                                       <td>
	                                         <input class="custom_search_input user_in_modal_input" type="text" name="remark" id="modGroupRemark"></input>
	                                       </td>
	                                     </tr>
	                                     <tr>
	                                       <td>관리자 여부</td>
	                                       <td>
	                                         <input type="radio" name="admin" id="modGroupY" value="Y">관리자</input>
	                                         <input type="radio" name="admin" id="modGroupN" value="N">일반</input>
	                                       </td>
	                                     </tr>
	                                 </tbody>
	                             </table>
	                             </form>
 
                         </div>
                     </div>
                   </div>
	                              <div class="user_in_modal_footer_wrap">
                            		 <button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" id="groupModBtn">저장</button>
	                             	 <button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" id="" data-bs-dismiss="modal">닫기</button>
	                              </div>
                   <!--  -->
                 </div>
             </div>
         </div>
     </div>
     <!--  -->
     
     
     </div>
<script>


var groupInsValidation = function() {
	var group_nm = $("#group_nm").val();
	var remark = $("#remark").val();
	
	if (!Boolean(group_nm)) {
		alert("그룹명을 입력해주세요.");
		$("#group_nm").focus();
		return false;
	}
	
	if (!$('#insGroupY').is(":checked") && !$('#insGroupN').is(":checked")) {
		alert("사용 여부를 체크해주세요.");
		return false;
	}

	return true;
}
var groupModValidation = function() {
	var modGroupNm = $("#modGroupNm").val();
	var modGroupRemark = $("#modGroupRemark").val();
	
	if (!Boolean(modGroupNm)) {
		alert("그룹명을 입력해주세요.");
		$("#modGroupNm").focus();
		return false;
	}
	
	if (!$('#modGroupY').is(":checked") && !$('#modGroupN').is(":checked")) {
		alert("사용 여부를 체크해주세요.");
		return false;
	}


	return true;
}
<%-- 그룹등록 관리자 여부 체크박스 단일선택 --%>
// $('input[type="checkbox"][name="admin"]').click(function(){
// 	  if($(this).prop('checked')){
	 
// 	     $('input[type="checkbox"][name="admin"]').prop('checked',false);
	 
// 	     $(this).prop('checked',true);
	 
// 	    }
	  
// });

<%-- 그룹 조건 검색 --%>
function groupSearchList(){
	// 사용자 조건 검색			
	var queryString = $("form[name=groupSearchForm]").serialize();
	var search_word = $('#search_word').val();
	var search_type = $('#search_type').val();
		$.ajax({
			type : 'post',
			url : '/groupListAjax.do',
			data : queryString,
			dataType : 'html',
			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
			error: function(xhr, status, error){
				alert(error);
			},
			success : function(data){
				$('#tab-content').empty().append(data);
				$('#search_word').val(search_word);
				$('#search_type').val(search_type);
				$('#search_word').focus();
			}
		});
}

// $('input[type="text"]').keydown(function() {
// 	  if (event.keyCode === 13) {
// 	    event.preventDefault();
// 	  };
// });

<%-- 그룹 페이지 이동 --%>
function goPage(value) {
	var search_word = $('#search_word').val();
	var search_type = $('#search_type').val();
	var page = value;
	$.ajax({
		type : 'POST',                 
		url : '/groupListAjax.do',   
		data:{
			search_word : search_word,
			search_type : search_type,
			page : page
		},
		dataType : "html",           
		contentType : "application/x-www-form-urlencoded;charset=UTF-8",
		error : function() {        
			alert('통신실패!');
		},
		success : function(data) {  
			$('#tab-content').empty().append(data);
			$('#search_word').val(search_word);
			$('#search_type').val(search_type);
		}
	});
}
</script>