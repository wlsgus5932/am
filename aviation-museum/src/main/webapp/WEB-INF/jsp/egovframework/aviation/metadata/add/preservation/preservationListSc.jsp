<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="list" items="${preservationList}" varStatus="status">
<form id="update-preservation-form${status.index}" enctype="multipart/form-data">
<div id="accordion-div">

<div class="accordion-item" id="preservation-div">
   <h2 class="accordion-header" id="flush-headingOne">
      <div class="preservation_into_wrap_left">
            <div class="card-body"><div class="table-responsive">
               <table class="table mb-0">
                  <tbody>
                           <tr>
                              <td>처리기관</td>
                              <td><input class="form-control st_input" list="datalistOptions" id="treatment_org${status.index}" name="treatment_org" placeholder="처리기관을 입력해 주세요." value="${list.treatment_org}"></td>

                              <td>처리자</td>
                              <td><input class="form-control st_input" list="datalistOptions" id="processor${status.index}" name="processor" placeholder="처리자 명을 입력해 주세요." value="${list.processor}"></td>

                              <td>처리기간</td>
                              <td><input class="form-control" type="date" name="start_date" id="start_date${status.index}" value="${list.start_date }"> ~
                                    <input class="form-control" type="date" name="end_date" id="end_date${status.index}" value="${list.end_date }"></td>
                              <td>
                              </td>
                           </tr>
                       </tbody>
                     </table>
                   </div>
                 </div>

      </div>
      <div class="preservation_btn_wrap_right">
         <button class="accordion-button fw-medium ac_btn" type="button" data-bs-toggle="collapse" data-bs-target="#update-flush-collapseOne${status.index}" aria-expanded="true" aria-controls="flush-collapseOne"></button>
      </div>
   </h2>
   <div id="update-flush-collapseOne${status.index}" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
      <div class="accordion-body text-muted">
         <div class="mb-0">

               </div>
               <div class="mb-0">
                  <div class="st_wrap">
                  
                     <label class="col-md-2 col-form-label st_title">처리내용</label>
                  </div>
                     <input type="text" class="st_inp_tbox" id="content${status.index}" name="content" placeholder="처리내용을 입력해 주세요." value="${list.content }">
               </div>
               <div class="mb-0">
                  <div class="st_wrap">
                     <label class="col-md-2 col-form-label st_title">비고</label>
                  </div>
                     <input type="text" class="st_inp_tbox" id="remark${status.index}" name="remark" placeholder="참고사항을 입력해 주세요." value="${list.remark }">
               </div>
               </div>

               <div class="mb-0">
                  <div class="st_wrap" id="resut-div">
                     <label class="col-md-2 col-form-label st_title">처리결과</label>
                     <input style="display:none" class="form-control st_input" type="file" name="result_uploadFile" id="update-result-uploadFile${status.index }" onchange="updateresultImg(this, ${status.index})" accept="image/*"><br/>

                  <div id="update-result-img-preview${status.index}">
                  <c:if test= "${not empty list.file_nm }">
                     <div style="width:70px; height:70px; margin: 5px 5px 5px 5px; display:inline-block;">
                        <img id="updateresult-img${status.index}" style="width: 70px; height: 70px;" src="<c:url value="${list.file_path}${list.file_nm}"/>"/>
                        <p style="text-align:center;">${list.file_nm}</p>
                     </div>
                  </c:if>
                  </div>
                    </div>
                </div>

                <div class="mb-0" id="before-div"><div class="st_wrap">
                   <label class="col-md-2 col-form-label st_title" style="display:inline">보존처리 전 이미지</label>
                   <%-- <label for="update-before-uploadFile${status.index}" class="custom_btn btn_6466ab btn_add_preservation_padding" style="display:inline">업로드</label>
                  <input type="file" name="before_uploadFile" id="update-before-uploadFile${status.index}" onchange="updatebeforeImg(this, ${status.index})" multiple style="display:none;" accept="image/*"> --%>
                   <%-- <button class="custom_btn btn_7288c5" type="button">다운로드</button>
                   <button type="button" class="custom_btn btn_707070" onclick="allCheck(before, ${status.index})">전체선택</button>
                   <button type="button" class="custom_btn btn_707070" onclick="cancelCheck(before, ${status.index})">선택해지</button> --%>
                   <%-- <button type="button" class="custom_btn btn_707070" onclick="preservationDeleteChecked(before, ${status.index})">선택삭제</button> --%>

                    <div id="update-before-img-preview${status.index}">
                       <c:forEach var="img" items="${list.image}" varStatus="imgStatus">
                          <c:if test="${img.image_state eq 'B' && not empty list.file_nm }">
                             <div id="updatebefore${status.index}Div${imgStatus.index}" style="width:70px; height:70px; margin: 10px 10px 10px 10px; display:inline-block;">
                               <%--  <button type="button" onclick="preservationDeleteChecked(before, ${img.preservation_image_idx},${status.index},${imgStatus.index })" style="position: relative; top:20px; z-index: 1; border:none;">X</button> --%>
                           <img id="updatebefore${status.index}img${imgStatus.index}" style="width: 70px; height: 70px;" src="<c:url value="${img.image_path}${img.image_nm}"/>"/>
                           <p style="text-align:center; text-overflow: ellipsis; white-space : nowrap; overflow : hidden;">${img.image_nm }</p>
                        </div>
                     </c:if>
                  </c:forEach>
                    </div>

                    </div>
                    </div>

                    <div class="mb-0" id="after-div">
                       <div class="st_wrap"><label class="col-md-2 col-form-label st_title">보존처리 후 이미지</label>
                         <%-- <label for="update-after-uploadFile${status.index}" class="custom_btn btn_6466ab btn_add_preservation_padding" style="display:inline">업로드</label>
                     <input type="file" name="after_uploadFile" id="update-after-uploadFile${status.index}" onchange="updateafterImg(this, ${status.index})" multiple style="display:none;" accept="image/*"> --%>
                     <%-- <button class="custom_btn btn_7288c5" type="button">다운로드</button>
                       <button type="button" class="custom_btn btn_707070" onclick="allCheck(after, ${status.index})">전체선택</button>
                       <button type="button" class="custom_btn btn_707070" onclick="cancelCheck(after, ${status.index})">선택해지</button> --%>
                       <%-- <button type="button" class="custom_btn btn_707070" onclick="preservationDeleteChecked(after, ${status.index})">선택삭제</button> --%>

                       <div id="update-after-img-preview${status.index}">
                          <c:forEach var="img" items="${list.image}" varStatus="imgStatus">
                             <c:if test="${img.image_state eq 'A' && not empty list.file_nm }">
                                <div id="updateafter${status.index}Div${imgStatus.index}" style="width:70px; height:70px; margin: 10px 10px 10px 10px; display:inline-block;">
                                   <%-- <button type="button" onclick="preservationDeleteChecked(after, ${img.preservation_image_idx},${status.index},${imgStatus.index })" style="position: relative; top:20px; z-index: 1; border:none;">X</button> --%>
                              <img id="updateafter${status.index}img${imgStatus.index}" style="width: 70px; height: 70px;" src="<c:url value="${img.image_path}${img.image_nm}"/>"/>
                              <p style="text-align:center; text-overflow: ellipsis; white-space : nowrap; overflow : hidden;">${img.image_nm }</p>
                           </div>
                        </c:if>
                     </c:forEach>
                       </div>
                       </div></div>



                  </div></div></div></div></div></div></form>

              </c:forEach>
                       <button type="button" class="mb-0" id="add-tab-btn" onclick="cloneDiv()">
                       <div class="st_wrap">
                       <label class="col-md-2 col-form-label st_title" style="cursor: pointer"> + 보존처리 추가</label>
                       </div>
                        </button>