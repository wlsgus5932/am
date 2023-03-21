<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 	              
          <div class="modal-dialog user-modal mypage_edit_modal_wrap">
            <div class="modal-content">
              <div class="modal-header mv-modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="workHistoryViewBtnClose"></button>
              </div>
              <div class="modal-body mv-modal-body">
                <div class="mb-0 user-wrap">
                  <div class="st_wrap" style="display: flex; justify-content: space-between;">
                    <label class="col-md-2 col-form-label st_title">작업 내역상세</label>
                   	<form id="workHistoryViewSearchForm" name="workHistoryViewSearchForm" method="post" class="form-horizontal">
						<input type="hidden" id="item_idx" name="item_idx" value="" />
					</form>
                    <button class="custom_btn btn_ex" type="button" onClick="workHistoryViewExcelList();">엑셀파일</button>
                  </div>
                   <div class="card-body">
                     <div class="table-responsive">
                       <table class="table mb-0">
                            <thead>
                                <tr class="tr_bgc">
                                    <th>번호</th>
									<th>작업명</th>
                                    <th>작업자</th>
                                    <th>작업날짜</th>
                                </tr>
                            </thead>
                            <tbody>
                               
                          	   <c:forEach var="workHistoryViewList" items="${workHistoryViewList}">
	                                <tr>
	                                    <th scope="row">${perPageNum + 1 - workHistoryViewList.rnum}</th>
	                                    <td>
	                                     ${workHistoryViewList.work_nm}
	                                    </td>
	                                    <td>
	                                      ${workHistoryViewList.reg_user}
	                                     </td>
	                                     <td>
	                                      ${workHistoryViewList.reg_date}
	                                     </td>	                              
	                                </tr>
								</c:forEach>
                            </tbody>
                        </table>
                        <ul class="btn-group pagination ">
						    <c:if test="${pageMaker.prev }">
						    <li class="page-item">
						        <a class="page-link" href='javascript:;' onclick="goViewPage('${pageMaker.startPage-1 }');"><i class="fa fa-chevron-left"></i></a>
						    </li>
						    </c:if>
						    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
						    <li class="page-item">
						        <a class="page-link" href='javascript:;' onclick="goViewPage('${pageNum}');"><i class="fa">${pageNum }</i></a>
						    </li>
						    </c:forEach>
						    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
						    <li class="page-item">
						        <a class="page-link" href="javascript:;" onclick="goViewPage('${pageMaker.endPage+1 }');"><i class="fa fa-chevron-right"></i></a>
						    </li>
						    </c:if>
						</ul> 
                     </div>
                   </div>
                </div>
              </div>
            </div>
          </div>