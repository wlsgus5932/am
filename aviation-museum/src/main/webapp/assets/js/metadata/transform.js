const getTransformList = () => {
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
	
	
	let formData = new FormData(document.getElementById('getTransform'));
	
	const form = await fetch('/getTransformList.do', {
    		method:'POST',
    		headers: {
                "Content-Type": "application/x-www-form-urlencoded",
            },
            body: new URLSearchParams(formData)
    	})

		const { itemBaseList } = await form.json();
    	itemBaseList.length ? set_itemBase_input(itemBaseList) : alert('검색하신 데이터가 없습니다.');
	
}