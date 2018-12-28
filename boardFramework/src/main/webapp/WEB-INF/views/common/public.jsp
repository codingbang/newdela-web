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
<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>
<link rel="stylesheet" href="${root}/css/skin_purple.css" type="text/css">
<link rel="stylesheet" href="${root}/css/header.css" type="text/css">
<script type="text/javascript" src="${root}/js/board.js"></script>
<script type="text/javascript" src="${root}/js/header.js"></script>
</head>

<body>
<form id="commonForm" action="" method="get">
  <input type="hidden" id="bcode" name="bcode" value="${bcode }">
  <input type="hidden" id="pg" name="pg" value="${pg }">
  <input type="hidden" id="key" name="key" value="${key }">
  <input type="hidden" id="word" name="word" value="${word }">
  <input type="hidden" id="seq" name="seq" value="">
</form>

<nav class="navbar navbar-inverse navbar-static-top">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#"> 메인LOGO</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="#">회원관리</a></li>
				<li><a href="#">미디어관리</a></li>
				<li><a href="#">대출관리</a></li>
			</ul>
			
			<ul class="nav navbar-nav">
			
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">커뮤니티<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<c:set var="idx" value="0" />
						<c:forEach var="board" items="${menu }" varStatus="loop">
							<c:if test="${board.ccode != idx}">
								<li class="dropdown-submenu">
									<a tabindex="-1" href="#"class="menu_category">${board.cname }</a>
									<c:set var="idx" value="${board.ccode}"/>
									<ul class="dropdown-menu">
							</c:if>
								<li><a tabindex="-1" href="${root}/${board.control}/list.bit?bcode=${board.bcode }&pg=1&key=&word=">${board.bname }</a></li>
							<c:if test="${loop.index < menu.size() -1 }">
								<c:if test="${idx != menu.get(loop.index + 1).ccode }">
									</ul>
									</li>
								</c:if>
							</c:if> 
								 
						</c:forEach>
					</ul>
				</li>
			</ul>
			</li>
		</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/member">회원가입</a></li>
				<li><a href="#" data-toggle="modal" data-target="#login-modal">로그인</a></li>
			</ul>
			<div class="modal fade" id="login-modal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true"
				style="display: none;">
				<div class="modal-dialog">
					<div class="loginmodal-container">
						<h1>Login to Your Account</h1>
						<br>
						<form>
							<input type="text" name="user" placeholder="Username"> <input
								type="password" name="pass" placeholder="Password"> <input
								type="submit" name="login" class="login loginmodal-submit"
								value="Login">
						</form>

						<div class="login-help">
							<a href="gettingstarted.html">Register</a> - <a href="#">Forgot
								Password</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>

