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
	if($('#item_no1').val() > $('#item_no2').val()) {
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

const goPage = page => {
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