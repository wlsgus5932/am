<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

            <!-- 보관처코드 -->
            <div class="tab-pane" id="code-tap-8" role="tabpanel" style="display:block;">
              <div class="user_control_wrap mb-0">
                <!-- 왼쪽 -->
                <div class="user_control_letf col-xl-6">
                  <div class="user_control_card_wrap card">
                    <div class="table-responsive">
                      <table class="table mb-0">
                        <thead>
                          <tr class="tr_bgc">
                            <th colspan="7">보관처 구조</th>
                          </tr>
                        </thead>
                      </table>
                      <div id="tree"></div>
                    </div>
                  </div>
                  <button class="custom_btn btn_code_upload" data-bs-toggle="modal" data-bs-target="#code_find_modal">코드찾기</button>
                </div>
                <!-- 화살표 -->
                <div class="center_arrow">▶</div>
                <!-- 오른쪽 -->
                <div class="user_control_right col-xl-6">
                   
                </div>
              </div>
            </div>
            
            <!-- 코드찾기 모달창 -->
            <div id="code_find_modal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none" aria-hidden="true">
              <div class="modal-dialog user-modal">
                <div class="modal-content">
                  <div class="modal-header mv-modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="subCodeSearchClose"></button>
                  </div>
                  <div class="modal-body mv-modal-body">
                    <div class="mb-0 user-wrap">
                      <div class="st_wrap">
                        <label class="col-md-2 col-form-label st_title">코드찾기</label>
                      </div>
                      <div class="card-body">
                      	<form id="storageSearchForm" name="storageSearchForm" method="post" class="form-horizontal" onsubmit="return false">
	                        <div class="table-responsive">
	                          <table class="table mb-0">
	                            <tbody>
	                              <tr>
	                                <td>코드명</td>
	                                <td>
										<input type="text" id="search_word" name="search_word" onkeypress="if( event.keyCode == 13 ){storageSearchList();}">
										<input type="hidden" id="search_type" name="search_type" value="storage_nm">
										<button type="button" onClick="storageSearchList();">코드찾기</button>
									</td>
	                              </tr>
	                            </tbody>
	                          </table>
	                          <div class="code_find_wrap"></div>
<!-- 	                          <button class="btn btn-secondary btn_save">저장</button> -->
	                        </div>
                        </form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!--  -->
            
            <!-- 코드등록 모달창 -->
            <div id="code_insert_modal-1" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none" aria-hidden="true">
              <div class="modal-dialog user-modal">
                <div class="modal-content">
                  <div class="modal-header mv-modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="subCodeInsClose"></button>
                  </div>
                  <div class="modal-body mv-modal-body">
                    <div class="mb-0 user-wrap">
                      <div class="st_wrap">
                        <label class="col-md-2 col-form-label st_title">코드 등록</label>
                      </div>
                      <div class="card-body">
                        <div class="table-responsive">
                           <form action="" method="post" name="subCodeInsForm">
                        	  <input type="hidden" name="" id="subInsType"/>
                        	  <input type="hidden" name="parent_code" id="subInsParentCode"/>
	                          <table class="table mb-0">
	                            <tbody>
	                              <tr>
	                                <td>명칭</td>
	                                <td>
	                                  <input type="text" id="subInsNm"/>
	                                </td>
	                              </tr>
	                              <tr>
	                                <td>사용여부</td>
	 								<td>
		                               	 <input type="checkbox" name="enabled" value="Y" id="subInsCodeEnabledY">사용
		                                 <input type="checkbox" name="enabled" value="N" id="subInsCodeEnabledN">미사용
		                            </td>                             
		                          </tr>
	                            </tbody>
	                          </table>
	                          <button class="btn btn-secondary btn_save" type="button" id="subInsBtn">저장</button>
	                       </form> 
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            <!-- 코드수정 모달창2 -->
            <div id="code_modify_modal-2" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none" aria-hidden="true">
              <div class="modal-dialog user-modal">
                <div class="modal-content">
                  <div class="modal-header mv-modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="subModClose"></button>
                  </div>
                  <div class="modal-body mv-modal-body">
                    <div class="mb-0 user-wrap">
                      <div class="st_wrap">
                        <label class="col-md-2 col-form-label st_title">코드 수정</label>
                      </div>
                      <div class="card-body">
                        <div class="table-responsive">
                           <form action="" method="post" name="subCodeModForm">
                        	  <input type="hidden" name="" id="subModType"/>
                        	  <input type="hidden" name="storage_code_idx" id="subModIdx"/>
                        	  <input type="hidden" name="parent_code" id="subModParentCode"/>
	                          <table class="table mb-0">
	                            <tbody>
	                              <tr>
	                                <td>명칭</td>
	                                <td>
	                                  <input type="text" name="" id="subModNm"/>
	                                </td>
	                              </tr>
	                              <tr>
	                                <td>사용여부</td>
	                                <td>
	                                	 <input type="checkbox" name="enabled" value="Y" id="subModCodeEnabledY">사용
		                                 <input type="checkbox" name="enabled" value="N" id="subModCodeEnabledN">미사용
	                                </td>
	                              </tr>
	                            </tbody>
	                          </table>
	                          <button class="btn btn-secondary btn_save" type="button" id="subModBtn">저장</button>
                          </form>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <script>
			<%-- 코드 등록 사용 여부 체크박스 단일선택 --%>
			$('input[type="checkbox"][name="enabled"]').click(function(){
				  if($(this).prop('checked')){
				 
				     $('input[type="checkbox"][name="enabled"]').prop('checked',false);
				 
				     $(this).prop('checked',true);
				 
				    }
				  
			});
    		
