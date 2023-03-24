<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <!-- Tab panes -->
            <!-- 매도신청(접수자별) 탭 -->
            <div class="tab-pane" id="datareview_1" role="tabpanel" style="display:block;">
              <!-- 데이터 전환 모달 -->
              <div id="NomalModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <p>조회된 모든 소장품 데이터를 전환 하시겠습니까</p>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-primary waves-effect waves-light">확인</button>
                      <button type="button" class="btn btn-secondary waves-effect" data-bs-dismiss="modal">취소</button>
                    </div>
                  </div>
                </div>
              </div>
              <!-- -->
              <div class="st_wrap st_mv_wrap">
                <p>| 심의 현황 : 접수자 1,000건, 총 건수 1,000건</p>
                <div class="">
                    리스트 출력 갯수 :
                    <select class="search_select">
                      <option disabled="" selected="">50개</option>
                      <option>더미1</option>
                      <option>더미2</option>
                      <option>더미3</option>
                    </select>
                </div>
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
                                <th>번호</th>
                                <th>접수일자</th>
                                <th>접수번호</th>
                                <th>신청인명</th>
                                <th>사업자등록번호</th>
                                <th>생년월일</th>
                                <th>연락처</th>
                                <th>이메일</th>
                                <th>매도물품수</th>
                                <th>상세보기</th>
                                <th>삭제</th>
                                <th>상태</th>
                              </tr>
                          </thead>
                          <tbody>
                              <tr>
                                <td>300</td>
                                <td>2023-02-01</td>
                                <td>230210001</td>
                                <td>홍길동</td>
                                <td>129-36-12345</td>
                                <td>1983-12-12</td>
                                <td>010-1234-1234</td>
                                <td>abcd@naver.com</td>
                                <td>N건</td>
                                <td><button class="custom_btn btn_232323" type=button onclick="window.open('자료구입 관리 상세조회-자료심의.html')">상세보기</button></td>
                                <td><button class="custom_btn btn_edit" type=button>삭제</button></td>
                                <td>심사대기</td>
                              </tr>
                          </tbody>
                      </table>
                  </div>
              </div>
            </div>
            <!-- 페이지 버튼 -->
            <ul class="pagination">
              <li class="page-item">
                  <a class="page-link" href="#" aria-label="Previous">
                      <i class="mdi mdi-chevron-left"></i>
                  </a>
              </li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item">
                  <a class="page-link" href="#" aria-label="Next">
                      <i class="mdi mdi-chevron-right"></i>
                  </a>
              </li>
          </ul>
            </div>