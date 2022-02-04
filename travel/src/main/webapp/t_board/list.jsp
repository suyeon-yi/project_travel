<%@page import="com.webjjang.util.PageObject"%>
<%@page import="travel.t_board.vo.T_boardVO"%>
<%@page import="java.util.List"%>
<%@page import="travel.t_board.service.T_boardListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>    
<%
//DB를 확인한다.
Class.forName("travel.util.db.DB");
//페이징 처리를 위한 페이지 정보를 받는다.
PageObject pageObject = PageObject.getInstance(request);

//list는 두가지 정렬로 보임 - 최신순(기본값): new/인기순: pop
//pt = pageObject.Period
String pt = request.getParameter("pt");
if(pt == null)pt = "new";

pageObject.setPeriod(pt);

//DB에서 데이터를 가져온다.
T_boardListService service = new T_boardListService();
List<T_boardVO> list = service.service(pageObject);
//데이터를 확인한다.
System.out.println("list.jsp - list : " + list);
//정렬 버튼의 스타일 문자열 변수를 선언한다.
String style = "background : #0099ff; color : white";

request.setAttribute("list", list);
request.setAttribute("pt", pt);
request.setAttribute("style", style);
request.setAttribute("pageObject", pageObject);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행 후기 공유</title>
<style type="text/css">
.dataRow:hover{
	cursor: pointer;
	background: #eee;
}
.button { /*나도 등록하기 버튼을 위한 스타일*/
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 6px 22px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 14px;
  margin: 4px 2px;
  cursor: pointer;
}
.button1 {
  background-color: white; 
  color: black; 
  border: 2px solid #4CAF50;
}

</style>

</head>
<body>
<div class="container">
<h2>여행 공유</h2>
<div class="btn-group">
<a href="list.jsp?pt=new" style='${(pt=="new")?style:""}'class="btn btn-default">최신순</a>
<a href="list.jsp?pt=pop" style='${(pt=="pop")?style:""}'class="btn btn-default">인기순</a>
</div>
<a href="writeForm.jsp" class="button button1" style="float: right;">나도 등록하기</a>
<p></p>
<div class="row">
		
		<% int i = 0;
		for(T_boardVO vo : list) { %>
		<div class="col-md-3">
		<div class="thumbnail dataRow" onclick="location='view.jsp?no=<%=vo.getNo() %>&inc=1'" >
			<img src="<%=vo.getPhoto() %>" alt="Photo Lists" style="width:100%;height: 300px;">
			<div class="caption">
			[<%=vo.getNo() %>]
			<br><%=vo.getTitle() %>
			<br><%=vo.getWriter() %>
			<br>조회수 <%=vo.getHit() %>
			</div>
		</div>
		</div>
		<%
		i++;
		if(i%4 ==0 && i != list.size()) {%>
		</div>
		<div class="row">
		
		<%}
		}%> 
</div>
		<div class="col-md-12">
				<pageNav:pageNav listURI="list.jsp" pageObject="${pageObject }" query="&pt=${pt }"/>
				</div>
		
</div>
</body>
</html>