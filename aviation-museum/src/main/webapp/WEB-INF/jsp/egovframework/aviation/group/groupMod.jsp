<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       
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
                             <table class="table mb-0">
                                 <tbody>
                                     <tr>
                                       <td>그룹명</td>
                                         <td>
                                           <input type="text">
                                         </td>
                                     </tr>
                                     <tr>
                                       <td>비고</td>
                                       <td>
                                         <input type="text">
                                       </td>
                                     </tr>
                                     <tr>
                                       <td>관리자 여부</td>
                                       <td>
                                         <input type="checkbox">관리자
                                         <input type="checkbox">일반
                                       </td>
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