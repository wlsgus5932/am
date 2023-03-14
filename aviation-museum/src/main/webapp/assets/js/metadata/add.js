let count = 0;
let movementData = [];
let item_idx = '';
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

function getImageFunction() {
    	getImageList();
    }
    
    const submitForm = async () => {
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
    };
    
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
   	 $('#material2-code_idx'+n).children('option:not(:first)').remove();
   	 const res = await fetch('/getMaterialData.do?material=' + r);
   	 
   	 if (res.status === 200) {
   	     const { material2List } = await res.json();
   	     material2List.forEach(e => {
   	    	 $('#material2_code_idx'+n).append("<option value="+e.material2_code_idx+">"+e.material2_nm+"</option>");
   	     })
   	 }
    };
    
    const addClassTd = (r, b) => {
   	 count = document.getElementById(r).querySelectorAll("th").length;
   	 let cell = '';
   	 switch (r) {
   	  case 'class-table':
   	  	 cell =  '<tr id="class-tr"><td><input type="checkbox" name="class-checkbox"></td>' +
			 '<th scope="row">'+(count+1)+'</th>' +
			 '<td><select class="form-select st_select" id="class1_code_idx'+count+'" name="class1_code_idx"><option value="" selected>선택</option>' +
			 '<c:forEach var="list" items="${class1List}" varStatus="status"><option value="${list.class1_code_idx}">${list.class1_nm}</option></c:forEach></select></td>' +
			 '<td><select class="form-select st_select" id="class2_code_idx'+count+'" name="class2_code_idx"><option value="" selected>선택</option>' +
			 '<c:forEach var="list" items="${class2List}" varStatus="status"><option value="${list.class2_code_idx}">${list.class2_nm}</option></c:forEach></select></td>' +
			 '<td><select class="form-select st_select" id="class3_code_idx'+count+'" name="class3_code_idx"><option value="" selected>선택</option> ' +
			 '<c:forEach var="list" items="${class3List}" varStatus="status"><option value="${list.class3_code_idx}">${list.class3_nm}</option></c:forEach></select></td></tr>';
   	    break;
   	    
   	  case 'country-table':
   	    cell = '<tr><td><input type="checkbox" name="country-checkbox"></td>' +
   	    '<th scope="row">'+(count+1)+'</th>' +
           '<td><select class="form-select st_select" id="country-select'+count+'" onchange="changeCountry(this.value, '+count+')" name="country_code_idx"><option value="" selected>선택</option>' +
           '<c:forEach var="list" items="${countryList}" varStatus="status"><option value="${list.country_code_idx}">${list.country_nm}</option></c:forEach></select></td>'+
           '<td><select class="form-select st_select" id="era-select'+count+'" name="era_code_idx"><option value="" selected>선택</option></select></td>' +
           '<td><input class="form-control st_input" list="datalistOptions" name="detail_year" placeholder="상세 시대를 입력해 주세요." id=detail_year'+count+'></td></tr>';
   	    break; 
   	    
   	  case 'material-table': 
   		  cell =  '<tr><td><input type="checkbox" name="material-checkbox"></td>' +
             '<th scope="row">'+(count+1)+'</th>' +
             '<td><select class="form-select st_select" onchange="changeMaterial(this.value, '+count+')" id="material1_code_idx'+count+'" name="material1_code_idx"><option value="" selected>선택</option>' +
             '<c:forEach var="list" items="${material1List}" varStatus="status"><option value="${list.material1_code_idx}">${list.material1_nm}</option></c:forEach></select></td>' +
             '<td><select class="form-select st_select" id="material2_code_idx'+count+'" name="material2_code_idx"><option value="" selected>선택</option></select></td>' +
             '<td><input class="form-control st_input" list="datalistOptions" placeholder="상세 재질을 입력해 주세요." id="material_detail'+count+'" name="material_detail"></td></tr>';
             break;
             
   	  case 'measurement-table':
   		  cell = '<tr><td><input type="checkbox" name="measurement-checkbox"></td>' +
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
   		  cell = '<tr><input type="hidden" name="invol_org_code_idx" id="invol_org_code_idx"><td><input type="checkbox" name="possession-checkbox">' +
             '<th scope="row">'+(count+1)+'</th>' +
             '<td><select class="form-select st_select" name="invol_possession_code_idx'+(count+1)+'"><option value="" selected>선택</option>' +
             '<c:forEach var="list" items="${posSessionList}" varStatus="status"><option value="${list.possession_code_idx}">${list.possession_nm}</option></c:forEach></select>' +
             '</td><td><input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="자료번호를 입력해 주세요." name="invol_item_no'+(count+1)+'"></td>' +
             '<td><input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="참고사항을 입력해 주세요." name="invol_remark'+(count+1)+'"></td></tr>';
             break;
         
   	  case 'insurance-table':
   		  cell = '<tr><td><input type="checkbox" name="insurance-checkbox"></td>' +
             '<th scope="row">'+(count+1)+'</th><td><input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="평가액을 입력해 주세요." name="insu_agreed_value'+(count+1)+'"></td>' +
             '<td><select class="form-select st_select" name="insu_price_unit_code_idx'+(count+1)+'"><option value="" selected>선택</option>' +
             '<c:forEach var="list" items="${priceUnitList}" varStatus="status"><option value="${list.price_unit_code_idx}">${list.price_unit_nm}</option></c:forEach></select></td>' +
             '<td><input class="form-control" type="date" name="insu_start_date'+(count+1)+'"> ~ <input class="form-control" type="date" name="insu_end_date"></td>' +
             '<td><input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="대여기관을 입력해 주세요." name="insu_rental_org'+(count+1)+'"></td>' +
             '<td><input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="참고사항을 입력해 주세요." name="insu_remark'+(count+1)+'"></td></tr>';
             break;
             
   	  case 'copyright-table':
   		  cell = '<tr><td><input type="checkbox" name="copyright-checkbox"></td>' +
             '<th scope="row">'+(count+1)+'</th><td><select class="form-select st_select" name="copy_copyright'+(count+1)+'"><option value="" selected>선택</option><option value="Y">예</option>' +
             '<option value="N">아니요</option></select></td>' + 
             '<td><input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="" name="copy_owner'+(count+1)+'"></td>' + 
             '<td><input class="form-control" type="date" name="copy_expiry_date'+(count+1)+'"></td>' +
             '<td><select class="form-select st_select" name="copy_usage_permission'+(count+1)+'"><option value="" selected>선택</option><option value="Y">예</option><option value="N">아니요</option>' +
             '</select></td><td><select class="form-select st_select" name="copy_copyright_transfer'+(count+1)+'"><option value="" selected>선택</option><option value="Y">예</option>' +
             '<option value="N">아니요</option></select></td>' +
             '<td><input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="참고사항을 입력해 주세요." name="copy_remark'+(count+1)+'"></td></tr>';
             break;
   	  
   	  default:
   	    '';
   	}
   	 
       $("#"+b).append(cell);
       count++;
    };
     
    const deleteClassTd = (e, v) => {
	    	const check = 'input[name='+v+']:checked';
	   		const selected = document.querySelectorAll(check);
	   		 
	        for(let i =0;i<selected.length;i++) {
	            selected[i].parentElement.parentElement.remove();
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
  
  const changeOrgCode = e => $("#invol_org_code_idx").val(e);
  
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
   	  	let item_idx = sessionStorage.getItem("item_idx");
		movementData = [];
		$.ajax({
              url : '/getMovementList.do?item_idx=' + item_idx,
              type : 'Get',
              dataType : 'html',
              
              async : false,
              success: function(data) {
                 $('#movementZone').empty().append(data);
              },
              error: function(xhr, ajaxOptions, thrownError) {
                 console.log(xhr.status);
                 console.log(thrownError);
              }
         });

		$.ajax({
              url : '/getPastMovementList.do?item_idx=' + item_idx,
              type : 'Get',
              dataType : 'html',
              
              async : false,
              success: function(data) {
                 $('#pastMovementZone').empty().append(data);
              },
              error: function(xhr, ajaxOptions, thrownError) {
                 console.log(xhr.status);
                 console.log(thrownError);
              }
         });
}

	const getMovementData = async(btn) => {
		console.log(btn.value);
		$.ajax({
              url : '/getMovementData.do?movement_idx=' + btn.value,
              type : 'Get',
              dataType : 'json',
              success: async function(data) {
				console.log(data.movementList[0]);

			$("select[name=storage_type1_code_idx]").val(data.movementList[0].storage_type1_code_idx).prop("selected", true);
			$('#storage_type2_code_idx').children('option:not(:first)').remove();
			 	
	      	await change_storageType2(data.movementList[0].storage_type1_code_idx);
	      	$("select[name=storage_type2_code_idx]").val(data.movementList[0].storage_type2_code_idx).prop("selected", true);
	      	$('input[name=movement_qty]').val(data.movementList[0].movement_qty);
	      	$('input[name=current_qty]').val(data.movementList[0].current_qty);
	      	$('input[name=requester]').val(data.movementList[0].requester);
	      	$('input[name=remark]').val(data.movementList[0].remark);
	      	$('input[name=movement_date]').val(data.movementList[0].movement_date);
	      	$('input[name=movement_idx]').val(data.movementList[0].nmMovement_idx);
	      	$('input[name=storage_idx]').val(data.movementList[0].storage_idx)
	      	change_Inout('IN', data.movementList[0].storage_in_code_idx);
	      	change_Inout('OUT', data.movementList[0].storage_out_code_idx);
              },
              error: function(xhr, ajaxOptions, thrownError) {
                 console.log(xhr.status);
                 console.log(thrownError);
              }
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
   		let data = num.split(',');
		console.log(data);
   		
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
		let data = num.split(',');
		console.log(data);
   		
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
   
  /* $(document).on('click', '#modify-movement-btn', async function() {
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
   	})*/
   	
   	/*$(document).on('click', '#modify-movement-btn2', async function() {
	    	submitModifyMovement();
   	})*/

		const deleteMovement = async (btn) => {
			const res = await fetch('/deleteMovement.do?movement=' + btn.value);
	    	const msg = await res.text();
	    	msg == 'success' ? (
	    			alert('삭제 되었습니다'), getMovementList()
	    			) : alert('오류입니다');
		}
	    
	    
	   //보존처리 -------------------------------------------------
	   let tabCnt = 0;
	   
	   const addPreservation = async (num) => {
		   let res = '';
			   let formData = new FormData(document.getElementById('preservation-form'+num));
			   formData.append('item_idx', sessionStorage.getItem('item_idx'));
		    	
		    	let form = await fetch('/addPreservation.do', {
		    		method:'POST',
		    		/* headers: {
		                "Content-Type": "application/x-www-form-urlencoded",
		            }, */
		            body: formData
		    	})
		   res = await form.text();
		   res == 'success' ? (alert('등록완료'), $('#addPreservationBtn'+num).html('저장완료'), $('#addPreservationBtn'+num).attr('disabled', true), $('#deletePreservationBtn'+num).attr('disabled', true)
										) : alert('오류입니다');
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
	                      	'<div id="flush-collapseOne'+tabCnt+'" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">' +
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
	                  	  '' +
						  '<div class="mb-0"><button type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" id="addPreservationBtn'+tabCnt+'" onclick="addPreservation('+tabCnt+')">저장</button><button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" onclick="deleteForm('+tabCnt+')" id="deletePreservationBtn'+tabCnt+'">삭제</button></div></div></div></div></div></div></div></form>'+
	                  	  
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

		const preservationDeleteChecked = (name, num, state) => {
	    	let names = name+num+'checkbox';
	    	let divName = name+num+'Div';
			let updateNames = state+name+num+'checkbox';
			let updateDivName = state+name+num+'Div'
	    	if($('input:checkbox[name='+names+']:checked').length == 0) {
	    		alert("삭제할 항목을 선택해주세요.")
	    		return;
	    	}
	    	if(confirm("삭제하시겠습니까?")) {
				let arr = [];
		
	    		$('input:checkbox[name='+names+']:checked').each(function() {
	    			$('#update'+divName+$(this).val()).remove();
	    			$('#'+divName+$(this).val()).remove();
					arr.push($(this).attr('idx'));
	    		})
				if(arr) {
					$.ajax({
						type : 'post',                 
						url : '/deletePreservationImage.do',
						dataType : "text",
						data: {image_idx: arr},
						contentType : "application/x-www-form-urlencoded;charset=UTF-8",
						error : function() {
								alert('통신실패!');
						},
						success : function(data) {  
							data == 'success' ? alert('삭제되었습니다') : alert('오류가 발생했습니다. 다시 시도해주세요.')
						}
					});
				} 
	        } else {
	            return false;
	        }
	    }
	    
	    const deleteForm = (num) => {
	    	$('#preservation-form'+num).remove();
	    }

	const getPreservation = () => {
		$.ajax({
				type : 'get',                 
				url : '/getPreservation.do?item_idx=' + sessionStorage.getItem("item_idx"),
				dataType : "html",           
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {
						alert('통신실패!');
				},
				success : function(data) {  
					console.log(data);
					$('#settings').empty().append(data);
				}
			});
	}
	
	const deletePreservation = (num, idx) => {
		$.ajax({
				type : 'get',                 
				url : '/deletePreservation.do?idx=' + idx,
				dataType : "text",
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {
						alert('통신실패!');
				},
				success : function(data) {
					data == 'success' ? 
					(deleteForm(num), alert('삭제되었습니다.')) : alert('오류가 발생했습니다. 다시 시도해주세요.')
				}
			});
	}
	   
	   //전문정보 -------------------------------------------------------------------------------------------------------------------------------
	   let specialityData = [];
	   let spc_tr = '';
	   
	   const submitSpc = async () => {
		    let formData = new FormData(document.getElementById('speciality-form'));
		    formData.append('item_idx', sessionStorage.getItem('item_idx'));
	    	const form = await fetch('/setSpeciality.do', {
	    		method:'POST',
	            body: formData
	    	})
	    	const res = await form.text();
	    	res == 'success' ? (alert('등록완료'),  getSpeciality()) : alert('오류입니다');
	   }
	   
	   const getSpeciality = async () => {
		 $.ajax({
              url :'/getSpeciality.do?item_idx=' + sessionStorage.getItem("item_idx"),
              type : 'Get',
              dataType : 'html',
              async : false,
              success: function(data) {
				$('#specialityZone').empty().append(data);
              },
              error: function(xhr, ajaxOptions, thrownError) {
                 console.log(xhr.status);
                 console.log(thrownError);
              }
         });
	   }

	const getSpecialitySearch = async () => {
		 $.ajax({
              url :'/getSpecialitySearch.do?item_idx=' + sessionStorage.getItem("item_idx") + '&speciality_code_idx_search=' + $("select[name=speciality_code_idx_search]").val() + '&speciality_title_search=' + $("#speciality_title_search").val(),
              type : 'Get',
              dataType : 'html',
              async : false,
              success: function(data) {
				$('#specialityZone').empty().append(data);
              },
              error: function(xhr, ajaxOptions, thrownError) {
                 console.log(xhr.status);
                 console.log(thrownError);
              }
         });
	   }

	 const modifySpeciality = idx => {
		$('#spc-add-btn').hide();
		$('#spc-update-btn').show();
		
		$.ajax({
              url :'/getSpecialityData.do?speciality_idx=' + idx,
              type : 'get',
              dataType : 'json',
              async : false,
              success: function(data) {
                 console.log(data.specialityList[0]);
				$("select[name=speciality_code_idx]").val(data.specialityList[0].speciality_code_idx).prop("selected", true);
		      	$('input[name=spc_title]').val(data.specialityList[0].title);
		      	$('#fileNameInput').val(data.specialityList[0].file_nm);
		      	$('input[name=spc_copyright]').val(data.specialityList[0].copyright);
		      	$('input[name=spc_content]').val(data.specialityList[0].content);
				specialityData = data.specialityList[0];
				console.log(specialityData);
              },
              error: function(xhr, ajaxOptions, thrownError) {
                 console.log(xhr.status);
                 console.log(thrownError);
              }
         });
	}
	
	const deleteSpeciality = (btn) => {
		let formData = new FormData();
		console.log(btn.getAttribute("idx"));
		formData.append("spc_file_path", btn.getAttribute("file_path"));
		formData.append("spc_file_nm", btn.getAttribute("file_nm"));
		formData.append("speciality_idx", btn.getAttribute("idx"));
/*		formData.append("spc_file_path", $('#delete-speciality-btn').attr('file_path'));
		formData.append("spc_file_nm", $('#delete-speciality-btn').attr('file_nm'));
		formData.append("speciality_idx", $('#delete-speciality-btn').attr('idx'));*/
		$.ajax({
              url :'/deleteSpeciality.do',
              type : 'post',
			  datatype: 'text',
			  data: formData,
			  contentType: false,
			  processData: false,
              success: function(data) {
				/*$('#specialityZone').empty().append(data);*/
				console.log(data);
				data == 'success' ? (alert('삭제완료'), getSpeciality()) : alert('오류가 발생했습니다. 다시 시도해주세요.')
              },
              error: function(xhr, ajaxOptions, thrownError) {
                 console.log(xhr.status);
                 console.log(thrownError);
              }
         });
	}
	   
	   const updateSpeciality = async () => {
		   let formData = new FormData($('#speciality-form')[0]);
		    formData.append('item_idx', sessionStorage.getItem('item_idx'));
		    formData.append('speciality_idx', specialityData.speciality_idx);
		    formData.append("spc_file_nm", specialityData.file_nm);
		    formData.append("spc_file_path", specialityData.file_path);
		    formData.append("speciality_idx", specialityData.speciality_idx);
	    	const form = await fetch('/updateSpeciality.do', {
	    		method:'POST',
	            body: formData
	    	})
	    	const res = await form.text();
	    	res == 'success' ? (alert('등록완료'), getSpeciality()) : alert('오류입니다');
	   }
	   
	   $(document).on('click', '#spc-add-button', async function() {
			$("#speciality-form")[0].reset();
		   $('#spc-add-btn').show();
		   $('#spc-update-btn').hide();
 		})
	
  	
  	const speciality_file_change = () => {
  		let value = $('#spc_uploadFile').val();
  		let filename = value.split('/').pop().split('\\').pop();
  		$('#fileNameInput').val(filename);
  	}

	const goSpecialityPage = page => {
		 $.ajax({
              url :'/getSpeciality.do?item_idx=' + sessionStorage.getItem("item_idx") + '&page='+page,
              type : 'Get',
              dataType : 'html',
              async : false,
              success: function(data) {
				$('#specialityZone').empty().append(data);
              },
              error: function(xhr, ajaxOptions, thrownError) {
                 console.log(xhr.status);
                 console.log(thrownError);
              }
         });
	}
	
	const goSpecialitySearchPage = page => {
		 $.ajax({
              url :'/getSpecialitySearch.do?item_idx=' + sessionStorage.getItem("item_idx") + '&speciality_code_idx_search=' + $("select[name=speciality_code_idx_search]").val() + '&speciality_title_search=' + $("#speciality_title_search").val() + '&page=' + page,
              type : 'Get',
              dataType : 'html',
              async : false,
              success: function(data) {
				$('#specialityZone').empty().append(data);
              },
              error: function(xhr, ajaxOptions, thrownError) {
                 console.log(xhr.status);
                 console.log(thrownError);
              }
         });
	}
  	
  	// 이미지정보 -------------------------------------------------------------------------
  	/** 일반 업로드 **/
    /** DEXTUPLOADX5 설정 **/
    dx5.create({ 
       mode: "multi", id: "dext5", parentId: "dext5-container" , btnFile: "btn-add-files",
       btnUploadAuto: "btn-upload-auto", btnDeleteChecked: "btn-delete-auto"
    });

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
		//dx.setPreviewEnable(true);
		// 내장 뷰어를 사용하여 미리보기를 수행하도록 설정한다. (기본값 1)
		//dx.setPreviewMethod(2);
		// 첫 번째 파일이 로컬 이미지 파일이라면 내장 뷰어를 실행한다.
	 }
	
	/** 
	function preview() {
       let dx = dx5.get("dext5");
	  let item = dx.getItemByIndex(0);
		console.log('이미지 이름: ' + item.name);
		console.log('이미지 이름: ' + item.path);
       //dx.preview(0);
    }
	
	
	function onDX5Preview(id, itemIndex, itemId, itemSource) {
	  console.log('프리뷰 실행');
	  console.log('dd'+itemSource);
	  let img = $('#imgimgimg');
	  if (itemSource) {
		$('#imgimgimg').attr('src', itemSource);
		$('#imgimgimg').css('display', 'block');
	  }
	}
	
	function onDX5ItemsAdded(id, count, arr) {
		let dx = dx5.get(id);
		arr.forEach((e,i) => {
			dx.preview(i);
		})
		
	}
	*/
	 
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

	const imageCheckboxChecked = box => {
		box.checked ? $('input:checkbox[id='+box.id+']').prop("checked", true) : $('input:checkbox[id='+box.id+']').prop("checked", false)
	}
	
	const downloadImageChecked = async () => {
        let path_arr = [];
      if($('input:checkbox[name=imageCheckbox]:checked').length == 0) {
         alert("다운로드할 항목을 선택해주세요.")
         return;
      }
      if(confirm("다운하시겠습니까?")) {
         $('input:checkbox[name=imageCheckbox]:checked').each(function() {
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
                 img_path : path_arr
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
  	
  	
  	
  	const deleteImageChecked =  () => {
      let idx_arr = [];
      if($('input:checkbox[name=imageCheckbox]:checked').length == 0) {
         alert("삭제할 항목을 선택해주세요.")
         return;
      }
      if(confirm("삭제하시겠습니까?")) {
         $('input:checkbox[name=imageCheckbox]:checked').each(function(i, val) {
            idx_arr.push(val.value);
         })
		console.log(idx_arr);

			$.ajax({
						type : 'POST',                 
						url : '/deleteImage.do',
						data: {
							image_idx: idx_arr,
						},
						dataType : "html",           
						contentType : "application/x-www-form-urlencoded;charset=UTF-8",
						error : function() {        
							alert('통신실패!');
						},
						success : function(data) {
							data == 'success' ? 
							(alert('삭제되었습니다.'), getImageList()) : alert('오류가 발생했습니다. 다시 시도해주세요.')
						}
					});
       } else {
           return false;
       }
   }
  	
  	const imageAllCheck = () => {
   	$('input[name=imageCheckbox]').prop("checked", true);
   	$('input[name=imageListCheckbox]').prop("checked", true);
   }
   
   const imageCancelCheck = () => {
   	$('input[name=imageCheckbox]').prop("checked", false);
   	$('input[name=imageListCheckbox]').prop("checked", false);
   }