<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.dropdown-submenu {
	position: relative;
}

.dropdown-submenu>.dropdown-menu {
	top: 0;
	left: 100%;
	margin-top: -6px;
	margin-left: -1px;
	-webkit-border-radius: 0 6px 6px 6px;
	-moz-border-radius: 0 6px 6px;
	border-radius: 0 6px 6px 6px;
}

.dropdown-submenu .open>.dropdown-menu {
	display: block;
}

.dropdown-submenu>a:after {
	display: block;
	content: " ";
	float: right;
	width: 0;
	height: 0;
	border-color: transparent;
	border-style: solid;
	border-width: 5px 0 5px 5px;
	border-left-color: #ccc;
	margin-top: 5px;
	margin-right: -10px;
}

.dropdown-submenu .open>a:after {
	border-left-color: #fff;
}

.dropdown-submenu.pull-left {
	float: none;
}

.dropdown-submenu.pull-left>.dropdown-menu {
	left: -100%;
	margin-left: 10px;
	-webkit-border-radius: 6px 0 6px 6px;
	-moz-border-radius: 6px 0 6px 6px;
	border-radius: 6px 0 6px 6px;
}
</style>

<script type="text/javascript">
	$(document).ready(
			function() {
				$("#boardmenu p.menu_category").click(
						function() {
							$(this).next("div.menu_body").slideDown(500)
									.siblings("div.menu_body").slideUp("slow");
						});

				$(function() {
					/**
					 * NAME: Bootstrap 3 Multi-Level by Johne
					 * This script will active Triple level multi drop-down menus in Bootstrap 3.*
					 */
					$('li.dropdown-submenu').on('click', function(event) {
						event.stopPropagation();
						if ($(this).hasClass('open')) {
							$(this).removeClass('open');
						} else {
							$('li.dropdown-submenu').removeClass('open');
							$(this).addClass('open');
						}
					});
				});

			});
</script>
</head>
<body>

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
					<li><a href="gettingstarted.html">회원가입</a></li>
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



<%-- 	<div id="boardmenu" align="center" class="menu_list">
		<c:set var="idx" value="0" />

		<c:forEach var="board" items="${menu }" varStatus="loop">
			<c:if test="${board.ccode != idx}">

				<p class="menu_category">${board.cname }</p>
				<c:set var="idx" value="${board.ccode}" />
				<div class="menu_body">
			</c:if>
			<a
				href="${root}/${board.control}/list.bit?bcode=${board.bcode }&pg=1&key=&word=">${board.bname }</a>
			<c:if test="${loop.index < menu.size() -1 }">
				<c:if test="${idx != menu.get(loop.index + 1).ccode }">
	</div>
	</c:if>
	</c:if>
	</c:forEach>

	</div> --%>


</body>
</html>