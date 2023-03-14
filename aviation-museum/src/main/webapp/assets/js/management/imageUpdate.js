let gallery;

const checkInput = () => {
	if(!$('#org_code_idx > option:selected').val()) {
    	alert("기관코드를 선택해주세요.");
		return false
	}
	if(!$('#possession_code_idx > option:selected').val()) {
    	alert("소장구분을 선택해주세요.");
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

const getImageUpdateList = () => {
	if(!checkInput()) {return}
	gallery = '';
	let form = $('#imageUpdateForm').serialize();
	$.ajax({
              url :'/getImageUpdateList.do',
              type : 'POST',
              dataType : 'html',
              data : form,
			  async: false,
              success: function(data) {
				$('#imageUpdateZone').empty().append(data);
              },
              error: function(xhr, ajaxOptions, thrownError) {
              }
         });
	gallery = new Viewer(document.getElementById('imageUpdateZone'));
	console.log(gallery)
}

const publicRepCheck = box => {
  		box.checked ? setPublicRep(box.value, box.name, 'Y') : setPublicRep(box.value, box.name, 'N')
  	}
  	
const setPublicRep = async (idx, colunm, val) => {
  	const res = await fetch('/setPublicrep.do?image_idx=' + idx + '&colunm=' + colunm + '&val=' + val);
  	await res.text() == 'success' ? getImageUpdateList() : alert('오류입니다.');
}

const imageAllCheck = box => {
   	box.checked ? $('input[name=imageUpdateListCheckbox]').prop("checked", true) : $('input[name=imageUpdateListCheckbox]').prop("checked", false);
}

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
  	
  	/** 일반 업로드 **/
    /** DEXTUPLOADX5 설정 **/
    dx5.create({ 
       mode: "multi", id: "dext5", parentId: "dext5-container" , btnFile: "btn-add-files",
       btnUploadAuto: "btn-upload-auto"
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
	 }
	 
	 function onDX5UploadStopped(id) { alert("업로드가 중단되었습니다."); }
	 
	 function onDX5UploadCompleted(id) {
	    // 대용량 업로드는 개별 파일마다 응답 데이터를 따로 받으므로, ';' 문자를 구분자로 하는 하나의 문자열로 생성하여 전달한다.
	    var responses = dx5.get(id).getResponses();
	    for(var i = 0, len = responses.length; i < len; i++) {
	       console.log(responses[i]);
	    }
	    getImageUpdateList()
	 }

const downloadImageChecked = async () => {
        let path_arr = [];
      if($('input:checkbox[name=imageUpdateListCheckbox]:checked').length == 0) {
         alert("다운로드할 항목을 선택해주세요.")
         return;
      }
      if(confirm("다운하시겠습니까?")) {
         $('input:checkbox[name=imageUpdateListCheckbox]:checked').each(function() {
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
      if($('input:checkbox[name=imageUpdateListCheckbox]:checked').length == 0) {
         alert("삭제할 항목을 선택해주세요.")
         return;
      }
      if(confirm("삭제하시겠습니까?")) {
         $('input:checkbox[name=imageUpdateListCheckbox]:checked').each(function(i, val) {
            idx_arr.push(val.value);
         })

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
							(alert('삭제되었습니다.'), getImageUpdateList()) : alert('오류가 발생했습니다. 다시 시도해주세요.')
						}
					});
       } else {
           return false;
       }
   }