<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
          <!-- 이미지통계 탭 -->
          <div class="tab-pane" id="tap-2" role="tabpanel" style="display:block;">
            <div class="fr_wrap">
              <div class="mb-3 row fr_1">
                <div class="col-md-10">
                  <label class="col-md-2 col-form-label">자료 구분</label>
                    <select class="search_select search_select_2">
                        <option disabled selected>국립항공박물관</option>
                        <option>더미1</option>
                        <option>더미2</option>
                        <option>더미3</option>
                    </select>
                  <select class="search_select search_select_2">
                      <option disabled selected>선택</option>
                      <option>더미1</option>
                      <option>더미2</option>
                      <option>더미3</option>
                  </select>
                    <label class="col-md-2 col-form-label">자료 번호</label>
                    <!-- <div class="col-md-10"> -->
                      <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="exampleDataList" placeholder="">
                      <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="exampleDataList" placeholder="">
                      ~
                      <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="exampleDataList" placeholder="">
                      <input class="custom_search_input custom_search_input_2" list="datalistOptions" id="exampleDataList" placeholder="">
                      <button class="custom_btn btn_707070" type="button">검색</button>
                      <button class="custom_btn btn_ex" type="button">엑셀파일</button>
                </div>
              </div>
            </div>
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
                  <!--  -->
                  <table class="table mb-0">
                    <thead>
                      <tr class="tr_bgc">
                        <th>연번</th>
                        <th>이미지수량</th>
                        <th>합계</th>
                        <th>국립항공박물관</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>1</td>
                        <td>이미지 없음</td>
                        <td>0 / null</td>
                        <td>0 / 0</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>이미지 없음</td>
                        <td>0 / null</td>
                        <td>0 / 0</td>
                      </tr>
                      <tr>
                        <td>1</td>
                        <td>이미지 없음</td>
                        <td>0 / null</td>
                        <td>0 / 0</td>
                      </tr>
                      <tr>
                        <td colspan="2">합계</td>
                        <td>1</td>
                        <td>1</td>
                      </tr>
                    </tbody>
                  </table>
                  <!--  -->
                </div>
            </div>
          </div>
          </div>
