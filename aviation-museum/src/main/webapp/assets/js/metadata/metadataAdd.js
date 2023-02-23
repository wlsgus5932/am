let count = 0;
     let movementData = [];
     let item_idx = '';
     
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
    	
    	item_idx ? alert('등록완료') : alert('오류입니다');
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
     
     /* const addClassTd = (r, b) => {
    	 count = document.getElementById(r).querySelectorAll("th").length;
    	 let cell = '';
    	 switch (r) {
    	  case 'class-table':
    	  	 cell =  '<tr id="class-tr"><td><input type="checkbox" name="class-checkbox"></td>' +
			 '<th scope="row">'+(count+1)+'</th>' +
			 '<td><select class="form-select st_select" name="class1_code_idx'+(count+1)+'"><option value="" selected>선택</option>' +
			 '<c:forEach var="list" items="${class1List}" varStatus="status"><option value="${list.class1_code_idx}">${list.class1_nm}</option></c:forEach></select></td>' +
			 '<td><select class="form-select st_select" name="class2_code_idx'+(count+1)+'"><option value="" selected>선택</option>' +
			 '<c:forEach var="list" items="${class2List}" varStatus="status"><option value="${list.class2_code_idx}">${list.class2_nm}</option></c:forEach></select></td>' +
			 '<td><select class="form-select st_select" name="class3_code_idx'+(count+1)+'"><option value="" selected>선택</option> ' +
			 '<c:forEach var="list" items="${class3List}" varStatus="status"><option value="${list.class3_code_idx}">${list.class3_nm}</option></c:forEach></select></td></tr>';
    	    break;
    	    
    	  case 'country-table':
    	    cell = '<tr><td><input type="checkbox" name="country-checkbox"></td>' +
    	    '<th scope="row">'+(count+1)+'</th>' +
            '<td><select class="form-select st_select" id="country-select'+(count+1)+'" onchange="changeCountry(this.value, '+(count+1)+')" name="country_code_idx"><option value="" selected>선택</option>' +
            '<c:forEach var="list" items="${countryList}" varStatus="status"><option value="${list.country_code_idx}">${list.country_nm}</option></c:forEach></select></td>'+
            '<td><select class="form-select st_select" id="era-select'+(count+1)+'" name="era_code_idx"><option value="" selected>선택</option></select></td>' +
            '<td><input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="상세 시대를 입력해 주세요." name=detail_year'+(count+1)+'></td></tr>';
    	    break;
    	    
    	  case 'material-table': 
    		  cell =  '<tr><td><input type="checkbox" name="material-checkbox"></td>' +
              '<th scope="row">'+(count+1)+'</th>' +
              '<td><select class="form-select st_select" onchange="changeMaterial(this.value, '+(count+1)+')" name="material1_code_idx'+(count+1)+'"><option value="" selected>선택</option>' +
              '<c:forEach var="list" items="${material1List}" varStatus="status"><option value="${list.material1_code_idx}">${list.material1_nm}</option></c:forEach></select></td>' +
              '<td><select class="form-select st_select" id="material2-select'+(count+1)+'" name="material2_code_idx"><option value="" selected>선택</option></select></td>' +
              '<td><input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="상세 재질을 입력해 주세요." name="material_detail'+(count+1)+'"></td></tr>';
              break;
              
    	  case 'measurement-table':
    		  cell = '<tr><td><input type="checkbox" name="measurement-checkbox"></td>' +
              '<th scope="row">'+(count+1)+'</th>' +
              '<td><input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="소장구분을 입력해 주세요." name="measurement_item_type"></td>' +
              '<td><select class="form-select st_select" name="measurement_code_idx"><option value="" selected>선택</option>' +
              '<c:forEach var="list" items="${measurementList}" varStatus="status"><option value="${list.measurement_code_idx}">${list.measurement_nm}</option></c:forEach></select></td>' +
              '<td><input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="실측치를 입력해 주세요." name="measurement_value"><td>' +
              '<select class="form-select st_select" name="measurement_unit_code_idx"><option value="" selected>선택</option>' +
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
     }; */
     
     const addClassTd = (r, b) => {
    	 count = document.getElementById(r).querySelectorAll("th").length;
    	 let cell = '';
    	 switch (r) {
    	  case 'class-table':
    	  	 cell =  '<tr id="class-tr"><td><input type="checkbox" name="class-checkbox"></td>' +
			 '<th scope="row">'+(count+1)+'</th>' +
			 '<td><select class="form-select st_select" name="class1_code_idx'+(count+1)+'"><option value="" selected>선택</option>' +
			 '<c:forEach var="list" items="${class1List}" varStatus="status"><option value="${list.class1_code_idx}">${list.class1_nm}</option></c:forEach></select></td>' +
			 '<td><select class="form-select st_select" name="class2_code_idx'+(count+1)+'"><option value="" selected>선택</option>' +
			 '<c:forEach var="list" items="${class2List}" varStatus="status"><option value="${list.class2_code_idx}">${list.class2_nm}</option></c:forEach></select></td>' +
			 '<td><select class="form-select st_select" name="class3_code_idx'+(count+1)+'"><option value="" selected>선택</option> ' +
			 '<c:forEach var="list" items="${class3List}" varStatus="status"><option value="${list.class3_code_idx}">${list.class3_nm}</option></c:forEach></select></td></tr>';
    	    break;
    	    
    	  case 'country-table':
    	    cell = '<tr><td><input type="checkbox" name="country-checkbox"></td>' +
    	    '<th scope="row">'+(count+1)+'</th>' +
            '<td><select class="form-select st_select" id="country-select'+(count+1)+'" onchange="changeCountry(this.value, '+(count+1)+')" name="country_code_idx"><option value="" selected>선택</option>' +
            '<c:forEach var="list" items="${countryList}" varStatus="status"><option value="${list.country_code_idx}">${list.country_nm}</option></c:forEach></select></td>'+
            '<td><select class="form-select st_select" id="era-select'+(count+1)+'" name="era_code_idx"><option value="" selected>선택</option></select></td>' +
            '<td><input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="상세 시대를 입력해 주세요." name=detail_year'+(count+1)+'></td></tr>';
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
	                     '<td><button id="modify-movement-btn" class="btn btn-secondary waves-effect waves-light btn_ml btn_wh" data-bs-toggle="modal" data-bs-target="#myModal" onclick="btn_control(1)">수정</button></td>' +
	                     '<td><button id="delete-movement-btn" class="btn btn-secondary waves-effect waves-light btn_ml btn_wh">삭제</button><input type="hidden" id="movement-idx" value="'+e.movement_idx+'"/></td></tr>');
		  	   	
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
		   const res = await fetch('/getSpeciality.do');
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
   	
   	let gallery = '';
   	
   	const getImageList = async () => {
   		let item_idx = sessionStorage.getItem("item_idx");
   		let res = await fetch('/getImage.do?item_idx=' + item_idx);
   		const { imageList } = await res.json();
   		const rep_text = "rep_image";
   		const public_text = "public_service";
   		
   		$('#img-info-preview').children().remove();
   		$('#img-info-list').children().remove();
   		
   		imageList.forEach((e, i) => {
	   			$('#img-info-preview').append(
		   				'<div class="col img-col" id="images-take"><div class="img-col-header">' +
		         		'<input type="checkbox" id="imageCheck'+i+'" name="imageListCheck" onclick="imageListChecked(this, '+i+')" value="'+e.image_idx+'">'+e.image_nm+'</div>' +
		       			'<div class="img-col-img-wrap"><a href="#">' +
		           		'<div class="img-hover-info"><h4>이미지 설명</h4><p>설명없음</p></div>' + 
		           		'<img src="assets/images/test.png" alt="이미지"></a></div>' +
		           		/* '<img src="<c:url value="images/test.png"/>" alt="이미지"></a></div>' + */
		           		/* '<img src="<c:url value="'+e.image_path+e.image_nm+'"/>" alt="이미지"></a></div>' + */
		         		'<div class="img-col-info">' +
		           		'<dl><dt>명칭:</dt><dd>'+e.image_nm+'</dd></dl>' +
		           		'<dl><dt>시간:</dt><dd>'+e.reg_date+'</dd></dl> ' +
		           		'<dl><dt>사이즈:</dt><dd>'+e.image_width+'x'+e.image_height+'</dd></dl>' +
		           		'<dl><dt>태그:</dt><dd><button class="img-tag"><a href="#">태그</a></button></dd></dl>' +
		           		'<dl><dt><input type="checkbox" name="rep_image" id="rep_check'+i+'" value="'+e.image_idx+'" onclick="publicRepCheck(this)"></dt><dd>대표</dd><dt>' +
		           		'<input type="checkbox" name="public_service" id="public_check'+i+'" value="'+e.image_idx+'" onclick="publicRepCheck(this)">' +
		           		'</dt><dd>대국민 서비스</dd></dl>' +
		           		'<dl><button class="img-info_btn" data-bs-toggle="modal" data-bs-target=".bs-example-modal-xll">설명등록</button>' +
		           		'<button class="img-info_btn" type="button" onclick="gallery.show()">원문보기</button></dl></div></div>');
	   			
		   		e.rep_image == 'Y' ? $('#rep_check'+i).prop('checked',true) : ''
		   		e.public_service == 'Y' ? $('#public_check'+i).prop('checked',true) : ''
		   				
		   		$('#img-info-list').append(
		   				'<tr><td><input type="checkbox" id="imageListCheck'+i+'" name="imageInfoListCheck"  value="'+e.image_idx+'" onclick="imageListChecked(this, '+i+')"></td>' +
                        '<td>'+e.rownum+'</td>' +
                        '<td>'+e.image_nm+'</td>' +
                        '<td>'+e.image_width+'x'+e.image_height+'</td>' +
                        '<td>'+e.image_path+e.image_nm+'</td>' +
                        '<td><input type="checkbox" name="rep_image" id="list_rep_check'+i+'" value="'+e.image_idx+'" onclick="publicRepCheck(this)"></td>' +
                        '<td><input type="checkbox" name="public_service" id="list_public_check'+i+'" value="'+e.image_idx+'" onclick="publicRepCheck(this)"></td>' +
                        '<td><button>원본보기</button></td></tr>');
		   		
		   		e.rep_image == 'Y' ? $('#list_rep_check'+i).prop('checked',true) : ''
			   	e.public_service == 'Y' ? $('#list_public_check'+i).prop('checked',true) : ''
			   	
   		});
		gallery = new Viewer(document.getElementById('img-info-preview'));
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
   	
   	const deleteImageChecked = async () => {
   		let idx_arr = [];
    	if($('input:checkbox[name=imageListCheck]:checked').length == 0) {
    		alert("삭제할 항목을 선택해주세요.")
    		return;
    	}
    	if(confirm("삭제하시겠습니까?")) {
    		$('input:checkbox[name=imageListCheck]:checked').each(function() {
    			idx_arr.push($(this).val());
    		})
    		
    		let formData = new FormData();
    		formData.append("image_idx", idx_arr);
    		let res = await fetch('/deleteImage.do', {
	    		method:'POST',
	            body: formData
	    	});
    		
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