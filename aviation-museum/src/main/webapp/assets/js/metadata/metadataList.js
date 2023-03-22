
//자료 기본사항 검색
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
	sessionStorage.setItem("item_idx", list[0].item_idx);
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
				
	$('#class-tbody').children('tr:not(:first-child)').remove();
	taxonomyList.forEach(async (e, i) => {
		if(i != 0) addClassTd('class-table', 'class-tbody');
		/*i != 0 ? addClassTd('class-table', 'class-tbody') : '';*/
		$('#class1_code_idx'+i).val(e.class1_code_idx).prop("selected", true);
		$('#class2_code_idx'+i).val(e.class2_code_idx).prop("selected", true);
		$('#class3_code_idx'+i).val(e.class3_code_idx).prop("selected", true);
	})
	
	$('#country-tbody').children('tr:not(:first-child)').remove();
	countryList.forEach(async (e, i) => {
		if(i != 0) addClassTd('country-table', 'country-tbody');
		$('#country-select'+i).val(e.country_code_idx).prop("selected", true);
		await changeCountry(e.country_code_idx, i);
		$('#era-select'+i).val(e.era_code_idx).prop("selected", true);
		$('#detail_year'+i).val(e.detail_year);
	})
	
	$('#material-tbody').children('tr:not(:first-child)').remove();
	materialList.forEach(async (e, i) => {
		if(i != 0) addClassTd('material-table', 'material-tbody');
		$('#material1_code_idx'+i).val(e.material1_code_idx).prop("selected", true);
		await changeMaterial(e.material1_code_idx, i);
		$('#material2_code_idx'+i).val(e.material2_code_idx).prop("selected", true);
		$('#material_detail'+i).val(e.material_detail);
	})
	
	$('#measurement-tbody').children('tr:not(:first-child)').remove();
	measurementList.forEach((e, i) => {
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
		$('#obt_designation').val(e.designation).prop("selected", true);
		$('#obt_redemption').val(e.redemption).prop("selected", true);
		$('#obt_country_code_idx').val(e.country_code_idx).prop("selected", true);
		if($('#obt_qty').val() != 0) {
			$('#obt_qty').val(e.qty);
		}
		$('#obt_qty_unit_code_idx').val(e.qty_unit_code_idx).prop("selected", true);
		$('#obt_redemption_date').val(e.redemption_date);
	})
	
	$('#possession-tbody').children('tr:not(:first-child)').remove();
	involvementList.forEach((e,i) => {
		if(i != 0) addClassTd('possession-table', 'possession-tbody');
		$('#invol_org_code_idx'+i).val(e.org_code_idx).prop("selected", true);
		$('#invol_possession_code_idx'+i).val(e.possession_code_idx).prop("selected", true);
		$('#invol_item_no'+i).val(e.item_no);
		$('#invol_remark'+i).val(e.remark);
	})
	
	$('#insurance-tbody').children('tr:not(:first-child)').remove();
	InsuranceList.forEach((e,i) => {
		if(i != 0) addClassTd('insurance-table', 'insurance-tbody');
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
		$('#reg_state').val(value5);
		var pop_title = "popupOpener" ;
		
		window.open("", pop_title, 'width=1000, height=1000') ;
		
		var frmData = document.metaDataListViewForm ;
		frmData.target = pop_title ;
		frmData.action = "/metaDataListView.do" ;
		
		frmData.submit() ;
}

