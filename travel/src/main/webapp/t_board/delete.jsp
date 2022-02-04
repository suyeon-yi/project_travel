<%@page import="travel.t_board.service.T_boardDeleteService"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 데이터를 수집한다. 삭제하고자 하는 글의 글번호를 가져와야한다.
String strNo = request.getParameter("no");
long no = Long.parseLong(strNo);

System.out.println("delete.jsp - no : " + no);

//DB에서 데이터를 가져온다.
T_boardDeleteService service = new T_boardDeleteService();
int result = service.service(no);
//자동으로 리스트로 보낸다.
response.sendRedirect("list.jsp");
%>

