<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

 					<table class="table mb-0">
                        <thead>
                          <tr class="tr_bgc">
                            <th colspan="4">보관처 코드</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr class="setting_thead">
                            <th>명칭</th>
                            <th>수정일</th>
                            <th>수정자</th>
                            <th>사용여부</th>
                          </tr>
                          <c:forEach var="storageCodeViewList" items="${storageCodeVO.storageCodeViewList }">
	                          <tr>
	                            <td onclick="storageCodeViewList('${storageCodeViewList.storage_code_idx}','${storageCodeViewList.storage_nm}','${storageCodeViewList.parent_code}')">${storageCodeViewList.storage_nm }</td>
	                            <td>${storageCodeViewList.mod_user }</td>
	                            <td>${storageCodeViewList.mod_date }</td>
	                            <td><button>${storageCodeViewList.enabled}</button></td>
	                          </tr>
                          </c:forEach>
                        </tbody>
                      </table>
                      
                      <script>
	              		<%-- 소장구분코드 조회 --%>
	            		function storageCodeViewList(value, value2, pc) {
	            			var storage_code_idx = value;
	            			var storage_nm = value2;
	            			var parent_code = pc;
                       		$.ajax({
                        			type : 'POST',                
                        			url : '/storageViewListAjax.do',    
                    				data:{
                    					parent_code : parent_code
                    				},
                        			dataType : "html",           
                        			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
                        			error : function() {          
                        				alert('통신실패!');
                        			},
                        			success : function(data) {  
                        				$('.user_control_right').empty().append(data);
                        				$('#subCodeSearchClose').click();
                        				
                        				$('#tree').jstree(); 
                        				$('#tree').jstree("close_all");
                        				$('#tree').jstree("deselect_all");
                        				$('#tree').jstree(true)._open_to(storage_code_idx);
                        				$('#'+parent_code).children('div').addClass('jstree-wholerow-clicked');
                        				$('#'+parent_code).attr('aria-selected', true);
                        				$('#'+parent_code).children('a').addClass('jstree-clicked');
                        				
                        				if(parent_code == "root"){
                        					$('#subInsParentCode').val(0);
                        					$('#subModParentCode').val(0);
                        				}else{
                        					$('#subInsParentCode').val(parent_code);
                        					$('#subModParentCode').val(parent_code);
                        				}
                        			}
                                })
	            		}
                      </script>