<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    			<div class="img-slider">
    				<c:choose>
							<c:when test="${mainImageList.size() > 0 }">
	                          	<c:forEach var="list" items="${mainImageList}" varStatus="status">
	                          		<div>
								    	<img src="<c:url value='/images/${list.image_nm }'/>" onerror=this.src="/assets/images/no_image.png">
								    </div>
                                </c:forEach>
	                         </c:when>
							<c:otherwise>
										<img src="/assets/images/no_image.png">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="slider_count_wrap">
                          <span>1</span>/<span>${mainImageList.size() }</span>
                        </div>
							
                                
 							