const getDeletion = () => {
	if(!checkInput()) { return }
	let formData = $('#deletionForm').serialize();
				$.ajax({
						type : 'POST',                 
						url : '/getDeletionList.do',
						data: formData,			
						dataType : "html",           
						contentType : "application/x-www-form-urlencoded;charset=UTF-8",
						error : function() {        
							alert('통신실패!');
						},
						success : function(data) {  
							$('#deletionZone').empty().append(data);
						}
					});
}

const checkInput = () => {
	if(!$('#deletion_org_code_idx > option:selected').val()) {
    	alert("기관코드를 선택해주세요.");
		return false
	}
	if(!$('#deletion_possession_code_idx > option:selected').val()) {
    	alert("소장구분을 선택해주세요.");
		return false
	}
	if(!$('#deletion_item_no1').val()) {
    	alert("첫번째 자료번호를 입력해주세요.");
		return false
	}
	if(!$('#deletion_item_no2').val()) {
    	alert("두번째 자료번호를 입력해주세요.");
		return false
	}
	if($('#deletion_item_detail_no1').val()) {
		if(!$('#deletion_item_detail_no2').val()) {
			alert("두번째 세부번호를 입력해주세요.");
			return false
		}
	}
	if($('#deletion_item_detail_no2').val()) {
		if(!$('#deletion_item_detail_no1').val()) {
			alert("첫번째 세부번호를 입력해주세요.");
			return false
		}
	}
	if($('#deletion_item_no1').val() > $('#deletion_item_no2').val()) {
		alert("두번째 자료번호의 검색조건이 잘못되었습니다")
		return false
	}
	return true
}

const deletionCheckAll = () => {
	if($("#deletionAllCheckbox").is(':checked')) {
		$("input[name=item_idx]").prop("checked", true);
	} else {
		$("input[name=item_idx]").prop("checked", false);
	}
}

$("#deletionAllCheckbox").click(function() {
	console.log('click');
	if($("#deletionAllCheckbox").is(':checked')) {
		$("input[id=deletionCheckbox]").prop("checked", true);
	} else {
		$("input[id=deletionCheckbox]").prop("checked", false);
	}
});

const checkDelete = () => {
	let checkbox = $('input:checkbox[id=deletionCheckbox]:checked');
	if($('#deletionCheckbox').is(":checked") == false){
		alert("삭제신청하실 자료를 1개이상 선택해주세요.");
		return;
	}
   

	if(confirm("선택하신 자료 삭제신청을 하시겠습니까?")) {
		/*$("#keyword_child_modal").css("display", "block");
		$('#keyword_child_modal').addClass("show");*/
		
		let item_idx = [];
		let org_nm = $('#deletion_org_code_idx option:checked').text();
		let possession_nm = $('#deletion_possession_code_idx option:checked').text();
		let item_no = [];
		let item_detail_no = [];
		let item_nm = [];
		let erasure_reason = $('#erasure_reason').val();
		let aproval_state = 'N';
	checkbox.each(function(j) {
		
		let tr = checkbox.parent().parent().eq(j);
		item_idx.push(checkbox.val());
		
		let td = tr.children();
			item_no.push(td.eq(3).text());
			item_detail_no.push(td.eq(4).text());
			item_nm.push(td.eq(5).text());
		/*for(let i=3; i<tr.children().length; i++) {
			console.log(i+'::::'+td.eq(i).text());
		}*/
		console.log(item_idx, item_no, item_detail_no, item_nm);
	})
	
			$.ajax({
						type : 'POST',
						url : '/deleteDeletion.do',
						data: {
							item_idx: item_idx,
							item_no: item_no,
							item_detail_no: item_detail_no,
							item_nm: item_nm,
							org_nm: org_nm,
							possession_nm: possession_nm,
							erasure_reason: erasure_reason,
							aproval_state: aproval_state
							},			
						dataType : "text",           
						contentType : "application/x-www-form-urlencoded;charset=UTF-8",
						error : function() {
							alert('오류가 발생했습니다. 다시 시도해주세요.');
						},
						success : function(data) {
							data == 'success' ? (alert('삭제 신청 완료'), getDeletion()) : alert('오류가 발생했습니다. 다시 시도해주세요.');
						}
					});
	} else {
		return false;
	}
}

