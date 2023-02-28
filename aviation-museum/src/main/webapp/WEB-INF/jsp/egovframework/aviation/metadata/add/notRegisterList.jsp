<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Dashboard | Borex - Admin & Dashboard Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesbrand" name="author" />
    <link rel="shortcut icon" href="assets/images/favicon.ico" />
    <!-- Bootstrap Css -->
    <link href="<c:url value='/assets/css/bootstrap.min.css'/>" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="<c:url value='/assets/css/icons.min.css'/>" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="<c:url value='/assets/css/app.min.css'/>" id="app-style" rel="stylesheet" type="text/css" />
    <!-- 커스텀 css -->
    <link href="<c:url value='/assets/css/custom.css'/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value='/assets/css/viewer.css'/>" rel="stylesheet" type="text/css" />
    <!--  -->
    <link rel="stylesheet" href="<c:url value='/assets/libs/swiper/swiper-bundle.min.css'/>" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="<c:url value='/assets/js/viewer.js'/>" defer></script>
    <script src="<c:url value='/dx5/dextuploadx5-configuration.js'/>"></script>
    <script src="<c:url value='/dx5/dextuploadx5.js'/>"></script>
    <script src="<c:url value='/assets/js/metadata/metadataList.js'/>" defer></script>
    
    <script type="text/javascript">
    let count = 0;
    let movementData = [];
    let item_idx = '';
    
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
     
     const getImageList = async () => {
        let item_idx = sessionStorage.getItem("item_idx");
        let res = await fetch('/getImage.do?item_idx=' + item_idx);
        const { imageList } = await res.json();
        console.log(imageList);
        const rep_text = "rep_image";
        const public_text = "public_service";
        
        $('#img-info-preview').children().remove();
        $('#img-info-list').children().remove();
        
        imageList.forEach((e, i) => {
              $('#img-info-preview').append(
                    '<div class="col img-col"><div class="img-col-header">' +
                    '<input type="checkbox" id="imageCheck'+i+'" name="imageListCheck" onclick="imageListChecked(this, '+i+')" value1="'+e.image_idx+'" value2="'+e.image_path+'">'+e.image_nm+'</div>' +
                     '<div id="images" class="img-col-img-wrap"><a href="#">' +
                      '<div class="img-hover-info"><h4>이미지 설명</h4><p>설명없음</p></div>' + 
//                       '<img src="assets/images/ggobugi.jpg" alt="이미지"></a></div>' +
                      /* '<img src="<c:url value="images/test.png"/>" alt="이미지"></a></div>' + */
                      '<img src="<c:url value="aviation-museum/images/'+e.image_nm+'"/>" alt="이미지"></a></div>' + 
                    '<div class="img-col-info">' +
                      '<dl><dt>명칭:</dt><dd>'+e.image_nm+'</dd></dl>' +
                      '<dl><dt>시간:</dt><dd>'+e.reg_date+'</dd></dl> ' +
                      '<dl><dt>사이즈:</dt><dd>'+e.image_width+'x'+e.image_height+'</dd></dl>' +
                      '<dl><dt>태그:</dt><dd><button class="img-tag"><a href="#">태그</a></button></dd></dl>' +
                      '<dl><dt><input type="checkbox" name="rep_image" id="rep_check'+i+'" value="'+e.image_idx+'" onclick="publicRepCheck(this)"></dt><dd>대표</dd><dt>' +
                      '<input type="checkbox" name="public_service" id="public_check'+i+'" value="'+e.image_idx+'" onclick="publicRepCheck(this)">' +
                      '</dt><dd>대국민 서비스</dd></dl>' +
                      '<dl><button class="img-info_btn" data-bs-toggle="modal" data-bs-target=".bs-example-modal-xll">설명등록</button>' +
                      '<button class="img-info_btn" type="button" onclick="gallery.view('+i+')">원문보기</button></dl></div></div>');
              
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
    </script>
  </head>

  <body data-sidebar="dark" onload="msg();">
    <!-- <body data-layout="horizontal"> -->

    <!-- Begin page -->
    <div id="layout-wrapper">
    <jsp:include page="../../common/inc/headerContent.jsp" />
    
      <!-- ============================================================== -->
      <!-- Start right Content here -->
      <!-- ============================================================== -->
      <div class="main-content">
        <!-- 자료등록 시작 -->
       <form id="add-form">
        <div class="page-content">
        <div class="tap_text">
            <h2>자료 신규 등록</h2>
            <p>자료 등록 > <span> 자료 신규 등록 </span></p>
          </div>
          <!-- 자료구분 셀렉트 -->
          <div class="fr_wrap">
            <div class="mb-3 row fr_1">
              <div class="col-md-10">
              <label class="col-md-2 col-form-label">자료 구분</label>
                  <select class="form-select" name="possession_code_idx">
                      <option value="" selected>선택</option>
                      		<c:forEach var="list" items="${posSessionList}" varStatus="status">
		                           <option value="${list.possession_code_idx}">${list.possession_nm}</option>
		                     </c:forEach>
                  </select>
                <select class="form-select" name="org_code_idx" onchange="changeOrgCode(this.value)">
                    <option value="" selected>선택</option>
                    		<c:forEach var="list" items="${orgList}" varStatus="status">
		                           <option value="${list.org_code_idx}">${list.org_nm}</option>
		                     </c:forEach>
                </select>
                
                <label class="col-md-2 col-form-label">자료 번호</label>
                  <!-- <div class="col-md-10"> -->
                    <input class="form-control" list="datalistOptions" id="item_no" placeholder="자료 번호" name="item_no">
                    <input class="form-control" list="datalistOptions" id="item_detail_no" placeholder="세부" name="item_detail_no">
                    <button type="button" class="btn btn-secondary waves-effect waves-light btn_ml" onclick="search_item_base()">조회</button>
                    <!--  -->
                    
                    <button class="btn btn-secondary waves-effect waves-light btn_ml">인쇄</button>
                    <select class="form-select fls kor_sl">
                      <option disabled selected>한글</option>
                      <option>더미1</option>
                      <option>더미2</option>
                      <option>더미3</option>
                  </select>
                   <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#"><<</a></li>
                    <li class="page-item"><a class="page-link" href="#"><</a></li>
                    <li class="page-item"><a class="page-link" href="#">상세</a></li>
                    <li class="page-item"><a class="page-link" href="#">></a></li>
                    <li class="page-item"><a class="page-link" href="#">>></a></li>
                </ul>
            </div>
          </div>
          <!--  -->
          <!-- 퀵메뉴 -->

          <div class="accordion" id="accordionExample">
          
            <div class="accordion-item">
              <h2 class="accordion-header" id="headingOne">
                <button
                  class="accordion-button fw-medium"
                  type="button"
                  data-bs-toggle="collapse"
                  data-bs-target="#collapseOne"
                  aria-expanded="true"
                  aria-controls="collapseOne"
                >
                  퀵메뉴
                </button>
              </h2>
              <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                  <div class="text-muted">
                    <strong class="text-dark">
                      <ul>
                        <li><a href="#">저장</a></li>
                        <li><a href="#">자료 등록하기</a></li>
                        <li><a href="#">자료 정보 가져오기</a></li>
                        <li><a href="#">자료 정보 일괄 변경</a></li>
                        <li><a href="#">자료 정보 삭제 신청</a></li>
                        <li><a href="#">자료 번호 삽입</a></li>
                      </ul>
                  </div>
                </div>
              </div>
            </div>
            <div class="accordion-item">
              <h2 class="accordion-header" id="headingTwo">
                <button
                  class="accordion-button fw-medium collapsed"
                  type="button"
                  data-bs-toggle="collapse"
                  data-bs-target="#collapseTwo"
                  aria-expanded="false"
                  aria-controls="collapseTwo"
                >
                  고정메뉴
                </button>
              </h2>
              <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                  <div class="text-muted">
                    <strong class="text-dark">
                      <ul>
                        <li><a href="#">연표</a></li>
                        <li><a href="#">연호</a></li>
                        <li><a href="#">용어</a></li>
                        <li><a href="#">분류체계</a></li>
                      </ul>
                  </div>
                </div>
              </div>
            </div>
            <div class="accordion-item">
              <h2 class="accordion-header" id="headingThree">
                <button
                  class="accordion-button fw-medium collapsed"
                  type="button"
                  data-bs-toggle="collapse"
                  data-bs-target="#collapseThree"
                  aria-expanded="false"
                  aria-controls="collapseThree"
                >
                  등록메뉴얼
                </button>
              </h2>
              <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                </div>
              </div>
            </div>
          </div>
          <!--  -->
          </div>
          <!-- 내용물 -->
          <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" data-bs-toggle="tab" href="#home" role="tab">
                    <span class="d-block d-sm-none"><i class="fas fa-home"></i></span>
                    <span class="d-none d-sm-block">기본 사항</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#profile" role="tab">
                    <span class="d-block d-sm-none"><i class="far fa-user"></i></span>
                    <span class="d-none d-sm-block">이동 사항(0)</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#messages" role="tab" onclick="getImageFunction(); return false;">
                    <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span>
                    <span class="d-none d-sm-block">이미지(0)</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#settings" role="tab">
                    <span class="d-block d-sm-none"><i class="fas fa-cog"></i></span>
                    <span class="d-none d-sm-block">보존처리(0)</span>
                </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-bs-toggle="tab" href="#settings22" role="tab">
                  <span class="d-block d-sm-none"><i class="fas fa-cog"></i></span>
                  <span class="d-none d-sm-block">전문정보(0)</span>
              </a>
          </li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content p-3 text-muted">
          <!-- 기본 사항 시작 -->
          <!--  -->
          <!-- 기본 사항 - 분류체계 시작 -->
            <div class="tab-pane active" id="home" role="tabpanel">
              <div class="mb-0">
                <div class="st_wrap">
                </div>
                <div class="card-body cd_df">
                  <div class="tr_left">
                  <!-- 이미지 슬라이드 -->
                      <div class="card-body">
                        <div class="slider_count_wrap">
                          1/10
                        </div>
                          <div class="card-title-desc">
                            <button>원본보기</button><button>다운로드</button>
                          </div>
                          <!--  -->
                          <div class="img-slider">
                            <div><img src="" alt="이미지1"></div>
                            <div><img src="" alt="이미지2"></div>
                            <div><img src="" alt="이미지3"></div>
                          </div>
                      </div>
                  </div>
                  <div class="table-responsive tr_right">
                      <table class="table mb-0">
                          <tbody>
                              <tr>
                                <td>
                                  명칭
                                </td>
                                  <td>
                                    <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="자료의 명칭을 입력해 주세요." name="item_nm">
                                  </td>
                                  <td>
                                    이명칭
                                  <td>
                                    <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="자료의 명칭을 입력해 주세요." name="item_se_nm">
                                  </td>
                              </tr>
                              <!-- 2  -->
                              <tr>
                                <td>
                                  영문 명칭
                                </td>
                                  <td>
                                    <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="자료의 영문 명칭을 입력해 주세요." name="item_eng_nm">
                                  </td>
                                  <td>
                                    작가
                                  <td>
                                    <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="작가의 이름을 입력해 주세요." name="author">
                                  </td>
                              </tr>
                              <!-- 3 -->
                              <tr>
                                <td>
                                  수량
                                </td>
                                  <td>
                                    <input class="form-control st_input pri" list="datalistOptions" id="exampleDataList" placeholder="수량을 입력해 주세요." name="qty" style="min-width:auto !important;">
                                    <select class="form-select st_select pri" name="qty_unit_code_idx" style="min-width:auto !important;">
                                      <option value="" selected>단위선택</option>
                                      	<c:forEach var="list" items="${qtyUnitList}" varStatus="status">
		                                    <option value="${list.qty_unit_code_idx}">${list.qty_unit_nm}</option>
		                                </c:forEach>
                                    </select>	
                                  </td>
                                  <td>
                                     ICAO
                                  </td>
                                  <td>
                                    <select class="form-select st_select" name="icao_code_idx">
                                      <option selected value="">선택안함</option>
                                      <c:forEach var="list" items="${IcaoList}" varStatus="status">
		                                    <option value="${list.icao_code_idx}">${list.icao_nm}</option>
		                                </c:forEach>
                                    </select>
                                  </td>
                              </tr>
                              <!-- 4 -->
                              <tr>
                                <td>
                                  현존여부
                                </td>
                                  <td>
                                    <select class="form-select st_select" name="existence_code_idx">
                                      <option selected value="">선택</option>
                                      <c:forEach var="list" items="${existenceList}" varStatus="status">
		                                    <option value="${list.existence_code_idx}">${list.existence_nm}</option>
		                               </c:forEach>
                                    </select>
                                  </td>
                                  <td>
                                    관리번호
                                  </td>
                                  <td>
                                    <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="관리번호를 입력해 주세요." name="management_no">
                                  </td>
                              </tr>
                              <!-- 5 -->
                              <tr>
                                <td>
                                  보존처리필요
                                </td>
                                  <td>
                                    <select class="form-select st_select" name="preservation_need">
                                      <option selected value="N">불필요</option>
                                      <option value="Y">필요</option>
                                    </select>
                                  </td>
                                  <td>
                                    보존처리자
                                  </td>
                                  <td>
                                    <input class="form-control st_input" list="datalistOptions" id="exampleDataList" placeholder="보존처리 이력이 있을 경우만 이름을 나타냅니다.">
                                  </td>
                              </tr>
                          </tbody>
                      </table>
                  </div>
                  
              </div>
              </div>
                <div class="mb-0">
                  <div class="st_wrap">
                    <label class="col-md-2 col-form-label st_title">분류체계</label>
                    <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" type="button" >간편입력</button>
                    <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" type="button" onclick="deleteClassTd('class-table', 'class-checkbox')">선택삭제</button>
                    <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" type="button" onclick="addClassTd('class-table', 'class-tbody')">추가</button>
                  </div>
                  <div class="card-body">
                    <div class="table-responsive">
	                        <table class="table mb-0" id="class-table">
	                            <thead>
	                                <tr class="tr_bgc">
	                                    <td>#</td>
	                                    <td>번호</td>
	                                    <td>대분류</td>
	                                    <td>중분류</td>
	                                    <td>소분류</td>
	                                </tr>
	                            </thead>
	                            <tbody id="class-tbody">
	                                <tr id="class-tr">
	                                  <td></td>
	                                 <!--  <input type="checkbox" name="class-checkbox" id=""> -->
	                                    <th scope="row" id="row-number">1</th>
	                                    <td>
	                                      <select class="form-select st_select" id="class1_code_idx0" name="class1_code_idx">
	                                        <option value="" selected>선택</option>
	                                        <c:forEach var="list" items="${class1List}" varStatus="status">
			                                    <option value="${list.class1_code_idx}">${list.class1_nm}</option>
			                                </c:forEach>
	                                      </select>
	                                    </td>
	                                    <td>
	                                      <select class="form-select st_select" id="class2_code_idx0" name="class2_code_idx">
	                                        <option value="" selected>선택</option>
	                                        <c:forEach var="list" items="${class2List}" varStatus="status">
			                                    <option value="${list.class2_code_idx}">${list.class2_nm}</option>
			                                </c:forEach>
	                                      </select>
	                                    </td>
	                                    <td>
	                                      <select class="form-select st_select" id="class3_code_idx0" name="class3_code_idx">
	                                        <option value="" selected>선택</option>
	                                        <c:forEach var="list" items="${class3List}" varStatus="status">
			                                    <option value="${list.class3_code_idx}">${list.class3_nm}</option>
			                                </c:forEach>
	                                      </select>
	                                    </td>
	                                </tr>
	                            </tbody>
	                        </table>
                    </div>
                </div>
              </div>
              
              
              <!-- ------------------------ddddddddddddddddddddmnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn -->
              <!-- 기본 사항 - 분류체계 끝 --> 
              <!-- 기본사항 - 국적 시작 -->
             
              <div class="mb-0">
                <div class="st_wrap">
                  <label class="col-md-2 col-form-label st_title">국적</label>
                  <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" type="button" >간편입력</button>
                  <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" type="button" onclick="deleteClassTd('country-table', 'country-checkbox')">선택삭제</button>
                  <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" type="button" onclick="addClassTd('country-table', 'country-tbody')">추가</button>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                      <table class="table mb-0" id="country-table">
                          <thead>
                              <tr class="tr_bgc">
                                  <td>#</td>
                                  <td>번호</td>
                                  <td>국적</td>
                                  <td>국적별 시대</td>
                                  <td>시대(상세)</td>
                              </tr>
                          </thead>
                          <tbody id="country-tbody">
                              <tr>
                                <td></td>
                                  <th scope="row">1</th>
                                  <td>
                                    <select class="form-select st_select" id="country-select0" onchange="changeCountry(this.value, 0)" name="country_code_idx">
                                      <option value="" selected>선택</option>
		                               <c:forEach var="list" items="${countryList}" varStatus="status">
		                                    <option value="${list.country_code_idx}">${list.country_nm}</option>
		                                </c:forEach>
                                    </select>
                                  </td>
                                  <td>
                                    <select class="form-select st_select" id="era-select0" name="era_code_idx">
                                      <option value="" selected>선택</option>
                                      <%-- <c:forEach var="list" items="${eraList}" varStatus="status">
		                                    <option value="${list.era_code_idx}">${list.era_nm}</option>
		                                </c:forEach> --%>
                                    </select>
                                  </td>
                                  <td>
                                    <input class="form-control st_input" list="datalistOptions" placeholder="상세 시대를 입력해 주세요." id="detail_year0" name=detail_year>
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
                <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" type="button" >간편입력</button>
                <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" type="button" onclick="deleteClassTd('material-table', 'material-checkbox')">선택삭제</button>
                <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" type="button" onclick="addClassTd('material-table', 'material-tbody')">추가</button>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                    <table class="table mb-0" id="material-table">
                        <thead>
                            <tr class="tr_bgc">
                                <td>#</td>
                                <td>번호</td>
                                <td>1단계</td>
                                <td>2단계</td>
                                <td>재질(상세)</td>
                            </tr>
                        </thead>
                        <tbody id="material-tbody">
                            <tr>
                              <td></td>
                                <th scope="row">1</th>
                                <td>
                                  <select class="form-select st_select" id="material1_code_idx0" onchange="changeMaterial(this.value, 0)" name="material1_code_idx">
                                    <option value="" selected>선택</option>
                                    <c:forEach var="list" items="${material1List}" varStatus="status">
		                                    <option value="${list.material1_code_idx}">${list.material1_nm}</option>
		                                </c:forEach>
                                  </select>
                                </td>
                                <td>
                                  <select class="form-select st_select" id="material2_code_idx0" name="material2_code_idx">
                                    <option value="" selected>선택</option>
                                  </select>
                                </td>
                                <td>
                                  <input class="form-control st_input" list="datalistOptions" id="material_detail0" placeholder="상세 재질을 입력해 주세요." name="material_detail">
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
                <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" type="button">간편입력</button>
                <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" type="button" onclick="deleteClassTd('measurement-table', 'measurement-checkbox')">선택삭제</button>
                <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" type="button" onclick="addClassTd('measurement-table', 'measurement-tbody')">추가</button>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                    <table class="table mb-0" id="measurement-table">
                        <thead>
                            <tr class="tr_bgc">
                                <td>#</td>
                                <td>번호</td>
                                <td>소장구분</td>
                                <td>실측부위</td>
                                <td>실측치</td>
                                <td>실단위</td>
                            </tr>
                        </thead>
                        <tbody id="measurement-tbody">
                            <tr>
                              <td></td>
                                <th scope="row">1</th>
                                <td>
                                  <input class="form-control st_input" list="datalistOptions" id="measurement_item_type0" placeholder="소장구분을 입력해 주세요." name="measurement_item_type">
                                </td>
                                <td>
                                  <select class="form-select st_select" id="measurement_code_idx0" name="measurement_code_idx">
                                    <option value="" selected>선택</option>
                                    	<c:forEach var="list" items="${measurementList}" varStatus="status">
		                                    <option value="${list.measurement_code_idx}">${list.measurement_nm}</option>
		                                </c:forEach>
                                  </select>
                                </td>
                                <td>
                                  <input class="form-control st_input" list="datalistOptions" id="measurement_value0" placeholder="실측치를 입력해 주세요." name="measurement_value">
                                <td>
                                  <select class="form-select st_select" id="measurement_unit_code_idx0" name="measurement_unit_code_idx">
                                    <option value="" selected>선택</option>
                                   	 	<c:forEach var="list" items="${measurementUnitList}" varStatus="status">
		                                    <option value="${list.measurement_unit_code_idx}">${list.measurement_unit_nm}</option>
		                                </c:forEach>
                                  </select>
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
                            <td>
                              입수일자
                              <td>
                                <input class="form-control in_date" type="date" id="obt_obtainment_date" name="obt_obtainment_date">
                              </td>
                              <td>
                                입수연유
                              <td>
                                <select class="form-select st_select" id="obt_obtainment_code_idx" name="obt_obtainment_code_idx">
                                  <option value="" selected>선택</option>
                                  		<c:forEach var="list" items="${obtainmentList}" varStatus="status">
		                                    <option value="${list.obtainment_code_idx}">${list.obtainment_nm}</option>
		                                </c:forEach>
                                </select>
                              </td>
                          </tr>
                          <!-- 2  -->
                          <tr>
                            <td>
                              구입구분1
                              <td>
                                <select class="form-select st_select" id="obt_purchase1_code_idx" name="obt_purchase1_code_idx">
                                  <option value="" selected>선택</option>
                                  		<c:forEach var="list" items="${purchase1List}" varStatus="status">
		                                    <option value="${list.purchase1_code_idx}">${list.purchase1_nm}</option>
		                                </c:forEach>
                                </select>
                              </td>
                              <td>
                                구입구분2
                              <td>
                                <select class="form-select st_select" id="obt_purchase2_code_idx" name="obt_purchase2_code_idx">
                                  <option value="" selected>선택</option>
                                 		 <c:forEach var="list" items="${purchase2List}" varStatus="status">
		                                    <option value="${list.purchase2_code_idx}">${list.purchase2_nm}</option>
		                                </c:forEach>
                                </select>
                              </td>
                          </tr>
                          <!-- 3 -->
                          <tr>
                            <td>
                              가격
                              <td>
                                <input class="form-control st_input pri" list="datalistOptions" id="obt_obtainment_price" placeholder="가격을 입력해 주세요." name="obt_obtainment_price">
                                <select class="form-select st_select pri" name="obt_price_unit_code_idx" id="obt_price_unit_code_idx">
                                  <option value="" selected>선택</option>
                                  		<c:forEach var="list" items="${priceUnitList}" varStatus="status">
		                                    <option value="${list.price_unit_code_idx}">${list.price_unit_nm}</option>
		                                </c:forEach>
                                </select>
                              </td>
                              <td>
                                원화환산
                                <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2">환률정보</button>
                              </td>
                              <td>
                                <input class="form-control st_input" list="datalistOptions" id="obt_won_exchange" placeholder="원화환산 입력에 관하여 환률정보 클릭 시 도움을 받을 수 있습니다." name="obt_won_exchange">
                              </td>
                          </tr>
                          <!-- 4 -->
                          <tr>
                            <td>
                              일괄구입번호
                              <td>
                                <input class="form-control st_input" list="datalistOptions" id="obt_obtainment_no" placeholder="일괄구입번호를 입력해 주세요." name="obt_obtainment_no">
                              </td>
                              <td>
                                입수처
                              </td>
                              <td>
                                <input class="form-control st_input" list="datalistOptions" id="obt_obtainment_place" placeholder="입수처를 입력해 주세요." name="obt_obtainment_place">
                              </td>
                          </tr>
                          <!-- 5 -->
                          <tr>
                            <td>
                              입수주소
                            </td>
                              <td>
                                <input class="form-control st_input" list="datalistOptions" id="obt_obtainment_addr" placeholder="입수주소를 입력해 주세요." name="obt_obtainment_addr">
                              </td>
                              <td>
                                입수 내용
                              </td>
                              <td>
                                <input class="form-control st_input" list="datalistOptions" id="obt_obtainment_detail" placeholder="연락처 외 기본사항을 입력 할 수 있습니다." name="obt_obtainment_detail">
                              </td>
                          </tr>
                          <!-- 6 -->
                          <tr>
                            <td>
                              등록일자
                            </td>
                              <td>
                                <input class="form-control in_date" type="date" id="obt_record_date" name="obt_record_date">
                              </td>
                              <td>
                                문화재 지정
                                <input type="checkbox" name="" id="">
                              </td>
                              <td>
                                <input class="form-control st_input" list="datalistOptions" id="obt_designation" placeholder="문화재 지정 내용을 입력해 주세요." name="obt_designation">
                              </td>
                          </tr>
                          <!-- 7 -->
                          <tr>
                            <td>
                              문화재 환수
                              <input type="checkbox" name="" id="">
                            </td>
                              <td>
                                <input class="form-control st_input" list="datalistOptions" id="obt_redemption" placeholder="환수 경로를 입력해 주세요." name="obt_redemption">
                              </td>
                              <td>
                                문화재 환수 국적
                              </td>
                              <td>
                                <select class="form-select st_select" name="obt_country_code_idx" id="obt_country_code_idx">
                                  <option value="" selected>선택</option>
                                  		<c:forEach var="list" items="${countryList}" varStatus="status">
		                                    <option value="${list.country_code_idx}">${list.country_nm}</option>
		                                </c:forEach>
                                </select>
                              </td>
                          </tr>
                          <!-- 8 -->
                          <tr>
                            <td>
                              문화재 환수 수량
                            </td>
                              <td>
                                <input class="form-control st_input pri" list="datalistOptions" id="obt_qty" placeholder="환수 경로를 입력해 주세요." name="obt_qty">
                                <select class="form-select st_select pri" id="obt_qty_unit_code_idx" name="obt_qty_unit_code_idx">
                                  <option value="" selected>문화재 환수 단위</option>
                                  		<c:forEach var="list" items="${qtyUnitList}" varStatus="status">
		                                    <option value="${list.qty_unit_code_idx}">${list.qty_unit_nm}</option>
		                                </c:forEach>
                                </select>
                              </td>
                              <td>
                                문화재 환수 연도
                              </td>
                              <td>
                                <input class="form-control st_input" list="datalistOptions" id="obt_redemption_date" placeholder="문화재 환수 연도를 입력해 주세요." name="obt_redemption_date">
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
              <input type="text" class="st_inp_tbox" placeholder="특징에 관하여 입력해 주세요." id="feature" name="feature">
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
                                <select class="form-select st_select"  id="condition_code_idx" name="condition_code_idx">
                                  <option value="" selected>선택</option>
                                  		<c:forEach var="list" items="${conditionList}" varStatus="status">
		                                    <option value="${list.condition_code_idx}">${list.condition_nm}</option>
		                                </c:forEach>
                                </select>
                              </td>
                              <td>
                                전시순위
                              <td>
                                <select class="form-select st_select" id="ranking_code_idx" name="ranking_code_idx">
                                  <option value="" selected>선택</option>
                                  		<c:forEach var="list" items="${rankingList}" varStatus="status">
		                                    <option value="${list.ranking_code_idx}">${list.ranking_nm}</option>
		                                </c:forEach>
                                </select>
                              </td>
                          </tr>
                      </tbody>
                  </table>
              </div>
          </div>
          
          <input type="hidden" id="gameToken" name="reg_user" value="jinhyun">
          <input type="hidden" id="gameToken" name="reg_state" value="N">
        </div>
          <!-- 기본사항 - 자료상태 및 전시순위 끝 -->
          <!--  -->
          <!-- 기본사항 - 관련자료 시작 -->
          <div class="mb-0">
            <div class="st_wrap">
              <label class="col-md-2 col-form-label st_title">관련자료</label>
              <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" type="button" onclick="deleteClassTd('possession-table', 'possession-checkbox')">선택삭제</button>
              <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" type="button" onclick="addClassTd('possession-table', 'possession-tbody')">추가</button>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                  <table class="table mb-0" id="possession-table">
                      <thead>
                          <tr class="tr_bgc">
                              <td>#</td>
                              <td>번호</td>
                              <td>자료구분</td>
                              <td>자료번호</td>
                              <td>비고</td>
                          </tr>
                      </thead>
                      <tbody id="possession-tbody">
                          <tr>
                          	<input type="hidden" name="invol_org_code_idx" id="invol_org_code_idx">
                            <td></td>
                              <th scope="row">1</th>
                              <td>
                                <select class="form-select st_select" id="invol_possession_code_idx" name="invol_possession_code_idx">
                                  <option value="" selected>선택</option>
                                  		<c:forEach var="list" items="${posSessionList}" varStatus="status">
		                                    <option value="${list.possession_code_idx}">${list.possession_nm}</option>
		                                </c:forEach>
                                </select>
                              </td>
                              <td>
                                <input class="form-control st_input" list="datalistOptions" id="invol_item_no" placeholder="자료번호를 입력해 주세요." name="invol_item_no">
                              </td>
                              <td>
                                <input class="form-control st_input" list="datalistOptions" id="invol_remark" placeholder="참고사항을 입력해 주세요." name="invol_remark">
                              </td>
                          </tr>
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
            <button type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" onclick="deleteClassTd('insurance-table', 'insurance-checkbox')">선택삭제</button>
            <button type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" onclick="addClassTd('insurance-table', 'insurance-tbody')">추가</button>
          </div>
          <div class="card-body">
            <div class="table-responsive">
                <table class="table mb-0" id="insurance-table">
                    <thead>
                        <tr class="tr_bgc">
                            <td>#</td>
                            <td>번호</td>
                            <td>평가액</td>
                            <td>가격단위</td>
                            <td>대여기간</td>
                            <td>대여기관</td>
                            <td>비고</td>
                        </tr>
                    </thead>
                    <tbody id="insurance-tbody">
                        <tr>
                          <td></td>
                            <th scope="row">1</th>
                            <td>
                              <input class="form-control st_input" list="datalistOptions" id="insu_agreed_value" placeholder="평가액을 입력해 주세요." name="insu_agreed_value">

                            </td>
                            <td>
                              <select class="form-select st_select" name="insu_price_unit_code_idx" id="insu_price_unit_code_idx">
                                <option value="" selected>선택</option>
                                		<c:forEach var="list" items="${priceUnitList}" varStatus="status">
		                                    <option value="${list.price_unit_code_idx}">${list.price_unit_nm}</option>
		                                </c:forEach>
                              </select>
                            </td>
                            <td>
                              <!-- 대여기간 캘린더 폼 -->
                              <input class="form-control" type="date" id="insu_start_date" name="insu_start_date"> ~ <input class="form-control" type="date" id="insu_end_date" name="insu_end_date">
                            </td>
                            <td>
                              <input class="form-control st_input" list="datalistOptions" id="insu_rental_org" placeholder="대여기관을 입력해 주세요." name="insu_rental_org">
                            </td>
                            <td>
                              <input class="form-control st_input" list="datalistOptions" id="insu_remark" placeholder="참고사항을 입력해 주세요." name="insu_remark">
                            </td>
                        </tr>
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
            <input type="text" class="st_inp_tbox" placeholder="참고사항을 입력해 주세요." id="remark" name="remark">
        </div>
        <!-- 기본사항 - 비고 끝 -->
        <!--  -->
        <!-- 기본사항 - 저작권 시작 -->
        <div class="mb-0">
          <div class="st_wrap">
            <label class="col-md-2 col-form-label st_title">저작권</label>
            <button type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" onclick="deleteClassTd('copyright-table', 'copyright-checkbox')">선택삭제</button>
            <button type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" onclick="addClassTd('copyright-table', 'copyright-tbody')">추가</button>
          </div>
          <div class="card-body">
            <div class="table-responsive">
                <table class="table mb-0" id="copyright-table">
                    <thead>
                        <tr class="tr_bgc">
                            <td>#</td>
                            <td>번호</td>
                            <td>저작권</td>
                            <td>저작권 소유자</td>
                            <td>저작권만료일자</td>
                            <td>이용허락 여부</td>
                            <td>저작권 양도 여부</td>
                            <td>비고</td>
                        </tr>
                    </thead>
                    <tbody id="copyright-tbody">
                        <tr>
                          <td></td>
                            <th scope="row">1</th>
                            <td>
                              <select class="form-select st_select" id="copy_copyright" name="copy_copyright">
                                <option value="" selected>선택</option>
                                <option value="Y">예</option>
                                <option value="N">아니요</option>
                              </select>
                            </td>
                            <td>
                              <input class="form-control st_input" list="datalistOptions" id="copy_owner" placeholder="" name="copy_owner">
                            </td>
                            <td>
                              <!-- 대여기간 캘린더 폼 -->
                              <input class="form-control" type="date" id="copy_expiry_date" name="copy_expiry_date">
                            </td>
                            <td>
                              <select class="form-select st_select" id="copy_usage_permission" name="copy_usage_permission">
                                <option value="" selected>선택</option>
                                <option value="Y">예</option>
                                <option value="N">아니요</option>
                              </select>
                            </td>
                            <td>
                              <select class="form-select st_select" id="copy_copyright_transfer" name="copy_copyright_transfer">
                                <option value="" selected>선택</option>
                                <option value="Y">예</option>
                                <option value="N">아니요</option>
                              </select>
                            </td>
                            <td>
                              <input class="form-control st_input" list="datalistOptions" id="copy_remark" placeholder="참고사항을 입력해 주세요." name="copy_remark">
                            </td>
                        </tr>
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
            <select class="form-select st_select ser_sel" id="public_service" name="public_service">
              <option value="" selected>선택</option>
              <option value="Y">사용</option>
              <option value="N">비사용</option>
            </select>
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
                        <tr>
                            <td>
                              <input class="form-control st_input" list="datalistOptions" id="reason" placeholder="서비스 불가 사유를 입력해 주세요." name="reason">
                            </td>
                            <td>
                              <select class="form-select st_select" id="ggnuri_code_idx" name="ggnuri_code_idx">
                                <option value="" selected>선택</option>
                                		<c:forEach var="list" items="${ggnuriList}" varStatus="status">
		                                    <option value="${list.ggnuri_code_idx}">${list.ggnuri_nm}</option>
		                                </c:forEach>
                              </select>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
      </div>
        <!-- 기본사항 - 대국민 서비스 끝 -->

        <!--  -->
        <!-- 기본사항 - 자료정보변경이력 시작 -->
        <div class="mb-0">
          <div class="st_wrap">
            <label class="col-md-2 col-form-label st_title">자료정보변경이력</label>
          </div>
          <div class="card-body">
            <div class="table-responsive">
                <table class="table mb-0">
                    <thead>
                        <tr class="tr_bgc">
                            <th>번호</th>
                            <th>기록자</th>
                            <th>변경일</th>
                            <th>변경항목</th>
                            <th>변경내용</th>
                            <th>비고</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>
                             -
                            </td>
                            <td>
                              -
                             </td>
                             <td>
                              -
                             </td>
                             <td>
                              -
                             </td>
                             <td>
                              -
                             </td>
                        </tr>
                    </tbody>
                </table>
            </div>
           
        </div>
      </div>
      <!--  -->
      <div class="mb-0">
        <div class="st_wrap">
          <label class="col-md-2 col-form-label st_title">키워드</label>
        </div>
          <input type="text" class="st_inp_tbox" placeholder="키워드를 입력해 주세요. 콤마 단위로 입력해주세요." id="keyword" name="keyword">
      </div>
      </form>
      <div class="mb-0">
        <div class="st_wrap">
        	<button type="button" class="submit_btn" onclick="submitForm()">저장하기</button>
        </div>
       </div>
      </div>
             <!-- End Page-content -->
        <!-- End Page-content -->
            <!-- form 끝 -->
            
         <!-- 기본사항 - 자료정보변경이력 끝 -->
        <!--  -->
        <!--  -->
            <!--  -->
            <!-- 기본사항 끝 -->
            <!--  -->
            <!-- 이동 사항 -->
            <div class="tab-pane" id="profile" role="tabpanel">
              <div class="mb-0">
                <!-- 엑셀 모달 -->
                <div id="myModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
                  <div class="modal-dialog">
                      <div class="modal-content">
                          <div class="modal-header mv-modal-header">
                              <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <div class="modal-body mv-modal-body">
                              <!-- 엑셀 모달 내용 -->
                              <div class="mb-0 move-wrap">
                                <div class="st_wrap">
                                  <label class="col-md-2 col-form-label st_title">이동사항 등록 및 수정</label>
                                </div>
                                <div class="card-body">
                                  <div class="table-responsive">
                                      <form id="addMovement">
                                      <table class="table mb-0">
                                          <tbody>
                                              <tr>
                                                <td>이동일자</td>
                                                  <td>
                                                   	<input class="form-control st_input" type="date" name="movement_date">
                                                  </td>
                                              </tr>
                                              <tr>
                                                <td>보관구분</td>
                                                  <td>
                                                    <select class="form-select st_select" name="storage_type1_code_idx" id="storage_type1_code_idx" onchange="change_storageType2(this.value)">
                                                    <option selected value="">선택</option>
                                                    <c:forEach var="list" items="${storage1List}" varStatus="status">
					                                    <option value="${list.storage_type1_code_idx}">${list.storage_type1_nm}</option>
					                                </c:forEach>
                                                  </td>
                                                  <td>
                                                    <select class="form-select st_select" name="storage_type2_code_idx" id="storage_type2_code_idx">
                                                    <option selected value="0">선택</option>
                                                    </select>
                                                  </td>
                                              </tr>
                                              <tr id="movement-in-tr">
                                                <td>보관처</td> 
                                                <td>
                                                  <select class="form-select st_select" name="storage1_code_idx" id="storage1_code1" onchange="change_storage1(this.value, 1)">
                                                    <option selected value="null">선택</option>
                                                    <c:forEach var="list" items="${storageCodeList}" varStatus="status">
					                                    <option value="${list.storage_code_idx}">${list.storage_nm}</option>
					                                </c:forEach>
                                                  </select>
                                                </td>
                                              </tr>
                                              <tr id="movement-out-tr">
                                                <td>반입처</td>
                                                <td>
                                                  <select class="form-select st_select" name="storage2_code_idx" id="storage2_code1" onchange="change_storage2(this.value, 1)">
                                                    <option value="null">선택</option>
                                                    <c:forEach var="list" items="${storageCodeList}" varStatus="status">
					                                    <option value="${list.storage_code_idx}">${list.storage_nm}</option>
					                                </c:forEach>
                                                  </select>
                                                </td>
                                              </tr>
                                              <tr>
                                                <td>이동수량</td>
                                                <td>
                                                 	<input class="form-control st_input" type="text" name="movement_qty">
                                                </td>
                                                <td>현수량</td>
                                                <td>
                                                  <input class="form-control st_input" type="text" name="current_qty">
                                                </td>
                                              </tr>
                                              <tr>
                                                <td>격납요청자</td>
                                                <td>
                                                  <input class="form-control st_input" type="text" name="requester">
                                                </td>
                                              </tr>
                                              <tr>
                                                <td>비고</td>
                                                <td>
                                                  <input class="form-control st_input" type="text" name="remark">
                                                </td>
                                              </tr>
                                              <!-- <input class="form-control st_input" type="hidden" name="item_idx" id="move_item_idx"  value=""> -->
                                          </tbody>
                                      </table>
                                      </form>
                                      <button id="add-movement-btn" class="btn btn-secondary btn_save" onClick="submitAddMovement();">저장</button>
                                      <button id="modify-movement-btn2" class="btn btn-secondary btn_save">수정</button>
                                  </div>
                              </div>
                            </div>
                            <!--  -->
                            <div class="mb-0 move-wrap">
                              <div class="st_wrap">
                                <label class="col-md-2 col-form-label st_title">과거 이동처 코드</label>
                              </div>
                              <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table mb-0">
                                        <thead>
                                            <tr class="tr_bgc">
                                                <th>번호</th>
                                                <th>과거이동처</th>
                                                <th>현수량</th>
                                                <th>입력값선택</th>
                                            </tr>
                                        </thead>
                                        <tbody id="past-movement-tbody">
                                        
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                          </div>
                          </div>
                      </div>
                  </div>
              </div>
                <!-- 이동사항 -->
                <div class="st_wrap st_mv_wrap">
                  <div class="st_title_wrap">
                    <label class="col-md-2 col-form-label st_title">이동사항 내역</label>
                    <label class="col-md-2 col-form-label st_sub_title">| 수주량 : 0</label>
                  </div>
                  <div class="move_btn">
                    <button type="button" class="btn btn-primary waves-effect waves-light btn_ml btn_wh btn_ex">엑셀파일</button>
                    <button class="btn btn-secondary waves-effect waves-light btn_ml" data-bs-toggle="modal" data-bs-target="#myModal" onclick="btn_control(0)">이동사항 등록</button>
                  </div>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                      <table class="table mb-0">
                          <thead>
                              <tr class="tr_bgc">
                                  <th>번호</th>
                                  <th>이동일자</th>
                                  <th>보관구분</th>
                                  <th>보관처</th>
                                  <th>반입처</th>
                                  <th>이동수량</th>
                                  <th>현수량</th>
                                  <th>비고</th>
                                  <th>격납요청자</th>
                                  <th>수정</th>
                                  <th>삭제</th>
                              </tr>
                          </thead>
                          <tbody id="movement-tbody">
                          <tr id="default-movement">
                          	<td>이동사항을 입력해주세요.</td>
                          </tr>
                          </tbody>
                      </table>
                  </div>
              </div>
            </div>
            </div>
            
            <!-- 이미지정보 -->
            <div class="tab-pane" id="messages" role="tabpanel">
                <div class="mb-0">
                  <!--  -->
                  <div class="st_wrap st_mv_wrap">
                  
                
                <!-- <button type="button" onclick="addTo('dext5');">추가</button>
  				<button type="button" data-bs-toggle="modal" data-bs-target=".imageUploadModal">업로드</button> -->
  				
  			<div class="modal fade imageUploadModal" tabindex="-1" aria-labelledby="myExtraLargeModalLabel" style="display: none;" aria-hidden="true">
                        <div class="modal-dialog modal-xl">
                          <div class="modal-content pro-modal-content">
                            <div class="modal-header mv-modal-header">
                                <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body mv-modal-body">
                                <!-- 엑셀 모달 내용 -->
                                  
									  <label for="result-uploadFile" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2">업로드</label>
										<input style="display:none" class="form-control st_input" type="file" name="result_uploadFile" id="result-uploadFile" onchange="resultImg(this, 0)" accept="image/*">
                                <%-- <div class="mb-0 move-wrap pro-wrap">
                                  <div id="dext5-container" style="width:500px; height:300px;">
                                  <!-- 버튼은 여기 -->
                                  <form action="..." method="post" enctype="multipart/form-data">
									  <input type="text" name="name" value="DEXTUploadNJ"/>
									</form>
                                  	<button type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" onclick="addTo('dext5');">파일추가</button>
                                  </div>
                              	</div> --%>
                            </div>
  									<button type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" onclick="uploadFrom('dext5')">저장</button>
                        </div>
                        </div>
                    </div>

                    <ul class="nav nav-pills mb-3 img-nav img-nav-item" id="pills-tab" role="tablist">
                      <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">이미지</button>
                      </li>
                      <li class="nav-item" role="presentation">
                        <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">리스트</button>
                      </li>
                    </ul>
                    <!--  -->
                    <div class="img-btn">
                      리스트 출력 갯수 :
                        <select class="form-select st_select img-select">
                          <option disabled selected>선택</option>
                          <option>더미1</option>
                          <option>더미2</option>
                          <option>더미3</option>
                        </select>
                        <!-- 
	                     <label for="image-upload-file" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2">업로드</label> -->
<!--                     <input style="display:none" id="image-upload-file" name="image_upload_file" class="form-control st_input" type="file" accept="image/*" onchange="change_img_info(this)" multiple> -->
                         <button type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" onclick="downloadImageChecked()">다운로드</button>
                         <button type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" onclick="imageAllCheck()">전체선택</button>
                         <button type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" onclick="imageCancelCheck()">선택해지</button>
                         <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" onclick="deleteImageChecked()">선택삭제</button>
                         <button>엑셀파일</button>
                           <div id="dext5-container" style="width:500px; height:300px;"><!-- 컴포넌트를 담는 컨테이너 요소 --></div>
                         <button id="btn-add-files" type="button">추가</button>
                    <button id="btn-upload-auto" type="button">업로드</button>
                    </div>
                  </div>
                  <!--  -->
                  <div class="tab-content" id="pills-tabContent">
                    <!--  -->
                    <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                      <div class="container text-center">
                          <div id="img-info-preview" class="row row-cols-auto img-row">
                            <div class="col img-col">
                        <!-- 이미지 설명 등록모달  -->
                              <div class="modal fade bs-example-modal-xll" tabindex="-1" aria-labelledby="myExtraLargeModalLabel" style="display: none;" aria-hidden="true">
                                <div class="modal-dialog modal-xl">
                                  <div class="modal-content pro-modal-content">
                                    <div class="modal-header mv-modal-header">
                                        <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body mv-modal-body">
                                        <!-- 이미지 설명 모달 내용 -->
                                        <div class="mb-0 move-wrap pro-wrap">
                                          <div class="st_wrap">
                                            <label class="col-md-2 col-form-label st_title">이미지 설명 등록 및 수정</label>
                                          </div>
                                          <div class="card-body">
                                            <input type="text">
                                        </div>
                                      </div>
                                      <button class="btn btn-secondary btn_save">저장</button>
                                    </div>
                                </div>
                                </div>
                              </div>
                              <!--  -->
                              <!-- <div class="img-col-header">
                                <input type="checkbox" name="" id="">
                                app000002-00000-0001.jpg
                              </div>
                              <div class="img-col-img-wrap">
                                <a href="#">
                                  <div class="img-hover-info">
                                    <h4>이미지 설명</h4>
                                    <p>설명없음</p>
                                  </div>
                                  <img src="" alt="이미지">
                                </a>
                              </div>
                                <div class="img-col-info">
                                  <dl>
                                    <dt>명칭:</dt>
                                    <dd>명칭이 자동으로 입력 됩니다.</dd>
                                  </dl>
                                  <dl>
                                    <dt>시간:</dt>
                                    <dd>220000-00:00:00</dd>
                                  </dl>
                                  <dl>
                                    <dt>사이즈:</dt>
                                    <dd>7952×5304</dd>
                                  </dl>
                                  <dl>
                                    <dt>태그:</dt>
                                    <dd><button class="img-tag"><a href="#">태그</a></button></dd>
                                  </dl>
                                  <dl>
                                    <dt><input type="checkbox" name="" id=""></dt>
                                    <dd>대표</dd>
                                    <dt><input type="checkbox" name="" id=""></dt>
                                    <dd>대국민 서비스</dd>
                                  </dl>
                                  <dl><button class="img-info_btn" data-bs-toggle="modal" data-bs-target=".bs-example-modal-xll">설명등록</button><button class="img-info_btn">원문보기</button></dl>
                                </div> --> 
                                
                            </div>
                            <!--  -->
                            
                            
                            <!-- 이미지 정보 끝부분 -->
                          </div>
                      </div>
                    </div>
                    <!--  -->
                    
                    <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                      <table class="table mb-0">
                        <thead>
                            <tr class="tr_bgc">
                                <th>선택</th>
                                <th>번호</th>
                                <th>이미지명</th>
                                <th>파일정보</th>
                                <th>파일경로</th>
                                <th>대표이미지</th>
                                <th>대국민서비스</th>
                                <th>기능</th>
                            </tr>
                        </thead>
                        <tbody id="img-info-list">
                        
                       
                        </tbody>
                    </table>
                    </div>
                  </div>
                </div>
            </div>
            
            
            <!-- 보존처리 -->
            <div class="tab-pane" id="settings" role="tabpanel">
            <div class="mb-0">
		        <div class="st_wrap">
		        	<button type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" onclick="addPreservation()">전체 저장하기</button>
		        </div>
		     </div>
            <form id="preservation-form0" enctype="multipart/form-data">
            <div id="accordion-div">
              <div class="accordion-item" id="preservation-div">
                <h2 class="accordion-header" id="flush-headingOne">
                  <button class="accordion-button fw-medium ac_btn" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="true" aria-controls="flush-collapseOne">
                    버튼으로 수정 예정
                  </button>
                </h2>
                <div id="flush-collapseOne" class="accordion-collapse collapse show" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                  <div class="accordion-body text-muted">
                    <!--  -->
                    <div class="mb-0">
                      <div class="card-body">
                        <div class="table-responsive">
                            <table class="table mb-0">
                                <tbody>
                                    <tr>
                                      <td>처리기관</td>
                                        <td>
                                          <input class="form-control st_input" list="datalistOptions" id="treatment_org0" name="treatment_org" placeholder="처리기관을 입력해 주세요.">
                                        </td>
                                        <td>
                                         처리자
                                        </td>
                                        <td>
                                          <input class="form-control st_input" list="datalistOptions" id="processor0" name="processor" placeholder="처리자 명을 입력해 주세요.">
                                        <td>
                                          처리기간
                                        </td>
                                        <td>
                                          <!-- 대여기간 캘린더 폼 -->
                                          <input class="form-control" type="date" name="start_date" id="start_date0"> ~ <input class="form-control" type="date" name="end_date" id="end_date0">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                  </div>
                    <div class="mb-0">
                      <div class="st_wrap">
                        <label class="col-md-2 col-form-label st_title">처리내용</label>
                      </div>
                        <input type="text" class="st_inp_tbox" name="content" placeholder="처리내용을 입력해 주세요." id="content0">
                    </div>
                    <div class="mb-0">
                      <div class="st_wrap">
                        <label class="col-md-2 col-form-label st_title">비고</label>
                      </div>
                        <input type="text" class="st_inp_tbox" name="remark" placeholder="참고사항을 입력해 주세요." id="remark0">
                    </div>
                    <!--  -->
                  </div>
              <div class="mb-0">
                <div class="st_wrap" id="resut-div">
                  <label class="col-md-2 col-form-label st_title">처리결과</label>
                    <label for="result-uploadFile" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2">업로드</label>
					<input style="display:none" class="form-control st_input" type="file" name="result_uploadFile" id="result-uploadFile" onchange="resultImg(this, 0)" accept="image/*"><br/>
                  <!-- <input type="file" name="uploadFile" onchange="resultImg(this)"><br/> -->
                  <div id="result-img-preview0">
                  
                  </div>
                  <!-- <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2">업로드</button> -->
                </div>
                
                 <!--  <img id="result-img" style="width: 100px; height: 100px;"/> -->
            </div>
            <div class="mb-0" id="before-div">
              <div class="st_wrap">
                <label class="col-md-2 col-form-label st_title" style="display:inline">보존처리 전 이미지</label>
                
                <label for="before-uploadFile" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" style="display:inline">업로드</label>
				<input type="file" name="before_uploadFile" id="before-uploadFile" onchange="beforeImg(this, 0)" multiple style="display:none;" accept="image/*">
                
                <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2">다운로드</button>
                <button type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" onclick="allCheck('before', '0')">전체선택</button>
                <button type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" onclick="cancelCheck('before', '0')">선택해지</button>
                <button type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" onclick="deleteChecked('before', '0')">선택삭제</button>
                
                <div id="before-img-preview0">
                  
                  </div>
              </div>
              <!-- <img id="before-img" style="width: 50px; height: 50px;"/> -->
            </div>
            <div class="mb-0" id="after-div">
              <div class="st_wrap">
                <label class="col-md-2 col-form-label st_title">보존처리 후 이미지</label>
                
                <label for="after-uploadFile" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" style="display:inline">업로드</label>
				<input type="file" name="after_uploadFile" id="after-uploadFile" onchange="afterImg(this, 0)" multiple style="display:none;" accept="image/*">
				
                <button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2">다운로드</button>
                <button type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" onclick="allCheck('after', '0')">전체선택</button>
                <button type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" onclick="cancelCheck('after', '0')">선택해지</button>
                <button type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" onclick="deleteChecked('after', '0')">선택삭제</button>
                
                <div id="after-img-preview0">
                  
                  </div>
              </div>
              </div>
              <!-- <div class="mb-0">
              <div class="st_wrap">
            	<button type="button" class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" onclick="addPreservation()">저장</button>
            	<button class="btn btn-secondary waves-effect waves-light btn_ml btn_m2" onclick="deleteForm(0)">삭제</button>
              </div>
              </div> -->
              </div>
            </div>
            
            <button type="button" class="mb-0" id="add-tab-btn" onclick="cloneDiv()">
              <div class="st_wrap">
                <label class="col-md-2 col-form-label st_title" style="cursor: pointer"> + 보존처리 추가</label>
              </div>
            </button>
            </div>
          </div>
          </form>
            
            <!-- 전문정보 -->
            <div class="tab-pane" id="settings22" role="tabpanel">
                <div class="mb-0">
                  <div class="st_wrap">
                      <label class="col-md-2 col-form-label st_title">전문정보검색</label>
                      <select class="form-select st_select pro_info">
                        <option disabled selected>구분</option>
                        <option>더미1</option>
                        <option>더미2</option>
                        <option>더미3</option>
                      </select>
                      <select class="form-select st_select pro_info">
                        <option disabled selected>제목</option>
                        <option>더미1</option>
                        <option>더미2</option>
                        <option>더미3</option>
                      </select>
                      <input class="form-control st_input pro_info" list="datalistOptions" id="exampleDataList" placeholder="내용을 입력해 주세요.">
                      <button class="btn btn-secondary waves-effect waves-light btn_ml">조회</button>
                      <button type="button" class="btn btn-primary waves-effect waves-light" data-bs-toggle="modal" data-bs-target=".bs-example-modal-xl" id="spc-add-button">자료등록</button>
                      <!--전문정보 자료등록 버튼 모달창 -->
                      <div class="modal fade bs-example-modal-xl" tabindex="-1" aria-labelledby="myExtraLargeModalLabel" style="display: none;" aria-hidden="true">
                        <div class="modal-dialog modal-xl">
                          <div class="modal-content pro-modal-content">
                            <div class="modal-header mv-modal-header">
                                <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body mv-modal-body">
                                <!-- 엑셀 모달 내용 -->
                                  
                              <form id="speciality-form" enctype="multipart/form-data">
                                <div class="mb-0 move-wrap pro-wrap">
                                  <div class="st_wrap">
                                    <label class="col-md-2 col-form-label st_title">전문정보 등록 및 수정</label>
                                  </div>
                                  <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table mb-0">
                                            <tbody>
                                                <tr>
                                                  <td>제목</td>
                                                    <td>
                                                      <select class="form-select st_select" name="speciality_code_idx">
                                                        <option selected value="0">선택</option>
                                                        <c:forEach var="list" items="${specialityCodeList}" varStatus="status">
									                           <option value="${list.speciality_code_idx}">${list.speciality_nm}</option>
									                     </c:forEach>
                                                      </select>
                                                    </td>
                                                    <td>
                                                      <input class="form-control st_input" type="text" name="spc_title">
                                                    </td>
                                                </tr>
                                                <tr>
                                                  <td>첨부파일</td>
                                                    <td>
                                                    <input class="form-control st_input" type="text" id="fileNameInput" disabled>
                                                    	<!-- <span id="filebox-in" style="display:inline-block; font-size: 12px;">
                                                    	<label for="spc_uploadFile" class="btn btn-secondary waves-effect waves-light" style="float:right">
                                                    	</span> -->
	                                                    <!-- <label class="btn btn-secondary waves-effect waves-light" for="spc_uploadFile">업로드</label>
                                                      	<input style="display:none" class="form-control st_input" type="file" name="spc_uploadFile" id="spc_uploadFile" multiple="true"> -->
                                                    </td>
                                                    <td>
                                                    	<div class="filebox" style="float:left;">
                                                    		<label for="spc_uploadFile" class="btn btn-secondary waves-effect waves-light" style="float:right">
															  업로드
															</label>
															<input style="display:none" class="form-control st_input" type="file" name="spc_uploadFile" id="spc_uploadFile" multiple="true" onchange="speciality_file_change()">
														</div>
                                                    </td>
                                                      <!-- <button class="btn btn-secondary waves-effect waves-light">파일 업로드</button> -->
                                                    
                                                </tr>
                                                <tr>
                                                  <td>저작권자</td>
                                                  <td>
                                                    <input class="form-control st_input" type="text" name="spc_copyright" >
                                                  </td>
                                                </tr>
                                                <tr>
                                                  <td>내용</td>
                                                  <td>
                                                    <input class="form-control st_input" type="text" name="spc_content">
                                                  </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <button type="button" class="btn btn-secondary btn_save" id="spc-add-btn" onclick="submitSpc()">저장</button>
                                        <button type="button" class="btn btn-secondary btn_save" id="spc-update-btn" onclick="updateSpeciality()">수정</button>
                                    </div>
                                </div>
                              </div>
                                        </form>
                            </div>
                        </div>
                        </div>
                    </div>
                  </div>
                  <div class="card-body">
                    <div class="table-responsive">
                        <table class="table mb-0">
                            <thead>
                                <tr class="tr_bgc">
                                    <th>번호</th>
                                    <th>작성자</th>
                                    <th>일자</th>
                                    <th>구분</th>
                                    <th>제목</th>
                                    <th>첨부파일</th>
                                    <th>저작권자</th>
                                    <th>수정</th>
                                    <th>삭제</th>
                                </tr>
                            </thead>
                            <tbody id="speciality-tbody">
                            
                            </tbody>
                        </table>
                    </div>
                </div>
              </div>
          </div>
        </div>
          <!--  -->

        </div>
        

        <footer class="footer">
          <div class="container-fluid">
            <div class="row">
              <div class="col-sm-12">
                <script>
                  document.write(new Date().getFullYear())
                </script>
                &copy; Borex. Design & Develop by Themesbrand
              </div>
            </div>
          </div>
        </footer>
      </div>
      <!-- end main content-->
    </div>
    <!-- END layout-wrapper -->

    <!-- Right Sidebar -->
    <div class="right-bar">
      <div data-simplebar class="h-100">
        <div class="rightbar-title d-flex align-items-center bg-dark p-3">
          <h5 class="m-0 me-2 text-white">Theme Customizer</h5>

          <a href="javascript:void(0);" class="right-bar-toggle-close ms-auto">
            <i class="mdi mdi-close noti-icon"></i>
          </a>
        </div>

        <!-- Settings -->
        <hr class="m-0" />

        <div class="p-4">
          <h6 class="mb-3">Layout</h6>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="layout" id="layout-vertical" value="vertical" />
            <label class="form-check-label" for="layout-vertical">Vertical</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="layout" id="layout-horizontal" value="horizontal" />
            <label class="form-check-label" for="layout-horizontal">Horizontal</label>
          </div>

          <h6 class="mt-4 mb-3">Layout Mode</h6>

          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="layout-mode" id="layout-mode-light" value="light" />
            <label class="form-check-label" for="layout-mode-light">Light</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="layout-mode" id="layout-mode-dark" value="dark" />
            <label class="form-check-label" for="layout-mode-dark">Dark</label>
          </div>

          <h6 class="mt-4 mb-3">Layout Width</h6>

          <div class="form-check form-check-inline">
            <input
              class="form-check-input"
              type="radio"
              name="layout-width"
              id="layout-width-fluid"
              value="fluid"
              onchange="document.body.setAttribute('data-layout-size', 'fluid')"
            />
            <label class="form-check-label" for="layout-width-fluid">Fluid</label>
          </div>
          <div class="form-check form-check-inline">
            <input
              class="form-check-input"
              type="radio"
              name="layout-width"
              id="layout-width-boxed"
              value="boxed"
              onchange="document.body.setAttribute('data-layout-size', 'boxed')"
            />
            <label class="form-check-label" for="layout-width-boxed">Boxed</label>
          </div>

          <h6 class="mt-4 mb-3">Layout Position</h6>

          <div class="form-check form-check-inline">
            <input
              class="form-check-input"
              type="radio"
              name="layout-position"
              id="layout-position-fixed"
              value="fixed"
              onchange="document.body.setAttribute('data-layout-scrollable', 'false')"
            />
            <label class="form-check-label" for="layout-position-fixed">Fixed</label>
          </div>
          <div class="form-check form-check-inline">
            <input
              class="form-check-input"
              type="radio"
              name="layout-position"
              id="layout-position-scrollable"
              value="scrollable"
              onchange="document.body.setAttribute('data-layout-scrollable', 'true')"
            />
            <label class="form-check-label" for="layout-position-scrollable">Scrollable</label>
          </div>

          <h6 class="mt-4 mb-3">Topbar Color</h6>

          <div class="form-check form-check-inline">
            <input
              class="form-check-input"
              type="radio"
              name="topbar-color"
              id="topbar-color-light"
              value="light"
              onchange="document.body.setAttribute('data-topbar', 'light')"
            />
            <label class="form-check-label" for="topbar-color-light">Light</label>
          </div>
          <div class="form-check form-check-inline">
            <input
              class="form-check-input"
              type="radio"
              name="topbar-color"
              id="topbar-color-dark"
              value="dark"
              onchange="document.body.setAttribute('data-topbar', 'dark')"
            />
            <label class="form-check-label" for="topbar-color-dark">Dark</label>
          </div>

          <div id="sidebar-setting">
            <h6 class="mt-4 mb-3 sidebar-setting">Sidebar Size</h6>

            <div class="form-check sidebar-setting">
              <input
                class="form-check-input"
                type="radio"
                name="sidebar-size"
                id="sidebar-size-default"
                value="default"
                onchange="document.body.setAttribute('data-sidebar-size', 'lg')"
              />
              <label class="form-check-label" for="sidebar-size-default">Default</label>
            </div>
            <div class="form-check sidebar-setting">
              <input
                class="form-check-input"
                type="radio"
                name="sidebar-size"
                id="sidebar-size-compact"
                value="compact"
                onchange="document.body.setAttribute('data-sidebar-size', 'md')"
              />
              <label class="form-check-label" for="sidebar-size-compact">Compact</label>
            </div>
            <div class="form-check sidebar-setting">
              <input
                class="form-check-input"
                type="radio"
                name="sidebar-size"
                id="sidebar-size-small"
                value="small"
                onchange="document.body.setAttribute('data-sidebar-size', 'sm')"
              />
              <label class="form-check-label" for="sidebar-size-small">Small (Icon View)</label>
            </div>

            <h6 class="mt-4 mb-3 sidebar-setting">Sidebar Color</h6>

            <div class="form-check sidebar-setting">
              <input
                class="form-check-input"
                type="radio"
                name="sidebar-color"
                id="sidebar-color-light"
                value="light"
                onchange="document.body.setAttribute('data-sidebar', 'light')"
              />
              <label class="form-check-label" for="sidebar-color-light">Light</label>
            </div>
            <div class="form-check sidebar-setting">
              <input
                class="form-check-input"
                type="radio"
                name="sidebar-color"
                id="sidebar-color-dark"
                value="dark"
                onchange="document.body.setAttribute('data-sidebar', 'dark')"
              />
              <label class="form-check-label" for="sidebar-color-dark">Dark</label>
            </div>
            <div class="form-check sidebar-setting">
              <input
                class="form-check-input"
                type="radio"
                name="sidebar-color"
                id="sidebar-color-brand"
                value="brand"
                onchange="document.body.setAttribute('data-sidebar', 'brand')"
              />
              <label class="form-check-label" for="sidebar-color-brand">Brand</label>
            </div>
          </div>

          <h6 class="mt-4 mb-3">Direction</h6>

          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="layout-direction" id="layout-direction-ltr" value="ltr" />
            <label class="form-check-label" for="layout-direction-ltr">LTR</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="layout-direction" id="layout-direction-rtl" value="rtl" />
            <label class="form-check-label" for="layout-direction-rtl">RTL</label>
          </div>
        </div>
      </div>
      <!-- end slimscroll-menu-->
    </div>
    <!-- /Right-bar -->

    <!-- Right bar overlay-->
    <div class="rightbar-overlay"></div>

    <!-- chat offcanvas -->
    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasActivity" aria-labelledby="offcanvasActivityLabel">
      <div class="offcanvas-header border-bottom">
        <h5 id="offcanvasActivityLabel">Offcanvas right</h5>
        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body">...</div>
    </div>
    <!-- 
    JAVASCRIPT
    <script src="./assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="./assets/libs/metismenujs/metismenujs.min.js"></script>
    <script src="./assets/libs/simplebar/simplebar.min.js"></script>
    <script src="./assets/libs/eva-icons/eva.min.js"></script>
    apexcharts
    <script src="./assets/libs/apexcharts/apexcharts.min.js"></script>
    <script src="./assets/js/pages/dashboard.init.js"></script>
    <script src="./assets/js/app.js"></script>
    
    <script src="./assets/libs/swiper/swiper-bundle.min.js"></script>
    <script src="./assets/js/pages/ecommerce-product-detail.init.js"></script> -->


   <!-- JAVASCRIPT -->
   	<script src="<c:url value='/assets/libs/bootstrap/js/bootstrap.bundle.min.js'/>" defer></script>
    <script src="<c:url value='/assets/libs/metismenujs/metismenujs.min.js'/>" defer></script>
    <script src="<c:url value='/assets/libs/simplebar/simplebar.min.js'/>" defer></script>
    <script src="<c:url value='/assets/libs/eva-icons/eva.min.js'/>" defer></script>
    <script src="<c:url value='/assets/libs/swiper/swiper-bundle.min.js'/>" defer></script>
    <script src="<c:url value='/assets/js/pages/ecommerce-product-detail.init.js'/>" defer></script>
    <script src="<c:url value='/assets/libs/apexcharts/apexcharts.min.js'/>" defer></script>
    <script src="<c:url value='/assets/js/app.js'/>" defer></script>
    <script src="<c:url value='/assets/js/pages/dashboard.init.js'/>" defer></script>
    
   
    
  </body>
</html>