let tabName = '';

const changeTabName = nm => { 
	nm == 'P' ? tabName='' : tabName=nm;
	 $('#reg_state').val(nm);
	$('#page').val(0);
	getTransformList()
}

const changeReg = nm => {
	let item_idx = [];
	$('input:checkbox[id='+nm+'Checkbox]:checked').each(function() {
		item_idx.push($(this).val());
	})
	
	if(!item_idx.length) { alert("선택된 자료가 없습니다."); return false }
	
	if(confirm("선택하신 자료상태를 변경하시겠습니까?")) {
	let reg_state =  $('#reg_state').val();
	$.ajax({
				type : 'POST',                 
				url : '/changeTransformReg.do',
				dataType : "text",
				data: {
					reg_state: reg_state,
					item_idx: item_idx
				},			
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {        
					alert('통신실패!');
				},
				success : function(data) {  
					data == 'success' ? 
					(alert('변경되었습니다.'), getTransformList()) : alert('오류가 발생했습니다. 다시 시도해주세요.')
				}
			});
	} else { return false }
};

const changeRegAll = nm => {
	if(confirm("검색조건에 맞는 자료를 전체 변환하시겠습니까?")) {
	let reg_state =  $('#reg_state').val();
	let item_no1 = $('#item_no1').val();
	let item_detail_no1 = $('#item_detail_no1').val();
	let item_no2 = $('#item_no2').val();
	let item_detail_no2 = $('#item_detail_no2').val();
	$.ajax({
				type : 'POST',                 
				url : '/changeTransformRegAll.do',
				dataType : "text",
				data: {
					reg_state: reg_state,
					item_no1: item_no1,
					item_detail_no1: item_detail_no1,
					item_no2: item_no2,
					item_detail_no2: item_detail_no2
				},			
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {        
					alert('통신실패!');
				},
				success : function(data) {  
					data == 'success' ? 
					(alert('변경되었습니다.'), getTransformList()) : alert('오류가 발생했습니다. 다시 시도해주세요.')
				}
			});
		} else {
			return false
		}
}

/*const changeRegAll = nm => {
	$('input[id='+nm+'Checkbox').prop("checked", true);
	$('input:checkbox[id='+nm+'Checkbox]:checked').each(function() {
	    console.log($(this).val());
	})
};*/

const allChecked = reg => {
	$('input[id='+reg+'Checkbox').prop("checked", true);
}

const cancelChecked = reg => {
	$('input[id='+reg+'Checkbox').prop("checked", false);
}

const goPage = page => {
	$('#page').val(page);
	let formData = $('#getTransform').serialize();
	$.ajax({
				type : 'POST',                 
				url : '/getTransformList.do',
				data: formData,			
				dataType : "html",           
				contentType : "application/x-www-form-urlencoded;charset=UTF-8",
				error : function() {        
					alert('통신실패!');
				},
				success : function(data) {  
					if($('#reg_state').val() == 'N') {
						$('#transformNotList').empty().append(data);
					} else if($('#reg_state').val() == 'Y') {
						$('#transformYesList').empty().append(data);
					} else {
						$('#transformAllList').empty().append(data);
					}
				}
			});
}

const checkInput = () => {
	if(!$('#possession_code_idx > option:selected').val()) {
    	alert("소장구분을 선택해주세요.");
		return false
	}
	if(!$('#org_code_idx > option:selected').val()) {
    	alert("기관코드를 선택해주세요.");
		return false
	}
	if(!$('#item_no1').val()) {
    	alert("첫번째 자료번호를 입력해주세요.");
		return false
	}
	if(!$('#item_no2').val()) {
    	alert("두번째 자료번호를 입력해주세요.");
		return false
	}
	if($('#item_detail_no1').val()) {
		if(!$('#item_detail_no2').val()) {
			alert("두번째 세부번호를 입력해주세요.");
			return false
		}
	}
	if($('#item_detail_no2').val()) {
		if(!$('#item_detail_no1').val()) {
			alert("첫번째 세부번호를 입력해주세요.");
			return false
		}
	}
	if($('#item_no1').val() > $('#item_no2').val()) {
		alert("두번째 자료번호의 검색조건이 잘못되었습니다")
		return false
	}
	return true
}

const getTransformList = async () => {
		if(checkInput()) {
			let formData = $('#getTransform').serialize();
			$.ajax({
						type : 'POST',                 
						url : '/getTransformList.do',
						data: formData,			
						dataType : "html",           
						contentType : "application/x-www-form-urlencoded;charset=UTF-8",
						error : function() {        
							alert('통신실패!');
						},
						success : function(data) {  
							if($('#reg_state').val() == 'N') {
								$('#transformNotList').empty().append(data);
							} else if($('#reg_state').val() == 'Y') {
								$('#transformYesList').empty().append(data);
							} else {
								$('#transformAllList').empty().append(data);
							}
						}
					});
		}
}

function excelDownload() {
	if(checkInput()) {
		let $form = $('#getTransform');
		$form.attr("action", "/transformListExcel.do");
		$form.attr("method", "post");
	    $form.submit();
	}
		
}