const goDelitionPage = page => {
	$('#deletion_page').val(page);
	let formData = $('#deletionForm').serialize();
	console.log(formData);
	$.ajax({
			type : 'POST',                 
			url : '/getDeletionList.do',
			data: formData,			
			dataType : "html",           
			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
			error : function() {
					alert('통신실패!');
			},
			success : function(data) {  
				$('#deletionZone').empty().append(data);
				console.log(data);
			}
		});
}

	let count = 0;
    let movementData = [];
    let item_idx = '';
    // update -------------------------------

	const checkUpdateForm = () => {
		let arr = $('#itembasekeyword').val().split(',').filter(e => e.length !== 0 );
		if(arr.length < 5) {
			alert("콤마 ', ' 단위로 5개 이상 입력해주세요.")
			return
		}
		updateData();
	}
    const updateData = async () => {
    	if(confirm("수정하시겠습니까?")) {
    		
    	let formData = new FormData(document.getElementById('add-form'));
    	formData.append("item_idx", sessionStorage.getItem("item_idx"));
    	
    	const res = await fetch('/update.do', {
       		method:'POST',
       		headers: {
                   "Content-Type": "application/x-www-form-urlencoded",
               },
               body: new URLSearchParams(formData)
       	})
    	const result = await res.text();
    	result == 'success' ? (alert('수정 완료'), search_item_base()) : alert('오류가 발생했습니다. 다시 시도해주세요,');
    	
    	} else {
    		return false;
    	}
    }
    
    // update end------------------------------------------------------------
    
    
    /* const submitForm = async () => {
   	let formData = new FormData(document.getElementById('add-form'));
   	
   	const form = await fetch('/add.do', {
   		method:'POST',
   		headers: {
               "Content-Type": "application/x-www-form-urlencoded",
           },
           body: new URLSearchParams(formData)
   	})
   	
	//const res = await form.text();
   	const { item_idx } = await form.json();
   	
   	sessionStorage.setItem("item_idx", item_idx);
   	
   	if(item_idx == null) {
        alert('오류입니다');
     } else {
        location.reload();
        alert('등록완료');
     }
    }; */
    
    const changeCountry = async(r, n) => {
   	 $('#era-select'+(n)).children('option:not(:first)').remove();
   	 const res = await fetch('/getEraData.do?country=' + r);
   	 
   	  if (res.status === 200) {
   	     const { eraList } = await res.json();
   	     eraList.forEach(e => {
   	    	 $('#era-select'+(n)).append("<option value="+e.era_code_idx+">"+e.era_nm+"</option>");	
   	     })
   	 }
    };
    
    const changeMaterial = async(r, n) => {
   	 $('#material2_code_idx'+(n)).children('option:not(:first)').remove();
   	 const res = await fetch('/getMaterialData.do?material=' + r);
   	 
   	 if (res.status === 200) {
   	     const { material2List } = await res.json();
   	     material2List.forEach(e => {
   	    	 $('#material2_code_idx'+(n)).append("<option value="+e.material2_code_idx+">"+e.material2_nm+"</option>");
   	     })
   	 }
    };
    
    const addClassTd = (r, b) => {
   	 count = document.getElementById(r).querySelectorAll("th").length;
   	 let cell = '';
   	 switch (r) {
   	  case 'class-table':
   	  	 cell =  '<tr id="class-tr"><td><input type="checkbox" name="class-checkbox" id="class-checkbox'+count+'"></td>' +
			 '<th scope="row">'+(count+1)+'</th>' + '<input type="hidden" name="taxonomy_idx" id="taxonomy_idx'+count+'"/>' +
			 '<td><select class="form-select st_select" id="class1_code_idx'+count+'" name="class1_code_idx"><option value="" selected>선택</option>' +
			 '<c:forEach var="list" items="${class1List}" varStatus="status"><option value="${list.class1_code_idx}">${list.class1_nm}</option></c:forEach></select></td>' +
			 '<td><select class="form-select st_select" id="class2_code_idx'+count+'" name="class2_code_idx"><option value="" selected>선택</option>' +
			 '<c:forEach var="list" items="${class2List}" varStatus="status"><option value="${list.class2_code_idx}">${list.class2_nm}</option></c:forEach></select></td>' +
			 '<td><select class="form-select st_select" id="class3_code_idx'+count+'" name="class3_code_idx"><option value="" selected>선택</option> ' +
			 '<c:forEach var="list" items="${class3List}" varStatus="status"><option value="${list.class3_code_idx}">${list.class3_nm}</option></c:forEach></select></td></tr>';
   	    break;
   	    
   	  case 'country-table':
   	    cell = '<tr><td><input type="checkbox" name="country-checkbox" id="country-checkbox'+count+'"></td>' +
   	    '<th scope="row">'+(count+1)+'</th>'+
           '<td><select class="form-select st_select" id="country-select'+count+'" onchange="changeCountry(this.value, '+count+')" name="country_code_idx"><option value="" selected>선택</option>' +
           '<c:forEach var="list" items="${countryList}" varStatus="status"><option value="${list.country_code_idx}">${list.country_nm}</option></c:forEach></select></td>'+
           '<td><select class="form-select st_select" id="era-select'+count+'" name="era_code_idx"><option value="" selected>선택</option></select></td>' +
           '<td><input class="form-control st_input" list="datalistOptions" name="detail_year" placeholder="상세 시대를 입력해 주세요." id=detail_year'+count+'></td></tr>';
   	    break; 
   	    
   	  case 'material-table': 
   		  cell =  '<tr><td><input type="checkbox" name="material-checkbox" id="material-checkbox'+count+'"></td>' +
             '<th scope="row">'+(count+1)+'</th>' +
             '<td><select class="form-select st_select" onchange="changeMaterial(this.value, '+count+')" id="material1_code_idx'+count+'" name="material1_code_idx"><option value="" selected>선택</option>' +
             '<c:forEach var="list" items="${material1List}" varStatus="status"><option value="${list.material1_code_idx}">${list.material1_nm}</option></c:forEach></select></td>' +
             '<td><select class="form-select st_select" id="material2_code_idx'+count+'" name="material2_code_idx"><option value="" selected>선택</option></select></td>' +
             '<td><input class="form-control st_input" list="datalistOptions" placeholder="상세 재질을 입력해 주세요." id="material_detail'+count+'" name="material_detail"></td></tr>';
             break;
             
   	  case 'measurement-table':
   		  cell = '<tr><td><input type="checkbox" name="measurement-checkbox" id="measurement-checkbox'+count+'"></td>' +
             '<th scope="row">'+(count+1)+'</th>' +
             '<td><input class="form-control st_input" list="datalistOptions" id="measurement_item_type'+count+'" placeholder="소장구분을 입력해 주세요." name="measurement_item_type"></td>' +
             '<td><select class="form-select st_select" id="measurement_code_idx'+count+'" name="measurement_code_idx"><option value="" selected>선택</option>' +
             '<c:forEach var="list" items="${measurementList}" varStatus="status"><option value="${list.measurement_code_idx}">${list.measurement_nm}</option></c:forEach></select></td>' +
             '<td><input class="form-control st_input" list="datalistOptions" id="measurement_value'+count+'" placeholder="실측치를 입력해 주세요." name="measurement_value"><td>' +
             '<select class="form-select st_select" id="measurement_unit_code_idx'+count+'" name="measurement_unit_code_idx"><option value="" selected>선택</option>' +
             '<c:forEach var="list" items="${measurementUnitList}" varStatus="status"><option value="${list.measurement_unit_code_idx}">${list.measurement_unit_nm}</option></c:forEach>' +
             '</select></td></tr>';
             break;
             
   	  case 'possession-table':
   		  cell = '<tr><td><input type="checkbox" name="possession-checkbox" id="possession-checkbox'+count+'">' +
             '<th scope="row">'+(count+1)+'</th>' +
             '<td><select class="form-select st_select" id="invol_possession_code_idx'+count+'" name="invol_possession_code_idx"><option value="" selected>선택</option>' +
             '<c:forEach var="list" items="${posSessionList}" varStatus="status"><option value="${list.possession_code_idx}">${list.possession_nm}</option></c:forEach></select>' +
             '</td><td><input class="form-control st_input" list="datalistOptions" name="invol_item_no" placeholder="자료번호를 입력해 주세요." id="invol_item_no'+count+'"></td>' +
             '<td><input class="form-control st_input" list="datalistOptions" name="invol_remark" placeholder="참고사항을 입력해 주세요." id="invol_remark'+count+'"></td></tr>';
             break;
         
   	  case 'insurance-table':
   		  cell = '<tr><td><input type="checkbox" name="insurance-checkbox" id="insurance-checkbox'+count+'"></td>' +
             '<th scope="row">'+(count+1)+'</th><td><input class="form-control st_input" list="datalistOptions" name="insu_agreed_value" placeholder="평가액을 입력해 주세요." id="insu_agreed_value'+count+'"></td>' +
             '<td><select class="form-select st_select" name="insu_price_unit_code_idx" id="insu_price_unit_code_idx'+count+'"><option value="" selected>선택</option>' +
             '<c:forEach var="list" items="${priceUnitList}" varStatus="status"><option value="${list.price_unit_code_idx}">${list.price_unit_nm}</option></c:forEach></select></td>' +
             '<td><input class="form-control" type="date" name="insu_start_date" id="insu_start_date'+count+'"> ~ <input class="form-control" type="date" name="insu_end_date" id="insu_end_date'+count+'"></td>' +
             '<td><input class="form-control st_input" list="datalistOptions" placeholder="대여기관을 입력해 주세요." id="insu_rental_org'+count+'" name="insu_rental_org"></td>' +
             '<td><input class="form-control st_input" list="datalistOptions" placeholder="참고사항을 입력해 주세요." id="insu_remark'+count+'" name="insu_remark"></td></tr>';
             break;
             
   	  case 'copyright-table':
   		  cell = '<tr><td><input type="checkbox" name="copyright-checkbox" id="copyright-checkbox'+count+'"></td>' +
             '<th scope="row">'+(count+1)+'</th><td><select class="form-select st_select" name="copy_copyright" id="copy_copyright'+count+'"><option value="" selected>선택</option><option value="Y">예</option>' +
             '<option value="N">아니요</option></select></td>' + 
             '<td><input class="form-control st_input" list="datalistOptions" placeholder="" name="copy_owner" id="copy_owner'+count+'"></td>' + 
             '<td><input class="form-control" type="date" name="copy_expiry_date" id="copy_expiry_date'+count+'"></td>' +
             '<td><select class="form-select st_select" name="copy_usage_permission" id="copy_usage_permission'+count+'"><option value="" selected>선택</option><option value="Y">예</option><option value="N">아니요</option>' +
             '</select></td><td><select class="form-select st_select" name="copy_copyright_transfer" id="copy_copyright_transfer'+count+'"><option value="" selected>선택</option><option value="Y">예</option>' +
             '<option value="N">아니요</option></select></td>' +
             '<td><input class="form-control st_input" list="datalistOptions" placeholder="참고사항을 입력해 주세요." name="copy_remark" id="copy_remark'+count+'"></td></tr>';
             break;
   	  
   	  default:
   	    '';
   	}
   	 
       $("#"+b).append(cell);
       count++;
    };
    
    const addClassTd2 = (r, b) => {
      	 count = document.getElementById(r).querySelectorAll("th").length;
      	 let cell = '';
      	 switch (r) {
      	  case 'class-table':
      	  	 cell =  '<tr id="class-tr"><td><input type="checkbox" name="class-checkbox"></td>' +
   			 '<th scope="row">'+(count+1)+'</th>' + '<input type="hidden" name="taxonomy_idx" id="taxonomy_idx'+count+'"/>' +
   			 '<td><select class="form-select st_select" id="class1_code_idx'+count+'" name="update_class1_code_idx"><option value="" selected>선택</option>' +
   			 '<c:forEach var="list" items="${class1List}" varStatus="status"><option value="${list.class1_code_idx}">${list.class1_nm}</option></c:forEach></select></td>' +
   			 '<td><select class="form-select st_select" id="class2_code_idx'+count+'" name="update_class2_code_idx"><option value="" selected>선택</option>' +
   			 '<c:forEach var="list" items="${class2List}" varStatus="status"><option value="${list.class2_code_idx}">${list.class2_nm}</option></c:forEach></select></td>' +
   			 '<td><select class="form-select st_select" id="class3_code_idx'+count+'" name="update_class3_code_idx"><option value="" selected>선택</option> ' +
   			 '<c:forEach var="list" items="${class3List}" varStatus="status"><option value="${list.class3_code_idx}">${list.class3_nm}</option></c:forEach></select></td></tr>';
      	    break;
      	    
      	  case 'country-table':
      	    cell = '<tr><td><input type="checkbox" name="country-checkbox"></td>' +
      	    '<th scope="row">'+(count+1)+'</th>'+
              '<td><select class="form-select st_select" id="country-select'+count+'" onchange="changeCountry(this.value, '+count+')" name="update_country_code_idx"><option value="" selected>선택</option>' +
              '<c:forEach var="list" items="${countryList}" varStatus="status"><option value="${list.country_code_idx}">${list.country_nm}</option></c:forEach></select></td>'+
              '<td><select class="form-select st_select" id="era-select'+count+'" name="update_era_code_idx"><option value="" selected>선택</option></select></td>' +
              '<td><input class="form-control st_input" list="datalistOptions" name="update_detail_year" placeholder="상세 시대를 입력해 주세요." id=detail_year'+count+'></td></tr>';
      	    break; 
      	    
      	  case 'material-table': 
      		  cell =  '<tr><td><input type="checkbox" name="material-checkbox"></td>' +
                '<th scope="row">'+(count+1)+'</th>' +
                '<td><select class="form-select st_select" onchange="changeMaterial(this.value, '+count+')" id="material1_code_idx'+count+'" name="update_material1_code_idx"><option value="" selected>선택</option>' +
                '<c:forEach var="list" items="${material1List}" varStatus="status"><option value="${list.material1_code_idx}">${list.material1_nm}</option></c:forEach></select></td>' +
                '<td><select class="form-select st_select" id="material2_code_idx'+count+'" name="update_material2_code_idx"><option value="" selected>선택</option></select></td>' +
                '<td><input class="form-control st_input" list="datalistOptions" placeholder="상세 재질을 입력해 주세요." id="material_detail'+count+'" name="update_material_detail"></td></tr>';
                break;
                
      	  case 'measurement-table':
      		  cell = '<tr><td><input type="checkbox" name="measurement-checkbox"></td>' +
                '<th scope="row">'+(count+1)+'</th>' +
                '<td><input class="form-control st_input" list="datalistOptions" id="measurement_item_type'+count+'" placeholder="소장구분을 입력해 주세요." name="update_measurement_item_type"></td>' +
                '<td><select class="form-select st_select" id="measurement_code_idx'+count+'" name="update_measurement_code_idx"><option value="" selected>선택</option>' +
                '<c:forEach var="list" items="${measurementList}" varStatus="status"><option value="${list.measurement_code_idx}">${list.measurement_nm}</option></c:forEach></select></td>' +
                '<td><input class="form-control st_input" list="datalistOptions" id="measurement_value'+count+'" placeholder="실측치를 입력해 주세요." name="update_measurement_value"><td>' +
                '<select class="form-select st_select" id="measurement_unit_code_idx'+count+'" name="update_measurement_unit_code_idx"><option value="" selected>선택</option>' +
                '<c:forEach var="list" items="${measurementUnitList}" varStatus="status"><option value="${list.measurement_unit_code_idx}">${list.measurement_unit_nm}</option></c:forEach>' +
                '</select></td></tr>';
                break;
                
      	  case 'possession-table':
      		  cell = '<tr><td><input type="checkbox" name="possession-checkbox">' +
                '<th scope="row">'+(count+1)+'</th>' +
                '<td><select class="form-select st_select" name="update_invol_possession_code_idx" id="invol_possession_code_idx'+count+'"><option value="" selected>선택</option>' +
                '<c:forEach var="list" items="${posSessionList}" varStatus="status"><option value="${list.possession_code_idx}">${list.possession_nm}</option></c:forEach></select>' +
                '</td><td><input class="form-control st_input" list="datalistOptions" name="update_invol_item_no" placeholder="자료번호를 입력해 주세요." id="invol_item_no'+count+'"></td>' +
                '<td><input class="form-control st_input" list="datalistOptions" name="update_invol_remark" placeholder="참고사항을 입력해 주세요." id="invol_remark'+count+'"></td></tr>';
                break;
            
      	  case 'insurance-table':
      		cell = '<tr><td><input type="checkbox" name="insurance-checkbox"></td>' +
            '<th scope="row">'+(count+1)+'</th><td><input class="form-control st_input" list="datalistOptions" name="update_insu_agreed_value" id="insu_agreed_value'+count+'" placeholder="평가액을 입력해 주세요." ></td>' +
            '<td><select class="form-select st_select" name="update_insu_price_unit_code_idx" id="insu_price_unit_code_idx'+count+'"><option value="" selected>선택</option>' +
            '<c:forEach var="list" items="${priceUnitList}" varStatus="status"><option value="${list.price_unit_code_idx}">${list.price_unit_nm}</option></c:forEach></select></td>' +
            '<td><input class="form-control" type="date" name="update_insu_start_date" id="insu_start_date'+count+'"> ~ <input class="form-control" type="date" name="update_insu_end_date" id="insu_end_date'+count+'"></td>' +
            '<td><input class="form-control st_input" list="datalistOptions" placeholder="대여기관을 입력해 주세요." id="insu_rental_org'+count+'" name="update_insu_rental_org"></td>' +
            '<td><input class="form-control st_input" list="datalistOptions" placeholder="참고사항을 입력해 주세요." id="insu_remark'+count+'" name="update_insu_remark"></td></tr>';
            break;
                
      	  case 'copyright-table':
      		  cell = '<tr><td><input type="checkbox" name="copyright-checkbox"></td>' +
                '<th scope="row">'+(count+1)+'</th><td><select class="form-select st_select" name="update_copy_copyright" id="update_copy_copyright'+count+'"><option value="" selected>선택</option><option value="Y">예</option>' +
                '<option value="N">아니요</option></select></td>' + 
                '<td><input class="form-control st_input" list="datalistOptions" name="update_copy_owner" placeholder="" id="update_copy_owner'+count+'"></td>' + 
                '<td><input class="form-control" type="date" name="update_copy_expiry_date" id="update_copy_expiry_date'+count+'"></td>' +
                '<td><select class="form-select st_select" name="update_copy_usage_permission" id="update_copy_usage_permission'+count+'"><option value="" selected>선택</option><option value="Y">예</option><option value="N">아니요</option>' +
                '</select></td><td><select class="form-select st_select" name="update_copy_copyright_transfer" id="update_copy_copyright_transfer'+count+'"><option value="" selected>선택</option><option value="Y">예</option>' +
                '<option value="N">아니요</option></select></td>' +
                '<td><input class="form-control st_input" list="datalistOptions" name="update_copy_remark" placeholder="참고사항을 입력해 주세요." id="update_copy_remark'+count+'"></td></tr>';
                break;
      	  
      	  default:
      	    '';
      	}
      	 
          $("#"+b).append(cell);
          count++;
       };
     
    const deleteClassTd = async (e, v, text) => {
	       	let arr = [];
	    	const check = 'input[name='+v+']:checked';
	   		const selected = document.querySelectorAll(check);
	   		 
	        for(let i =0;i<selected.length;i++) {
	            selected[i].parentElement.parentElement.remove();
	            if(selected[i].value != 'on') {
		            arr.push(selected[i].value);
	            }
	        }
	        if(arr.length) {
		   		let formData = new FormData;
		   		formData.append(''+text+'_idx', arr);
	            let res = await fetch('/delete'+text+'.do', {
	           		method:'POST',
	           		headers: {
	                       "Content-Type": "application/x-www-form-urlencoded",
	                   },
	                   body: new URLSearchParams(formData)
	           	})
	            let result = await res.text();
	            result == 'success' ? alert("삭제되었습니다.") : alert("오류입니다");
	        }
	            
	    	count -= selected.length;
	    	sortNumber(e);
  };
  
  const sortNumber = e => {
	  let rows = document.getElementById(e).querySelectorAll("th");
	   for(let i = 1; i<=rows.length; i++) {
		   $(rows[i]).text((i+1));
	   }
  }
  
  const change_storageType2 = async (v) => {
	  $('#storage_type2_code_idx').children('option:not(:first)').remove();
 	 const res = await fetch('/getStorageType2.do?type2=' + v);
 	 
 	 if (res.status === 200) {
 	     const { storage2List } = await res.json();
 	   storage2List.forEach(e => {
 	   	$('#storage_type2_code_idx').append("<option value="+e.storage_type2_code_idx+">"+e.storage_type2_nm+"</option>")
 	   });
 	 }
  }
  
  let movementTr = '';
  
  const submitAddMovement = async () => {
	    let formData = new FormData(document.getElementById('addMovement'));
	    formData.append('item_idx', sessionStorage.getItem('item_idx'));
	   	
	   	const form = await fetch('/addMovement.do', {
	   		method:'POST',
	   		headers: {
	               "Content-Type": "application/x-www-form-urlencoded",
	           },
	           body: new URLSearchParams(formData)
	   	})
	   	
	   	//const res = await form.text();
	   	const { movement_idx } = await form.json();
	   	sessionStorage.setItem("movement_idx", movement_idx);
		
	   	movement_idx ? (alert('등록완료'),
	   								$("#addMovement")[0].reset(),
	   								getMovementList(),
	   								removeTd()
	   	) : alert('오류입니다');
  }
  
  const removeTd = () => {
	   $('#movement-in-tr > td:gt(1)').remove();
	   $('#movement-out-tr > td:gt(1)').remove();
  }
  
   const getMovementList = async () => {
   	  const item_idx = sessionStorage.getItem("item_idx");
		  movementData = [];
		  const res = await fetch('/getMovementData.do?item_idx=' + item_idx);
		  $('#default-movement').remove();
		  $('#past-movement-tbody').children('tr').remove();
		  $('#movement-tbody').children('tr').remove();
		  
		  const { movementList } = await res.json();
		  movementData = movementList;
		  let list = JSON.stringify(movementList);
		  
		  movementList.forEach((e, i) => {
		  	   	$('#movement-tbody').append('<tr><td scope="row">'+e.rownum+'</td><td>' +e.movement_date+ '</td>' +
	                    '<td>'+e.storage_type1_code_idx+'</td><td>'+e.storage_in+'</td><td>'+e.storage_out+'</td><td>'+e.movement_qty+'</td><td>'+e.current_qty+'</td><td>'+e.remark+'</td><td>'+e.requester+'</td>' +
	                     '<td><button id="modify-movement-btn" type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_wh" data-bs-toggle="modal" data-bs-target="#myModal" onclick="btn_control(1)">수정</button></td>' +
	                     '<td><button id="delete-movement-btn" type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_wh">삭제</button><input type="hidden" id="movement-idx" value="'+e.movement_idx+'"/></td></tr>');
		  	   	
		  	   	$('#past-movement-tbody').append('<tr><td scope="row">'+e.rownum+'</td><td>'+e.storage_in+'</td><td>'+e.movement_qty+'</td>' +
		          '<td><select class="form-select st_select" onchange="change_Inout(this.value, '+i+')">'+
		          '<option selected value="">선택</option><option value="IN">보관처</option><option value="OUT">반입처</option>' +
		          '</select></td></tr>');
		  }); 
  }
   
   const change_storage1 = async(v, num) => {
   	if(v == 'null') { $('#movement-in-tr > td').eq(num+1).remove(); return }
   	
	    let td_length = $('#movement-in-tr > td').length;
   	const res = await fetch('/getStorageCode.do?storage=' + v);
   	const { storageCodeList } = await res.json();
   	  	
   	if(!storageCodeList.length) {
   	  	$('#movement-in-tr > td').eq(num+1).remove(); 
   	  		return
   	};
   	
   	if(!$('#movement-in-tr > td:eq('+(num+1)+')').length) { 
   	  	$('#movement-in-tr').append('<td><select class="form-select st_select" name="storage1_code_idx" onchange="change_storage1(this.value, '+td_length+')"><option selected value="null">선택</option></select></td>');
   	} else {
   	  	$('#movement-in-tr > td:eq('+(num+1)+')' + '> select').children('option:not(:first)').remove();
   	};
   	
   	storageCodeList.forEach((e) => {
			 $('#movement-in-tr > td:eq('+(num+1)+')' + '> select').append("<option value="+e.storage_code_idx+">"+e.storage_nm+"</option>"); 
	    });
   }
   
   const change_storage2 = async(v, num) => {
		if(v == 'null') { 
			$('#movement-out-tr > td').eq(num+1).remove(); 
			return 
		} 
   	
	    let td_length = $('#movement-out-tr > td').length;
	    
   	const res = await fetch('/getStorageCode.do?storage=' + v);
   	const { storageCodeList } = await res.json();
   	  	
   	if(!storageCodeList.length) {
   	  	$('#movement-out-tr > td').eq(num+1).remove(); 
   	  		return
   	};
   	
   	if(!$('#movement-out-tr > td:eq('+(num+1)+')').length) {
   	  	$('#movement-out-tr').append('<td><select class="form-select st_select" name="storage2_code_idx" onchange="change_storage2(this.value, '+td_length+')"><option selected value="null">선택</option></select></td>');
   	} else {
   	  	$('#movement-out-tr > td:eq('+(num+1)+')' + '> select').children('option:not(:first)').remove();
   	};
   	
   	storageCodeList.forEach((e) => {
			 $('#movement-out-tr > td:eq('+(num+1)+')' + '> select').append("<option value="+e.storage_code_idx+">"+e.storage_nm+"</option>");
	    });
   }
   
   const change_Inout = async (v, num) => {
   	if(v == 'IN') {
   		let data = movementData[num].storage_in_code_idx.split(',');
   		
   		let td_length = $('#movement-in-tr > td').length;
   		$('#movement-in-tr > td:eq(1) > select').val(data[0]).prop("selected", true);
   		$('#movement-in-tr > td:gt(1)').remove();
   		
   		for(let i=2; i<=data.length; i++) {
	    		const res = await fetch('/getStorageCode.do?storage=' + data[i-2]);
	        	const { storageCodeList } = await res.json();
	        	 	
	    			$('#movement-in-tr').append('<td><select class="form-select st_select" name="storage1_code_idx" onchange="change_storage1(this.value, '+td_length+')"><option selected value="null">선택</option></select></td>');
	    			storageCodeList.forEach((e) => {
	    				 $('#movement-in-tr > td:eq('+i+')' + '> select').append("<option value="+e.storage_code_idx+">"+e.storage_nm+"</option>"); 
	    		    });
	    	    	$('#movement-in-tr > td:eq('+i+') > select').val(data[i-1]).prop("selected", true);
   		}
   	}
   	
   	else if(v=='OUT') {
			let data = movementData[num].storage_out_code_idx.split(',');
   		
   		let td_length = $('#movement-out-tr > td').length;
   		$('#movement-out-tr > td:eq(1) > select').val(data[0]).prop("selected", true);
	        $('#movement-out-tr > td:gt(1)').remove();
   		
   		for(let i=2; i<=data.length; i++) {
	    		const res = await fetch('/getStorageCode.do?storage=' + data[i-2]);
	        	const { storageCodeList } = await res.json();
	    			$('#movement-out-tr').append('<td><select class="form-select st_select" name="storage2_code_idx" onchange="change_storage1(this.value, '+td_length+')"><option selected value="null">선택</option></select></td>');
	    			storageCodeList.forEach((e) => {
	    				 $('#movement-out-tr > td:eq('+i+')' + '> select').append("<option value="+e.storage_code_idx+">"+e.storage_nm+"</option>"); 
	    		    });
	    	    	$('#movement-out-tr > td:eq('+i+') > select').val(data[i-1]).prop("selected", true);
   		}
   	}
   }
   
   const submitModifyMovement = async () => {
		let formData = new FormData(document.getElementById('addMovement'));
   	const movement_idx = movementData[movementTr].movement_idx;
   	
		formData.append("movement_idx", movement_idx);
   	const form = await fetch('/modifyMovement.do', {
   		method:'POST',
   		headers: {
               "Content-Type": "application/x-www-form-urlencoded",
           },
           body: new URLSearchParams(formData)
   	})
   	
   	const res = await form.text();
   	res == 'success' ? ( 
   			alert('수정완료'),
   			getMovementList()
   			)  : alert('오류입니다');
   }
   
   const btn_control = (num) => {
   	if(num == 0) {
	    	$("#add-movement-btn").show();
	    	$("#modify-movement-btn2").hide();
   		return;
   	}
   	$("#add-movement-btn").hide();
   	$("#modify-movement-btn2").show();
   }    
   
   $(document).on('click', '#modify-movement-btn', async function() {
	    	let index = $(this).parent().parent().index();
	    	movementTr = index;
	      	const item_idx = sessionStorage.getItem("item_idx");
	      	const res = await fetch('/getMovementData.do?item_idx=' + item_idx);
			const { movementList } = await res.json();
	      	
			$("select[name=storage_type1_code_idx]").val(movementData[index].storage_type1_code_idx).prop("selected", true);
	      	await change_storageType2(movementData[index].storage_type1_code_idx);
	      	$("select[name=storage_type2_code_idx]").val(movementData[index].storage_type2_code_idx).prop("selected", true);
	      	change_Inout('IN', index, JSON.stringify(movementData[index]));
	      	change_Inout('OUT', index, JSON.stringify(movementData[index]));
	      	$('input[name=movement_qty]').val(movementData[index].movement_qty);
	      	$('input[name=current_qty]').val(movementData[index].current_qty);
	      	$('input[name=requester]').val(movementData[index].requester);
	      	$('input[name=remark]').val(movementData[index].remark);
	      	$('input[name=movement_date]').val(movementData[index].movement_date);
	      	$('input[name=movement_idx]').val(movementData[index].nmMovement_idx);
	      	$('input[name=storage_idx]').val(movementData[index].storage_idx);
   	})
   	
   	$(document).on('click', '#modify-movement-btn2', async function() {
	    	submitModifyMovement();
   	})
   	
	   	$(document).on('click', '#delete-movement-btn', async function() {
		   	let index = $(this).parent().parent().index();
		    /* $('#movement-tbody > tr:eq('+index+')').remove();
		    $('#past-movement-tbody > tr:eq('+index+')').remove(); */
		    let idx = movementData[index].movement_idx;
		    
		    const res = await fetch('/deleteMovement.do?movement=' + idx);
	    	const msg = await res.text();
	    	msg == 'success' ? (
	    			alert('삭제 되었습니다'), getMovementList()
	    			) : alert('오류입니다');
	    })
	    
	    
	   //보존처리 -------------------------------------------------
	   let tabCnt = 0;
	   
	   const addPreservation = async () => {
		   let res = '';
		   for(let i=0; i<=tabCnt; i++) {
			   let formData = new FormData(document.getElementById('preservation-form'+i));
			   formData.append('item_idx', sessionStorage.getItem('item_idx'));
		    	
		    	let form = await fetch('/addPreservation.do', {
		    		method:'POST',
		    		/* headers: {
		                "Content-Type": "application/x-www-form-urlencoded",
		            }, */
		            body: formData
		    	})
		    	if(i == tabCnt) {
			    	res = await form.text();
		    	}
		   }
		   res == 'success' ? alert('등록완료') : alert('오류입니다');
	   }
	   
	   let beforeArr = [];
	   let afterArr = [];
	   let resultArr = [];
	   let fileCount = 1;
	   let after = "after";
	   let before = "before";
	   let result = "result";
	   
	    function resultImg(input, num) {
		   if (input.files && input.files[0]) {
			     const reader = new FileReader();
			     
			     reader.onload = e => {
				    	 let imgTag = document.createElement('img');
				    	 imgTag.setAttribute('src', e.target.result);
				    	 imgTag.setAttribute('width', '200');
				    	 imgTag.setAttribute('height', '200');
			    		 $('#result-img-preview'+num).children().remove();
				    	 $('#result-img-preview'+num).append('<div style="width:200px; height:250px; margin: 5px 5px 5px 5px; display:inline-block;"><img id="result-img'+num+'" style="width: 200px; height: 200px;"/><p style="text-align:center;">'+input.files[0].name+'</p></div>');
				    	 document.getElementById('result-img'+num).src = e.target.result;
			    	 
			    	 //document.querySelector('#result-img-preview').appendChild(imgTag);
			    	 
		     	};
		     	reader.readAsDataURL(input.files[0]);
		   } else {
		     document.getElementById('result-img'+num).src = "";
		   }
		 }
	    
	    function beforeImg(input, num) {
			$('#before-img-preview').children().remove();
			for(let i=0; i<input.files.length; i++) {
				const reader = new FileReader();
				reader.onload = e => {
					$('#before-img-preview'+num).append(
							'<div id="before'+num+'Div'+i+'" style="width:200px; height:250px; margin: 10px 10px 10px 10px; display:inline-block;">'+
							'<input type="checkbox" value="'+i+'" id="before'+num+'checkbox'+i+'" name="before'+num+'checkbox" class="before'+num+'checkbox" style="position: relative; top: 20px; z-index: 1; width:15px; height:15px;"/>' +
						    '<label for="before'+num+'checkbox'+i+'">' +
						    '<img id="before'+num+'img'+i+'" style="width: 200px; height: 200px;"/></label>'+
						    '<p style="text-align:center; text-overflow: ellipsis; white-space : nowrap; overflow : hidden;">'+input.files[i].name+'</p></div>');
					document.getElementById('before'+num+'img'+i).src = e.target.result;
				}
				reader.readAsDataURL(input.files[i]);
			}
		}
	    
	    function afterImg(input, num) {
			$('#after-img-preview'+num).children().remove();
			for(let i=0; i<input.files.length; i++) {
				let img = document.createElement("img");
				const reader = new FileReader();
				reader.onload = e => {
					$('#after-img-preview'+num).append(
					'<div id="after'+num+'Div'+i+'" style="width:200px; height:250px; margin: 10px 10px 10px 10px; display:inline-block;">' +
					'<input type="checkbox" value="'+i+'" id="after'+num+'checkbox'+i+'" name="after'+num+'checkbox" class="after'+num+'checkbox" style="position: relative; top: 20px; z-index: 1; width:15px; height:15px;"/>' +
					'<label for="after'+num+'checkbox'+i+'">' +
					'<img id="after'+num+'img'+i+'" style="width: 200px; height: 200px;"/></label>' +
					'<p style="text-align:center; text-overflow: ellipsis; white-space : nowrap; overflow : hidden;">'+input.files[i].name+'</p></div>');
					
					document.getElementById('after'+num+'img'+i).src = e.target.result;
				}
				reader.readAsDataURL(input.files[i]);
			}
		}
	    
	    const cloneDiv = () => {
	    	$('#add-tab-btn').remove();
	    	tabCnt ++;
	          $('#settings').append('<form id="preservation-form'+tabCnt+'" enctype="multipart/form-data"><div id="accordion-div"><hr/><div class="accordion-item" id="preservation-div"><h2 class="accordion-header" id="flush-headingOne">' +
	                        '<button class="accordion-button fw-medium ac_btn" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne'+tabCnt+'" aria-expanded="true" aria-controls="flush-collapseOne">버튼으로 수정 예정</button></h2>' +
	                      	'<div id="flush-collapseOne'+tabCnt+'" class="accordion-collapse collapse show" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">' +
	                        '<div class="accordion-body text-muted"><div class="mb-0"><div class="card-body"><div class="table-responsive"><table class="table mb-0"><tbody>' +
	                        '<tr><td>처리기관</td><td><input class="form-control st_input" list="datalistOptions" id="treatment_org'+tabCnt+'" name="treatment_org" placeholder="처리기관을 입력해 주세요."></td>' +
	                        '<td>처리자</td><td><input class="form-control st_input" list="datalistOptions" id="processor'+tabCnt+'" name="processor" placeholder="처리자 명을 입력해 주세요.">' +
	                        '<td>처리기간</td><td><input class="form-control" type="date" name="start_date" id="start_date'+tabCnt+'"> ~ <input class="form-control" type="date" name="end_date" id="end_date'+tabCnt+'"></td></tr></tbody></table></div></div></div>' +
	                        '<div class="mb-0"><div class="st_wrap"><label class="col-md-2 col-form-label st_title">처리내용</label></div><input type="text" class="st_inp_tbox" id="content'+tabCnt+'" name="content" placeholder="처리내용을 입력해 주세요."></div>' +
	                        '<div class="mb-0"><div class="st_wrap"><label class="col-md-2 col-form-label st_title">비고</label></div><input type="text" class="st_inp_tbox" id="remark'+tabCnt+'" name="remark" placeholder="참고사항을 입력해 주세요."></div></div>' +
	                    	'<div class="mb-0"><div class="st_wrap" id="resut-div"><label class="col-md-2 col-form-label st_title">처리결과</label>' +
	                    	
	                        '<label for="result-uploadFile'+tabCnt+'" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2">업로드</label>' +
	      					'<input style="display:none" class="form-control st_input" type="file" name="result_uploadFile" id="result-uploadFile'+tabCnt+'" onchange="resultImg(this, '+tabCnt+')" accept="image/*"><br/>' +
	                        
	                        '<div id="result-img-preview'+tabCnt+'"></div>' +
	                        
	                        
	                      	'</div></div>' +
	                  		'<div class="mb-0" id="before-div"><div class="st_wrap"><label class="col-md-2 col-form-label st_title" style="display:inline">보존처리 전 이미지</label>' +
	                      
	                      	'<label for="before-uploadFile'+tabCnt+'" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" style="display:inline">업로드</label>' +
	      					'<input type="file" name="before_uploadFile" id="before-uploadFile'+tabCnt+'" onchange="beforeImg(this, '+tabCnt+')" multiple style="display:none;" accept="image/*">' +
	                      
	                      '<button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2">다운로드</button>' +
	                      '<button type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" onclick="allCheck(before, '+tabCnt+')">전체선택</button>' +
	                      '<button type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" onclick="cancelCheck(before, '+tabCnt+')">선택해지</button>' +
	                      '<button type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" onclick="deleteChecked(before, '+tabCnt+')">선택삭제</button>' +
	                      
	                      '<div id="before-img-preview'+tabCnt+'"></div>' +
	                   	  '</div></div><div class="mb-0" id="after-div"><div class="st_wrap"><label class="col-md-2 col-form-label st_title">보존처리 후 이미지</label>' +
	                   	  
	                   	  
	                      
	                      '<label for="after-uploadFile'+tabCnt+'" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" style="display:inline">업로드</label>' +
	      				  '<input type="file" name="after_uploadFile" id="after-uploadFile'+tabCnt+'" onchange="afterImg(this, '+tabCnt+')" multiple style="display:none;" accept="image/*">' +
	      				
	                      '<button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2">다운로드</button>' +
	                      '<button type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" onclick="allCheck(after, '+tabCnt+')">전체선택</button>' +
	                      '<button type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" onclick="cancelCheck(after, '+tabCnt+')">선택해지</button>' +
	                      '<button type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" onclick="deleteChecked(after, '+tabCnt+')">선택삭제</button>' +
	                      
	                      '<div id="after-img-preview'+tabCnt+'"></div></div></div>' +
	                  	  '<button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" onclick="deleteForm('+tabCnt+')">삭제</button></div></div></div></div></div></div></form>' +
	                  	  
	                 	  '<button type="button" class="mb-0" id="add-tab-btn" onclick="cloneDiv()"><div class="st_wrap"><label class="col-md-2 col-form-label st_title" style="cursor: pointer"> + 보존처리 추가</label></div>' +
	                  	  '</button>');
	    }
	    
	    const allCheck = (name, num) => {
	    	$('input[class='+name+num+'checkbox').prop("checked", true);
	    }
	    
	    const cancelCheck = (name, num) => {
	    	$('input[class='+name+num+'checkbox').prop("checked", false);
	    }
	    
	    const deleteChecked = (name, num) => {
	    	let names = name+num+'checkbox';
	    	let divName = name+num+'Div';
	    	if($('input:checkbox[name='+names+']:checked').length == 0) {
	    		alert("삭제할 항목을 선택해주세요.")
	    		return;
	    	}
	    	if(confirm("삭제하시겠습니까?")) {
	    		$('input:checkbox[name='+names+']:checked').each(function() {
	    			$('#'+divName+$(this).val()).remove();
	    		})
	        } else {
	            return false;
	        }
	    }
	    
	    const deleteForm = (num) => {
	    	$('#preservation-form'+num).remove();
	    }
	   
	   //전문정보 -------------------------------------------------------------------------------------------------------------------------------
	   let specialityData = [];
	   let spc_tr = '';
	   
	   const submitSpc = async () => {
		    let formData = new FormData($('#speciality-form')[0]);
		    formData.append('item_idx', sessionStorage.getItem('item_idx'));
	    	const form = await fetch('/setSpeciality.do', {
	    		method:'POST',
	            body: formData
	    	})
	    	const res = await form.text();
	    	res == 'success' ? (alert('등록완료'), $("#speciality-form")[0].reset(), getSpeciality()) : alert('오류입니다');
	   }
	   
	   const getSpeciality = async () => {
		   specialityData = [];
		   let item_idx = sessionStorage.getItem("item_idx");
		   const res = await fetch('/getSpeciality.do?item_idx='+item_idx);
		   const { specialityList } = await res.json();
		   specialityData = specialityList;
		   specialityList ? $('#speciality-tbody').children('tr').remove() : alert('다시 시도해주세요.')
		   
		   specialityList.forEach((e, i) => {
			   $('#speciality-tbody').append('<tr><th scope="row">'+e.rownum+'</th>' +
					   '<td>'+e.reg_user+'</td><td>'+e.reg_date+'</td><td>'+e.speciality_nm+'</td>' +
					   '<td>'+e.title+'</td><td>'+e.file_nm+'</td><td>'+e.copyright+'</td>' +
	                   '<td><button id="modify-speciality-btn" class="btn btn-secondary waves-effect waves-light btn_ml btn_wh" data-bs-toggle="modal" data-bs-target=".bs-example-modal-xl">수정</button></td>' +
	                   '<td><button id="delete-speciality-btn" class="btn btn-secondary waves-effect waves-light btn_ml btn_wh">삭제</button></td>' +
	                   '<td><input id="specialityList'+i+'" type="hidden" value="'+e.speciality_idx+'"/></td></tr>')
		   })
	   }
	   
	   $(document).on('click', '#modify-speciality-btn', async function() {
		   $('#spc-add-btn').hide();
		   $('#spc-update-btn').show();
	    	let index = $(this).parent().parent().index();
	    	spc_tr=index;
	    	let data = specialityData[index];
	      	
	      	$("select[name=speciality_code_idx]").val(data.speciality_code_idx).prop("selected", true);
	      	$('input[name=spc_title]').val(data.title);
	      	$('#fileNameInput').val(data.file_nm);
	      	$('input[name=spc_copyright]').val(data.copyright);
	      	$('input[name=spc_content]').val(data.content);
	   })
	   
	   const updateSpeciality = async () => {
		   let formData = new FormData($('#speciality-form')[0]);
		    formData.append('item_idx', sessionStorage.getItem('item_idx'));
		    formData.append('speciality_idx', specialityData[spc_tr].speciality_idx);
		    formData.append("spc_file_nm", specialityData[spc_tr].file_nm);
		    formData.append("spc_file_path", specialityData[spc_tr].file_path);
		    formData.append("speciality_idx", specialityData[spc_tr].speciality_idx);
	    	const form = await fetch('/updateSpeciality.do', {
	    		method:'POST',
	            body: formData
	    	})
	    	const res = await form.text();
	    	res == 'success' ? (alert('등록완료'), $("#speciality-form")[0].reset(), getSpeciality()) : alert('오류입니다');
	   }
	   
	   $(document).on('click', '#spc-add-button', async function() {
		   $('#spc-add-btn').show();
		   $('#spc-update-btn').hide();
 		})
	    	
	    $(document).on('click', '#delete-speciality-btn', async function() {
		    let index = $(this).parent().parent().index();
		    let formData = new FormData();
		    
		    formData.append("spc_file_nm", specialityData[index].file_nm);
		    formData.append("spc_file_path", specialityData[index].file_path);
		    formData.append("speciality_idx", specialityData[index].speciality_idx);
		    
		    //const res = await fetch('/deleteSpeciality.do?spc=' + val);
		    
		    const res = await fetch('/deleteSpeciality.do', {
	    		method:'POST',
	            body: formData
	    	})
		    
		    const msg = await res.text();
		    msg == 'success' ? (
		    		alert('삭제되었습니다.'), getSpeciality()
		    		) : alert('오류입니다.')
  	})
  	
  	const speciality_file_change = () => {
  		let value = $('#spc_uploadFile').val();
  		let filename = value.split('/').pop().split('\\').pop();
  		$('#fileNameInput').val(filename);
  	}
  	
  	// 이미지정보 -------------------------------------------------------------------------
  	
 // 멀티 모듈은 mode를 "multi"로 설정하며, id 속성으로 컴포넌트 DOM 아이디를 부여한다.
 // parentId는 컨테이너 아이디를 지정한다.
  dx5.create({ mode: "multi", id: "dext5", parentId: "dext5-container" });
  function addTo(id) {
	    var dx = dx5.get("dext5");
		// ORAF, OROF, EXNJ로 업로드 모드를 설정한다.
		dx.setUploadMode("EXNJ");
	   	dx5.get(id).openFileDialog();
	 }
	
	 function uploadFrom(id) {
	   var dx = dx5.get(id);
	   if (dx.hasUploadableItems()) {
	     // 추가된 모든 로컬 파일을 주어진 경로(웹)로 업로드한다.
	     dx.setUploadURL("http://localhost:8080/addImage.do");
	     dx.upload("AUTO");
	   } else {
	     alert("업로드할 대상이 없다.");
	   }
	 } 
  	
     // 이미지정보 -------------------------------------------------------------------------
     
     let gallery = '';
     
     const getImageList = () => {
		let item_idx = sessionStorage.getItem("item_idx");
		let perPageNum = $('#ImageperPageNum').val();
		$.ajax({
						type : 'POST',                 
						url : '/getImage.do',
						data: {
							item_idx: item_idx,
							perPageNum: perPageNum
						},
						dataType : "html",           
						contentType : "application/x-www-form-urlencoded;charset=UTF-8",
						error : function() {        
							alert('통신실패!');
						},
						success : function(data) {  
							$('#imageInfoZone').empty().append(data);
						}
					});
	$.ajax({
						type : 'POST',                 
						url : '/getImageList.do',
						data: {
							item_idx: item_idx,
							perPageNum: perPageNum
						},
						dataType : "html",           
						contentType : "application/x-www-form-urlencoded;charset=UTF-8",
						error : function() {
							alert('통신실패!');
						},
						success : function(data) {
							$('#imageInfoListZone').empty().append(data);
						}
					});
					
	}

