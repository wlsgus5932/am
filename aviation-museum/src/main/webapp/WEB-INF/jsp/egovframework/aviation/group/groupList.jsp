<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

     <!--  -->
     <div class="tab-pane" id="messages" role="tabpanel" style="display : block;">
       <div class="st_wrap st_mv_wrap">
         <div class="st_title_wrap">
           <button class="btn btn-secondary waves-effect waves-light btn_ml" id="groupDelBtn">선택삭제</button>
         </div>
         <div class="group_btn">
           <button type="button" class="btn btn-primary waves-effect waves-light btn_ml btn_wh btn_ex" data-bs-toggle="modal" data-bs-target="#GroupModal">그룹등록</button>
         </div>
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
                      <c:forEach var="groupList" items="${groupList}" varStatus="varStatus">
	                       <tr>
	                           <td>
	                             <input type="checkbox" name="group_seqList" id="" class="check_temp"  value="${groupList.group_idx}">
	                           </td>
	                           <td>
	                             ${varStatus.count}
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
	                             <button type="button" class="btn btn-primary waves-effect waves-light btn_ml btn_wh btn_ex" data-bs-toggle="modal" data-bs-target="#GroupModal-2" onclick="groupModPopup('${groupList.group_idx}');">수정</button>
	                            </td>
	                       </tr>
						</c:forEach>	
                   </tbody>
               </table>
           </div>
       </div>
         <!-- 그룹 등록 모달 -->
         <div id="GroupModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
           <div class="modal-dialog user-modal">
               <div class="modal-content">
                   <div class="modal-header mv-modal-header">
                       <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
                       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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
	                                   <tbody>
	                                       <tr>
	                                         <td>그룹명</td>
	                                           <td>
	                                             <input type="text" name="group_nm" id="group_nm">
	                                           </td>
	                                       </tr>
	                                       <tr>
	                                         <td>비고</td>
	                                         <td>
	                                           <input type="text" name="remark" id="remark">
	                                         </td>
	                                       </tr>
	                                       <tr>
	                                         <td>관리자 여부</td>
	                                         <td>
	                                           <input type="checkbox" name="admin" value="Y">관리자
	                                           <input type="checkbox" name="admin" value="N">일반
	                                         </td>
	                                       </tr>
	                                   </tbody>
	                               </table>
                              	   <button class="btn btn-secondary btn_save" type="button" id="groupInsBtn">저장</button>
                               </form>
                           </div>
                           </div>
                       </div>
                     </div>
                     <!--  -->
                   </div>
               </div>
           </div>
       </div>
<!-- 			///cccc -->

       <!-- 그룹 수정 모달 -->
       <div id="GroupModal-2" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
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
	                          <form action="/groupupdate.do" method="post" name="groupupdateform">
								<input type="hidden" id="modGroupIdx" name="group_idx" />
	                             <table class="table mb-0">
	                                 <tbody>
	                                     <tr>
	                                       <td>그룹명</td>
	                                         <td>
	                                           <input type="text" name="group_nm" id="modGroupNm"></input>
	                                         </td>
	                                     </tr>
	                                     <tr>
	                                       <td>비고</td>
	                                       <td>
	                                         <input type="text" name="remark" id="modGroupRemark"></input>
	                                       </td>
	                                     </tr>
	                                     <tr>
	                                       <td>관리자 여부</td>
	                                       <td>
	                                         <input type="checkbox" name="admin" id="modGroupY" value="Y">관리자</input>
	                                         <input type="checkbox" name="admin" id="modGroupN" value="N">일반</input>
	                                       </td>
	                                     </tr>
	                                 </tbody>
	                             </table>
	                             </form>
                             <button class="btn btn-secondary btn_save" type="button" id="groupModBtn">저장</button>
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
<script>


var groupInsValidation = function() {
	var group_nm = $("#group_nm").val();
	var remark = $("#remark").val();
	
	if (!Boolean(group_nm)) {
		alert("그룹명을 입력해주세요.");
		$("#group_nm").focus();
		return false;
	}
	
	if (!$('input[type="checkbox"][name="admin"]').is(":checked")) {
		alert("관리자 여부를 체크해주세요.");
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
	
	if (!$('input[type="checkbox"][name="admin"]').is(":checked")) {
		alert("관리자 여부를 체크해주세요.");
		return false;
	}

	return true;
}
<%-- 그룹등록 관리자 여부 체크박스 단일선택 --%>
$('input[type="checkbox"][name="admin"]').click(function(){
	  if($(this).prop('checked')){
	 
	     $('input[type="checkbox"][name="admin"]').prop('checked',false);
	 
	     $(this).prop('checked',true);
	 
	    }
	  
});


</script>