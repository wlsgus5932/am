<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
           <!-- 권한로그 -->
            <div class="tab-pane" id="datareview_5" role="tabpanel" style="display:block;">
              <!-- 보기 모달 -->
              <div id="view_Modal" class="modal fade hide" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-modal="true" role="dialog">
                <div class="modal-dialog user-modal user_in_modal_wrap user_in_modal_wrap_view">
                    <div class="modal-content">
                        <div class="modal-header mv-modal-header">
                            <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="userModInputClose"></button>
                        </div>
                        <div class="modal-body mv-modal-body">
                            <!-- 사용자 등록 모달 내용 -->
                            <div class="mb-0 user-wrap">
                              <div class="st_wrap">
                                <label class="col-md-2 col-form-label st_title">자세히 보기</label>
                              </div>
                              <div class="view_Modal_data_wrap">
                                <div class="tr_bgc view_Modal_data_header">변경전</div>
                                <div class="view_Modal_data_in_wrap">
                                  1
                                </div>
                              </div>
                              <div class="view_Modal_data_wrap">
                                <div class="tr_bgc view_Modal_data_header">변경후</div>
                                <div class="view_Modal_data_in_wrap">
                                  0
                                </div>
                              </div>
                          </div>
                                        <div class="user_in_modal_footer_wrap">
                                           <!-- <button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" id="userModBtn">저장</button> -->
                                          <button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" id="" data-bs-dismiss="modal">닫기</button>
                                        </div>
                        </div>
                    </div>
                </div>
            </div>
              <!--  -->
              <div class="mb-0">
                <div class="fr_wrap">
                  <div class="mb-3 row fr_1">
                    <div class="col-md-10">
                      <label class="col-md-2 col-form-label">테이블</label>
                      <select class="form-select">
                        <option disabled selected>박물관별 대국민 소장구분별 조회항목 권한</option>
                        <option>-</option>
                        <option>-</option>
                      </select>
                      <label class="col-md-2 col-form-label">기간</label>
                      <input class="search_select" type="date" name="" id=""> ~ <input class="search_select" type="date" name="" id="">
                      <!--  -->
                      <label class="col-md-2 col-form-label">상태</label>
                      <select class="form-select">
                        <option disabled selected>선택</option>
                        <option>-</option>
                        <option>-</option>
                      </select>
                      <label class="col-md-2 col-form-label">대상필드</label>
                      <select class="form-select">
                        <option disabled selected>전체</option>
                        <option>-</option>
                        <option>-</option>
                      </select>
                    </div>
                    <div class="col-md-10">
                      <label class="col-md-2 col-form-label">검색</label>
                      <select class="form-select">
                        <option disabled selected>전체</option>
                        <option>-</option>
                        <option>-</option>
                      </select>
                      <input class="custom_search_input" type="text" value="">
                      <button class="custom_btn btn_707070" type="button">조회</button>
                    </div>
                  </div>
                </div>
              </div>
              <!-- -->
              <div class="st_wrap st_mv_wrap">
                <button class="custom_btn btn_ex" type="button">엑셀파일</button>
                <div class="all_number_text">총 건수: 5건</div>
              </div>
              <!--  -->
              <div class="mb-0">
                <!-- 엑셀 모달 -->
                <div id="myModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
                  <div class="modal-dialog">
                      <div class="modal-content">
                          <div class="modal-header mv-modal-header">
                              <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <div class="modal-body mv-modal-body">
                              <!-- 엑셀 모달 내용 -->
                              <div class="mb-0 move-wrap">
                                <div class="st_wrap">
                                  <label class="col-md-2 col-form-label st_title">이동사항 등록 및 수정</label>
                                </div>
                                <div class="card-body">
                                  <div class="table-responsive">
                                      <table class="table mb-0">
                                          <tbody>
                                              <tr>
                                                <td>이동일자</td>
                                                  <td>
                                                    <select class="form-select st_select">
                                                      <option disabled selected>선택</option>
                                                      <option>더미1</option>
                                                      <option>더미2</option>
                                                      <option>더미3</option>
                                                    </select>
                                                  </td>
                                              </tr>
                                              <tr>
                                                <td>보관구분</td>
                                                  <td>
                                                    <select class="form-select st_select">
                                                      <option disabled selected>선택</option>
                                                      <option>더미1</option>
                                                      <option>더미2</option>
                                                      <option>더미3</option>
                                                    </select>
                                                  </td>
                                                  <td>
                                                    <select class="form-select st_select">
                                                      <option disabled selected>선택</option>
                                                      <option>더미1</option>
                                                      <option>더미2</option>
                                                      <option>더미3</option>
                                                    </select>
                                                  </td>
                                              </tr>
                                              <tr>
                                                <td>보관처</td>
                                                <td>
                                                  <select class="form-select st_select">
                                                    <option disabled selected>선택</option>
                                                    <option>더미1</option>
                                                    <option>더미2</option>
                                                    <option>더미3</option>
                                                  </select>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td>반입처</td>
                                                <td>
                                                  <select class="form-select st_select">
                                                    <option disabled selected>선택</option>
                                                    <option>더미1</option>
                                                    <option>더미2</option>
                                                    <option>더미3</option>
                                                  </select>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td>이동수량</td>
                                                <td>
                                                  <select class="form-select st_select">
                                                    <option disabled selected>선택</option>
                                                    <option>더미1</option>
                                                    <option>더미2</option>
                                                    <option>더미3</option>
                                                  </select>
                                                </td>
                                                <td>현수량</td>
                                                <td>
                                                  <select class="form-select st_select">
                                                    <option disabled selected>선택</option>
                                                    <option>더미1</option>
                                                    <option>더미2</option>
                                                    <option>더미3</option>
                                                  </select>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td>격납요청자</td>
                                                <td>
                                                  <input class="form-control st_input" type="text" name="" id="">
                                                </td>
                                                <td>실제전시여부</td>
                                                <td> <input type="checkbox" name="" id=""> </td>
                                              </tr>
                                              <tr>
                                                <td>비고</td>
                                                <td>
                                                  <input class="form-control st_input" type="text" name="" id="">
                                                </td>
                                              </tr>
                                          </tbody>
                                      </table>
                                      <button class="btn btn-secondary btn_save">저장</button>
                                  </div>
                              </div>
                            </div>
                            <!--  -->
                            <div class="mb-0 move-wrap">
                              <div class="st_wrap">
                                <label class="col-md-2 col-form-label st_title">과거 이동처 코드</label>
                              </div>
                              <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table mb-0">
                                        <thead>
                                            <tr class="tr_bgc">
                                                <th>번호</th>
                                                <th>과거이동처</th>
                                                <th>현수량</th>
                                                <th>입력값선택</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th scope="row">1</th>
                                                <td>
                                                20200000
                                                </td>
                                                <td>
                                                  0
                                                </td>
                                                <td>
                                                  <select class="form-select st_select">
                                                    <option disabled selected>선택</option>
                                                    <option>더미1</option>
                                                    <option>더미2</option>
                                                    <option>더미3</option>
                                                  </select>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                          </div>
                          </div>
                      </div>
                  </div>
              </div>
                <div class="card-body">
                  <div class="table-responsive">
                      <table class="table mb-0">
                          <thead>
                              <tr class="tr_bgc">
                                <th>수정일시</th>
                                <th>코드</th>
                                <th>상태</th>
                                <th>대상필드</th>
                                <th>이전 값</th>
                                <th>바뀐 값</th>
                                <th>수정자 아이디</th>
                                <th>수정자IP</th>
                              </tr>
                          </thead>
                          <tbody>
                              <tr>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                              </tr>
                          </tbody>
                      </table>
                  </div>
              </div>
            </div>
            </div>
          <!--  -->