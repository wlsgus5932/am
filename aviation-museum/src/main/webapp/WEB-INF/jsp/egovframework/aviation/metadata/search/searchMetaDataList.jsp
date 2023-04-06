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
                            <button type="button" class="custom_btn btn_707070" style="margin-right: 1%;" onclick="mainImageClick()">원본보기</button>
                            <button type="button" class="custom_btn btn_707070" onclick="downloadMainImage()">다운로드</button>
                            <button class="custom_btn btn_c57283" type="button" onclick="addLike()">★관심자료등록</button>
                          </div>
                          <!--  -->
                          <div class="img-card-body_wrap" id="img-card-body">
                          	<div class="img-slider">
								<img src="/assets/images/no_image.png" onerror=this.src="/assets/images/no_image.png">
							</div>
                          </div>
                      </div>
                  </div>
                  <div class="table-responsive tr_right">
                      <table class="table mb-0 data_table_wrap_left_2">
                          <c:forEach var="list" items="${itemBaseList}" varStatus="status">
                  			<input type="hidden" id="item_idx" value="${list.item_idx }"/>
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
                                </tr>
		                     </c:forEach>
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
                          <c:forEach var="list" items="${countryList}" varStatus="status">
                              <tr>
                                  <th scope="row">${status.index+1 }</th>
                                  <td>
                                    ${list.country_nm }
                                  </td>
                                  <td>
                                    ${list.era_nm }
                                  </td>
                                  <td>
                                    ${list.detail_year }
                              </tr>
                              </c:forEach>
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
                        <c:forEach var="list" items="${materialList}" varStatus="status">
                            <tr>
                                <th scope="row">${status.index+1 }</th>
                                <td>
                                  ${list.material1_nm }
                                </td>
                                <td>
                                  ${list.material2_nm }
                                </td>
                                <td>
                                  ${list.material_detail }
                            </tr>
                        </c:forEach>
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
                        <c:forEach var="list" items="${measurementList}" varStatus="status">
                            <tr>
                                <th scope="row">${status.index+1 }</th>
                                <td>
                                  ${list.item_type}
                                </td>
                                <td>
                                  ${list.measurement_nm }
                                </td>
                                <td>
                                  ${list.measurement_value }
                                <td>
                                  ${list.measurement_unit_nm }
                                </td>
                            </tr>
                            </c:forEach>
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
                      <tbody class="data_table_wrap_left">
                      <c:forEach var="list" items="${obtainmentList}" varStatus="status">
                          <tr>
                            <td class="view_border_1">
                              입수일자
                              <td class="view_border_2">
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
                                <button class="custom_btn btn_707070">환률정보</button>
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
                          </c:forEach>
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
            <c:forEach var="list" items="${itemBaseList}" varStatus="status">
              <p>${list.feature }</p>
             </c:forEach>
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
                      <c:forEach var="list" items="${ranconList}" varStatus="status">
                          <tr>
                            <td>
                              자료상태
                              <td>
                                ${list.condition_nm }
                              </td>
                              <td>
                                전시순위
                              <td>
                                ${list.ranking_nm }
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
              <label class="col-md-2 col-form-label st_title">관련자료</label>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                  <table class="table mb-0">
                      <thead>
                          <tr class="tr_bgc">
                              <th>번호</th>
                              <th>자료구분</th>
                              <th>자료번호</th>
                              <th>비고</th>
                          </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="list" items="${involvementList}" varStatus="status">
                          <tr>
                              <th scope="row">${status.index+1 }</th>
                              <td>
                                ${list.possession_nm }
                              </td>
                              <td>
                                ${list.item_no }
                              </td>
                              <td>
                                ${list.remark }
                              </td>
                          </tr>
                          </c:forEach>
                      </tbody>
                  </table>
              </div>
          </div>
        </div>
        <!-- 기본사항 - 관련자료 끝 -->
        <!--  -->
        <!--  -->
        <div class="mb-0">
          <div class="st_wrap">
            <label class="col-md-2 col-form-label st_title">보험 관계기록</label>
          </div>
          <div class="card-body">
            <div class="table-responsive">
                <table class="table mb-0">
                    <thead>
                        <tr class="tr_bgc">
                            <th>번호</th>
                            <th>평가액</th>
                            <th>가격단위</th>
                            <th>대여기간</th>
                            <th>대여기관</th>
                            <th>비고</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="list" items="${InsuranceList}" varStatus="status">
                        <tr>
                            <th scope="row">${status.index+1 }</th>
                            <td>
                              ${list.agreed_value }
                            </td>
                            <td>
                              ${list.price_unit_nm }
                            </td>
                            <td>
                              ${list.start_date } = ${list.end_date }
                            </td>
                            <td>
                              ${list.rental_org }
                            </td>
                            <td>
                              ${list.remark }
                            </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
      </div>
        <!--  -->
        <!-- 기본사항 - 비고 시작 -->
        <div class="mb-0">
          <div class="st_wrap">
            <label class="col-md-2 col-form-label st_title">비고</label>
          </div>
          <c:forEach var="list" items="${itemBaseList}" varStatus="status">
            <p>${list.remark }</p>
            </c:forEach>
        </div>
        <!-- 기본사항 - 비고 끝 -->
        <!--  -->
        <!-- 기본사항 - 저작권 시작 -->
        <div class="mb-0">
          <div class="st_wrap">
            <label class="col-md-2 col-form-label st_title">저작권</label>
          </div>
          <div class="card-body">
            <div class="table-responsive">
                <table class="table mb-0">
                    <thead>
                        <tr class="tr_bgc">
                            <th>번호</th>
                            <th>저작권</th>
                            <th>저작권 소유자</th>
                            <th>저작권만료일자</th>
                            <th>이용허락 여부</th>
                            <th>저각권 양도 여부</th>
                            <th>비고</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="list" items="${copyrightList}" varStatus="status">
                        <tr>
                            <th scope="row">1</th>
                            <td>
                              ${list.copyright }
                            </td>
                            <td>
                              ${list.owner }
                            </td>
                            <td>
                              <!-- 대여기간 캘린더 폼 -->
                              ${list.expiry_date }
                            </td>
                            <td>
                              ${list.usage_permission }
                            </td>
                            <td>
                              ${list.copyright_transfer }
                            </td>
                            <td>
                              ${list.remark }
                            </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
      </div>
        <!-- 기본사항 - 저작권 끝 -->
        <!--  -->
        <!-- 기본사항 - 대국민 서비스 시작 -->
        <div class="mb-0">
          <div class="st_wrap">
            <label class="col-md-2 col-form-label st_title">대국민 서비스</label>
            선택내용
          </div>
          <div class="card-body">
            <div class="table-responsive">
                <table class="table mb-0">
                    <thead>
                        <tr class="tr_bgc">
                            <th>서비스 불가 사유</th>
                            <th>공공누리 서비스 유형</th>
                        </tr>
                    </thead>
                    <tbody>
                     <c:forEach var="list" items="${publicServiceList}" varStatus="status">
                        <tr>
                            <td>
                              ${list.reason }
                            </td>
                            <td>
                              ${list.public_service }
                            </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
      </div>
        <!-- 기본사항 - 대국민 서비스 끝 -->
      <!--  -->
      <div class="mb-0">
        <div class="st_wrap">
          <label class="col-md-2 col-form-label st_title">키워드</label>
        </div>
          <p>${keys }</p>
      </div>
            </div>