<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>여행 후기 등록</title>
<script type="text/javascript" src="/js/formUtil.js"></script>
<style type="text/css">
input,textarea{
	background: #eee;
}
</style>

<script type="text/javascript">
$(function(){
	
	//입력란의 배경색을 #eee(옅은 회색) 만들어 놓고, 입력하는 입력란에 배경색을 흰색으로 바꿔준다.
	$("input, textarea").css("background", "#eee");
	
	$("#writeForm").submit(function(){
		
		//필수 입력 항목 검사 - 제목, 여행장소, 여행일정, 참여인원, 사진, 내용, 작성자 - 태그는 필수입력 항목이 아니다.
		
		if(emptyCheck("#title", "제목")) return false;
		if(emptyCheck("#place", "여행장소")) return false;
		if(emptyCheck("#startDate", "여행시작일")) return false;
		if(emptyCheck("#endDate", "여행종료일")) return false;
		if(emptyCheck("#staff", "참여인원")) return false;
		if(emptyCheck("#photo", "여행사진")) return false;
		if(emptyCheck("#content", "내용")) return false;
		if(emptyCheck("#writer", "작성자")) return false;
		
		//길이 제한 검사를 한다. - 제목, 여행장소, 내용, 태그, 작성자
		if(!lengthCheck("#title", "제목", 4, 100)) return false;
		if(!lengthCheck("#place", "여행장소", 4, 100)) return false;
		if(!lengthCheck("#content", "내용", 4, 1000)) return false;
		if(!lengthCheck("#tags", "태그", 0, 100)) return false;
		if(!lengthCheck("#writer", "이름", 2, 10)) return false;
		
		//날짜 패턴 검사를 한다. - 여행 시작일, 여행 종료일
		if(!regTest(reg_date, "#startDate", "yyyy-mm-dd")) return false;
		if(!regTest(reg_date, "#endDate", "yyyy-mm-dd")) return false;
	
	});
});
</script>
</head>
<body>
<div class="container">
<h2>여행 공유</h2>
<form action="write.jsp" method="post" enctype="multipart/form-data" id="writeForm">
	<div class="form-group">
			<label for="title" class="control-label col-sm-2" >제목</label>
			<div class="col-sm-10">
				<input name="title" maxlength="100" id="title" class="form-control" placeholder="제목을 입력해주세요.">
			</div>
	</div>
	<br>
	<div class="form-group">
		<label for="place" class="control-label col-sm-2">여행장소</label>
		<div class="col-sm-10">
			<input name="place" maxlength="100" id="place" class="form-control" placeholder="예)서울특별시 종로구">
		</div>	
	</div>	
	<br>
	<div class="form-group">
		<label for="schedule" class="control-label col-sm-2">여행일정</label>
		<div class="col-sm-10">
				<input type="text" id="startDate" name="startDate" placeholder="yyyy=mm=dd">
				<label for="endDate">~</label>
				<input type="text" id="endDate" name="endDate" placeholder="yyyy-mm-dd">
		</div>	
	</div>	
	<br>
		<div class="form-group">
		<label for="staff" class="control-label col-sm-2">참여인원</label>
			<div class="col-sm-10">
				<label>
				<input type="radio" name="staff" id="satff" value="1명" checked>1명
				</label>
				<label>
				<input type="radio" name="staff" id="satff" value="2명" >2명
				</label>
				<label>
				<input type="radio" name="staff" id="satff" value="3명 이상" >3명 이상
				</label>
			</div>
		</div>
		<br>	
		<div class="form-group">
		<label for="photo" class="control-label col-sm-2">여행사진</label>
		<div class="col-sm-10">
			사진 한 장당 크기는 10MB 이내로 등록 가능합니다.
			<br>사진의 크기는 가로 936px  세로 500px입니다.
			<br><input name="photo" type="file" id="photo" class="form-control" >
		</div>	
	</div>	
	<br>
		<div class="form-group">
			<label for="content" class="control-label col-sm-2" >내용</label>
			<div class="col-sm-10">
				<textarea rows="7" cols="80" name="content" id="content" class="form-control" placeholder="내용을 입력해주세요."></textarea>
			</div>
		</div>
		<br>
		<div class="form-group">
		<label for="tags" class="control-label col-sm-2">태그</label>
		<div class="col-sm-10">
			<input name="tags" maxlength="100" id="tags" class="form-control" placeholder="#여행" > 
		</div>
		</div>
		<br>
		<div class="form-group">
		<label for="writer" class="control-label col-sm-2">작성자</label>
		<div class="col-sm-10">
			<input name="writer" maxlength="10" id="writer" class="form-control" placeholder="이름을 입력해주세요."> 
		</div>	
		</div>	
		<br>
		<div class="text-center">
				<button type="submit" class="btn btn-default">등록</button>
				<button type="reset" class="btn btn-default">새로입력</button>
				<button type="button" onclick="history.back()" class="btn btn-default">취소</button>
		</div>
</form>
</div>
</body>
</html>