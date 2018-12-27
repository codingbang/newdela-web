<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" import="com.bit.member.model.MemberDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pagetContext.request.contextPath }" />
<%
MemberDto memberDto = new MemberDto();
memberDto.setId("testtest");
memberDto.setName("이종현");
memberDto.setEmail("test@test.com");

session.setAttribute("userInfo", memberDto);
response.sendRedirect(request.getContextPath()+"/badmin/boardmenu.bit");
%>