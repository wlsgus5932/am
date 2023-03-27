<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="mb-0">
                <div class="st_wrap">
                  <!-- <label class="col-md-2 col-form-label st_title"></label> -->
                </div>
                <div class="card-body cd_df">
                  <div class="tr_left">
                    <!-- 이미지 슬라이드 -->
                      <div class="card-body">
                        <div class="slider_count_wrap">
                          1/10
                        </div>
                          <div class="card-title-desc">
                            <button>dddddddddddddd</button><button>다운로드</button><button>★관심사료등록</button>
                          </div>
                          <!--  -->
                          <div class="img-slider">	
                            <div><img src="assets/custom_img/msJLHGdyoMkjM9jZWJ4Reso_4BTZqoxBMm2OU1M1PQiFrXA2i0JPnarpIo23uCJ0sngZNlJBG2ZqujuxH64i9Js-H92aG0z0m-O3k_h-kL306cxjtelCQpypWURTRsnHT3TrkYwF1NJl8n73Mj4MYg.jpg" alt="이미지1"></div>
                          </div>
                          <!-- <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                              <div class="carousel-inner slider_wrap" role="listbox">
                                <div class="slider_count_wrap">
                                  1/10
                                </div>
                                  <div class="carousel-item active">
                                      <img class="d-block img-fluid" src="assets/images/small/img-3.jpg" alt="First slide">
                                  </div>
                                  <div class="carousel-item">
                                      <img class="d-block img-fluid" src="assets/images/small/img-2.jpg" alt="Second slide">
                                  </div>
                                  <div class="carousel-item">
                                      <img class="d-block img-fluid" src="assets/images/small/img-1.jpg" alt="Third slide">
                                  </div>
                              </div>
                              <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-bs-slide="prev">
                                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                  <span class="sr-only">Previous</span>
                              </a>
                              <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-bs-slide="next">
                                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                  <span class="sr-only">Next</span>
                              </a>
                          </div> -->	                               <!--  <colgroup>
	                                 <col style="width:70%;>
	                                 <col style="width:10%">
	                                 <col style="width:10%">
	                                 <col style="width:10%">
	                                </colgroup> -->
                      </div>
                  </div>
                  <div class="table-responsive tr_right view_right">
                      <table class="table mb-0 ">
                          <tbody>
                          <c:forEach var="list" items="${itemBaseList}" varStatus="status">
                              <tr>
                                <td>
                                  명칭
                                </td>
                                  <td>
                                    ${list.item_nm}
                                  </td>
                                  <td>
                                    이명칭
                                  <td>
                                    ${list.item_se_nm}
                                  </td>
                              </tr>
                              <!-- 2  -->
                              <tr>
                                <td>
                                  영문 명칭
                                </td>
                                  <td>
                                    ${list.item_eng_nm }
                                  </td>
                                  <td>
                                    작가
                                  <td>
                                    ${list.author }
                                  </td>
                              </tr>
                              <!-- 3 -->
                              <tr>
                                <td>
                                  수량
                                </td>
                                  <td>
                                    ${list.qty }
                                  </td>
                                  <td>
                                     ICAO
                                  </td>
                                  <td>
                                    ${list.icao_code_idx }
                                  </td>
                              </tr>
                              <!-- 4 -->
                              <tr>
                                <td>
                                  현존여부
                                </td>
                                  <td>
                                    ${list.existence_code_idx }
                                  </td>
                                  <td>
                                    관리번호
                                  </td>
                                  <td>
                                    ${list.management_no }
                                  </td>
                              </tr>
                              <!-- 5 -->
                              <tr>
                                <td>
                                  보존처리필요
                                </td>
                                  <td>
                                    ${list.preservation_need }
                                  </td>
                                  <td>
                                    보존처리자
                                  </td>
                                  <td>
                                    -
                                  </td>
                              </tr>
                              </c:forEach>
                          </tbody>
                      </table>
                  </div>
              </div>
              </div>
                <div class="mb-0">
                  <div class="st_wrap">
                    <label class="col-md-2 col-form-label st_title">분류체계</label>
                  </div>
                  <div class="card-body">
                    <div class="table-responsive">
                        <table class="table mb-0">
                            <thead>
                                <tr class="tr_bgc">
                                    <th>번호</th>
                                    <th>대분류</th>
                                    <th>중분류</th>
                                    <th>소분류</th>
                                </tr>
                            </thead>
                            <tbody>
                           <c:forEach var="list" items="${taxonomyList}" varStatus="status">
                                <tr>
                                    <th scope="row">${status.index+1 }</th>
                                    <td>
                                      ${list.class1_nm}
                                    </td>
                                    <td>
                                      ${list.class2_nm }
                                    </td>
                                    <td>
                                      ${list.class3_nm }
                                    </td>
		                     </c:forEach>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
              </div>
              <!-- 기본 사항 - 분류체계 끝 -->
              <!-- 기본사항 - 국적 시작 -->
              <div class="mb-0">
                <div class="st_wrap">
                  <label class="col-md-2 col-form-label st_title">국적</label>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                      <table class="table mb-0">
                          <thead>
                              <tr class="tr_bgc">
                                  <th>번호</th>
                                  <th>국적</th>
                                  <th>국적별 시대</th>
                                  <th>시대(상세)</th>
                              </tr>
                          </thead>
                          <tbody>
                              <tr>
                                  <th scope="row">1</th>
                                  <td>
                                    선택
                                  </td>
                                  <td>
                                    선택
                                  </td>
                                  <td>
                                    상세 시대
                              </tr>
                          </tbody>
                      </table>
                  </div>
              </div>
            </div>
            <!-- 기본사항 - 국적 시작 끝 -->
            <!-- 기본사항 - 재질 시작 -->
            <div class="mb-0">
              <div class="st_wrap">
                <label class="col-md-2 col-form-label st_title">재질</label>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                    <table class="table mb-0">
                        <thead>
                            <tr class="tr_bgc">
                                <th>번호</th>
                                <th>1단계</th>
                                <th>2단계</th>
                                <th>재질(상세)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>
                                  선택선택
                                </td>
                                <td>
                                  선택
                                </td>
                                <td>
                                  상세 재질
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
          </div>
            <!-- 기본사항 - 재질 끝 -->
            <!-- 기본사항 - 크기 시작 -->
            <div class="mb-0">
              <div class="st_wrap">
                <label class="col-md-2 col-form-label st_title">크기</label>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                    <table class="table mb-0">
                        <thead>
                            <tr class="tr_bgc">
                                <th>번호</th>
                                <th>소장구분</th>
                                <th>실측부위</th>
                                <th>실측치</th>
                                <th>실단위</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>
                                  소장구분
                                </td>
                                <td>
                                  선택
                                </td>
                                <td>
                                  실측치
                                <td>
                                  선택
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
          </div>
          <!-- 기본사항 - 크기 끝 -->
          <!--  -->
          <div class="mb-0">
            <div class="st_wrap">
              <label class="col-md-2 col-form-label st_title">입수정보</label>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                  <table class="table mb-0">
                      <tbody>
                          <tr>
                            <td class="view_border_1">
                              입수일자
                              <td class="view_border_2">
                                2022-12-14
                              </td>
                              <td class="view_border_1">
                                입수연유
                              <td class="view_border_2">
                                선택
                              </td>
                          </tr>
                          <!-- 2  -->
                          <tr>
                            <td class="view_border_1">
                              구입구분1
                              <td class="view_border_2">
                                선택
                              </td>
                              <td class="view_border_1">
                                구입구분2
                              </td>
                              <td class="view_border_2">
                                선택
                              </td>
                          </tr>
                          <!-- 3 -->
                          <tr>
                            <td class="view_border_1">
                              가격
                              <td class="view_border_2">
                                가격 가격단위
                              </td>
                              <td class="view_border_1">
                                원화환산
                                <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2">환률정보</button>
                              </td>
                              <td class="view_border_2">
                                원화환산
                              </td>
                          </tr>
                          <!-- 4 -->
                          <tr>
                            <td class="view_border_1">
                              일괄구입번호
                            </td>
                            <td class="view_border_2">
                              일괄구입번호
                            </td>
                            <td class="view_border_1">
                              입수처
                            </td>
                            <td class="view_border_2">
                              선택
                            </td>
                          </tr>
                          <!-- 5 -->
                          <tr>
                            <td class="view_border_1">
                              입수주소
                            </td>
                              <td class="view_border_2">
                                입수주소
                              </td>
                              <td class="view_border_1">
                                입수 내용
                              </td>
                              <td class="view_border_2">
                                연락처 외 기본사항
                              </td>
                          </tr>
                          <!-- 6 -->
                          <tr>
                            <td class="view_border_1">
                              등록일자
                            </td>
                              <td class="view_border_2">
                                선택
                              </td>
                              <td class="view_border_1">
                                문화재 지정
                              </td>
                              <td class="view_border_2">
                                선택 안함
                              </td>
                          </tr>
                          <!-- 7 -->
                          <tr>
                            <td class="view_border_1">
                              문화재 환수
                              <input type="checkbox" name="" id="">
                            </td>
                              <td class="view_border_2">
                                환수 경로
                              </td>
                              <td class="view_border_1">
                                문화재 환수 국적
                              </td>
                              <td class="view_border_2">
                                선택
                              </td>
                          </tr>
                          <!-- 8 -->
                          <tr>
                            <td class="view_border_1">
                              문화재 환수 수량
                            </td>
                              <td class="view_border_2">
                                문화재수량 단위
                              </td>
                              <td class="view_border_1">
                                문화재 환수 연도
                              </td>
                              <td class="view_border_2">
                                문화재 환수 연도
                              </td>
                          </tr>
                      </tbody>
                  </table>
              </div>
          </div>
          </div>
          <!--  -->
          <!-- 기본사항 특징 시작 -->
          <div class="mb-0">
            <div class="st_wrap">
              <label class="col-md-2 col-form-label st_title">특징</label>
            </div>
              <p>특징</p>
          </div>
          <!-- 기본사항 특징 끝 -->
          <!--  -->
          <!-- 기본사항 - 자료상태 및 전시순위 시작 -->
          <div class="mb-0">
            <div class="st_wrap">
              <label class="col-md-2 col-form-label st_title">자료상태 및 전시순위</label>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                  <table class="table mb-0">
                      <tbody>
                          <tr>
                            <td>
                              자료상태
                              <td>
                                선택
                              </td>
                              <td>
                                전시순위
                              <td>
                                선택
                              </td>
                          </tr>
                      </tbody>
                  </table>
              </div>
          </div>

        </div>