// 			$('input[type="text"]').keydown(function() {
// 	  			  if (event.keyCode === 13) {
// 	  			    event.preventDefault();
// 	  			  };
// 			});
			
            function getJson() {
//             	var icon = "";
//                 var company = new Array();
//             	company[0] = {id : "root", parent : "#", text : "보관처", state : {opened:true}};
            	
//             	$.ajax({
//                         type:'get',
//                         url:'/treelist.do',
//                         dataType:'json',
//                         success: function(data) {
//                                     // 데이터 받아옴
//                             $.each(data.storageCodeVOList, function(idx, item){
//                             	//상위 메뉴 없는경우 root로 부모 메뉴명 변경, 아이콘 설정
//             					if (item.parent_code == null || item.parent_code == '' || item.parent_code == 0){
//             						item.parent_code = "root";
//             						icon = 'jstree-folder';
//             					} else{
//             						icon = 'jstree-file';
//             					}
                            	
//                                 company[idx+1] = {id:item.storage_code_idx, parent:item.parent_code, text:item.storage_nm, icon:icon};
//                             });

//                                     // 트리 생성
//                             $('#tree').jstree({
//                                 core: {
//                                                 data: company    //데이터 연결
//                                     },
//                                     types: {
//                                            'default': {
//                                                 'icon': 'jstree-folder'
//                                             }
//                                     },
//                                     plugins: ['wholerow', 'types']
//                              })
//                              .bind('loaded.jstree', function(event, data){
//                                     //트리 로딩 롼료 이벤트
//                              })
//                              .bind('select_node.jstree', function(event, data){
//                             	 var id = data.instance.get_node(data.selected).id; 
// 	                         		$.ajax({
// 	                        			type : 'POST',                
// 	                        			url : '/storageViewListAjax.do',    
// 	                    				data:{
// 	                    					parent_code : id
// 	                    				},
// 	                        			dataType : "html",           
// 	                        			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
// 	                        			error : function() {          
// 	                        				alert('통신실패!');
// 	                        			},
// 	                        			success : function(data) {  
// 	                        				$('.user_control_right').empty().append(data);
	                        				
// 	                        				if(id == "root"){
// 	                        					$('#subInsParentCode').val(0);
// 	                        					$('#subModParentCode').val(0);
// 	                        				}else{
// 	                        					$('#subInsParentCode').val(id);
// 	                        					$('#subModParentCode').val(id);
// 	                        				}
	                        				
// 	                        			}
// 	                                })
//                              })
//                              .bind("refresh.jstree", function(e,d) {
//                             		alert('refresh');
//                              })

//                         },
//                         error:function (data) {
//                             alert("에러");
//                         }
//                    });
                }
        	$(function() {
            	getJson(); 
        	});
//             $(document).ready(function(){
//             	getJson(); 
//             	alert('getjson');
//             });
    		
    		<%-- 보관처 코드명 검색 --%>
    		function storageSearchList(){
    			var search_word = $('#search_word').val();
    			var search_type = $('#search_type').val();
    			// 태그 조건 검색			
    			var queryString = $("form[name=storageSearchForm]").serialize();

    				$.ajax({
    					type : 'post',
    					url : '/storageSearchListAjax.do',
    					data : queryString,
    					dataType : 'html',
    					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
    					error: function(xhr, status, error){
    						alert(error);
    					},
    					success : function(data){
    						$('.code_find_wrap').empty().append(data);
//     						$('#perPageNum').val(perPageNum);
//     						$('#search_word').val(search_word);
//     						$('#search_type').val(search_type);
    					}
    				});
    		}
            </script>