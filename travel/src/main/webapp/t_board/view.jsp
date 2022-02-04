<%@page import="travel.t_board.vo.T_boardVO"%>
<%@page import="travel.t_board.service.T_boardViewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//데이터를 수집한다. - 글번호, 조회수
//게시글 1회 선택 당 조회수 1증가한다.
//조회수는 list.jsp에서 인기순 글보기시 사용된다.
String strNo = request.getParameter("no");
long no = Long.parseLong(strNo);
System.out.println(no);
String strInc = request.getParameter("inc");
long inc = Long.parseLong(strInc);
System.out.println(inc);
//DB에서 데이터를 가져온다.(글번호, 조회수 증가)
T_boardViewService service = new T_boardViewService();
T_boardVO vo = service.service(no, inc);
//게시글의 내용에 엔터를 적용하기 위해 줄바꿈 데이터(\n)을 <br>태그로 변경한다.
vo.setContent(vo.getContent().replace("\n", "<br>"));
//데이터를 확인한다.
System.out.println("view.jsp - vo : " + vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행 후기 보기</title>
<style type="text/css">
#viewImg{
	width: 400px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}

#changeImageDiv{
	display: none;
}

</style>
</head>
<body>
<div class="container">
<h2>여행 공유</h2>
<div class="form-group" style="float: right;">
	<label for="no">번호</label><%=vo.getNo() %> | <label for="hit">조회수</label><%=vo.getHit() %>
</div>	
	<div class="title" style="text-align: center;">
	<h3><%=vo.getTitle() %></h3>
	</div>
<table class="table">
<thead>
      <tr>
        <th>작성자</th>
        <th>여행장소</th>
        <th>여행일정</th>
        <th>참여인원</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><%=vo.getWriter() %></td>
        <td><%=vo.getPlace() %></td>
        <td><%=vo.getStartDate() %> ~ <%=vo.getEndDate() %></td>
        <td><%=vo.getStaff() %></td>
      </tr>
</table>
		<div class="photo" style="text-align: center;">
		<img  alt="<%=vo.getTitle() %>" src="<%=vo.getPhoto() %>" id= "viewImg">
		</div>
		<div class="content">
		<%=vo.getContent() %>
		</div>
		<div class="tags">
		<%=vo.getTags() %>
		</div>
<div class="text-center">
<a href="updateForm.jsp?no=<%=vo.getNo() %>" class="btn btn-default">수정</a>
<a href="delete.jsp?no=<%=vo.getNo() %>" class="btn btn-default">삭제</a>
<a href="list.jsp?page=${param.page }&perPageNum=${param.perPageNum}" class="btn btn-default">리스트</a>
</div>
</div>
</body>
</html>