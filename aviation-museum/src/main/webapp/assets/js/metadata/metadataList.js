
//자료 기본사항 검색
const search_item_base = async (reg_state) => {
	if($('#possession_code_idx').val() == 0) {
		alert('자료구분을 선택해주세요');
		return
	}
	if($('#item_no').val() == '') {
		alert('자료번호를 입력해주세요.');
		return;
	}
	let formData = new FormData(document.getElementById('add-form'));
	const form = await fetch('/searchItemBase.do', {
    		method:'POST',
    		headers: {
                "Content-Type": "application/x-www-form-urlencoded",
            },
            body: new URLSearchParams(formData)
    	})

		const { itemBaseList } = await form.json();
		
    	itemBaseList.length ? (set_itemBase_input(itemBaseList), item_number = itemBaseList[0].item_no) : (alert('검색하신 데이터가 없습니다.'), item_number ? $('#item_no').val(item_number) : '') 
}

const search_item_base_html = () => {
	if($('#possession_code_idx').val() == 0) {
		alert('자료구분을 선택해주세요');
		return
	}
	if($('#item_no').val() == '') {
		alert('자료번호를 입력해주세요.');
		return;
	}
	$('#item_idx').val(sessionStorage.getItem("item_idx"));
	let formData = $('#add-form').serialize();
					$.ajax({
						type : 'POST',                 
						url : '/searchItemBaseHtml.do',
						data: formData,
						dataType : "html",           
						contentType : "application/x-www-form-urlencoded;charset=UTF-8",
						error : function() {
							alert('통신실패!');
						},
						success : function(data) {
							$('#home').empty().append(data);
						}
					})
}


