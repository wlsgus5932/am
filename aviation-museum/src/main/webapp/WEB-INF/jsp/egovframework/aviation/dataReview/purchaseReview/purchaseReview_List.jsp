<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <!-- 실무검토 심의 탭 시작 -->
            <div class="tab-pane" id="datareview_1" role="tabpanel" style="display:block;">
              <!-- 실무검토서 작성하기 모달창 -->
              <div id="working_review_modal_1" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header mv-modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                        <div class="modal-body mv-modal-body">
                          <div class="st_wrap">
                            <label class="col-md-2 col-form-label st_title">매도대상자료명세서 - 00시대 전국비행지도</label>
                          </div>
                          <!--  -->
                          <div class="tr_left">
                            <!-- 이미지 슬라이드 -->
                              <div class="card-body">
                                <div class="slider_count_wrap">
                                  1/10
                                </div>
                                  <!--  -->
                                  <div class="img-slider">
                                    <div><img src="" alt="이미지1"></div>
                                    <div><img src="" alt="이미지2"></div>
                                    <div><img src="" alt="이미지3"></div>
                                  </div>
                              </div>
                          </div>
                          <div class="table-responsive tr_right">
                              <table class="table mb-0">
                                  <tbody>
                                      <tr>
                                        <td>
                                          명칭(소장부여)
                                        </td>
                                          <td>
                                            00시대 전국비행지도
                                          </td>
                                          <td>
                                            분류
                                          </td>
                                          <td>
                                            분류1
                                          </td>
                                      </tr>
                                      <tr>
                                        <td>수량</td>
                                        <td>N개</td>
                                        <td>소장자</td>
                                        <td>****</td>
                                      </tr>
                                      <tr>
                                        <td>
                                          크기(가로x세로x높이)
                                        </td>
                                          <td>
                                            3,500x1,000x2,000
                                          </td>
                                          <td>
                                            시대/국적
                                          </td>
                                          <td>
                                            1900년도
                                          </td>
                                      </tr>
                                      <tr>
                                          <td>
                                            매도신청액
                                          </td>
                                          <td>
                                            3,000,000원
                                          </td>
                                      </tr>
                                      <tr>
                                        <td>주요특징 및 상태</td>
                                         <td>-</td>
                                      </tr>
                                  </tbody>
                              </table>
                          </div>
                          <!-- 소장내력서 -->
                          <div class="st_wrap">
                            <label class="col-md-2 col-form-label st_title">소장내력서</label>
                          </div>
                          <div class="mb-0 user-wrap">
                            <div class="card-body">
                              <div class="table-responsive">
                                <table class="table mb-0">
                                  <tbody>
                                    <tr>
                                      <td>입수시기</td>
                                      <td>1980년 3월, 증조 할아버지 증여</td>
                                    </tr>
                                    <tr>
                                      <td>증빙서류의 유무</td>
                                      <td>1900년도</td>
                                    </tr>
                                    <tr>
                                      <td>증빙서류 유무</td>
                                      <td>-</td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                          </div>
                          <div class="mb-0 user-wrap">
                            <div class="container">
                              <div class="row row-cols-12 data_reivew_modtal_img_wrap">
                                <div class="col"><a href="#"><img src="" alt="1"></a></div>
                                <div class="col"><a href="#"><img src="" alt="2"></a></div>
                                <div class="col"><a href="#"><img src="" alt="3"></a></div>
                                <div class="col"><a href="#"><img src="" alt="4"></a></div>
                                <div class="col"><a href="#"><img src="" alt="5"></a></div>
                                <div class="col"><a href="#"><img src="" alt="6"></a></div>
                                <div class="col"><a href="#"><img src="" alt="7"></a></div>
                                <div class="col"><a href="#"><img src="" alt="8"></a></div>
                                <div class="col"><a href="#"><img src="" alt="9"></a></div>
                                <div class="col"><a href="#"><img src="" alt="10"></a></div>
                                <div class="col"><a href="#"><img src="" alt="11"></a></div>
                                <div class="col"><a href="#"><img src="" alt="12"></a></div>
                              </div>
                            </div>
                          </div>
                          <!-- 구입감정서 -->
                          <div class="st_wrap">
                            <label class="col-md-2 col-form-label st_title">자료 합의 감정가</label>
                          </div>
                          <div class="mb-0 user-wrap">
                            <table class="table mb-0">
                              <thead>
                                  <tr class="tr_bgc">
                                    <th>연변</th>
                                    <th>명칭</th>
                                    <th>수량</th>
                                    <th>매도신청액</th>
                                    <th>구입감정가</th>
                                    <th>비고</th>
                                  </tr>
                              </thead>
                              <tbody>
                                  <tr>
                                    <td>2023-2-1-1</td>
                                    <td>00시대 전국비행지도</td>
                                    <td>5</td>
                                    <td>3,000,000원</td>
                                    <td>500,000원</td>
                                    <td>구매, 비구매</td>
                                  </tr>
                              </tbody>
                          </table>
                          </div>
                          <div class="modal-footer">
                            <button>적정</button>
                            <button>부적정</button>
                        </div>
                      </div>
                          <!--  -->
                        </div>
                    </div>
                </div>
              <!--  -->
              <div class="mb-0">
                <div class="card-body">
                  <div class="table-responsive">
                      <table class="table mb-0">
                          <thead>
                              <tr class="tr_bgc">
                                <th>선택</th>
                                <th>번호</th>
                                <th>분류</th>
                                <th>명칭</th>
                                <th>수량</th>
                                <th>시대/국적</th>
                                <th>크기</th>
                                <th>매도신청가</th>
                                <th>구입감정확인서</th>
                              </tr>
                          </thead>
                          <tbody>
                              <tr>
                                <td><input type="checkbox" name="" id=""></td>
                                <td>300</td>
                                <td>분류1</td>
                                <td>00시대 전국비행지도</td>
                                <td>n개</td>
                                <td>1800년도, 대한민국</td>
                                <td>W300 x H200 x D100</td>
                                <td>36,000,000원</td>
                                <td><button data-bs-toggle="modal" data-bs-target="#working_review_modal_1">작성하기</button></td>
                              </tr>
                              <tr>
                                <td><input type="checkbox" name="" id=""></td>
                                <td>300</td>
                                <td>분류1</td>
                                <td>00시대 전국비행지도</td>
                                <td>n개</td>
                                <td>1800년도, 대한민국</td>
                                <td>W300 x H200 x D100</td>
                                <td>36,000,000원</td>
                                <td><button>작성완료</button></td>
                              </tr>
                          </tbody>
                      </table>
                  </div>
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
          <!--  -->