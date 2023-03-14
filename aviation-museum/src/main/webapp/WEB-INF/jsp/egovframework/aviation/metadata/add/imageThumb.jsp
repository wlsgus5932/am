<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                <!-- 이미지 설명 등록모달  -->
                              <div class="modal fade bs-example-modal-xll" tabindex="-1" aria-labelledby="myExtraLargeModalLabel" style="display: none;" aria-hidden="true">
                                <div class="modal-dialog modal-xl">
                                  <div class="modal-content pro-modal-content">
                                    <div class="modal-header mv-modal-header">
                                        <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body mv-modal-body">
                                        <!-- 이미지 설명 모달 내용 -->
                                        <div class="mb-0 move-wrap pro-wrap">
                                          <div class="st_wrap">
                                            <label class="col-md-2 col-form-label st_title">이미지 설명 등록 및 수정</label>
                                          </div>
                                          <div class="card-body">
                                            <textarea style="width:100%; height:300px;" id="imageDesc" placeholder='${list.image_desc eq null ? "이미지 설명을 등록해주세요" : list.image_desc}'></textarea>
                                        </div>
                                      </div>
                                      <button type="button" class="btn btn-secondary btn_save" onclick="updateImageDesc()">저장</button>
                                    </div>
                                </div>
                                </div>
                              </div>
                              <!--  -->
                <div class="row row-cols-auto img-row" id="galleryDiv">
                <input type="hidden" id="imageidxhidden" value=""/>
    				<c:choose>
							<c:when test="${imageList.size() > 0 }">
	                          	<c:forEach var="list" items="${imageList}" varStatus="status">
	                          	
    				<div class="col img-col">
                        
                              <div class="img-col-header">
                                <input type="checkbox" name="imageCheckbox" id="imageCheckbox${status.index}" value="${list.image_idx}" value2="${list.image_path }" onclick="imageCheckboxChecked(this)">
                                ${list.image_nm}
                              </div>
                              <div class="img-col-img-wrap">
                                <a href="#">
                                  <div class="img-hover-info">
                                    <h4>이미지 설명</h4>
                                    <p>${list.image_desc}</p>
                                  </div>
                                  <img src="<c:url value="images/${list.image_nm}"/>" alt="이미지">
                                </a>
                              </div>
                                <div class="img-col-info">
                                  <dl>
                                    <dt>명칭:</dt>
                                    <dd>${list.image_nm }</dd>
                                  </dl>
                                  <dl>
                                    <dt>시간:</dt>
                                    <dd>${list.reg_date }</dd>
                                  </dl>
                                  <dl>
                                    <dt>사이즈:</dt>
                                    <dd>${list.image_width} x ${list.image_height}</dd>
                                  </dl>
                                  <dl>
                                    <dt>태그:</dt>
                                    <dd><button type="button" class="img-tag"><a href="#">태그</a></button></dd>
                                  </dl>
                                  <dl>
                                    <dt><input type="checkbox" id="req_image${status.index}" name="rep_image" value="${list.image_idx}" onclick="publicRepCheck(this)" ${list.rep_image == "Y" ? "CHECKED" : ""}/></dt>
                                    <dd>대표</dd>
                                    <dt><input type="checkbox" id="public_service${status.index}" name="public_service" value="${list.image_idx}" onclick="publicRepCheck(this)" ${list.public_service == "Y" ? "CHECKED" : ""}></dt>
                                    <dd>대국민 서비스</dd>
                                  </dl>
                                  <dl>
                                  	<button class="img-info_btn" data-bs-toggle="modal" data-bs-target=".bs-example-modal-xll" type="button" onclick="setImageIdx(${list.image_idx})">설명등록</button>
                                  	<button class="img-info_btn" type="button" onclick="gallery.view(${status.index})">원문보기</button>
                                  </dl>
                                </div>
                                
                            </div>
                                </c:forEach>
	                         </c:when>
							<c:otherwise>
									<tr>
										<td colspan="6">검색된 결과가 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
							<br/>
							</div>
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
					
					<script>
					gallery = new Viewer(document.getElementById('galleryDiv'));
					</script>
							
                                
 							