const setImageIdx = val => {
	$('#imageidxhidden').val(val);
}

const updateImageDesc = () => {
	let image_idx = $('#imageidxhidden').val();
	let image_desc = $('#imageDesc').val();
	if(image_desc == '') { alert('이미지 설명을 1글자 이상 입력해주세요.');return}
	if(confirm("이미지 설명을 등록하시겠습니까?")) {
	$.ajax({
						type : 'POST',                 
						url : '/updateImageDesc.do',
						data: {
							image_idx: image_idx,
							image_desc: image_desc
						},
						dataType : "html",           
						contentType : "application/x-www-form-urlencoded;charset=UTF-8",
						error : function() {
							alert('통신실패!');
						},
						success : function(data) {
							data == 'success' ? ( alert('수정되었습니다.'), $('.modal-backdrop').attr("class","show"), getImageList()) : alert('오류가 발생했습니다. 다시 시도해주세요.');
						}
					});
	} else {
		return
	}
}

const goPage = page => {
	
	let item_idx = sessionStorage.getItem("item_idx");
	let perPageNum = $('#ImageperPageNum').val();
		
		$.ajax({
						type : 'POST',                 
						url : '/getImage.do',
						data: {
							item_idx: item_idx,
							page: page,
							perPageNum: perPageNum
						},
						dataType : "html",
						async: false,
						contentType : "application/x-www-form-urlencoded;charset=UTF-8",
						error : function() {        
							alert('통신실패!');
						},
						success : function(data) {  
							$('#imageInfoZone').empty().append(data);
						}
					});
					
	
	$.ajax({
						type : 'POST',                 
						url : '/getImageList.do',
						data: {
							item_idx: item_idx,
							page: page,
							perPageNum: perPageNum
						},
						dataType : "html",
						contentType : "application/x-www-form-urlencoded;charset=UTF-8",
						error : function() {
							alert('통신실패!');
						},
						success : function(data) {
							$('#imageInfoListZone').empty().append(data);
						}
					});
		gallery = new Viewer(document.getElementById('imageInfoZone'));
}

  	
  	/** 일반 업로드 **/
    /** DEXTUPLOADX5 설정 **/
    dx5.create({ 
       mode: "multi", id: "dext5", parentId: "dext5-container" , btnFile: "btn-add-files",
       btnUploadAuto: "btn-upload-auto"
    });
    
	//   // onDX5Error라는 이름의 함수를 다음과 같이 만들면 컴포넌트에서 오류가 발생할 때, onDX5Error 함수를 호출한다.
	//     function onDX5Error(id, code, msg) {
	//        alert(id + " => " + code + "\n" + msg);
	//     }
	
	//     // onDX5Created 함수를 다음과 같이 만들면, 컴포넌트가 로드(생성)된 후 호출된다.
	//     function onDX5Created(id) {
	//        var dx = dx5.get(id);
	//        dx.setUploadURL(dx5.canonicalize("./uploadImage.do"));
	//     }
	    
	//// onDX5UploadCompleted 함수는 업로드가 완료(서버 측 파일 업로드 처리가 완료)되면 호출되는 콜백 함수이다.
	//     function onDX5UploadCompleted(id) {  
	//          // 응답 데이터를 확인한다.
	//        var dx = dx5.get(id);
	//          dx.clearItems();
	//          alert("업로드가 완료되었습니다.");
	//     }
	
	 /** 대용량 업로드 **/
	 function onDX5Error(id, code, msg) {
	//     alert(id + " => " +  code + "\n" + msg);
	 }
	 
	 function onDX5Created(id) {
	    var dx = dx5.get(id);
	    
	    // 대용량 파일 업로드 방식으로 설정한다.
	    dx.setUploadURL(dx5.canonicalize('./extension-upload.ext?item_idx='+sessionStorage.getItem('item_idx')));
	    dx.setUploadMode("EXNJ");
	    dx.setUploadBlockSize(10 * 1024 * 1024);
	    
	//     dx.addVirtualFile({ vindex: "F00001", name: "가상파일.txt", size: 12345 });
	//     dx.addVirtualFile({ vindex: "F00002", name: "잠긴-가상파일.txt", size: 45678, lock: true });
	//     dx.addVirtualFile({ vindex: "F00001", name: "코스모스.jpg", size: 195779 });
	//     dx.setCompressURL(dx5.canonicalize("./zip-download.do"));
	 }
	 
	 function onDX5UploadStopped(id) { alert("업로드가 중단되었습니다."); }
	 
	 function onDX5UploadCompleted(id) {
	    // 대용량 업로드는 개별 파일마다 응답 데이터를 따로 받으므로, ';' 문자를 구분자로 하는 하나의 문자열로 생성하여 전달한다.
	    var responses = dx5.get(id).getResponses();
	    for(var i = 0, len = responses.length; i < len; i++) {
	       console.log(responses[i]);
	    }
	    getImageList()
	 }
  	
  	const publicRepCheck = box => {
  		box.checked ? setPublicRep(box.value, box.name, 'Y') : setPublicRep(box.value, box.name, 'N')
  	}
  	
  	const setPublicRep = async (idx, colunm, val) => {
  		const res = await fetch('/setPublicrep.do?image_idx=' + idx + '&colunm=' + colunm + '&val=' + val);
  		await res.text() == 'success' ? getImageList() : alert('오류입니다.');
  	}
  	
  	const change_img_info = async (input) => {
  		for(let i=0; i<input.files.length; i++) {
	   		let formData = new FormData();
	   		formData.append('item_idx', sessionStorage.getItem('item_idx'));
	   		formData.append('image_upload_file', input.files[i]);
	   		
	   		let res = await fetch('/addImage.do', {
	    		method:'POST',
	            body: formData
	    	});
	   		let msg = await res.text();
  		}
  		getImageList()
  	}
  	
  	const imageListChecked = (box, num) => {
  		box.checked ? ( $('#imageCheck'+num).prop('checked', true), $('#imageListCheck'+num).prop('checked', true) ) 
  								: 
  								( $('#imageCheck'+num).prop('checked', false), $('#imageListCheck'+num).prop('checked', false) )
  	}
  	
  	const downloadImageChecked = async () => {
        let path_arr = [];
      if($('input:checkbox[name=imageListCheck]:checked').length == 0) {
         alert("다운로드할 항목을 선택해주세요.")
         return;
      }
      if(confirm("다운하시겠습니까?")) {
         $('input:checkbox[name=imageListCheck]:checked').each(function() {
            console.log($(this).attr("value2"))
            path_arr.push($(this).attr("value2"));
         })
//          const res = await fetch(encodeURI('/zip-download.do?img_path=' + path_arr));
//          location.href=encodeURI("./zip-download.do?img_path="+path_arr);
         $.ajax({
              url :'./zip-download.do',
              type : 'POST',
              dataType : 'text',
              data : {
                 "img_path" : path_arr
              },
              async : false,
              success: function(data) {
                 console.log('성공');
                 location.href = encodeURI("./zip-download.do?compresskey="+data);
              },
              error: function(xhr, ajaxOptions, thrownError) {
                 console.log(xhr.status);
                 console.log(thrownError);
              }
         });
//          let formData = new FormData();
//          formData.append("img_path", encodeURI(path_arr));
//          console.log(path_arr);
//          let res = await fetch('/zip-download.do', {
//             method:'POST',
//               body: formData
//          })
       } else {
           return false;
       }
   }
  	
  	const deleteImageChecked = async () => {
      let idx_arr = [];
      if($('input:checkbox[name=imageListCheck]:checked').length == 0) {
         alert("삭제할 항목을 선택해주세요.")
         return;
      }
      if(confirm("삭제하시겠습니까?")) {
         $('input:checkbox[name=imageListCheck]:checked').each(function() {
            console.log($(this).attr("value1"))
            idx_arr.push($(this).attr("value1"));
         })
         
         let formData = new FormData();
         formData.append("image_idx", idx_arr);
         let res = await fetch('/deleteImage.do', {
            method:'POST',
              body: formData
         })
         location.reload();
         res.text() == 'success' ? getImageList() : ''
       } else {
           return false;
       }
   }
  	
  	const imageAllCheck = () => {
   	$('input[name=imageListCheck]').prop("checked", true);
   	$('input[name=imageInfoListCheck]').prop("checked", true);
   }
   
   const imageCancelCheck = () => {
   	$('input[name=imageListCheck]').prop("checked", false);
   	$('input[name=imageInfoListCheck]').prop("checked", false);
   }
  	
  	//페이징
  	
  	let totalData; //총 데이터 수
	let dataPerPage; //한 페이지에 나타낼 글 수
	let pageCount = 10; //페이징에 나타낼 페이지 수
	let globalCurrentPage=1; //현재 페이지
	let dataList; //표시하려하는 데이터 리스트
	
  	const paging = () => {
  		
  	}


