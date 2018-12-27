<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pagetContext.request.contextPath }" />
<c:set var="bcode" value="${param.bcode }"/>
<c:set var="pg" value="${param.pg }"/>
<c:set var="key" value="${param.key }"/>
<c:set var="word" value="${param.word }"/>
<c:set var="seq" value="${param.seq }"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="ko">
<head>
<title>게시판</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="${root}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${root}/bootstrap/css/bootstrap-theme.min.css">
<script src="${root}/bootstrap/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="${root}/css/skin_purple.css" type="text/css">
<script type="text/javascript" src="${root}/js/board.js"></script>
</head>

<body>
<form id="commonForm" action="" method="get">
  <input type="hidden" id="bcode" name="bcode" value="${bcode }">
  <input type="hidden" id="pg" name="pg" value="${pg }">
  <input type="hidden" id="key" name="key" value="${key }">
  <input type="hidden" id="word" name="word" value="${word }">
  <input type="hidden" id="seq" name="seq" value="">
</form>