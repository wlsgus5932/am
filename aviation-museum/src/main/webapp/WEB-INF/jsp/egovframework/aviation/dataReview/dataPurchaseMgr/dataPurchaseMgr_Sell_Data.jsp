<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <!-- 매도신청(자료별 N건) 시작 -->
            <div class="tab-pane" id="datareview_2" role="tabpanel" style="display:block;">
              <!--  -->
              <div class="st_wrap st_mv_wrap">
                <p>| 심의 현황 : 접수자 1,000건, 총 건수 1,000건</p>
                <div>
                  리스트 출력 갯수 :
                    <select class="form-select st_select img-select select_width_auto">
                      <option disabled="" selected="">50개</option>
                      <option>더미1</option>
                      <option>더미2</option>
                      <option>더미3</option>
                    </select>
                </div>
              </div>
              <!--  -->
              <div class="mb-0">
                <div class="card-body">
                  <div class="table-responsive">
                      <table class="table mb-0">
                          <thead>
                              <tr class="tr_bgc">
                                <th>번호</th>
                                <th>분류</th>
                                <th>명칭</th>
                                <th>수량</th>
                                <th>시대/국적</th>
                                <th>매도신청액</th>
                                <th>자료접수</th>
                                <th>실무검토</th>
                                <th>구입감정</th>
                                <th>구입심의</th>
                                <th>상세보기</th>
                                <th>삭제</th>
                                <th>상태</th>
                              </tr>
                          </thead>
                          <tbody>
                              <tr>
                                <td>5</td>
                                <td>분류2</td>
                                <td>비행문서</td>
                                <td>N개</td>
                                <td>1805년</td>
                                <td>10,000,000원</td>
                                <td>Y</td>
                                <td>적정</td>
                                <td>10,000원</td>
                                <td>심의중</td>
                                <td><button class="custom_btn btn_232323" type="button">상세보기</button></td>
                                <td><button class="custom_btn btn_edit" type="button">삭제</button></td>
                                <td>심사대기</td>
                              </tr>
                          </tbody>
                      </table>
                  </div>
              </div>
				<ul class="btn-group pagination">
				  <li class="page-item">
				    <a class="page-link" href="javascript:;" onclick="goPage('1');"><i class="fa">1</i></a>
				  </li>
				
				  <li class="page-item">
				    <a class="page-link" href="javascript:;" onclick="goPage('2');"><i class="fa">2</i></a>
				  </li>
				
				  <li class="page-item">
				    <a class="page-link" href="javascript:;" onclick="goPage('3');"><i class="fa">3</i></a>
				  </li>
				</ul>              
            </div>
              <!-- 페이지 버튼 -->
            </div>
            <!--  -->