//자료 기본사항
const search_item_base = async (reg_state) => {
	let formData = new FormData(document.getElementById('add-form'));
	
	const form = await fetch('/searchItemBase.do', {
    		method:'POST',
    		headers: {
                "Content-Type": "application/x-www-form-urlencoded",
            },
            body: new URLSearchParams(formData)
    	})

		const { itemBaseList } = await form.json();
    	itemBaseList.length ? set_itemBase_input(itemBaseList) : alert('검색하신 데이터가 없습니다.');
}

//자료기본사항 아래 항목들
const set_itemBase_input = async (list) => {
	getImageList();
	//$('#add-form')[0].reset();
	sessionStorage.setItem("item_idx", list[0].item_idx);
	$('input[name=item_nm]').val(list[0].item_nm);
	$('input[name=item_se_nm]').val(list[0].item_se_nm);
	$('input[name=item_eng_nm]').val(list[0].item_eng_nm);
	$('input[name=author]').val(list[0].author);
	$('input[name=qty]').val(list[0].qty);
	$('select[name=qty_unit_code_idx]').val(list[0].qty_unit_code_idx).prop("selected", true);
	$('select[name=icao_code_idx]').val(list[0].icao_code_idx).prop("selected", true);
	$('select[name=existence_code_idx]').val(list[0].existence_code_idx).prop("selected", true);
	$('input[name=management_no]').val(list[0].management_no);
	$('select[name=preservation_need]').val(list[0].preservation_need).prop("selected", true);
	$('#feature').val(list[0].feature);
	$('#condition_code_idx').val(list[0].condition_code_idx).prop("selected", true);
	$('#ranking_code_idx').val(list[0].ranking_code_idx).prop("selected", true);
	$('#remark').val(list[0].remark);
	//$('input[name=management_no]').val(list[0].management_no); //보존처리자
	
	const form = await fetch('/searchItemBaseChild.do?item_idx=' + list[0].item_idx);
	const { taxonomyList, countryList, materialList, measurementList, obtainmentList, involvementList,
				InsuranceList, copyrightList, publicServiceList, keywordList } = await form.json();
				
	taxonomyList.forEach(async (e, i) => {
		$('#class-tbody').children('tr:not(:first-child)').remove();
		i != 0 ? addClassTd('class-table', 'class-tbody') : '';
		$('#class1_code_idx'+i).val(e.class1_code_idx).prop("selected", true);
		$('#class2_code_idx'+i).val(e.class2_code_idx).prop("selected", true);
		$('#class3_code_idx'+i).val(e.class3_code_idx).prop("selected", true);
	})
	
	countryList.forEach(async (e, i) => {
		$('#country-tbody').children('tr:not(:first-child)').remove();
		$('#country-select'+i).val(e.country_code_idx).prop("selected", true);
		await changeCountry(e.country_code_idx, 0);
		$('#era-select'+i).val(e.era_code_idx).prop("selected", true);
		$('#detail_year'+i).val(e.detail_year);
	})
	
	materialList.forEach(async (e, i) => {
		$('#material-tbody').children('tr:not(:first-child)').remove();
		if(i != 0) addClassTd('material-table', 'material-tbody');
		$('#material1_code_idx'+i).val(e.material1_code_idx).prop("selected", true);
		await changeMaterial(e.material1_code_idx, i);
		$('#material2_code_idx'+i).val(e.material2_code_idx).prop("selected", true);
		$('#material_detail'+i).val(e.material_detail);
	})
	
	measurementList.forEach((e, i) => {
		$('#measurement-tbody').children('tr:not(:first-child)').remove();
		if(i != 0) addClassTd('measurement-table', 'measurement-tbody');
		$('#measurement_item_type'+i).val(e.item_type);
		$('#measurement_code_idx'+i).val(e.measurement_code_idx).prop("selected", true);
		$('#measurement_value'+i).val(e.measurement_value);
		$('#measurement_unit_code_idx'+i).val(e.measurement_unit_code_idx).prop("selected", true);
	})
	
	obtainmentList.forEach((e, i) => {
		$('#obt_obtainment_date').val(e.obtainment_date);
		$('#obt_obtainment_code_idx').val(e.obtainment_code_idx).prop("selected", true);
		$('#obt_purchase1_code_idx').val(e.purchase1_code_idx).prop("selected", true);
		$('#obt_purchase2_code_idx').val(e.purchase2_code_idx).prop("selected", true);
		$('#obt_obtainment_price').val(e.obtainment_price);
		$('#obt_price_unit_code_idx').val(e.price_unit_code_idx).prop("selected", true);
		$('#obt_won_exchange').val(e.won_exchange);
		$('#obt_obtainment_no').val(e.obtainment_no);
		$('#obt_obtainment_place').val(e.obtainment_place);
		$('#obt_obtainment_addr').val(e.obtainment_addr);
		$('#obt_obtainment_detail').val(e.obtainment_detail);
		$('#obt_record_date').val(e.record_date);
		$('#obt_designation').val(e.designation);
		$('#obt_redemption').val(e.redemption);
		$('#obt_country_code_idx').val(e.country_code_idx).prop("selected", true);
		$('#obt_qty').val(e.qty);
		$('#obt_qty_unit_code_idx').val(e.qty_unit_code_idx).prop("selected", true);
		$('#obt_redemption_date').val(e.redemption_date);
	})
	
	involvementList.forEach((e,i) => {
		$('#possession-tbody').children('tr:not(:first-child)').remove();
		if(i != 0) addClassTd('possession-table', 'possession-tbody');
		$('#invol_possession_code_idx').val(e.possession_code_idx).prop("selected", true);
		$('#invol_item_no').val(e.item_no);
		$('#invol_remark').val(e.remark);
	})
	
	InsuranceList.forEach((e,i) => {
		$('#insurance-tbody').children('tr:not(:first-child)').remove();
		if(i != 0) addClassTd('insurance-table', 'insurance-tbody');
		$('#insu_agreed_value').val(e.agreed_value);
		$('#insu_price_unit_code_idx').val(e.price_unit_code_idx).prop("selected", true);
		$('#insu_start_date').val(e.start_date);
		$('#insu_end_date').val(e.end_date);
		$('#insu_rental_org').val(e.rental_org);
		$('#insu_remark').val(e.remark);
	})
	
	copyrightList.forEach((e,i) => {
		$('#copyright-tbody').children('tr:not(:first-child)').remove();
		if(i != 0) addClassTd('copyright-table', 'copyright-tbody');
		$('#copy_copyright').val(e.copyright).prop("selected", true);
		$('#copy_owner').val(e.owner);
		$('#copy_expiry_date').val(e.expiry_date);
		$('#copy_usage_permission').val(e.usage_permission);
		$('#copy_copyright_transfer').val(e.copyright_transfer);
		$('#copy_remark').val(e.remark);
	})
	
	publicServiceList.forEach((e,i) => {
		$('#public_service').val(e.public_service).prop("selected", true);
		$('#reason').val(e.reason);
		$('#ggnuri_code_idx').val(e.ggnuri_code_idx).prop("selected", true);
	})
	
	keywordList.forEach((e,i) => {
		$('#keyword').val(e.keyword);
	})
	
	await getMovementList();
	await getSpeciality();
	
	const form2 = await fetch('/getPreservation.do?item_idx=' + list[0].item_idx);
	const { preservationList } = await form2.json();
	preservationList.forEach((e, num) => {
		num!=0 ? cloneDiv() : '';
		$('#settings').children('option:not(:first)').remove();
		$('#treatment_org'+num).val(e.treatment_org);
		$('#processor'+num).val(e.processor);
		$('#start_date'+num).val(e.start_date);
		$('#end_date'+num).val(e.end_date);
		$('#content'+num).val(e.content);
		$('#remark'+num).val(e.remark);
		
		$('#before-img-preview').children().remove();
		$('#after-img-preview'+num).children().remove();
		let beforeImg = e.image.filter(r => r.image_state == 'B');
		let afterImg = e.image.filter(r => r.image_state == 'A');
		$('#result-img-preview'+num).append('<div style="width:200px; height:250px; margin: 5px 5px 5px 5px; display:inline-block;"><img id="result-img'+num+'" style="width: 200px; height: 200px;"/><p style="text-align:center;">'+e.image_nm+'</p></div>');
		document.getElementById('result-img'+num).src = e.file_path+e.file_nm;
		
		beforeImg.forEach((r, i) => {
			$('#before-img-preview'+num).append(
							'<div id="before'+num+'Div'+i+'" style="width:200px; height:250px; margin: 10px 10px 10px 10px; display:inline-block;">'+
							'<input type="checkbox" value="'+i+'" id="before'+num+'checkbox'+i+'" name="before'+num+'checkbox" class="before'+num+'checkbox" style="position: relative; top: 20px; z-index: 1; width:15px; height:15px;"/>' +
						    '<label for="before'+num+'checkbox'+i+'">' +
						    '<img id="before'+num+'img'+i+'" style="width: 200px; height: 200px;"/></label>'+
						    '<p style="text-align:center; text-overflow: ellipsis; white-space : nowrap; overflow : hidden;">'+r.image_nm+'</p></div>');
					document.getElementById('before'+num+'img'+i).src = r.image_path+r.image_nm;
		})
		
		afterImg.forEach((r, i) => {
			$('#after-img-preview'+num).append(
					'<div id="after'+num+'Div'+i+'" style="width:200px; height:250px; margin: 10px 10px 10px 10px; display:inline-block;">' +
					'<input type="checkbox" value="'+i+'" id="after'+num+'checkbox'+i+'" name="after'+num+'checkbox" class="after'+num+'checkbox" style="position: relative; top: 20px; z-index: 1; width:15px; height:15px;"/>' +
					'<label for="after'+num+'checkbox'+i+'">' +
					'<img id="after'+num+'img'+i+'" style="width: 200px; height: 200px;"/></label>' +
					'<p style="text-align:center; text-overflow: ellipsis; white-space : nowrap; overflow : hidden;">'+r.image_nm+'</p></div>');
					
					document.getElementById('after'+num+'img'+i).src = r.image_path+r.image_nm;
		})
		
		//처리결과, 보존처리후, 보존처리전 preview랑 값 추가해야함
		
		
	})
	
	let item_idx = sessionStorage.getItem("item_idx");
	
	$.ajax({
			type : 'POST',                 
			url : '/getKeywordList.do',
			data: {
				item_idx: item_idx
			},			
			dataType : "html",           
			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
			error : function() {
					alert('통신실패!');
			},
			success : function(data) {  
				console.log(data);
				$('#keywordZone').empty().append(data);
			}
		});
}


