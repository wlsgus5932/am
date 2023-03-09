<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    				<div class="table-responsive" style="overflow-y:scroll; height:300px; padding:4px; border:1 solid #000000;">
                        <table class="table mb-0">
                          <thead>
                            <tr class="tr_bgc">
                              <th>번호</th>
                              <th>색인어</th>
                            </tr>
                          </thead>
                          <tbody id="keyword_tbody">
                          <c:forEach var="list" items="${keywordList}">
	                          <tr>
	    						  <td>${list.rownum}</td>
	                              <td>${list.keyword}</td>
	                            </tr>
	                            </c:forEach>
                          </tbody>
                        </table>
                      </div>