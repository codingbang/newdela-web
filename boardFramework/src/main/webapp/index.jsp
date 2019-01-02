<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" import="com.bit.member.model.MemberDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pagetContext.request.contextPath }" />
<%
response.sendRedirect(request.getContextPath()+"/boardmain.bit");
%>