const searchKeyword = () => {
	if(!$('#item_nm').val()) { alert('자료조회를 먼저 진행해주세요.'); return; }
		let item_idx = sessionStorage.getItem("item_idx");
		let keyword = $('#searchKeyword').val();
		console.log(keyword);
		
		$.ajax({
				type : 'POST',
				url : '/getKeywordList.do',
				data: {
					item_idx: item_idx,
					keyword: keyword
				},			
				dataType : "html",           
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {
						alert('통신실패!');
				},
				success : function(data) {  
					console.log(data);
					$('#keywordZone').empty().append(data);
				}
			});
}

const addKeyword = () => {
	let item_idx = sessionStorage.getItem("item_idx");
	let arr = $('#addKeyword').val().split(',').filter(e => e.length !== 0 );
		
	if(!$('#item_nm').val()) { 
		alert('자료조회를 먼저 진행해주세요.'); 
		return; 
	}
	if(arr.length < 5) {
			alert("콤마 ', ' 단위로 5개 이상 입력해주세요.")
			return
		}
	
	if(confirm("키워드 추가를 하시겠습니까?")) {
		
			$.ajax({
					type : 'POST',
					url : '/addKeyword.do',
					data: {
						item_idx: item_idx,
						keywordList: arr
					},			
					dataType : "text",
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {
							alert('통신실패!');
					},
					success : function(data) {  
						data == 'success' ? (
							alert('키워드 신청이 완료되었습니다.'), $('#addKeyword').val('')
						) : alert('오류가 발생했습니다. 다시 시도해주세요.')
					}
				});
		
	} else {
		return false;
	}
}


function metaDataListView(value1,value2,value3,value4,value5){
		$('#possession_code_idx').val(value1);
		$('#org_code_idx').val(value2);
		$('#item_no').val(value3);
		$('#item_detail_no').val(value4);
		//$('#reg_state').val(value5);
		var pop_title = "popupOpener" ;
		
		window.open("", pop_title, 'width=1000, height=1000') ;
		
		var frmData = document.metaDataListViewForm ;
		frmData.target = pop_title ;
		frmData.action = "/metaDataListView.do" ;
		
		frmData.submit() ;
}

