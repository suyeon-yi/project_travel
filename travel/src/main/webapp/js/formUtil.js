/**
 * 게시판류 입력 폼의 데이터 처리를 위한 JS
 */

//alert("formUtil.js setting");


//데이터의 패턴 정규 표현식 객체 선언
			//날짜 패턴 검사 -> JS 정규 표현식
			//맨 앞자리는 숫자 4 + "-" + 중간 숫자 2자리:0[1-9],10,11,12+ "-" + 뒷자리 2자리[12][0-9][3][01]
var reg_date = /^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/; //날짜 패턴
//이메일 정규 표현식
//영숫자 한자리 + ? - 0 또는 한개 문자 + [0-9a-zA-Z] * 0개 이상 + @ + [0-9a-zA-Z] + ([-_.]?[0-9a-zA-Z])* + . + [a-zA-Z]{2,3}:2자~3자
var reg_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
//전화번호 정규 표현식
var reg_tel = /^\d{2,3}-\d{3,4}-\d{4}$/;


//정규 표현식 패턴 검사 함수
//사용법 : if(!regTest(reg_email, "#email", "영숫자.-@영숫자*.영숫자2~3의 이메일")) return false;
function regTest(reg, objStr, pattern){
	//패턴에 맞지 않는 경우 처리
	if(!reg.test($(objStr).val())){
		alert("패턴에 맞지 않다. \n"+ pattern +"을(를) 입력하셔야합니다.")
		$(objStr).focus();
		return false;
	}
	return true;
}


// 필수 항목 검사 함수 - 데이터가 비어 있으면 true가 리턴된다.
// 필수 항목 검사 사용법 : if(emptyCheck("#title", "제목")) return false;
function emptyCheck(objStr, itemName){
	//공백제거
	//val() -> 값을 가져오세요. getter()
	//val(값) -> 값을 넣어주세요. setter()
	$(objStr).val($(objStr).val().trim());
	//선택한 항목 객체가 비어 있으면
	if(!$(objStr).val()){
		//경고창을 띄운다.
		alert(itemName +"은(는) 필수 입력 항목입니다. 입력해 주세요.");
		//커서를 입력란에 위치 시킨다.
		$(objStr).focus();
		return true; //데이터가 비어 있으면 true가 리턴된다.
	}
	return false;
}

//길이 젠한 함수
//길이 제한 사용법 : if(!lengthCheck("#title", "제목", 4, 100)) return false;
function lengthCheck(objStr, itemName, minLen, maxLen){

		//제목은 4~100 까지 사용 가능
		var len = $(objStr).val().length;
		if(!(len >= minLen && len <= maxLen)){
			alert(itemName +"은(는)" + minLen + "~" + maxLen +"자 이내로 작성하셔야 합니다.");
			$(objStr).focus();
			return false;
		}
		return true;
}

