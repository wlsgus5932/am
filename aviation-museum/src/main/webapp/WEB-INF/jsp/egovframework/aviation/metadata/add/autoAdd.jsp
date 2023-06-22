<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>신규자료 자동등록 | 국립항공박물관</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesbrand" name="author" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.ico" />
    <!-- Bootstrap Css -->
    <link href="assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />
    <!--  -->
    <link rel="stylesheet" href="assets/libs/swiper/swiper-bundle.min.css">
    <!-- 커스텀 css -->
    <link href="assets/css/custom.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="assets/css/custom_auto_upload.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.5/xlsx.full.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  </head>
  
  <script>
  
  <!-- 기본사항 업로드-->
  let excelData = [];
  let modifyIdx = '';
  let modifyIdxMv = '';
  
  const uploadMetaDataExcel = () => {
	  $('#excel_tbody').children().remove();
	  let form = $('#uploadMetaDataExcelForm')[0];
	  let frmData = new FormData(form);

	    $.ajax({
	        enctype: 'multipart/form-data',
	        type: 'POST',
	        url: '/uploadMetaDataExcel.do',
	        processData: false,   
	        contentType: false,
	        cache: false,
	        data: frmData,
	        dataType: 'json',
	        success: function(data) {
	            excelData = data.excelList;
	            drawMetadataList();
	            $('#uploadExcel').val("");
	        },
	        error: function(e) {
	            console.log(e);
	            alert('엑셀 업로드 실패');
	        }
	    });
  }
  
  const deleteMetadataTbody = () =>  $('#excel_tbody').children().remove();
  
  const drawMetadataList = () => {
	 	excelData.forEach((e, i) => {
          $('#excel_tbody').append('<tr>' +
                 '<td><input type="checkbox" id="auto_metadata_checkbox" name="auto_metadata_checkbox" value="'+i+'"></td>' +
                  '<td>'+(i+1)+'</td>' +
                  '<td>'+e.possession_nm+'</td>' +
                  '<td>'+e.item_no+'</td>' +
                  '<td>'+e.item_detail_no+'</td>' +
                  '<td>'+e.qty+'</td>' +
                  '<td>'+e.qty_unit_nm+'</td>' +
                  '<td>'+e.item_nm+'</td>' +
                  '<td>'+e.item_se_nm+'</td>' +
                  '<td>'+e.check+'</td>'+
                  '<td><button onclick="clickModify('+i+')">수정</button></td></tr>');
      })
  }
  
  const changeCountry = async (r) => {
	  $('#modal_era_code_idx').children('option:not(:first)').remove();
  	 const res = await fetch('/getEraData.do?country=' + r);

  	  if (res.status === 200) {
  	     const { eraList } = await res.json();
  	     if(eraList.length) {
	  	     eraList.forEach(e => {
	  	    	 $('#modal_era_code_idx').append("<option value="+e.era_code_idx+">"+e.era_nm+"</option>");
	  	     })
  	     } else {
  	    	 $('#modal_era_code_idx').val('0');
  	     }
  	 }
  }
  
  const changeMaterial = async r => {
  	 $('#modal_material2_code_idx').children('option:not(:first)').remove();
  	 const res = await fetch('/getMaterialData.do?material=' + r);

  	 if (res.status === 200) {
  	     const { material2List } = await res.json();
  	     material2List.forEach(e => {
  	    	 $('#modal_material2_code_idx').append("<option value="+e.material2_code_idx+">"+e.material2_nm+"</option>");
  	     })
  	 }
   };
  
  const clickModify = async val => {
	  let fff = false;
	  let mateTF = false;
	  let priceUnitTF = false;
	  modifyIdx = val;
	  
	  $('#modal_item_nm').val(excelData[val].item_nm);
	  $('#modal_item_se_nm').val(excelData[val].item_se_nm);
	  $('#modal_item_no').val(excelData[val].item_no);
	  $('#modal_item_detail_no').val(excelData[val].item_detail_no);
	  $('#modal_qty').val(excelData[val].qty);
	  $('#modal_agreed_value').val(excelData[val].agreed_value);
	  $('#modal_rental_org').val(excelData[val].rental_org);
	  $('#modal_rental_remark').val(excelData[val].rental_remark);
	  $('#modal_data_recorder').val(excelData[val].data_recorder);
	  $('#modal_reg_user').val(excelData[val].reg_user);
	  $('#modal_remark').val(excelData[val].remark);
	  $('#modal_reference').val(excelData[val].reference);
	  $('#modal_insu_start_date').val(excelData[val].start_date);
	  $('#modal_insu_end_date').val(excelData[val].end_date);
	  $('#modal_item_eng_nm').val(excelData[val].item_eng_nm);
	  $('#modal_management_no').val(excelData[val].management_no);
	  
	  let pos = $('#modal_possession_code_idx option:contains(' + excelData[val].possession_nm + ')').val();
	  let qty  = $('#modal_qty_unit_code_idx option:contains(' + excelData[val].qty_unit_nm + ')').val();
	  let country  = $('#modal_country_code_idx option:contains(' + excelData[val].country_nm + ')').val();
	  let mate = $('#modal_material1_code_idx option:contains(' + excelData[val].material1_nm + ')').val();
	  $('#modal_possession_code_idx').val(pos);
	  $('#modal_qty_unit_code_idx').val(qty);
	  $('#modal_country_code_idx').val(country);
	  $('#modal_material1_code_idx').val(mate);
	  await changeCountry(country);
	  await changeMaterial(mate);
	  let era  = $('#modal_era_code_idx option:contains(' + excelData[val].era_nm + ')').val();
	  let mate2  = $('#modal_material2_code_idx option:contains(' + excelData[val].material2_nm + ')').val();
	  let priceUnit  = $('#modal_insu_price_unit_code_idx option:contains(' + excelData[val].price_unit_nm + ')').val();
	  
	  $('#modal_era_code_idx option').each(function() {
		  this.text == excelData[val].era_nm ? fff = true : '';
	   });
	  fff ? $('#modal_era_code_idx').val(era) : $('#modal_era_code_idx').val('0');
	  
	  $('#modal_material2_code_idx option').each(function() {
		  this.text == excelData[val].material2_nm ? mateTF = true : '';
	   });
	  mateTF ? $('#modal_material2_code_idx').val(mate2) : $('#modal_material2_code_idx').val();
	  
	  $('#modal_insu_price_unit_code_idx option').each(function() {
		  this.text == excelData[val].price_unit_nm ? priceUnitTF = true : '';
	   });
	  mateTF ? $('#modal_insu_price_unit_code_idx').val(priceUnit) : $('#modal_insu_price_unit_code_idx').val();
	  
	  $('#data_edit_modal_1').modal('show');
  }
  
  const clickModifySubmit = () => {
	  let x = modifyIdx;
	  
	  excelData[x].item_nm = $('#modal_item_nm').val();
	  excelData[x].item_se_nm = $('#modal_item_se_nm').val();
	  excelData[x].item_no = $('#modal_item_no').val();
	  excelData[x].item_detail_no = $('#modal_item_detail_no').val();
	  excelData[x].agreed_value = $('#modal_agreed_value').val();
	  excelData[x].rental_org = $('#modal_rental_org').val();
	  excelData[x].data_recorder = $('#modal_data_recorder').val();
	  excelData[x].reg_user = $('#modal_reg_user').val();
	  excelData[x].remark = $('#modal_remark').val();
	  excelData[x].reference = $('#modal_reference').val();
	  excelData[x].start_date = $('#modal_insu_start_date').val();
	  excelData[x].end_date = $('#modal_insu_end_date').val();
	  excelData[x].item_eng_nm = $('#modal_item_eng_nm').val();
	  excelData[x].rental_remark = $('#modal_rental_remark').val();
	  excelData[x].management_no = $('#modal_management_no').val();
	  
	  excelData[x].possession_nm = $('#modal_possession_code_idx option:checked').text();
	  excelData[x].qty_unit_nm = $('#modal_qty_unit_code_idx option:checked').text();
	  excelData[x].country_nm = $('#modal_country_code_idx option:checked').text();
	  excelData[x].material1_nm = $('#modal_material1_code_idx option:checked').text();
	  excelData[x].era_nm = $('#modal_era_code_idx option:checked').text();
	  excelData[x].material2_nm = $('#modal_material2_code_idx option:checked').text();
	  excelData[x].price_unit_nm = $('#modal_insu_price_unit_code_idx option:checked').text();
	  
	  $.ajax({
		  contentType: 'application/json; charset=UTF-8',
	        type: 'POST',
	        url: '/duplicateItemNo.do',
	        data: JSON.stringify(excelData[x]),
	        dataType: 'text',
	        async: false,
	        success: function(data) {
	        	console.log(data)
	        	data == 'error' ? 
	        			'' :
	            		excelData[x].check = data;
	        },
	        error: function(e) {
	            console.log(e);
	            alert('엑셀 업로드 실패');
	        }
	    });
	  
	  let select_box = $('#modal_qty_unit_code_idx').val();
	  
	  if(!select_box) {
		  excelData[x].check = '실패';
	  }
	  
	  if(!$('#modal_possession_code_idx').val()) {
		  excelData[x].check = '실패';
	  }
	  
	  if(!$('#modal_qty_unit_code_idx').val()) {
		  excelData[x].check = '실패';
	  }
	  
	  if(!$('#modal_item_no').val()) {
		  excelData[x].check = '실패';
	  }
	  
	  if(!$('#modal_item_detail_no').val()) {
		  excelData[x].check = '실패';
	  }
	  
	  if(!$('#modal_qty').val()) {
		  excelData[x].check = '실패';
	  }
	  
	  deleteMetadataTbody();
	  drawMetadataList();
	  $('#data_edit_modal_1').modal('hide');
  }
  
  const clickSubmitMeta = () => {
	  let child = $('#excel_tbody').children().length;
	  if(child == 0) {
		  alert('엑셀 양식을 업로드 해주세요.');
		  return;
	  }
	  
	  $('#NomalModal').modal('show');
  }
  
  const autoAddMetaData = async () => {
	  let cnt = [];
	  excelData.forEach((e, i) => {
		  if(e.check == '실패' || e.check == '자료번호중복') {
			  cnt.push(i+1);
		    //excelData.splice(i,1);
		  }
	  })
	  console.log(cnt.length);
	  
	  if(cnt.length) {
		  let str = cnt.join(',');
		  alert('업로드에 실패한 데이터가 존재합니다. '+str+'번째 데이터를 확인해주세요.' );
		  $('#NomalModal').modal("hide")
		  return;
	  }
	   $.ajax({
	        type: 'POST',
	        url: '/autoAddMetaData.do',
	        data: JSON.stringify(excelData),
	        dataType: 'text',
	        contentType: 'application/json; charset=UTF-8',
	        success: function(data) {
	        	data == 'success' ? (
	        			alert('등록완료'), 
	        			$('#excel_tbody').children().remove(), 
	        			$('#NomalModal').modal("hide"), 
	        			$('#uploadExcel').val("")
	        			) : alert('오류가 발생했습니다');
	        },
	        error: function(e) {
	            alert('엑셀 업로드에 실패하였습니다 다시 시도해주세요');
	        }
	    });
  }
  
  const delete_auto_metadata = () => {
	  if($('#excel_tbody').children().length == 0) {
		  alert('삭제할 항목이 없습니다.');
		  return;
	  }
	  if(confirm("전체삭제하시겠습니까?")) {
		  $('#excel_tbody').children().remove();
		  excelData = [];
	      drawMetadataList();
	  } else {
		  return;
	  }
  }
  
  const delete_checked_auto_metadata = () => {
	  if($('input:checkbox[id="auto_metadata_checkbox"]:checked').length == 0) {
		  alert('삭제할 항목을 선택해주세요')
		  return
	  }
	  
	  if(confirm('선택하신 항목을 삭제하시겠습니까?')) {
		  let checkArr = [];
		  $('input:checkbox[name="auto_metadata_checkbox"]').each(function() {
			  if($(this).is(":checked")==true) {
			    	checkArr.push($(this).val());
			    }
			});
		  
		  let sum = checkArr.length-1;
		  for(let i=sum; i >= 0; i--) {
			  excelData.splice(i, 1);
		  }
		  deleteMetadataTbody();
		  drawMetadataList();
	  }
  }
  
  <!-- 기본사항 업로드 끝 -->
  
  <!-- 이동사항 업로드 -->
  let movementExcelData = [];
  
  const uploadMovementExcel = () => {
	  $('#excel_movement_tbody').children().remove();
	  let form = $('#uploadMovementExcelForm')[0];
	  let frmData = new FormData(form);

	    $.ajax({
	        enctype: 'multipart/form-data',
	        type: 'POST',
	        url: '/uploadMovementDataExcel.do',
	        processData: false,   
	        contentType: false,
	        cache: false,
	        data: frmData,
	        dataType: 'json',
	        success: function(data) {
	        	movementExcelData = data.excelList;
	        	drawMVList();
	        	$('#uploadExcel2').val("");
	        },
	        error: function(e) {
	            alert('엑셀 업로드가 실패하였습니다. 확인 후 다시 시도해주세요.');
	        }
	    });
  }
  
  const drawMVList = () => {
	  movementExcelData.forEach((e, i) => {
          $('#excel_movement_tbody').append(
	            '<tr>' +
              '<td><input type="checkbox" name="auto_movement_checkbox" id="auto_movement_checkbox" value="'+i+'" /></td>' +
              '<td>'+(i+1)+'</td>' +
              '<td>'+e.movement_date+'</td>' +
              '<td>'+e.storage_type1_nm+'-'+e.storage_type2_nm+'</td>' +
              '<td>'+e.storage_in+'</td>' +
              '<td>'+e.storage_out+'</td>' +
              '<td>'+e.movement_qty+'</td>'+
              '<td>'+e.remark+'</td>' +
              '<td>'+e.requester+'</td>' +
              '<td>'+e.check+'</td>' +
              '<td><button onclick=clickModifyMV('+i+')>수정</button></td>' +
            '</tr>');
	})
  }
  
  const deleteMVTbody = () =>  $('#excel_movement_tbody').children().remove();
  
  const clickModifyMV = async num => {
	  $('#movement-in-tr > td:gt(1)').remove();
	  $('#movement-out-tr > td:gt(1)').remove();
	  modifyIdxMv = num;
	  let type2TF = false;
	  $('input[name=movement_date]').val(movementExcelData[num].movement_date);
	  let type1_code = $('select[name=storage_type1_code_idx] option:contains(' + movementExcelData[num].storage_type1_nm + ')').val();
	  $('select[name=storage_type1_code_idx]').val(type1_code);
	  await change_storageType2(type1_code);
	  let type2_code = $('select[name=storage_type2_code_idx] option:contains(' + movementExcelData[num].storage_type2_nm + ')').val();
	  $('select[name=storage_type2_code_idx] option').each(function() {
		  this.text == movementExcelData[num].storage_type2_nm ? type2TF = true : '';
	   });
	  type2TF ? $('select[name=storage_type2_code_idx]').val(type2_code) : $('select[name=storage_type2_code_idx]').val(0);
	  $('select[name=storage_type1_code_idx]').val(type1_code);
	  $('input[name=movement_qty]').val(movementExcelData[num].movement_qty);
	  $('input[name=requester]').val(movementExcelData[num].requester);
	  $('input[name=remark]').val(movementExcelData[num].remark);
	  
	  await add_storage1(movementExcelData[num].storage_in);
	  await add_storage2(movementExcelData[num].storage_out);
	  
	  $('#myModal').modal('show');
  }
  
  const clickModifySubmitMV = () => {
	  x = modifyIdxMv;
	  let inArr = [];
	  let outArr = [];
	  
	  movementExcelData[x].movement_date = $('input[name=movement_date]').val();
	  movementExcelData[x].storage_type1_nm = $('#storage_type1_code_idx option:checked').text();
	  movementExcelData[x].storage_type2_nm = $('#storage_type2_code_idx option:checked').text();
	  movementExcelData[x].movement_qty = $('input[name=movement_qty]').val();
	  movementExcelData[x].qty = $('input[name=current_qty]').val();
	  movementExcelData[x].requester = $('input[name=requester]').val();
	  movementExcelData[x].remark = $('input[name=remark]').val();
	  
	  let in_cnt = $('#movement-in-tr > td').length-1;
	  let out_cnt = $('#movement-out-tr > td').length-1;
	  
	  movementExcelData[x].storage_in = [];
	  movementExcelData[x].storage_out = [];
	  
	  for(let i=0; i < in_cnt; i++) {
		  let td_text = $('#storage1_code'+(i+1)+' option:checked').text();
		  if(td_text != '선택') {
			  movementExcelData[x].storage_in.push(td_text);
		  }
	  }
	  
	  for(let i=0; i < out_cnt; i++) {
		  let td_text = $('#storage2_code'+(i+1)+' option:checked').text();
		  if(td_text != '선택') {
			  movementExcelData[x].storage_out.push(td_text);
		  }
	  }
	  
	  deleteMVTbody();
	  drawMVList();
	  $('#myModal').modal('hide');
	  
	  
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
  
  const add_storage1 = async item => {
	  let td_length = $('#movement-in-tr > td').length-1;
	  $('#storage1_code1 option:contains(' + item[0] + ')').prop("selected", true);
	  let storage1 = $('#storage1_code1').find(":selected").val();
	  
		  for(let i=1; i<item.length; i++) {
 			  let storage1 = $('#storage1_code'+i).find(":selected").val();
 			  
			  if(storage1 != '선택' && storage1) {
				  const res = await fetch('/getStorageCode.do?storage=' + storage1);
				  const { storageCodeList } = await res.json();
			  
				  if(storageCodeList) {
					  $('#movement-in-tr').append('<td><select class="form-select st_select" name="storage1_code_idx" id="storage1_code'+(i+1)+'" onchange="change_storage1(this.value, '+(i+1)+')"><option selected>선택</option></select></td>');
					  await storageCodeList.forEach(e => {
					   	   	$('#storage1_code'+(i+1)).append("<option value="+e.storage_code_idx+">"+e.storage_nm+"</option>")
					  }); 	
				   } else {
					   $('#storage1_code'+(i+1)).remove();
				   }
 			  $('#storage1_code'+(i+1)+' option:contains(' + item[i] + ')').prop("selected", true);
				let code = $('#storage1_code'+(i+1)+'option:contains(' + item[i] + ')').val();
				code ? $('#storage1_code'+(i+1)).val(code) : '';
			  }
	  		}
  }
  
  const add_storage2 = async item => {
	  console.log(item);
	  let td_length = $('#movement-out-tr > td').length-1;
	  $('#storage2_code1 option:contains(' + item[0] + ')').prop("selected", true);
	  let storage1 = $('#storage2_code1').find(":selected").val();
	  
		  for(let i=1; i<item.length; i++) {
 			  let storage1 = $('#storage2_code'+i).find(":selected").val();
 			  
			  if(storage1 != '선택' && storage1) {
				  const res = await fetch('/getStorageCode.do?storage=' + storage1);
				  const { storageCodeList } = await res.json();
			  
				  if(storageCodeList) {
					  $('#movement-out-tr').append('<td><select class="form-select st_select" name="storage2_code_idx" id="storage2_code'+(i+1)+'" onchange="change_storage2(this.value, '+(i+1)+')"><option selected>선택</option></select></td>');
					  await storageCodeList.forEach(e => {
					   	   	$('#storage2_code'+(i+1)).append("<option value="+e.storage_code_idx+">"+e.storage_nm+"</option>")
					  }); 	
				   } else {
					   $('#storage2_code'+(i+1)).remove();
				   }
 			  $('#storage2_code'+(i+1)+' option:contains(' + item[i] + ')').prop("selected", true);
				let code = $('#storage2_code'+(i+1)+'option:contains(' + item[i] + ')').val();
				code ? $('#storage2_code'+(i+1)).val(code) : '';
			  }
	  	}
  }
  
  const change_storage1 = async(v, num) => {
 	 let td_length = $('#movement-in-tr > td').length;
 	 if(v == '0' || v=='선택') {
			for(i=num+1; i<=td_length; i++) {
	  			$('#movement-in-tr > td:eq('+(num+1)+')').remove();
			}
		} else {
   	const res = await fetch('/getStorageCode.do?storage=' + v);
   	const { storageCodeList } = await res.json();

	     	if(storageCodeList.length) {
		     	if(!$('#movement-in-tr > td:eq('+(num+1)+')').length) {
		     	  	$('#movement-in-tr').append('<td  id="in_td'+td_length+'"><select class="form-select st_select" name="storage1_code_idx" onchange="change_storage1(this.value, '+td_length+')"><option selected value="0">선택</option></select></td>');
		     	} else {
		     	  	$('#movement-in-tr > td:eq('+(num+1)+')' + '> select').children('option:not(:first)').remove();
		     	}
	     	};
	     	storageCodeList.forEach((e) => {
	  			 $('#movement-in-tr > td:eq('+(num+1)+')' + '> select').append("<option value="+e.storage_code_idx+">"+e.storage_nm+"</option>");
	  	    });
		}
  }
  
  const change_storage2 = async(v, num) => {
	    let td_length = $('#movement-out-tr > td').length;
		if(v == '0' || v == '선택') {
			for(i=num+1; i<=td_length; i++) {
	  			$('#movement-out-tr > td:eq('+(num+1)+')').remove();
			}
		} else {
   			const res = await fetch('/getStorageCode.do?storage=' + v);
   			const { storageCodeList } = await res.json();

	     	if(storageCodeList.length) {
		     	if(!$('#movement-out-tr > td:eq('+(num+1)+')').length) {
		     	  	$('#movement-out-tr').append('<td  id="out_td'+td_length+'"><select class="form-select st_select" name="storage2_code_idx" onchange="change_storage2(this.value, '+td_length+')"><option selected value="0">선택</option></select></td>');
		     	} else {
		     	  	$('#movement-out-tr > td:eq('+(num+1)+')' + '> select').children('option:not(:first)').remove();
		     	}
	     	};
	     	storageCodeList.forEach((e) => {
	  			 $('#movement-out-tr > td:eq('+(num+1)+')' + '> select').append("<option value="+e.storage_code_idx+">"+e.storage_nm+"</option>");
	  	    });
		}
   }
  
  const clickSubmitMv = () => {
	  let child = $('#excel_movement_tbody').children().length;
	  if(child == 0) {
		  alert('엑셀 양식을 업로드 해주세요.');
		  return;
	  }
	  
	  $('#MoveModal').modal('show');
  }
  
  const submitMVData = async () => {
	  $.ajax({
	        type: 'POST',
	        url: '/autoMovementMetaData.do',
	        data: JSON.stringify(movementExcelData),
	        dataType: 'text',
	        contentType: 'application/json; charset=UTF-8',
	        success: function(data) {
	        	console.log(data);
	        	data == 'success' ? (
	        			alert('업로드 완료'), 
	        			deleteMVTbody(),
	        			movementExcelData = [],
	        			drawMVList(),
	        			$('#MoveModal').modal('hide')
	        	) : (
	        		alert('엑셀 업로드에 실패하였습니다. 다시 시도해주세요.')		
	        	)
	        			
	        },
	        error: function(e) {
	            alert('엑셀 업로드에 실패하였습니다. 다시 시도해주세요.');
	        }
	    });
  }
  
  const delete_auto_mv = () => {
	  if($('#excel_movement_tbody').children().length == 0) {
		  alert('삭제할 항목이 없습니다.');
		  return;
	  }
	  
	  if(confirm("전체삭제하시겠습니까?")) {
		  deleteMVTbody();
		  movementExcelData = [];
		  drawMVList();
	  } else {
		  return;
	  }
  }
  
  const delete_checked_auto_mv = () => {
	  if($('input:checkbox[id="auto_movement_checkbox"]:checked').length == 0) {
		  alert('삭제할 항목을 선택해주세요')
		  return
	  }
	  
	  if(confirm('선택하신 항목을 삭제하시겠습니까?')) {
		  let checkArr = [];
		  $('input:checkbox[name="auto_movement_checkbox"]').each(function() {
			  if($(this).is(":checked")==true) {
			    	checkArr.push($(this).val());
			    }
			});
		  
		  let sum = checkArr.length-1;
		  for(let i=sum; i >= 0; i--) {
			  movementExcelData.splice(i, 1);
		  }
		  deleteMVTbody();
		  drawMVList();
	  }
  }
  
  const excelDownload = num => {
	  num == 1 ? document.location.href = '/excelTemplate/일괄등록엑셀양식.xlsx' : '';
  }
  
  
  </script>

  <body data-sidebar="dark">
    <!-- <body data-layout="horizontal"> -->

    <!-- Begin page -->
    <div id="layout-wrapper">
    <jsp:include page="../../common/inc/headerContent.jsp" />
    
      <!-- ============================================================== -->
      <div class="main-content">
        <!-- 신규자료 자동등록 시작 -->
        <div class="page-content">
          <div class="tap_text">
            <h2>신규자료 자동등록</h2>
            <p>자료 등록 > <span>신규자료 자동등록</span></p>
          </div>
          <!-- 자료 구분 셀렉트 -->
          <div class="fr_wrap">
            <div class="mb-3 row fr_1">
              <div class="col-md-10">
                <label class="col-md-2 col-form-label">검증</label>
                <select class="form-select" disabled>
                  <option disabled selected>선택</option>
                  <option>더미1</option>
                  <option>더미2</option>
                  <option>더미3</option>
              </select>
                <label class="col-md-2 col-form-label">자료 구분</label>
                  <select class="form-select"  disabled>
                      <option disabled selected>국립항공박물관</option>
                      <option>더미1</option>
                      <option>더미2</option>
                      <option>더미3</option>
                  </select>
                <select class="form-select"  disabled>
                    <option disabled selected>선택</option>
                    <option>더미1</option>
                    <option>더미2</option>
                    <option>더미3</option>
                </select>
                  <label class="col-md-2 col-form-label">자료 번호</label>
                  <!-- <div class="col-md-10"> -->
                    <input class="form-control" list="datalistOptions" id="exampleDataList" placeholder="" disabled>
                    <input class="form-control" list="datalistOptions" id="exampleDataList" placeholder="" disabled>
                    ~
                    <input class="form-control" list="datalistOptions" id="exampleDataList" placeholder="" disabled>
                    <input class="form-control" list="datalistOptions" id="exampleDataList" placeholder="" disabled>
                    <button class="btn btn-secondary waves-effect waves-light btn_ml"  disabled>조회</button>
              </div>
            </div>
          </div>
          <!-- 탭 -->
          <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" data-bs-toggle="tab" href="#profile" role="tab">
                    <span class="d-block d-sm-none"><i class="far fa-user"></i></span>
                    <span class="d-none d-sm-block">기본 사항</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#settings" role="tab">
                    <span class="d-block d-sm-none"><i class="fas fa-cog"></i></span>
                    <span class="d-none d-sm-block">이동사항</span>
                </a>
            </li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content p-3 text-muted">
        <!-- 이동사항 등록 및 수정 모달 -->
                <div id="myModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
                  <div class="modal-dialog">
                      <div class="modal-content">
                          <div class="modal-header mv-modal-header">
                              <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <div class="modal-body mv-modal-body">
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
                                                <td style="width: 20%;">이동일자</td>
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
                                                    <select class="form-select st_select" name="storage_type2_code_idx" id="storage_type2_code_idx" style="width: auto">
                                                    <option selected value="0">선택</option>
                                                    </select>
                                                  </td>
                                              </tr>
                                              <tr id="movement-in-tr">
                                                <td>보관처</td>
                                                <td>
                                                  <select class="form-select st_select" name="storage1_code_idx" id="storage1_code1" onchange="change_storage1(this.value, 1)">
                                                    <option selected value="0">선택</option>
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
                                                    <option value="0">선택</option>
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
                                      <button id="add-movement-btn" type="button" class="custom_btn btn_c58672 btn_c58672_6840" onclick="clickModifySubmitMV()">저장</button>
                                  </div>
                              </div>
                            </div>
                            <!--  -->
                            <div class="mb-0 move-wrap">
                              <div class="st_wrap">
                                <label class="col-md-2 col-form-label st_title">과거 이동처 코드</label>
                              </div>
                              <div class="card-body">
                                <div class="table-responsive" id="pastMovementZone">
                                    <!-- <table class="table mb-0">
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
                                    </table> -->
                                </div>
                            </div>
                          </div>
                          </div>
                      </div>
                  </div>
              </div>
            <!-- 기본 사항 탭 -->
            <div class="tab-pane active" id="profile" role="tabpanel">
              <!-- 데이터 전환 모달 -->
              <div id="NomalModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <p>조회된 모든 소장품 데이터를 전환 하시겠습니까</p>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-primary waves-effect waves-light" onclick="autoAddMetaData()">확인</button>
                      <button type="button" class="btn btn-secondary waves-effect" data-bs-dismiss="modal">취소</button>
                    </div>
                  </div>
                </div>
              </div>
              <!-- -->
              <div class="st_wrap st_mv_wrap">
                <div class="auto_btn_left">
	                <button type="button" onclick="delete_checked_auto_metadata()">선택 삭제</button>
	                <button type="button" onclick="delete_auto_metadata()">전체 삭제</button>
                </div>
                <div class="auto_btn_right">
	                <button type="button" onclick="onclick=document.all.uploadExcel.click()" >양식 업로드</button>
	                <button type="button" >
	                	<a href="<c:url value="/excelTemplate/일괄등록엑셀양식.xls"/>"> 엑셀 양식 다운로드</a>
	               </button>
	                <button type="button" onclick="clickSubmitMeta()">데이터전환</button>
                </div>
              </div>
	                <form id="uploadMetaDataExcelForm" method="post" action="/uploadMetaDataExcel.do" enctype="multipart/form-data">
		                <input type="file" id="uploadExcel" name="uploadExcel" onchange="uploadMetaDataExcel()" accept=".xlsx, .xls" style="display:none;"/>
	                </form>
              <div class="mb-0">
                <!-- 엑셀 모달 -->
                <div class="card-body">
                  <div class="table-responsive">
                      <table class="table mb-0">
                          <thead>
                              <tr class="tr_bgc">
                                  <th>선택</th>
                                  <th>번호</th>
                                  <th>자료구분명</th>
                                  <th>자료번호</th>
                                  <th>세부번호</th>
                                  <th>주수량</th>
                                  <th>수량단위</th>
                                  <th>명칭</th>
                                  <th>이명칭</th>
                                  <th>오류체크</th>
                                  <th>수정</th>
                              </tr>
                          </thead>
                          <tbody id="excel_tbody">
                              
                          </tbody>
                      </table>
                  </div>
              </div>
            </div>
            </div>
            
            
            
            <!-- 이동사항 탭 시작 -->
            <div class="tab-pane" id="settings" role="tabpanel">
              <!-- 데이터 전환 모달 -->
              <div id="MoveModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <p>조회된 모든 소장품 데이터를 전환 하시겠습니까</p>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-primary waves-effect waves-light" onclick="submitMVData()">확인</button>
                      <button type="button" class="btn btn-secondary waves-effect" data-bs-dismiss="modal">취소</button>
                    </div>
                  </div>
                </div>
              </div>
              <!-- -->
              <div class="st_wrap st_mv_wrap">
                <div class="auto_btn_left">
                	<button type="button" onclick="delete_checked_auto_mv()">선택 삭제</button>
                	<button type="button" onclick="delete_auto_mv()">전체 삭제</button>
                </div>
                <div class="auto_btn_right">
	                <button type="button" onclick="onclick=document.all.uploadExcel2.click()">양식 업로드</button>
                	<button type="button" >
	                	<a href="<c:url value="/excelTemplate/이동사항일괄등록양식.xls"/>"> 엑셀 양식 다운로드</a>
	               </button>
                	<!-- <button data-bs-toggle="modal" data-bs-target="#MoveModal">데이터전환</button> -->
                	<button type="button" onclick="clickSubmitMv()">데이터전환</button>
                </div>
              </div>
                	<form id="uploadMovementExcelForm" method="post" action="/uploadMovementDataExcel.do" enctype="multipart/form-data">
			                <input type="file" name="uploadExcel2" id="uploadExcel2" onchange="uploadMovementExcel()" accept=".xlsx, .xls"  style="display:none;"/>
	                </form>
              <div class="mb-0">
                <!-- 이동사항 탭 내용 시작 -->
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table mb-0">
                      <thead>
                        <tr class="tr_bgc">
                          <th>선택</th>
                          <th>번호</th>
                          <th>이동일자</th>
                          <th>보관구분</th>
                          <th>보관처</th>
                          <th>반입처</th>
                          <th>이동수량</th>
                          <th>비고</th>
                          <th>격납요청자</th>
                          <th>오류체크</th>
                          <th>수정</th>
                        </tr>
                      </thead>
                      <tbody id="excel_movement_tbody">
                        
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
          </div>
          <!--  -->
        <!-- End Page-content -->
        
        <div id="data_edit_modal_1" class="modal fade hide" tabindex="-1" aria-labelledby="myModalLabel" style="display: none" aria-modal="true" role="dialog">
		  <div class="modal-dialog user-modal user_in_modal_wrap">
		    <div class="modal-content">
		      <div class="modal-header mv-modal-header">
		        <!-- <h5 class="modal-title" id="myModalLabel">Default Modal</h5> -->
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="userModInputClose"></button>
		      </div>
		      <div class="modal-body mv-modal-body">
		        <div class="mb-0 user-wrap">
		          <div class="st_wrap">
		            <label class="col-md-2 col-form-label st_title">데이터 수정하기</label>
		          </div>
		          <!-- 데이터 수정하기 모달 테이블 -->
		          <div class="card-body">
		            <div class="table-responsive">
		              <table class="table mb-0">
		                <tbody>
		                  <tr>
		                    <td style="width: 30%">자료구분</td>
		                    <td>
								<select class="search_select" name="modal_org_code_idx" id="modal_org_code_idx" style="width: 60%; height: 38px;">
									<c:forEach var="list" items="${orgList}" varStatus="status">
										<option value="${list.org_code_idx}" <c:if test ="${list.org_nm eq '항공박물관'}">selected="selected"</c:if>>${list.org_nm}</option>
									</c:forEach>
								</select>
								<select class="search_select" name="modal_possession_code_idx" id="modal_possession_code_idx" style="width: 39%; height: 38px;">
									<option value="" selected>선택</option>
									<c:forEach var="list" items="${posSessionList}" varStatus="status">
										<option value="${list.possession_code_idx}">${list.possession_nm}</option>
									</c:forEach>
								</select>
		                    </td>
		                  </tr>
		                  <tr>
		                    <td>자료번호</td>
		                    <td><input class="custom_search_input custom_search_input_100" type="text" name="modal_item_no" id="modal_item_no" placeholder="" /></td>
		                  </tr>
		                  <tr>
		                    <td>세부번호</td>
		                    <td><input class="custom_search_input custom_search_input_100" type="text" name="modal_item_detail_no" id="modal_item_detail_no" placeholder="" /></td>
		                  </tr>
		                  <tr>
		                  <tr>
		                    <td>관리번호</td>
		                    <td><input class="custom_search_input custom_search_input_100" type="text" name="modal_management_no" id="modal_management_no" placeholder="" /></td>
		                  </tr>
		                  <tr>
		                    <td>주수량</td>
		                    <td><input class="custom_search_input custom_search_input_100" type="text" name="modal_qty" id="modal_qty" placeholder="" /></td>
		                  </tr>
		                  <tr>
		                    <td>주수량단위</td>
		                    <td>
		                      <select class="search_select" name="modal_qty_unit_code_idx" id="modal_qty_unit_code_idx" style="min-width:auto !important; width:50% !important;">
                                      <option value="" selected>단위선택</option>
                                      	<c:forEach var="list" items="${qtyUnitList}" varStatus="status">
		                                    <option value="${list.qty_unit_code_idx}">${list.qty_unit_nm}</option>
		                                </c:forEach>
                                    </select>
		                    </td>
		                  </tr>
		                  <tr>
		                    <td>명칭</td>
		                    <td><input class="custom_search_input custom_search_input_100" type="text" name="modal_item_nm" id="modal_item_nm" placeholder="" /></td>
		                  </tr>
		                  <tr>
		                    <td>이명칭</td>
		                    <td><input class="custom_search_input custom_search_input_100" type="text" name="modal_item_se_nm" id="modal_item_se_nm" placeholder="" /></td>
		                  </tr>
		                  <tr>
		                    <td>국적/시대</td>
		                    <td>
		                      <select class="search_select" id="modal_country_code_idx" onchange="changeCountry(this.value, 0)" name="modal_country_code_idx">
                                      <option value="0" selected>선택</option>
		                               <c:forEach var="list" items="${countryList}" varStatus="status">
		                                    <option value="${list.country_code_idx}">${list.country_nm}</option>
		                                </c:forEach>
                              </select>
                              <select class="search_select" id="modal_era_code_idx" name="modal_era_code_idx">
                                      <option value="0" selected>선택</option>
                              </select>
		                    </td>
		                  </tr>
		                  <tr>
		                    <td>재질</td>
		                    <td>
                                  <select class="form-select st_select" id="modal_material1_code_idx" onchange="changeMaterial(this.value, 0)" name="modal_material1_code_idx">
                                    <option value="0" selected>선택</option>
                                    	<c:forEach var="list" items="${material1List}" varStatus="status">
		                                    <option value="${list.material1_code_idx}">${list.material1_nm}</option>
		                                </c:forEach>
                                  </select>
                                  <select class="form-select st_select" id="modal_material2_code_idx" name="modal_material2_code_idx">
                                    <option value="0" selected>선택</option>
                                  </select>
                            </td>
		                  </tr>
		                  <tr>
		                    <td>보험평가액</td>
		                    <td><input class="custom_search_input custom_search_input_100" type="text" name="modal_agreed_value" id="modal_agreed_value" placeholder="" /></td>
		                  </tr>
		                  <tr>
		                    <td>평가액단위</td>
                            <td>
                            	<select class="form-select st_select" name="modal_insu_price_unit_code_idx" id="modal_insu_price_unit_code_idx">
                            		<option value="0" selected>선택</option>
                            			<c:forEach var="list" items="${priceUnitList}" varStatus="status">
                            				<option value="${list.price_unit_code_idx}">${list.price_unit_nm}</option>
                            			</c:forEach>
                            	</select>
                            </td>
		                  </tr>
		                  <tr>
		                  	<td>보험 대여기간</td>
		                  	<td><input class="form-control st_input" type="date" name="modal_insu_start_date" id="modal_insu_start_date">~<input class="form-control st_input" type="date" name="modal_insu_end_date" id="modal_insu_end_date"></td>
		                  </tr>
		                  <tr>
		                  	<td>보험 대여기관</td>
		                  	<td><input class="custom_search_input custom_search_input_100" type="text" name="modal_rental_org" id="modal_rental_org" placeholder="" /></td>
		                  </tr>
		                  <tr>
		                  	<td>보험정보 비고</td>
		                  	<td><input class="custom_search_input custom_search_input_100" type="text" name="modal_rental_remark" id="modal_rental_remark" placeholder="" /></td>
		                  </tr>
		                  <tr>
		                  	<td>자료기록자</td>
		                  	<td><input class="custom_search_input custom_search_input_100" type="text" name="modal_data_recorder" id="modal_data_recorder" placeholder="" /></td>
		                  </tr>
		                  <tr>
		                  	<td>자료입력자</td>
		                  	<td><input class="custom_search_input custom_search_input_100" type="text" name="modal_reg_user" id="modal_reg_user" placeholder="" /></td>
		                  </tr>
		                  <tr>
		                  	<td>비고</td>
		                  	<td><input class="custom_search_input custom_search_input_100" type="text" name="modal_remark" id="modal_remark" placeholder="" /></td>
		                  </tr>
		                  <tr>
		                  	<td>참고자료</td>
		                  	<td><input class="custom_search_input custom_search_input_100" type="text" name="modal_reference" id="modal_reference" placeholder="" /></td>
		                  </tr>
		                  <tr>
		                  	<td>영문명칭</td>
		                  	<td><input class="custom_search_input custom_search_input_100" type="text" name="modal_item_eng_nm" id="modal_item_eng_nm" placeholder="" /></td>
		                  </tr>
		                </tbody>
		              </table>
		            </div>
		          </div>
		          <!--  -->
		        </div>
		        <div class="user_in_modal_footer_wrap">
		          <button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" id="userModBtn" onclick="clickModifySubmit()">저장</button>
		          <button class="custom_btn btn_c58672 user_in_modal_footer_btn" type="button" id="" data-bs-dismiss="modal">닫기</button>
		        </div>
		      </div>
		    </div>
		  </div>
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


    <!-- JAVASCRIPT -->
    <script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/libs/metismenujs/metismenujs.min.js"></script>
    <script src="assets/libs/simplebar/simplebar.min.js"></script>
    <script src="assets/libs/eva-icons/eva.min.js"></script>
    <!-- apexcharts -->
    <script src="assets/libs/apexcharts/apexcharts.min.js"></script>
    <script src="assets/js/pages/dashboard.init.js"></script>
    <script src="assets/js/app.js"></script>
    <!--  -->
    <script src="assets/js/pages/ecommerce-product-detail.init.js"></script>
  </body>
</html>