<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
		
	<div class="simple_view_wrap2">
		<input type="hidden" id="metaDataSearchType">
        <c:forEach var="metaDataSearchQuickView" items="${metaDataSearchQuickView}">
            <div class="simple_view_top">
              <p>간략보기</p>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="quickViewCloseBtn();"></button>
            </div>
            <div class="simple_view_thumb">
              <c:choose>
	            		<c:when test="${metaDataSearchQuickView.image_path ne null}">
	            		 	 <img src="${metaDataSearchQuickView.image_path}" alt="이미지" onerror="this.onerror=null; this.src='/assets/images/no_image.png';"/>
	           		</c:when>
	           		<c:otherwise>
	           			<img src="/assets/images/no_image.png" alt="이미지">
	           		</c:otherwise>
	           </c:choose>
            </div>
            <div class="simple_view_info">
              <dl>
                <dt>소장구분</dt>
                <dd>${metaDataSearchQuickView.possession_nm}</dd>
              </dl>
              <dl>
                <dt>사료번호</dt>
                <dd>${metaDataSearchQuickView.item_no}-${metaDataSearchQuickView.item_detail_no}</dd>
              </dl>
              <dl>
                <dt>명칭</dt>
                <dd>${metaDataSearchQuickView.item_nm}</dd>
              </dl>
              <dl>
                <dt>이명칭</dt>
                <dd>${metaDataSearchQuickView.item_se_nm}</dd>
              </dl>
              <dl>
                <dt>영문명칭</dt>
                <dd>${metaDataSearchQuickView.item_eng_nm}</dd>
              </dl>
              <dl>
                <dt>ICAO</dt>
                <dd>${metaDataSearchQuickView.icao_nm}</dd>
              </dl>
              <dl>
                <dt>주수량</dt>
                <dd>${metaDataSearchQuickView.qty}</dd>
              </dl>
              <dl>
                <dt>국적</dt>
                <dd>${metaDataSearchQuickView.country_nm}</dd>
              </dl>
              <dl>
                <dt>작가</dt>
                <dd>${metaDataSearchQuickView.author}</dd>
              </dl>
              <dl>
                <dt>보관처</dt>
                <dd>${metaDataSearchQuickView.storage_nm}</dd>
              </dl>
              <dl>
                <dt>대/중/소</dt>
                <dd>${metaDataSearchQuickView.class1_nm}/${metaDataSearchQuickView.class2_nm}/${metaDataSearchQuickView.class3_nm}</dd>
              </dl>
              <dl>
                <dt>크기</dt>
                <dd>${metaDataSearchQuickView.measurement_value}</dd>
              </dl>
            </div>
            <div class="simple_view_footer">
              <c:choose>
	              <c:when test="${image eq null }">
	              	<span><a href="javascript:quickView('${metaDataSearchQuickView.prev}');">< 이전자료</a></span> | <span><a href="javascript:quickView('${metaDataSearchQuickView.next}');">다음자료 ></a></span> | <span><a href="javascript:metaDataListView('${metaDataSearchQuickView.possession_code_idx}','${metaDataSearchQuickView.org_code_idx}','${metaDataSearchQuickView.item_no}','${metaDataSearchQuickView.item_detail_no}', '${metaDataSearchQuickView.reg_state}')">자세히보기</a></span>
	          	  </c:when>
	          	  <c:otherwise>
	          	  	<span><a href="javascript:imageQuickView('${metaDataSearchQuickView.prev}');">< 이전자료</a></span> | <span><a href="javascript:imageQuickView('${metaDataSearchQuickView.next}');">다음자료 ></a></span> | <span><a href="javascript:metaDataListView('${metaDataSearchQuickView.possession_code_idx}','${metaDataSearchQuickView.org_code_idx}','${metaDataSearchQuickView.item_no}','${metaDataSearchQuickView.item_detail_no}','${metaDataSearchQuickView.reg_state}')">자세히보기</a></span>
	          	  </c:otherwise>
          	  </c:choose>
            </div>
         </c:forEach>
      </div>