//자료기본사항 아래 항목들
const set_itemBase_input = async (list) => {
	sessionStorage.setItem("item_idx", list[0].item_idx);
	$('#item_no').val(list[0].item_no);
	$('#item_detail_no').val(list[0].item_detail_no);
	checkSearchState = 'Y';
	changeAddBtn();
	getImageList();
	getMovementList();
	getSpeciality();
	getPreservation();
	
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
	
	//$('#class-tbody').children('tr:not(:first-child)').remove();
	if(taxonomyList.length) {
		$('#class-tbody').children().remove();
		taxonomyList.forEach(async (e, i) => {
			addClassTd('class-table', 'class-tbody');
			$('#class1_code_idx'+i).val(e.class1_code_idx).prop("selected", true);
			$('#class2_code_idx'+i).val(e.class2_code_idx).prop("selected", true);
			$('#class3_code_idx'+i).val(e.class3_code_idx).prop("selected", true);
			$('#taxonomy_idx'+i).val(e.taxonomy_idx);
			$('#input_taxonomy_idx'+i).val(e.taxonomy_idx);
		})
	} else {
		$('#class1_code_idx0').attr('name', 'update_class1_code_idx0');
		$('#class2_code_idx0').attr('name', 'update_class2_code_idx0');
		$('#class3_code_idx0').attr('name', 'update_class3_code_idx0');
	}
	
	//$('#country-tbody').children('tr:not(:first-child)').remove();
	if(countryList.length) {
		$('#country-tbody').children().remove();
		countryList.forEach(async (e, i) => {
			addClassTd('country-table', 'country-tbody');
			$('#country-select'+i).val(e.country_code_idx).prop("selected", true);
			await changeCountry(e.country_code_idx, i);
			$('#era-select'+i).val(e.era_code_idx).prop("selected", true);
			$('#detail_year'+i).val(e.detail_year);
			$('#country_idx'+i).val(e.country_era_idx);
			$('#input_country_idx'+i).val(e.country_era_idx);
		})
	} else {
		$('#country-select0').attr('name', 'update_country_code_idx');
		$('#era-select0').attr('name', 'update_era_code_idx');
		$('#detail_year0').attr('name', 'update_detail_year');
		
	}
	
	//$('#material-tbody').children('tr:not(:first-child)').remove();
	if(materialList.length) {
		$('#material-tbody').children().remove();
		materialList.forEach(async (e, i) => {
			addClassTd('material-table', 'material-tbody');
			$('#material1_code_idx'+i).val(e.material1_code_idx).prop("selected", true);
			await changeMaterial(e.material1_code_idx, i);
			$('#material2_code_idx'+i).val(e.material2_code_idx).prop("selected", true);
			$('#material_detail'+i).val(e.material_detail);
			$('#material_idx'+i).val(e.material_idx);
			$('#input_material_idx'+i).val(e.material_idx);
		})
	} else {
		$('#material1_code_idx0').attr('name', 'update_material1_code_idx');
		$('#material2_code_idx0').attr('name', 'update_material2_code_idx');
		$('#material_detail0').attr('name', 'update_material_detail');
	}
	
	//$('#measurement-tbody').children('tr:not(:first-child)').remove();
	if(measurementList.length) {
		$('#measurement-tbody').children().remove();
		measurementList.forEach((e, i) => {
			addClassTd('measurement-table', 'measurement-tbody');
			$('#measurement_item_type'+i).val(e.item_type);
			$('#measurement_code_idx'+i).val(e.measurement_code_idx).prop("selected", true);
			$('#measurement_value'+i).val(e.measurement_value);
			$('#measurement_unit_code_idx'+i).val(e.measurement_unit_code_idx).prop("selected", true);
			$('#measurement_idx'+i).val(e.measurement_idx);
			$('#input_measurement_idx'+i).val(e.measurement_idx);
		})
	} else {
		$('#measurement_item_type0').attr('name', 'update_measurement_item_type');
		$('#measurement_code_idx0').attr('name', 'update_measurement_code_idx');
		$('#measurement_value0').attr('name', 'update_measurement_value');
		$('#measurement_unit_code_idx0').attr('name', 'update_measurement_unit_code_idx');
	}
	
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
		$('#obt_designation').val(e.designation).prop("selected", true);
		$('#obt_redemption').val(e.redemption).prop("selected", true);
		$('#obt_country_code_idx').val(e.country_code_idx).prop("selected", true);
		if($('#obt_qty').val() != 0) {
			$('#obt_qty').val(e.qty);
		}
		$('#obt_qty_unit_code_idx').val(e.qty_unit_code_idx).prop("selected", true);
		$('#obt_redemption_date').val(e.redemption_date);
	})
	
	//$('#possession-tbody').children('tr:not(:first-child)').remove();
	if(involvementList.length) {
		$('#possession-tbody').children().remove();
		involvementList.forEach((e,i) => {
			addClassTd('possession-table', 'possession-tbody');
			$('#invol_org_code_idx'+i).val(e.org_code_idx).prop("selected", true);
			$('#invol_possession_code_idx'+i).val(e.possession_code_idx).prop("selected", true);
			$('#invol_item_no'+i).val(e.item_no);
			$('#invol_remark'+i).val(e.remark);
			$('#involvement_idx'+i).val(e.involvement_idx);
			$('#input_involvement_idx'+i).val(e.involvement_idx);
		})
	} else {
		$('#invol_possession_code_idx0').attr('name', 'update_invol_possession_code_idx');
		$('#invol_item_no0').attr('name', 'update_invol_item_no');
		$('#invol_remark0').attr('name', 'update_invol_remark');
	}
	
	//$('#insurance-tbody').children('tr:not(:first-child)').remove();
	if(InsuranceList.length) {
		$('#insurance-tbody').children().remove();
		InsuranceList.forEach((e,i) => {
			addClassTd('insurance-table', 'insurance-tbody');
			$('#insu_agreed_value'+i).val(e.agreed_value);
			$('#insu_price_unit_code_idx'+i).val(e.price_unit_code_idx).prop("selected", true);
			$('#insu_start_date'+i).val(e.start_date);
			$('#insu_end_date'+i).val(e.end_date);
			$('#insu_rental_org'+i).val(e.rental_org);
			$('#insu_remark'+i).val(e.remark);
			$('#insurance_idx'+i).val(e.insurance_idx);
			$('#input_insurance_idx'+i).val(e.insurance_idx);
		})
	} else {
		$('#insu_agreed_value0').attr('name', 'update_insu_agreed_value');
		$('#insu_price_unit_code_idx0').attr('name', 'update_insu_price_unit_code_idx');
		$('#insu_start_date0').attr('name', 'update_insu_start_date');
		$('#insu_end_date0').attr('name', 'update_insu_end_date');
		$('#insu_rental_org0').attr('name', 'update_insu_rental_org');
		$('#insu_remark0').attr('name', 'update_insu_remark');
	}
	
	//$('#copyright-tbody').children('tr:not(:first-child)').remove();
	if(copyrightList.length) {
		$('#copyright-tbody').children().remove();
		copyrightList.forEach((e,i) => {
			addClassTd('copyright-table', 'copyright-tbody');
			$('#copy_copyright'+i).val(e.copyright).prop("selected", true);
			$('#copy_owner'+i).val(e.owner);
			$('#copy_expiry_date'+i).val(e.expiry_date);
			$('#copy_usage_permission'+i).val(e.usage_permission).prop("selected", true);
			$('#copy_copyright_transfer'+i).val(e.copyright_transfer).prop("selected", true);
			$('#copy_remark'+i).val(e.remark);
			$('#copyright_idx'+i).val(e.copyright_idx);
			$('#input_copyright_idx'+i).val(e.copyright_idx);
		})
	} else {
		$('#copy_copyright0').attr('name', 'update_copy_copyright');
		$('#copy_owner0').attr('name', 'update_copy_owner');
		$('#copy_expiry_date0').attr('name', 'update_copy_expiry_date');
		$('#copy_usage_permission0').attr('name', 'update_copy_usage_permission');
		$('#copy_copyright_transfer0').attr('name', 'update_copy_copyright_transfer');
		$('#copy_remark0').attr('name', 'update_copy_remark');
	}
	
	publicServiceList.forEach((e,i) => {
		$('#public_service').val(e.public_service).prop("selected", true);
		$('#reason').val(e.reason);
		$('#ggnuri_code_idx').val(e.ggnuri_code_idx).prop("selected", true);
	});
	
					if(keywordList.length > 1) {
	    	    		let keywordArr = [];

	    				keywordList.forEach((e,i) => {
	    	    			keywordArr.push(e.keyword);
	    	    		 })
	    	    		 keywordArr.join(',');
	    				$('#itembasekeyword').val(keywordArr);
	    				return;
	    			} else if(!keywordList.length) {
						return;
					} else {
	    				$('#itembasekeyword').val(keywordList[0].keyword);
						
					}
	
	
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
	let arr = $('#addKeyword').val().split(',').filter(e => e.length !== 0);
	let val = arr.join(',');
		
	if(!$('#item_nm').val()) { 
		alert('자료조회를 먼저 진행해주세요.'); 
		return; 
	}
	
	if(arr.length > 5) {
			alert("콤마 ', ' 단위로 5개 이하 입력해주세요.")
			return
		}
	
	if(confirm("키워드 추가를 하시겠습니까?")) {
		
			$.ajax({
					type : 'POST',
					url : '/addKeyword.do',
					data: {
						item_idx: item_idx,
						addKeyword: val
					},			
					dataType : "text",
					contentType : "application/x-www-form-urlencoded;charset=UTF-8",
					error : function() {
							alert('통신실패!');
					},
					success : function(data) {  
						data == 'success' ? (
							alert('키워드 신청이 완료되었습니다.'), $('#addKeyword').val(''), $('#searchKeyword').val(), searchKeyword()
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
		$('#reg_state').val(value5);
		var pop_title = "popupOpener" ;
		
		window.open("", pop_title, 'width=1500, height=1500') ;
		
		var frmData = document.metaDataListViewForm ;
		frmData.target = pop_title ;
		frmData.action = "/metaDataListView.do" ;
		
		frmData.submit() ;
}

