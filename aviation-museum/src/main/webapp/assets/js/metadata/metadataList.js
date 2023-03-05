
//자료 기본사항
const search_item_base = async (reg_state) => {
	if(!$('#possession_code_idx > option:selected').val()) {
    	alert("소장구분을 선택해주세요.");
		return
	}
	if(!$('#org_code_idx > option:selected').val()) {
    	alert("기관코드를 선택해주세요.");
		return
	}
	if(!$('#item_no').val()) {
    	alert("자료번호를 입력해주세요.");
		return
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
    	itemBaseList.length ? set_itemBase_input(itemBaseList) : alert('검색하신 데이터가 없습니다.');
}

//자료기본사항 아래 항목들
const set_itemBase_input = async (list) => {
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
				
	$('#class-tbody').children('tr:not(:first-child)').remove();
	taxonomyList.forEach(async (e, i) => {
		i == 0 ? '' : addClassTd('class-table', 'class-tbody');
		$('#class-checkbox'+i).val(e.taxonomy_idx);
		$('#class1_code_idx'+i).val(e.class1_code_idx).prop("selected", true);
		$('#class2_code_idx'+i).val(e.class2_code_idx).prop("selected", true);
		$('#class3_code_idx'+i).val(e.class3_code_idx).prop("selected", true);
	})
	
	$('#country-tbody').children('tr:not(:first-child)').remove();
	countryList.forEach(async (e, i) => {
		i == 0 ? '' : addClassTd('country-table', 'country-tbody');
		$('#country-checkbox'+i).val(e.country_era_idx);
		$('#country-select'+i).val(e.country_code_idx).prop("selected", true);
		await changeCountry(e.country_code_idx, i);
		$('#era-select'+i).val(e.era_code_idx).prop("selected", true);
		$('#detail_year'+i).val(e.detail_year);
	})
	
	$('#material-tbody').children('tr:not(:first-child)').remove();
	materialList.forEach(async (e, i) => {
		if(i != 0) addClassTd('material-table', 'material-tbody');
		$('#material-checkbox'+i).val(e.material_idx);
		$('#material1_code_idx'+i).val(e.material1_code_idx).prop("selected", true);
		await changeMaterial(e.material1_code_idx, i);
		$('#material2_code_idx'+i).val(e.material2_code_idx).prop("selected", true);
		$('#material_detail'+i).val(e.material_detail);
	})
	
	$('#measurement-tbody').children('tr:not(:first-child)').remove();
	measurementList.forEach((e, i) => {
		if(i != 0) addClassTd('measurement-table', 'measurement-tbody');
		$('#measurement-checkbox'+i).val(e.measurement_idx);
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
	
	$('#possession-tbody').children('tr:not(:first-child)').remove();
	involvementList.forEach((e,i) => {
		if(i != 0) addClassTd('possession-table', 'possession-tbody');
		$('#possession-checkbox'+i).val(e.involvement_idx);
		$('#invol_possession_code_idx'+i).val(e.possession_code_idx).prop("selected", true);
		$('#invol_item_no'+i).val(e.item_no);
		$('#invol_remark'+i).val(e.remark);
	})
	
	$('#insurance-tbody').children('tr:not(:first-child)').remove();
	InsuranceList.forEach((e,i) => {
		if(i != 0) addClassTd('insurance-table', 'insurance-tbody');
		$('#insurance-checkbox'+i).val(e.insurance_idx);
		$('#insu_agreed_value'+i).val(e.agreed_value);
		$('#insu_price_unit_code_idx'+i).val(e.price_unit_code_idx).prop("selected", true);
		$('#insu_start_date'+i).val(e.start_date);
		$('#insu_end_date'+i).val(e.end_date);
		$('#insu_rental_org'+i).val(e.rental_org);
		$('#insu_remark'+i).val(e.remark);
	})
	
	$('#copyright-tbody').children('tr:not(:first-child)').remove();
	copyrightList.forEach((e,i) => {
		if(i != 0) addClassTd('copyright-table', 'copyright-tbody');
		$('#copyright-checkbox'+i).val(e.copyright_idx);
		$('#copy_copyright'+i).val(e.copyright).prop("selected", true);
		$('#copy_owner'+i).val(e.owner);
		$('#copy_expiry_date'+i).val(e.expiry_date);
		$('#copy_usage_permission'+i).val(e.usage_permission);
		$('#copy_copyright_transfer'+i).val(e.copyright_transfer);
		$('#copy_remark'+i).val(e.remark);
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
	await getImageList();
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
	
}




